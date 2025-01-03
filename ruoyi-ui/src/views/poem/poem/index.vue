<template>
  <div class="app-container">
    <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
      <el-col>
        <el-button type="primary" @click="handleAdd">新增诗词</el-button>
      </el-col>
    </el-row>

    <el-table :data="poemList" v-loading="loading" border style="width: 100%">
      <el-table-column label="诗词ID" prop="poemId" align="center"></el-table-column>
      <el-table-column label="发布人" prop="userName" align="center"></el-table-column>
      <el-table-column label="标题" prop="poemTitle" align="center"></el-table-column>
      <el-table-column label="作者" prop="poemAuthor" align="center"></el-table-column>
      <el-table-column label="内容" prop="poemContent" align="center">
        <template #default="scope">
          <span>{{ scope.row.poemContent.slice(0, 20) }}...</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" prop="status" align="center">
        <template #default="scope">
          <el-tag :type="scope.row.status === 1 ? 'success' : 'warning'">
            {{ scope.row.status === 1 ? '审核通过' : '审核中' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="400"
                       fixed="right">
        <template #default="scope">
          <el-button
            v-if="scope.row.status === 0"
            type="success"
            size="mini"
            @click="handleAudit(scope.row)"
          >
            审核
          </el-button>
          <el-button type="info" size="mini" @click="openCommentDialog(scope.row)">评论</el-button>
          <el-button size="mini" @click="handleView(scope.row)">查看</el-button>
          <el-button type="primary" size="mini" @click="handleEdit(scope.row)">编辑</el-button>
          <el-button type="danger" size="mini" @click="handleDelete(scope.row.poemId)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页组件 -->
    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="fetchPoems"
    />

    <!-- 添加/编辑诗词对话框 -->
    <el-dialog :visible.sync="dialogVisible" :title="dialogTitle" width="600px" @close="resetForm">
      <el-form :model="poemForm" label-width="100px" ref="poemFormRef" :rules="rules">
        <el-form-item label="标题" prop="poemTitle">
          <el-input v-model="poemForm.poemTitle"></el-input>
        </el-form-item>
        <el-form-item label="作者" prop="poemAuthor">
          <el-input v-model="poemForm.poemAuthor"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="poemContent">
          <el-input v-model="poemForm.poemContent" type="textarea" :rows="5"></el-input>
        </el-form-item>
        <el-form-item label="诗词背景" prop="poemBackground">
          <el-input v-model="poemForm.poemBackground" type="textarea" :rows="3"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitForm">确定</el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="viewDialogVisible" title="诗词详情" width="600px">
      <el-form :model="viewPoemForm" label-width="100px">
        <el-form-item label="标题">
          <el-input v-model="viewPoemForm.poemTitle" disabled></el-input>
        </el-form-item>
        <el-form-item label="作者">
          <el-input v-model="viewPoemForm.poemAuthor" disabled></el-input>
        </el-form-item>
        <el-form-item label="内容">
          <el-input v-model="viewPoemForm.poemContent" type="textarea" :rows="5" disabled></el-input>
        </el-form-item>
        <el-form-item label="诗词背景">
          <el-input v-model="viewPoemForm.poemBackground" type="textarea" :rows="3" disabled></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="viewDialogVisible = false">关闭</el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="auditDialogVisible" title="审核确认" width="400px">
      <span>确定要审核通过这首诗词吗？</span>
      <div slot="footer" class="dialog-footer">
        <el-button @click="auditDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="confirmAudit">确定</el-button>
      </div>
    </el-dialog>

    <!-- 评论对话框 -->
    <el-dialog :visible.sync="commentDialogVisible" title="评论详情" class="comment-dialog">
      <!-- 判断是否有评论，如果没有则显示暂无评论 -->
      <div v-if="comments.length === 0" class="no-comment">
        <p class="center-text">该场馆暂无评论</p>
      </div>
      <!-- 评论内容 -->
      <div v-for="(comment, index) in comments" :key="index" class="comment-item">
        <div class="comment-info">
          <span class="comment-user">评论人：{{ comment.userName }}</span>
          <span class="comment-time">评论时间：{{ comment.createTime }}</span>
        </div>
        <div class="comment-content">
          <p>{{ comment.content }}</p>
          <!-- 删除按钮 -->
          <el-button type="danger" size="mini" @click="handleDeleteComment(comment.commentId)">删除</el-button>
        </div>
      </div>

      <!-- 分割线 -->
      <div class="divider"></div>

      <!-- 新增评论输入框 -->
      <div class="new-comment">
        <el-input v-model="newComment" placeholder="请输入评论内容"></el-input>
        <el-button type="success" size="mini" @click="handleAddComment">发送评论</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listAllPoems, addPoem, updatePoem, deletePoem, getPoemById} from '@/api/poem/poem'
import {addComment, deleteComment, listCommentsByPoemId} from "@/api/poem/comment";

export default {
  data() {
    return {
      loading: true,
      poemList: [],
      total: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
      dialogVisible: false,
      dialogTitle: '',
      poemForm: {
        poemId: null,
        poemTitle: '',
        poemAuthor: '',
        poemContent: '',
        status: 0,
        poemBackground: ''
      },
      viewDialogVisible: false,
      viewPoemForm: {
        poemTitle: '',
        poemAuthor: '',
        poemContent: '',
        poemBackground: ''
      },
      auditDialogVisible: false,
      selectedPoem: {}, // 保存当前选中的诗词信息
      comments: [],
      commentDialogVisible: false,
      newComment: '',
      rules: {
        poemTitle: [{required: true, message: '请输入标题', trigger: 'blur'}],
        poemAuthor: [{required: true, message: '请输入作者', trigger: 'blur'}],
        poemContent: [{required: true, message: '请输入内容', trigger: 'blur'}],
      }
    }
  },
  created() {
    this.fetchPoems()
  },
  methods: {
    // 查询诗词列表
    fetchPoems() {
      this.loading = true
      listAllPoems(this.queryParams).then(response => {
        this.poemList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 打开新增诗词对话框
    handleAdd() {
      this.resetForm()
      this.dialogTitle = '新增诗词'
      this.dialogVisible = true
    },
    // 编辑诗词
    handleEdit(row) {
      getPoemById(row.poemId).then(response => {
        this.poemForm = {...response.data}
        this.dialogTitle = '编辑诗词'
        this.dialogVisible = true
      })
    },
    // 提交表单
    submitForm() {
      this.$refs.poemFormRef.validate(valid => {
        if (valid) {
          if (this.poemForm.poemId) {
            updatePoem(this.poemForm).then(() => {
              this.$message.success('更新成功')
              this.fetchPoems()
              this.dialogVisible = false
            })
          } else {
            addPoem(this.poemForm).then(() => {
              this.$message.success('新增成功')
              this.fetchPoems()
              this.dialogVisible = false
            })
          }
        }
      })
    },
    confirmAudit() {
      updatePoem(this.poemForm).then(() => {
        this.$message.success('审核成功')
        this.auditDialogVisible = false
        this.fetchPoems() // 重新加载诗词列表
      }).catch(() => {
        this.$message.error('审核失败，请稍后重试')
      })
    },
    // 删除诗词
    handleDelete(poemId) {
      this.$confirm('确定要删除该诗词吗？', '提示', {
        type: 'warning'
      }).then(() => {
        deletePoem(poemId).then(() => {
          this.$message.success('删除成功')
          this.fetchPoems()
        })
      })
    },
    handleView(row) {
      getPoemById(row.poemId).then(response => {
        this.viewPoemForm = {...response.data}
        this.viewDialogVisible = true
      })
    },
    handleAudit(row) {
      this.poemForm = {...row}
      this.poemForm.status = 1
      this.auditDialogVisible = true
    },
    // 重置表单
    resetForm() {
      this.poemForm = {
        poemId: null,
        poemTitle: '',
        poemAuthor: '',
        poemContent: '',
        poemBackground: ''
      }
      this.$refs.poemFormRef?.resetFields()
    },

    // 打开评论对话框并加载评论列表
    openCommentDialog(row) {
      this.selectedPoem = row
      listCommentsByPoemId(row.poemId).then(response => {
        this.comments = response.rows;
        // 打开评论对话框
        this.commentDialogVisible = true;
      }).catch(error => {
        // 处理请求失败的情况
        console.error('获取评论列表失败：', error);
        this.$message.error('获取评论列表失败，请稍后重试');
      });
    },
    // 添加评论
    handleAddComment() {
      // 获取用户输入的评论内容
      const reviewComment = this.newComment.trim();
      if (!reviewComment) {
        // 如果评论内容为空，提示用户输入评论内容
        this.$message.error('请输入评论内容');
        return;
      }
      // 构造评论数据
      const commentData = {
        poemId: this.selectedPoem.poemId, // 课程ID
        content: reviewComment, // 评论内容
      };
      // 调用新增评论的方法
      addComment(commentData).then(response => {
        // 处理新增评论成功的情况
        this.$message.success('评论成功');
        // 清空输入框内容
        this.newComment = '';
        this.commentDialogVisible = false; // 关闭评论对话框
      })
    },
    // 删除评论
    handleDeleteComment(commentId) {
      console.log('删除评论：', commentId)
      deleteComment(commentId).then(response => {
        this.$message.success('删除成功')
        this.commentDialogVisible = false; // 关闭评论对话框
      }).catch(error => {
        console.log('Error:', error)
        this.$message.error('删除失败')
      })
    },
  }
}
</script>
<style scoped>
/* 分割线样式 */
.center-text {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  font-size: 15px; /* 设置字体大小为15像素 */
}

/* 评论对话框样式 */
.comment-dialog {
  max-height: 800px; /* 设置最大高度 */
  overflow-y: auto; /* 添加纵向滚动条 */
}

/* 评论样式 */
.comment-item {
  margin-bottom: 20px;
  border: 1px solid #eee;
  padding: 10px;
}

/* 调整评论人和评论时间的间距 */
.comment-info {
  margin-bottom: 5px; /* 增加评论人和评论时间之间的垂直间距 */
  border-bottom: 1px solid #ccc; /* 添加底部边框，实现表格线效果 */
  padding-bottom: 15px; /* 调整底部边框与评论内容之间的间距 */
}

.comment-time {
  margin-left: 300px; /* 增加评论时间与评论人之间的水平间距 */
}

/* 新增评论输入框样式 */
.new-comment {
  margin-top: 20px; /* 设置输入框与上方元素的垂直间距 */
}

/* 调整发送评论按钮的垂直间距 */
.new-comment .el-button {
  margin-top: 10px; /* 设置按钮与上方元素的垂直间距 */
}

/* 分割线样式 */
.divider {
  border-top: 3px solid #ccc;
  margin-top: 20px; /* 调整分割线上方的间距 */
  margin-bottom: 20px; /* 调整分割线下方的间距 */
}
</style>
