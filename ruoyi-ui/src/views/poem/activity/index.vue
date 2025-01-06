<template>
  <div>
    <div class="app-container">
      <!-- 新增活动按钮 -->
      <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
        <el-col>
          <el-button type="primary" @click="handleAddActivity">新增活动</el-button>
        </el-col>
      </el-row>

      <!-- 活动列表 -->
      <el-table :data="activityList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="活动ID" prop="activityId" align="center"></el-table-column>
        <el-table-column label="活动名称" prop="activityName" align="center"></el-table-column>
        <el-table-column label="活动地点" prop="activityLocation" align="center"></el-table-column>
        <el-table-column label="活动开始时间" prop="startTime" align="center"></el-table-column>
        <el-table-column label="活动结束时间" prop="endTime" align="center"></el-table-column>
        <el-table-column label="状态" align="center">
          <template #default="scope">
            {{ scope.row.status === 1 ? '可预约' : '不可预约' }}
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="350px">
          <template #default="scope">
            <el-button type="info" size="mini" @click="handleReservation(scope.row)">预约</el-button>
            <el-button type="primary" size="mini" @click="handleView(scope.row)">查看详情</el-button>
            <el-button type="warning" size="mini" @click="handleEdit(scope.row)">修改</el-button>
            <el-button type="danger" size="mini" @click="handleDelete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页组件 -->
      <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="fetchActivityList"
      />

      <el-dialog :visible.sync="viewDialogVisible" title="查看活动详情" width="40%">
        <el-form label-width="100px">
          <el-form-item label="活动名称">
            <el-input v-model="currentActivity.activityName" disabled></el-input>
          </el-form-item>
          <el-form-item label="活动地点">
            <el-input v-model="currentActivity.activityLocation" disabled></el-input>
          </el-form-item>
          <el-form-item label="活动开始时间">
            <el-input v-model="currentActivity.startTime" disabled></el-input>
          </el-form-item>
          <el-form-item label="活动结束时间">
            <el-input v-model="currentActivity.endTime" disabled></el-input>
          </el-form-item>
          <el-form-item label="活动内容">
            <el-input v-model="currentActivity.activityContent" type="textarea" disabled></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="viewDialogVisible = false">关闭</el-button>
        </div>
      </el-dialog>


      <!-- 新增/修改活动对话框 -->
      <el-dialog :visible.sync="addDialogVisible" :title="dialogTitle" width="40%">
        <el-form ref="activityForm" :model="activityData" label-width="100px" :rules="rules">
          <el-form-item label="活动名称" prop="activityName">
            <el-input v-model="activityData.activityName"></el-input>
          </el-form-item>
          <el-form-item label="活动地点" prop="activityLocation">
            <el-input v-model="activityData.activityLocation"></el-input>
          </el-form-item>
          <el-form-item label="活动内容" prop="activityContent">
            <el-input v-model="activityData.activityContent" type="textarea"></el-input>
          </el-form-item>
          <el-form-item label="开始时间" prop="startTime">
            <el-date-picker
              v-model="activityData.startTime"
              type="datetime"
              value-format="yyyy-MM-dd HH:mm:ss"
              placeholder="选择开始时间">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="结束时间" prop="endTime">
            <el-date-picker
              v-model="activityData.endTime"
              type="datetime"
              value-format="yyyy-MM-dd HH:mm:ss"
              placeholder="选择结束时间">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="状态">
            <el-switch v-model="activityData.status" :active-value="'1'" :inactive-value="'0'"></el-switch>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="addDialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitActivity">提交</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import { listAllActivities, addActivity, updateActivity, deleteActivity } from '@/api/poem/activity';
import { MessageBox } from 'element-ui';
import {addRegistration} from "@/api/poem/activityRegistration";

export default {
  data() {
    return {
      loading: true,
      activityList: [],
      total: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
      addDialogVisible: false,
      dialogTitle: '',
      activityData: {},
      viewDialogVisible: false, // 控制查看对话框的显示
      currentActivity: {},      // 存储当前活动的详细信息
      rules: {
        activityName: [{ required: true, message: '请输入活动名称', trigger: 'blur' }],
        activityLocation: [{ required: true, message: '请输入活动地点', trigger: 'blur' }],
        startTime: [{ required: true, message: '请选择开始时间', trigger: 'change' }],
        endTime: [{ required: true, message: '请选择结束时间', trigger: 'change' }]
      }
    }
  },
  created() {
    this.fetchActivityList();
  },
  methods: {
    fetchActivityList() {
      this.loading = true;
      listAllActivities(this.queryParams).then(response => {
        this.activityList = response.rows;
        this.total = response.total;
        this.loading = false;
      })
    },
    handleAddActivity() {
      this.dialogTitle = '新增活动';
      this.addDialogVisible = true;
      this.activityData = {};
    },
    // 查看活动详情
    handleView(row) {
      this.currentActivity = { ...row };
      this.viewDialogVisible = true;
    },
    handleEdit(row) {
      this.dialogTitle = '修改活动';
      this.addDialogVisible = true;
      this.activityData = { ...row };
    },
    // 活动报名
    handleReservation(row){
      this.$confirm('确定要预约该活动吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const data = {
          activityId: row.activityId
        };
        addRegistration(data).then(() => {
          this.$message.success('预约成功');
          this.fetchActivityList();  // 刷新活动列表
        });
      })
    },
    submitActivity() {
      this.$refs.activityForm.validate(valid => {
        if (valid) {
          if (this.activityData.activityId) {
            updateActivity(this.activityData).then(() => {
              this.$message.success('修改成功');
              this.addDialogVisible = false;
              this.fetchActivityList();
            });
          } else {
            addActivity(this.activityData).then(() => {
              this.$message.success('新增成功');
              this.addDialogVisible = false;
              this.fetchActivityList();
            });
          }
        }
      });
    },
    handleDelete(row) {
      MessageBox.confirm('确认删除该活动吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteActivity(row.activityId).then(() => {
          this.$message.success('删除成功');
          this.fetchActivityList();
        });
      });
    }
  }
}
</script>
