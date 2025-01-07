<template>
  <div>
    <!-- 反馈管理页面 -->
    <div class="app-container">
      <!-- 新增反馈按钮 -->
      <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
        <el-col>
          <el-button type="primary" @click="handleAddFeedback" v-hasPermi="['poem:feedback:add']">新增反馈</el-button>
        </el-col>
      </el-row>

      <!-- 反馈列表 -->
      <el-table :data="feedbackList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="反馈ID" prop="feedbackId" align="center"></el-table-column>
        <el-table-column label="用户姓名" prop="userName" align="center"></el-table-column>
        <el-table-column label="反馈内容" prop="content" align="center">
          <template #default="scope">
            <span>{{ scope.row.content.slice(0, 20) }}...</span>
          </template>
        </el-table-column>
        <el-table-column label="状态" align="center">
          <template #default="scope">
            <el-tag :type="scope.row.status === 1 ? 'success' : 'warning'">
              {{ scope.row.status === 1 ? '已回复' : '未回复' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="200px">
          <template slot-scope="scope">
            <el-button type="primary" size="mini" @click="handleView(scope.row)">查看详情</el-button>
            <el-button type="danger" size="mini" @click="handleDelete(scope.row)" v-hasPermi="['poem:feedback:delete']">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页组件 -->
      <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="fetchFeedbackList"
      />

      <el-dialog :visible.sync="addDialogVisible" title="新增反馈" width="40%">
        <el-form ref="addForm" :model="addFeedbackData" label-width="100px" :rules="rules">
          <el-form-item label="反馈内容" prop="content">
            <el-input v-model="addFeedbackData.content" type="textarea"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="addDialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitAddFeedback">提交</el-button>
        </div>
      </el-dialog>

      <!-- 反馈详情对话框 -->
      <el-dialog :visible.sync="dialogVisible" title="反馈详情" width="40%">
        <el-form label-width="100px">
          <el-form-item label="用户姓名">
            <el-input v-model="currentFeedback.userName" disabled></el-input>
          </el-form-item>
          <el-form-item label="反馈内容">
            <el-input v-model="currentFeedback.content" type="textarea" disabled></el-input>
          </el-form-item>
          <el-form-item label="管理员回复">
            <el-input v-model="currentFeedback.replyContent" type="textarea"
                      :disabled="currentFeedback.status === 1"></el-input>
          </el-form-item>
          <el-form-item label="回复时间">
            <el-input v-model="currentFeedback.replyTime" disabled></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">关闭</el-button>
          <el-button type="primary" @click="submitReply" v-if="currentFeedback.status === 0" v-hasPermi="['poem:feedback:reply']">回复</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import {replyFeedback, deleteFeedback, listAllFeedback, addFeedback} from '@/api/poem/feedback'
import {MessageBox} from 'element-ui';

export default {
  data() {
    return {
      loading: true,
      feedbackList: [],
      total: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
      dialogVisible: false,
      currentFeedback: {},
      addDialogVisible: false, // 控制新增对话框的显示
      addFeedbackData: {
        content: ''
      },
      rules: {
        content: [{required: true, message: '请输入反馈内容', trigger: 'blur'}]
      }
    }
  },
  created() {
    this.fetchFeedbackList()
  },
  methods: {
    // 获取反馈列表
    fetchFeedbackList() {
      this.loading = true;
      listAllFeedback(this.queryParams).then(response => {
        this.feedbackList = response.rows;
        this.total = response.total;
        this.loading = false;
      })
    },
    // 查看详情
    handleView(row) {
      this.currentFeedback = {...row};
      this.dialogVisible = true;
    },
    // 提交回复
    submitReply() {
      replyFeedback(this.currentFeedback).then(() => {
        this.$message.success('回复成功');
        this.dialogVisible = false;
        this.fetchFeedbackList();
      })
    },
    // 删除反馈
    handleDelete(row) {
      MessageBox.confirm('确认删除该反馈吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteFeedback(row.feedbackId).then(() => {
          this.$message.success('删除成功');
          this.fetchFeedbackList();
        })
      })
    },
    // 新增反馈
    handleAddFeedback() {
      this.addDialogVisible = true;
      this.addFeedbackData = {
        userName: '',
        content: ''
      };
    },
    // 提交新增反馈
    submitAddFeedback() {
      this.$refs.addForm.validate(valid => {
        if (valid) {
          addFeedback(this.addFeedbackData).then(() => {
            this.$message.success('新增成功');
            this.addDialogVisible = false;
            this.fetchFeedbackList();
          })
        }
      })
    }
  }
}
</script>
