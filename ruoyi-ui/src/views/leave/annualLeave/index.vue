<template>
  <div>
    <div class="app-container">
      <!-- 剩余假期记录列表 -->
      <el-table :data="annualLeaveList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="记录ID" prop="leaveId" align="center"></el-table-column>
        <el-table-column label="用户名" prop="userName" align="center"></el-table-column>
        <el-table-column label="总年假天数" prop="totalLeaveDays" align="center"></el-table-column>
        <el-table-column label="已使用天数" prop="usedLeaveDays" align="center"></el-table-column>
        <el-table-column label="剩余天数" prop="remainingLeaveDays" align="center"></el-table-column>
        <el-table-column label="操作" align="center" width="200px">
          <template #default="{ row }">
            <el-button type="primary" size="mini" @click="handleView(row)">查看</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="fetchAnnualLeaves"
      />

      <!-- 查看年假记录对话框 -->
      <el-dialog :visible.sync="viewDialogVisible" title="查看年假记录" width="30%">
        <el-form :model="viewForm" label-width="100px" ref="viewFormRef">
          <el-form-item label="用户ID">
            <el-input v-model="viewForm.userId" readonly></el-input>
          </el-form-item>
          <el-form-item label="总年假天数">
            <el-input v-model="viewForm.totalLeaveDays" readonly></el-input>
          </el-form-item>
          <el-form-item label="已使用天数">
            <el-input v-model="viewForm.usedLeaveDays" readonly></el-input>
          </el-form-item>
          <el-form-item label="剩余天数">
            <el-input v-model="viewForm.remainingLeaveDays" readonly></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="viewDialogVisible = false">关闭</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import { listAllAnnualLeaves } from "@/api/leave/annualLeave";

export default {
  data() {
    return {
      loading: false,
      annualLeaveList: [],
      total: 0,
      viewDialogVisible: false,
      viewForm: {
        userId: '',
        totalLeaveDays: '',
        usedLeaveDays: '',
        remainingLeaveDays: ''
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
    };
  },
  created() {
    this.fetchAnnualLeaves();
  },
  methods: {
    // 获取所有年假记录
    fetchAnnualLeaves() {
      this.loading = true;
      listAllAnnualLeaves().then((response) => {
        this.annualLeaveList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    // 查看年假记录
    handleView(row) {
      this.viewForm = { ...row };
      this.viewDialogVisible = true;
    },
  },
};
</script>

<style scoped lang="scss">
</style>
