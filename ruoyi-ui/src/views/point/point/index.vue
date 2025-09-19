<template>
  <div>
    <div class="app-container">
      <!-- 新增点位按钮 -->
      <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
        <el-col>
          <el-button type="primary" @click="handleAddPoint" v-hasPermi="['point:point:add']">新增点位</el-button>
          <el-button type="success" @click="openAIChat" icon="el-icon-chat-dot-round" style="margin-left: 10px;">AI助手</el-button>
        </el-col>
      </el-row>

      <!-- 点位信息列表 -->
      <el-table :data="pointList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="点位ID" prop="pointId" align="center"></el-table-column>
        <el-table-column label="点位名称" prop="pointName" align="center"></el-table-column>
        <el-table-column label="用户名" prop="userName" align="center"></el-table-column>
        <el-table-column label="下一节点" prop="pointNext" align="center"></el-table-column>
        <el-table-column label="返回节点" prop="pointBack" align="center"></el-table-column>
        <el-table-column label="操作" align="center" width="220px">
          <template #default="{ row }">
            <el-button type="info" size="mini" @click="handleView(row)" v-hasPermi="['point:point:view']">查看</el-button>
            <el-button type="primary" size="mini" @click="handleEdit(row)" v-hasPermi="['point:point:edit']">编辑</el-button>
            <el-button type="danger" size="mini" @click="handleDelete(row)" v-hasPermi="['point:point:delete']">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="fetchPoints"
      />

      <!-- 新增/编辑点位对话框 -->
      <el-dialog :visible.sync="dialogVisible" :title="dialogTitle" width="30%">
        <el-form :model="pointForm" label-width="100px" ref="pointFormRef" :rules="rules">
          <el-form-item label="点位名称" prop="pointName">
            <el-input v-model="pointForm.pointName" placeholder="请输入点位名称"></el-input>
          </el-form-item>
          <el-form-item label="用户名" prop="userName">
            <el-input v-model="pointForm.userName" placeholder="请输入用户名"></el-input>
          </el-form-item>
          <el-form-item label="下一节点" prop="pointNext">
            <el-input v-model.number="pointForm.pointNext" placeholder="请输入下一节点ID" type="number"></el-input>
          </el-form-item>
          <el-form-item label="返回节点" prop="pointBack">
            <el-input v-model.number="pointForm.pointBack" placeholder="请输入返回节点ID" type="number"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSubmit">{{ dialogButton }}</el-button>
        </div>
      </el-dialog>

      <!-- 查看点位详情对话框 -->
      <el-dialog :visible.sync="viewDialogVisible" title="点位详情" width="30%">
        <el-form :model="viewPointForm" label-width="100px">
          <el-form-item label="点位ID">
            <el-input v-model="viewPointForm.pointId" readonly></el-input>
          </el-form-item>
          <el-form-item label="点位名称">
            <el-input v-model="viewPointForm.pointName" readonly></el-input>
          </el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="viewPointForm.userName" readonly></el-input>
          </el-form-item>
          <el-form-item label="下一节点">
            <el-input v-model="viewPointForm.pointNext" readonly></el-input>
          </el-form-item>
          <el-form-item label="返回节点">
            <el-input v-model="viewPointForm.pointBack" readonly></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="viewDialogVisible = false">关闭</el-button>
        </div>
      </el-dialog>

      <!-- AI对话弹窗 -->
      <el-dialog 
        :visible.sync="aiChatVisible" 
        title="AI智能助手" 
        width="60%" 
        :before-close="closeAIChat"
        append-to-body>
        <div slot="title" style="text-align: center;">
          <i class="el-icon-chat-dot-round"></i>
          AI智能助手 - 本地大模型
        </div>
        
        <!-- 对话消息区域 -->
        <div class="chat-container">
          <div class="chat-messages" ref="chatMessages">
            <div v-for="(message, index) in chatMessages" :key="index" class="message-item">
              <div v-if="message.type === 'user'" class="user-message">
                <div class="message-content">{{ message.content }}</div>
                <div class="message-avatar">
                  <i class="el-icon-user"></i>
                </div>
              </div>
              <div v-else class="ai-message">
                <div class="message-avatar">
                  <i class="el-icon-cpu"></i>
                </div>
                <div class="message-content">
                  <div v-html="message.content"></div>
                  <div v-if="message.streaming" class="typing-indicator">
                    <span></span><span></span><span></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <!-- 输入区域 -->
          <div class="chat-input-area">
            <el-input
              v-model="currentMessage"
              type="textarea"
              :rows="3"
              placeholder="请输入您的问题..."
              :disabled="isLoading"
              @keydown.ctrl.enter="sendMessage"
              resize="none">
            </el-input>
            <div class="input-actions">
              <el-button 
                type="primary" 
                @click="sendMessage"
                :loading="isLoading"
                :disabled="!currentMessage.trim()">
                发送 (Ctrl+Enter)
              </el-button>
              <el-button @click="clearChat" type="info" plain>清空对话</el-button>
            </div>
          </div>
        </div>
        
        <div slot="footer" class="dialog-footer">
          <el-button @click="closeAIChat">关闭</el-button>
        </div>
      </el-dialog>

    </div>
  </div>
</template>

<script>
import { listAllPoints, addPoint, updatePoint, deletePoint } from "@/api/point/oasPoint";

export default {
  data() {
    return {
      loading: false,
      pointList: [],
      total: 0,
      dialogVisible: false,
      dialogTitle: "新增点位",
      dialogButton: "添加",
      pointForm: {
        pointId: null,
        pointName: "",
        userName: "",
        pointNext: null,
        pointBack: null,
      },
      viewDialogVisible: false,
      viewPointForm: {},
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
      rules: {
        pointName: [{ required: true, message: "请输入点位名称", trigger: "blur" }],
        userName: [{ required: true, message: "请输入用户名", trigger: "blur" }],
      },
      // AI对话相关数据
      aiChatVisible: false,
      chatMessages: [],
      currentMessage: '',
      isLoading: false,
      conversationId: '',
      // 配置信息
      aiConfig: {
        apiUrl: 'http://localhost/v1/chat-messages',
        apiKey: 'app-8RWJx0uqQq7A8Y8FUhrzUnaw',
        user: 'point-manager-user'
      }
    };
  },
  methods: {
    // 获取点位列表
    fetchPoints() {
      this.loading = true;
      listAllPoints(this.queryParams).then((response) => {
        this.pointList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 新增点位
    handleAddPoint() {
      this.dialogTitle = "新增点位";
      this.dialogButton = "添加";
      this.pointForm = {
        pointId: null,
        pointName: "",
        userName: "",
        pointNext: null,
        pointBack: null,
      };
      this.dialogVisible = true;
    },
    // 编辑点位
    handleEdit(row) {
      this.dialogTitle = "编辑点位";
      this.dialogButton = "更新";
      this.pointForm = { ...row };
      this.dialogVisible = true;
    },
    // 查看详情
    handleView(row) {
      this.viewPointForm = { ...row };
      this.viewDialogVisible = true;
    },
    // 删除点位
    handleDelete(row) {
      this.$confirm("确定删除该点位吗？", "提示", {
        type: "warning",
      }).then(() => {
        deletePoint(row.pointId).then(() => {
          this.$message.success("删除成功");
          this.fetchPoints();
        });
      });
    },
    // 提交表单
    handleSubmit() {
      this.$refs.pointFormRef.validate((valid) => {
        if (valid) {
          const api = this.dialogButton === "添加" ? addPoint : updatePoint;
          api(this.pointForm).then(() => {
            this.$message.success(this.dialogButton + "成功");
            this.dialogVisible = false;
            this.fetchPoints();
          });
        }
      });
    },

    // === AI对话相关方法 ===
    
    // 打开AI对话
    openAIChat() {
      this.aiChatVisible = true;
      if (this.chatMessages.length === 0) {
        this.chatMessages.push({
          type: 'ai',
          content: '您好！我是AI智能助手，我可以帮助您解答关于点位管理和系统操作的问题。请随时向我提问！',
          streaming: false,
          timestamp: new Date()
        });
      }
      this.$nextTick(() => {
        this.scrollToBottom();
      });
    },

    // 关闭AI对话
    closeAIChat() {
      this.aiChatVisible = false;
      if (this.eventSource) {
        this.eventSource.close();
        this.eventSource = null;
      }
      this.isLoading = false;
    },

    // 发送消息
    async sendMessage() {
      if (!this.currentMessage.trim() || this.isLoading) {
        return;
      }

      const userMessage = this.currentMessage.trim();
      this.currentMessage = '';

      // 添加用户消息
      this.chatMessages.push({
        type: 'user',
        content: userMessage,
        timestamp: new Date()
      });

      // 添加AI消息占位符
      const aiMessageIndex = this.chatMessages.length;
      this.chatMessages.push({
        type: 'ai',
        content: '',
        streaming: true,
        timestamp: new Date()
      });

      this.isLoading = true;
      this.scrollToBottom();
      
      try {
        await this.sendToAI(userMessage, aiMessageIndex);
      } catch (error) {
        this.chatMessages[aiMessageIndex] = {
          type: 'ai',
          content: '抱歉，发生了错误，请稍后重试。',
          streaming: false,
          timestamp: new Date()
        };
        this.isLoading = false;
        this.scrollToBottom();
      }
    },

    // 发送到AI接口
    async sendToAI(message, messageIndex) {
      const requestBody = {
        inputs: {},
        query: message,
        response_mode: "streaming",
        conversation_id: this.conversationId,
        user: this.aiConfig.user,
        files: []
      };

      const response = await fetch(this.aiConfig.apiUrl, {
        method: 'POST',
        mode: 'cors',
        credentials: 'omit',
        headers: {
          'Authorization': `Bearer ${this.aiConfig.apiKey}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(requestBody)
      });

      if (!response.ok) {
        throw new Error(`请求失败: HTTP ${response.status}`);
      }

      if (!response.body) {
        throw new Error('无法建立流式连接');
      }

      const reader = response.body.getReader();
      const decoder = new TextDecoder();
      let accumulatedContent = '';
      let buffer = '';

      try {
        while (true) {
          const { done, value } = await reader.read();
          if (done) break;

          const chunk = decoder.decode(value, { stream: true });
          buffer += chunk;

          // 按照Dify格式处理：使用 \n\n 分隔数据块
          const blocks = buffer.split('\n\n');
          buffer = blocks.pop() || ''; // 保留最后一个不完整的块

          for (const block of blocks) {
            if (block.trim() === '') continue;
            
            // 处理每个数据块中的行
            const lines = block.split('\n');
            
            for (const line of lines) {
              if (line.trim() === '' || !line.startsWith('data: ')) continue;
              
              const data = line.slice(6).trim();
              if (!data) continue;

              try {
                const parsed = JSON.parse(data);
                
                if (parsed.event === 'message') {
                  // Dify流式消息事件
                  if (parsed.answer) {
                    accumulatedContent += parsed.answer;
                    this.chatMessages[messageIndex].content = this.formatMessage(accumulatedContent);
                    this.scrollToBottom();
                  }
                  
                  // 更新会话ID（如果有）
                  if (parsed.conversation_id) {
                    this.conversationId = parsed.conversation_id;
                  }
                } else if (parsed.event === 'message_end') {
                  // Dify流式结束事件
                  if (parsed.conversation_id) {
                    this.conversationId = parsed.conversation_id;
                  }
                  
                  // 结束流式处理
                  this.chatMessages[messageIndex].streaming = false;
                  this.isLoading = false;
                  this.scrollToBottom();
                  return;
                }
              } catch (parseError) {
                // 忽略解析错误
              }
            }
          }
        }
      } finally {
        reader.releaseLock();
      }

      // 如果没有收到结束信号，手动结束
      this.chatMessages[messageIndex].streaming = false;
      this.isLoading = false;
    },

    // 格式化消息内容
    formatMessage(content) {
      // 将换行符转换为<br>
      return content.replace(/\n/g, '<br>');
    },

    // 清空对话
    clearChat() {
      this.$confirm('确定要清空对话记录吗？', '提示', {
        type: 'warning'
      }).then(() => {
        this.chatMessages = [{
          type: 'ai',
          content: '对话已清空，请重新开始对话。',
          streaming: false,
          timestamp: new Date()
        }];
        this.conversationId = '';
        this.scrollToBottom();
      }).catch(() => {
        // 用户取消
      });
    },

    // 滚动到底部
    scrollToBottom() {
      this.$nextTick(() => {
        const chatMessages = this.$refs.chatMessages;
        if (chatMessages) {
          chatMessages.scrollTop = chatMessages.scrollHeight;
        }
      });
    },
  },

  created() {
    this.fetchPoints();
  },
};
</script>

<style scoped>
/* AI对话样式 */
.chat-container {
  height: 500px;
  display: flex;
  flex-direction: column;
}

.chat-messages {
  flex: 1;
  overflow-y: auto;
  padding: 15px;
  border: 1px solid #e4e7ed;
  border-radius: 8px;
  background-color: #f8f9fa;
  margin-bottom: 15px;
}

.message-item {
  margin-bottom: 20px;
}

.user-message {
  display: flex;
  justify-content: flex-end;
  align-items: flex-start;
}

.ai-message {
  display: flex;
  justify-content: flex-start;
  align-items: flex-start;
}

.message-content {
  max-width: 70%;
  padding: 12px 16px;
  border-radius: 12px;
  word-wrap: break-word;
  line-height: 1.5;
}

.user-message .message-content {
  background-color: #409eff;
  color: white;
  margin-right: 10px;
  border-bottom-right-radius: 4px;
}

.ai-message .message-content {
  background-color: white;
  color: #333;
  border: 1px solid #e4e7ed;
  margin-left: 10px;
  border-bottom-left-radius: 4px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.message-avatar {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  color: white;
  flex-shrink: 0;
}

.user-message .message-avatar {
  background-color: #67c23a;
}

.ai-message .message-avatar {
  background-color: #909399;
}

.chat-input-area {
  border-top: 1px solid #e4e7ed;
  padding-top: 15px;
}

.input-actions {
  margin-top: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* 打字指示器动画 */
.typing-indicator {
  display: inline-flex;
  align-items: center;
  margin-top: 8px;
}

.typing-indicator span {
  height: 8px;
  width: 8px;
  border-radius: 50%;
  background-color: #c0c4cc;
  display: inline-block;
  margin-right: 4px;
  animation: typing 1.4s infinite ease-in-out;
}

.typing-indicator span:nth-child(1) {
  animation-delay: -0.32s;
}

.typing-indicator span:nth-child(2) {
  animation-delay: -0.16s;
}

@keyframes typing {
  0%, 80%, 100% {
    transform: scale(0.8);
    opacity: 0.5;
  }
  40% {
    transform: scale(1);
    opacity: 1;
  }
}

/* 滚动条样式 */
.chat-messages::-webkit-scrollbar {
  width: 6px;
}

.chat-messages::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 3px;
}

.chat-messages::-webkit-scrollbar-thumb {
  background: #c0c4cc;
  border-radius: 3px;
}

.chat-messages::-webkit-scrollbar-thumb:hover {
  background: #a8abb2;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .message-content {
    max-width: 85%;
  }
  
  .chat-container {
    height: 400px;
  }
}
</style>
