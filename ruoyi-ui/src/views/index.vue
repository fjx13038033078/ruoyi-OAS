<template>
  <div>
    <div id="curtain" style="width: 100%; height: 100px">
      <el-row justify="center" align="middle" style="height: 100px" class="background-title">
        <el-col :span="24">
          <h1 class="centered-title" style="margin-top: -8px" data-text="企业OA系统">{{ titleText }}</h1>
        </el-col>
      </el-row>
    </div>
    <div>
      <el-carousel :interval="4000" type="card" height="300px" style="margin-top: 5px">
        <el-carousel-item>
          <a href="https://tv.cctv.com/yxg/tbjm/scdh/index.shtml" target="_blank">
            <img src="../assets/images/01.jpg" alt="Image 1" style="width: 100%;">
          </a>
        </el-carousel-item>
        <el-carousel-item>
          <a href="https://tv.cctv.com/yxg/tbjm/scdh/index.shtml" target="_blank">
            <img src="../assets/images/02.jpg" alt="Image 2" style="width: 100%;">
          </a>
        </el-carousel-item>
        <el-carousel-item>
          <a href="https://tv.cctv.com/yxg/tbjm/scdh/index.shtml" target="_blank">
            <img src="../assets/images/03.jpg" alt="Image 3" style="width: 100%;">
          </a>
        </el-carousel-item>
      </el-carousel>
      <!-- 通知公告 -->
      <el-row style="margin-top: 20px;">
        <el-col :span="12">
          <el-card style="margin-right: 20px; height: 420px;">
            <h3 slot="header">通知公告</h3>
            <el-table v-loading="loading" :data="noticeList" @selection-change="handleSelectionChange">
              <el-table-column label="序号" align="center" prop="noticeId" width="100"/>
              <el-table-column
                label="公告标题"
                align="center"
                prop="noticeTitle"
                :show-overflow-tooltip="true"
              >
                <template slot-scope="scope">
                  <span @click="showNoticeContent(scope.row)">{{ scope.row.noticeTitle }}</span>
                </template>
              </el-table-column>
              <el-table-column label="公告类型" align="center" prop="noticeType" width="100">
                <template slot-scope="scope">
                  <dict-tag :options="dict.type.sys_notice_type" :value="scope.row.noticeType"/>
                </template>
              </el-table-column>
              <el-table-column label="创建时间" align="center" prop="createTime" width="100">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
            </el-table>
          </el-card>
        </el-col>
        <!-- 平台简介和AI助手 -->
        <el-col :span="12">
          <el-card style="margin-right: 20px; height: 420px;">
            <h3 slot="header">平台简介</h3>
            <p>请在这里填写更多的文字说明</p>
          </el-card>
        </el-col>
      </el-row>
      <!-- 弹出的公告内容卡片 -->
      <el-dialog :title="selectedNotice.title" :visible.sync="showNoticeDialog" width="780px" append-to-body>
        <div slot="title" style="text-align: center;">{{ selectedNotice.title }}</div>
        <div v-html="selectedNotice.content" class="notice-content"></div>
      </el-dialog>
      
      <!-- AI智能助手弹窗 -->
      <el-dialog 
        title="AI智能助手" 
        :visible.sync="showChatbotDialog" 
        width="80%" 
        append-to-body
        :before-close="handleChatbotClose">
        <div slot="title" style="text-align: center;">
          <i class="el-icon-chat-dot-round"></i>
          AI智能助手
        </div>
        <div class="chatbot-container">
          <iframe
            v-if="showChatbotDialog"
            src="http://localhost/chatbot/1V9bomDXkQXgVNQS"
            style="width: 100%; height: 600px; border: none; border-radius: 8px;"
            frameborder="0"
            allow="microphone">
          </iframe>
        </div>
      </el-dialog>
      
      <!-- 智能机器人浮动按钮 -->
      <div class="chatbot-float-button" @click="openChatbot">
        <el-tooltip content="AI智能助手" placement="left">
          <el-button 
            type="primary" 
            icon="el-icon-chat-dot-round" 
            circle 
            size="large"
            class="float-btn">
          </el-button>
        </el-tooltip>
      </div>
    </div>
  </div>
</template>
<script>
import {listNotice, getNotice} from "@/api/system/notice";


export default {
  name: "Notice",
  dicts: ['sys_notice_status', 'sys_notice_type'],
  data() {
    return {
      titleText : '企业OA系统',
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 公告表格数据
      noticeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      venueCourtMapData: {}, // 存储场馆场地数量映射的数据
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        noticeTitle: undefined,
        createBy: undefined,
        status: undefined
      },
      selectedNotice: {
        title: '',
        content: ''
      },
      showNoticeDialog: false,
      showChatbotDialog: false,
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        noticeTitle: [
          {required: true, message: "公告标题不能为空", trigger: "blur"}
        ],
        noticeType: [
          {required: true, message: "公告类型不能为空", trigger: "change"}
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询公告列表 */
    getList() {
      this.loading = true;
      listNotice(this.queryParams).then(response => {
        this.noticeList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    showNoticeContent(row) {
      this.loading = true;
      getNotice(row.noticeId).then((response) => {
        this.selectedNotice.title = response.data.noticeTitle;
        this.selectedNotice.content = response.data.noticeContent;
        this.showNoticeDialog = true;
        this.loading = false;
      });
    },
    /** 打开AI助手弹窗 */
    openChatbot() {
      this.showChatbotDialog = true;
    },
    /** 关闭AI助手弹窗 */
    handleChatbotClose(done) {
      this.showChatbotDialog = false;
      if (done) {
        done();
      }
    },
  }
};
</script>

<style scoped lang="scss">
.notice-content::v-deep img {
  max-width: 100%;
  height: auto;
  display: block;
  margin: 0 auto;
}

#curtain {
  position: relative;
}

.background-title {
  background-color: #4158d0;
  background-image: linear-gradient(43deg, #4158d0 0%, #c850c0 46%, #ffcc70 100%);
}

.centered-title {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 60px;
  white-space: nowrap;
  font-weight: bold;
  font-family: 'Microsoft YaHei';
}

.centered-title::before {
  content: attr(data-text);
  position: absolute;
  transform: rotateX(180deg);
  transform-origin: bottom;
  line-height: 52px;
  background: linear-gradient(0deg, #000 0, transparent 80%);
  background-clip: text;
  -webkit-background-clip: text;
  color: transparent;
  opacity: 0.5;
}

@keyframes slideInLeft {
  0% {
    transform: translateX(-100%);
  }
  100% {
    transform: translateX(100%);
  }
}

@keyframes slideInRight {
  0% {
    transform: translateX(100%);
  }
  100% {
    transform: translateX(-100%);
  }
}

.chatbot-container {
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.chatbot-container iframe {
  transition: all 0.3s ease;
}

.chatbot-container:hover iframe {
  box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.15);
}

/* 智能机器人浮动按钮样式 */
.chatbot-float-button {
  position: fixed;
  bottom: 30px;
  right: 30px;
  z-index: 1000;
}

.float-btn {
  width: 60px !important;
  height: 60px !important;
  font-size: 24px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
  transition: all 0.3s ease;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border: none;
}

.float-btn:hover {
  transform: scale(1.1);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4);
}

.float-btn:active {
  transform: scale(0.95);
}

/* 弹窗中的聊天机器人容器 */
.el-dialog .chatbot-container {
  margin: -20px -20px 0 -20px;
}

.el-dialog .chatbot-container iframe {
  border-radius: 0 0 8px 8px;
}

</style>
