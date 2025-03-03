<template>
  <div class="app-container">
    <!-- 办公用品申购记录列表 -->
    <el-table :data="purchaseList" v-loading="loading" style="width: 100%" border>
      <el-table-column label="申购ID" prop="purchaseId" align="center"></el-table-column>
      <el-table-column label="申购人" prop="userName" align="center"></el-table-column>
      <el-table-column label="用品名称" prop="supplyName" align="center"></el-table-column>
      <el-table-column label="数量" prop="quantity" align="center"></el-table-column>
      <el-table-column label="申购日期" prop="createTime" align="center"></el-table-column>
      <el-table-column label="状态" prop="status" align="center">
        <template #default="scope">
          <el-tag :type="scope.row.status === 0 ? 'warning' : (scope.row.status === 1 ? 'success' : 'danger')">
            {{ scope.row.status === 0 ? '待审批' : (scope.row.status === 1 ? '已批准' : '已拒绝') }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="审批人" prop="approvalUserName" align="center"></el-table-column>
      <el-table-column label="操作" align="center" width="350px">
        <template #default="{ row }">
          <el-button type="primary" size="mini" @click="handleView(row)">查看</el-button>
          <el-button type="danger" size="mini" @click="handleDelete(row)" v-if="row.status === 0"
                     v-hasPermi="['office:purchase:delete']">删除
          </el-button>
          <el-button type="success" size="mini" @click="handleApproval(row)" v-if="row.status === 0"
                     v-hasPermi="['office:purchase:approve']">审批
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
                @pagination="fetchPurchaseList"/>

    <!-- 查看办公用品申购记录对话框 -->
    <el-dialog :visible.sync="viewDialogVisible" title="查看申购记录" width="30%">
      <el-form :model="viewForm" label-width="100px">
        <el-form-item label="用品名称"><span>{{ viewForm.supplyName }}</span></el-form-item>
        <el-form-item label="数量"><span>{{ viewForm.quantity }}</span></el-form-item>
        <el-form-item label="申购日期"><span>{{ viewForm.createTime }}</span></el-form-item>
        <el-form-item label="状态">
          <el-tag :type="viewForm.status === 0 ? 'warning' : 'success'">
            {{ viewForm.status === 0 ? '待审批' : (viewForm.status === 1 ? '已批准' : '已拒绝') }}
          </el-tag>
        </el-form-item>
        <el-form-item label="审批人"><span>{{ viewForm.approvalUserName }}</span></el-form-item>
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
</template>

<script>
import {
  listAllOfficeSupplyPurchases,
  deleteOfficeSupplyPurchase, updateOfficeSupplyPurchaseStatus,
} from "@/api/office/officeSupplyPurchase";

export default {
  data() {
    return {
      loading: false,
      purchaseList: [],
      total: 0,
      viewDialogVisible: false,
      approvalDialogVisible: false, // 审批对话框显示状态
      approvalForm: {
        purchaseId: null,
        status: null,
      },
      viewForm: {},
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
    };
  },
  created() {
    this.fetchPurchaseList();
  },
  methods: {
    fetchPurchaseList() {
      this.loading = true;
      listAllOfficeSupplyPurchases().then(response => {
        this.purchaseList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleView(row) {
      this.viewForm = row;
      this.viewDialogVisible = true;
    },
    handleDelete(row) {
      this.$confirm("确定删除该申购记录吗？", "提示", {type: "warning"}).then(() => {
        deleteOfficeSupplyPurchase(row.purchaseId).then(() => {
          this.$message.success("删除成功");
          this.fetchPurchaseList();
        });
      });
    },
    // 审批请假申请
    handleApproval(row) {
      this.approvalForm.purchaseId = row.purchaseId; // 设置待审批的请假申请ID
      this.approvalForm.status = null; // 清空之前的审批状态
      this.approvalDialogVisible = true; // 打开审批对话框
    },
    // 提交审批
    handleApprovalSubmit() {
      if (this.approvalForm.status === null) {
        this.$message.warning("请选择审批状态");
        return;
      }
      updateOfficeSupplyPurchaseStatus(this.approvalForm).then(() => {
        this.$message.success("审批成功");
        this.approvalDialogVisible = false;
        this.fetchPurchaseList(); // 刷新列表
      });
    },
  },
};
</script>
