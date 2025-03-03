<template>
  <div>
    <div class="app-container">
      <!-- 请假申请按钮 -->
      <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
        <el-col>
          <el-button type="primary" @click="handleAddLeaveApplication">发起请假申请</el-button>
        </el-col>
      </el-row>

      <!-- 请假申请记录列表 -->
      <el-table :data="leaveApplicationList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="请假ID" prop="leaveId" align="center"></el-table-column>
        <el-table-column label="申请人" prop="userName" align="center"></el-table-column>
        <el-table-column label="请假类型" prop="leaveType" align="center">
          <template #default="scope">
            <el-tag :type="scope.row.leaveType === 0 ? 'success' : (scope.row.leaveType === 1 ? 'warning' : 'info')">
              {{ scope.row.leaveType === 0 ? '年假' : (scope.row.leaveType === 1 ? '病假' : '事假') }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="请假开始时间" prop="startDate" align="center"></el-table-column>
        <el-table-column label="请假结束时间" prop="endDate" align="center"></el-table-column>
        <el-table-column label="请假理由" prop="leaveReason" align="center"></el-table-column>
        <el-table-column label="申请状态" prop="status" align="center">
          <template #default="scope">
            <el-tag :type="scope.row.status === 0 ? 'warning' : (scope.row.status === 1 ? 'success' : 'danger')">
              {{ scope.row.status === 0 ? '待审批' : (scope.row.status === 1 ? '已批准' : '已拒绝') }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="400px">
          <template #default="{ row }">
            <el-button
              type="primary"
              size="mini"
              @click="handleView(row)"
            >
              查看
            </el-button>
            <el-button
              type="danger"
              size="mini"
              @click="handleDelete(row)"
              v-if="row.status === 0"
            >
              删除
            </el-button>
            <el-button
              type="success"
              size="mini"
              @click="handleApproval(row)"
              v-if="row.status === 0"
            >
              审批
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="fetchLeaveApplications"
      />

      <!-- 发起请假申请对话框 -->
      <el-dialog :visible.sync="addDialogVisible" title="发起请假申请" width="40%">
        <el-form :model="addForm" label-width="100px" ref="addFormRef">
          <el-form-item label="请假类型">
            <el-select v-model="addForm.leaveType" placeholder="请选择请假类型">
              <el-option label="年假" :value="0"></el-option>
              <el-option label="病假" :value="1"></el-option>
              <el-option label="事假" :value="2"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="请假开始时间">
            <el-date-picker
              v-model="addForm.startDate"
              type="date"
              placeholder="请选择开始时间"
              value-format="yyyy-MM-dd"
            ></el-date-picker>
          </el-form-item>
          <el-form-item label="请假结束时间">
            <el-date-picker
              v-model="addForm.endDate"
              type="date"
              placeholder="请选择结束时间"
              value-format="yyyy-MM-dd"
            ></el-date-picker>
          </el-form-item>
          <el-form-item label="请假理由">
            <el-input v-model="addForm.leaveReason" type="textarea" placeholder="请输入请假理由"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="addDialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleAddSubmit">提交申请</el-button>
        </div>
      </el-dialog>

      <!-- 查看请假申请对话框 -->
      <el-dialog :visible.sync="viewDialogVisible" title="查看请假申请" width="30%">
        <el-form :model="viewForm" label-width="100px" ref="viewFormRef">
          <el-form-item label="请假类型">
            <el-tag :type="viewForm.leaveType === 0 ? 'success' : (viewForm.leaveType === 1 ? 'warning' : 'info')">
              {{ viewForm.leaveType === 0 ? '年假' : (viewForm.leaveType === 1 ? '病假' : '事假') }}
            </el-tag>
          </el-form-item>
          <el-form-item label="请假开始时间">
            <span>{{ viewForm.startDate }}</span>
          </el-form-item>
          <el-form-item label="请假结束时间">
            <span>{{ viewForm.endDate }}</span>
          </el-form-item>
          <el-form-item label="请假理由">
            <span>{{ viewForm.leaveReason }}</span>
          </el-form-item>
          <el-form-item label="申请状态">
            <el-tag :type="viewForm.status === 0 ? 'warning' : (viewForm.status === 1 ? 'success' : 'danger')">
              {{ viewForm.status === 0 ? '待审批' : (viewForm.status === 1 ? '已批准' : '已拒绝') }}
            </el-tag>
          </el-form-item>
          <el-form-item label="审批人">
            <span>{{ viewForm.approvalUserName }}</span>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="viewDialogVisible = false">关闭</el-button>
        </div>
      </el-dialog>

      <!-- 审批请假申请对话框 -->
      <el-dialog :visible.sync="approvalDialogVisible" title="审批请假申请" width="30%">
        <el-form :model="approvalForm" label-width="100px" ref="approvalFormRef">
          <el-form-item label="审批状态">
            <el-select v-model="approvalForm.status" placeholder="请选择审批状态">
              <el-option label="批准" :value="1"></el-option>
              <el-option label="拒绝" :value="2"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="approvalDialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleApprovalSubmit">提交审批</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import {
  listAllLeaveApplications,
  addLeaveApplication,
  deleteLeaveApplication,
  updateLeaveApplicationStatus
} from "@/api/leave/leaveApplication";

export default {
  data() {
    return {
      loading: false,
      leaveApplicationList: [],
      total: 0,
      addDialogVisible: false,
      approvalDialogVisible: false, // 审批对话框显示状态
      viewDialogVisible: false, // 新增查看对话框的显示状态
      viewForm: {}, // 存储查看的申请详情
      approvalForm: {
        leaveId: null,
        status: null // 审批状态，1-批准，2-拒绝
      },
      addForm: {
        leaveType: null,
        startDate: '',
        endDate: '',
        leaveReason: ''
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
    };
  },
  created() {
    this.fetchLeaveApplications();
  },
  methods: {
    // 获取所有请假申请记录
    fetchLeaveApplications() {
      this.loading = true;
      listAllLeaveApplications().then((response) => {
        this.leaveApplicationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 发起请假申请
    handleAddLeaveApplication() {
      this.addForm = {
        leaveType: null,
        startDate: '',
        endDate: '',
        leaveReason: ''
      };
      this.addDialogVisible = true;
    },
    // 提交请假申请
    handleAddSubmit() {
      addLeaveApplication(this.addForm).then(() => {
        this.$message.success("请假申请提交成功");
        this.addDialogVisible = false;
        this.fetchLeaveApplications();
      });
    },
    // 查看请假申请
    handleView(row) {
      this.viewForm = row;
      this.viewDialogVisible = true;
    },
    // 删除请假申请
    handleDelete(row) {
      this.$confirm("确定删除该请假申请吗？", "提示", {
        type: "warning",
      }).then(() => {
        deleteLeaveApplication(row.leaveId).then(() => {
          this.$message.success("删除成功");
          this.fetchLeaveApplications();
        });
      });
    },
    // 审批请假申请
    handleApproval(row) {
      this.approvalForm.leaveId = row.leaveId; // 设置待审批的请假申请ID
      this.approvalForm.status = null; // 清空之前的审批状态
      this.approvalDialogVisible = true; // 打开审批对话框
    },
    // 提交审批
    handleApprovalSubmit() {
      if (this.approvalForm.status === null) {
        this.$message.warning("请选择审批状态");
        return;
      }
      updateLeaveApplicationStatus(this.approvalForm).then(() => {
        this.$message.success("审批成功");
        this.approvalDialogVisible = false;
        this.fetchLeaveApplications(); // 刷新列表
      });
    },
  },
};
</script>
