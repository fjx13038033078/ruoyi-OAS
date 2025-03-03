<template>
  <div class="app-container">
    <!-- 新增办公用品按钮 -->
    <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
      <el-col>
        <el-button type="primary" @click="handleAddSupply" v-hasPermi="['office:supply:add']">新增办公用品</el-button>
      </el-col>
    </el-row>

    <!-- 办公用品列表 -->
    <el-table :data="supplyList" v-loading="loading" border>
      <el-table-column label="用品ID" prop="supplyId" align="center"></el-table-column>
      <el-table-column label="用品名称" prop="supplyName" align="center"></el-table-column>
      <el-table-column label="用品类别" prop="supplyType" align="center">
        <template #default="{ row }">
          {{ row.supplyType === 0 ? "文具" : row.supplyType === 1 ? "电子设备" : "日常用品" }}
        </template>
      </el-table-column>
      <el-table-column label="库存数量" prop="quantity" align="center"></el-table-column>
      <el-table-column label="操作" align="center" width="400px">
        <template #default="{ row }">
          <el-button type="info" size="mini" @click="handleView(row)" v-hasPermi="['office:supply:view']">查看</el-button>
          <el-button type="primary" size="mini" @click="handleEdit(row)" v-hasPermi="['office:supply:edit']">编辑</el-button>
          <el-button type="danger" size="mini" @click="handleDelete(row)" v-hasPermi="['office:supply:delete']">删除</el-button>
          <el-button type="success" size="mini" @click="handlePurchase(row)" v-hasPermi="['office:supply:purchase']">申购</el-button>
          <el-button type="warning" size="mini" @click="handleUsage(row)" v-hasPermi="['office:supply:usage']">申领</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页组件 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="fetchSupplies" />

    <!-- 新增/编辑办公用品对话框 -->
    <el-dialog :visible.sync="dialogVisible" :title="dialogTitle" width="30%">
      <el-form :model="supplyForm" label-width="100px">
        <el-form-item label="用品名称">
          <el-input v-model="supplyForm.supplyName" placeholder="请输入用品名称"></el-input>
        </el-form-item>
        <el-form-item label="用品类别">
          <el-select v-model="supplyForm.supplyType" placeholder="请选择用品类别">
            <el-option label="文具" :value="0"></el-option>
            <el-option label="电子设备" :value="1"></el-option>
            <el-option label="日常用品" :value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="库存数量">
          <el-input-number v-model="supplyForm.quantity" :min="0"></el-input-number>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleSubmit">{{ dialogButton }}</el-button>
      </div>
    </el-dialog>

    <el-dialog
      title="查看办公用品详情"
      :visible.sync="openView"
      width="600px"
    >
      <el-form label-width="100px">
        <el-form-item label="用品名称">
          <span>{{ viewForm.supplyName }}</span>
        </el-form-item>
        <el-form-item label="用品分类">
          <span>{{ viewForm.supplyType === 0 ? "文具" : viewForm.supplyType === 1 ? "电子设备" : "日常用品" }}</span>
        </el-form-item>
        <el-form-item label="库存数量">
          <span>{{ viewForm.quantity }}</span>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button type="primary" @click="openView = false">关闭</el-button>
      </template>
    </el-dialog>

    <!-- 申购办公用品对话框 -->
    <el-dialog :visible.sync="purchaseDialogVisible" title="申购办公用品" width="30%">
      <el-form :model="purchaseForm" label-width="100px">
        <el-form-item label="用品名称">
          <el-input v-model="purchaseForm.supplyName" disabled></el-input>
        </el-form-item>
        <el-form-item label="申购数量">
          <el-input-number v-model="purchaseForm.quantity" :min="1"></el-input-number>
        </el-form-item>
        <el-form-item label="申购理由">
          <el-input type="textarea" v-model="purchaseForm.purchaseReason" placeholder="请输入申购理由"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="purchaseDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitPurchase">提交申请</el-button>
      </div>
    </el-dialog>

    <!-- 申领办公用品对话框 -->
    <el-dialog :visible.sync="usageDialogVisible" title="申领办公用品" width="30%">
      <el-form :model="usageForm" label-width="100px">
        <el-form-item label="用品名称">
          <el-input v-model="usageForm.supplyName" disabled></el-input>
        </el-form-item>
        <el-form-item label="申领数量">
          <el-input-number v-model="usageForm.quantity" :min="1"></el-input-number>
        </el-form-item>
        <el-form-item label="申领理由">
          <el-input type="textarea" v-model="usageForm.usageReason" placeholder="请输入申领理由"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="usageDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitUsage">提交申请</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAllOfficeSupplies, addOfficeSupply, updateOfficeSupply, deleteOfficeSupply } from "@/api/office/officeSupply";
import {addOfficeSupplyPurchase} from "@/api/office/officeSupplyPurchase";
import {addOfficeSupplyUsage} from "@/api/office/officeSupplyUsage";

export default {
  data() {
    return {
      loading: false,
      supplyList: [],
      total: 0,
      dialogVisible: false,
      viewForm: {},
      openView: false,
      dialogTitle: "新增办公用品",
      dialogButton: "添加",
      supplyForm: {
        supplyId: null,
        supplyName: "",
        supplyType:null,
        quantity: 0,
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
      purchaseDialogVisible: false,
      purchaseForm: {
        supplyId: "",
        supplyName: "",
        quantity: 1,
        purchaseReason: "",
      },
      usageDialogVisible: false, // 申领对话框
      usageForm: {
        supplyId: "",
        supplyName: "",
        quantity: 1,
        usageReason: "",
      },
    };
  },
  created() {
    this.fetchSupplies();
  },
  methods: {
    fetchSupplies() {
      this.loading = true;
      listAllOfficeSupplies().then((response) => {
        this.supplyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleView(row) {
      this.viewForm = { ...row };
      this.openView = true;
    },
    handleAddSupply() {
      this.dialogTitle = "新增办公用品";
      this.dialogButton = "添加";
      this.supplyForm = { supplyId: null, supplyName: "", supplyType: "", quantity: 0,};
      this.dialogVisible = true;
    },
    handleEdit(row) {
      this.dialogTitle = "编辑办公用品";
      this.dialogButton = "保存";
      this.supplyForm = { ...row };
      this.dialogVisible = true;
    },
    handleDelete(row) {
      this.$confirm("确定删除该办公用品记录吗？", "提示", { type: "warning" }).then(() => {
        deleteOfficeSupply(row.supplyId).then(() => {
          this.$message.success("删除成功");
          this.fetchSupplies();
        });
      });
    },
    handleSubmit() {
      if (this.dialogButton === "添加") {
        addOfficeSupply(this.supplyForm).then(() => {
          this.$message.success("新增成功");
          this.dialogVisible = false;
          this.fetchSupplies();
        });
      } else {
        updateOfficeSupply(this.supplyForm).then(() => {
          this.$message.success("更新成功");
          this.dialogVisible = false;
          this.fetchSupplies();
        });
      }
    },
    handlePurchase(row) {
      this.purchaseForm = {
        supplyId: row.supplyId,
        supplyName: row.supplyName,
        quantity: 1,
        purchaseReason: "",
      };
      this.purchaseDialogVisible = true;
    },
    submitPurchase() {
      if (!this.purchaseForm.purchaseReason) {
        return this.$message.warning("请输入申购理由！");
      }
      addOfficeSupplyPurchase({
        supplyId: this.purchaseForm.supplyId,
        quantity: this.purchaseForm.quantity,
        purchaseReason: this.purchaseForm.purchaseReason,
      }).then(() => {
        this.$message.success("申购申请提交成功！");
        this.purchaseDialogVisible = false;
      });
    },
    handleUsage(row) {
      this.usageForm = {
        supplyId: row.supplyId,
        supplyName: row.supplyName,
        quantity: 1,
        usageReason: "",
      };
      this.usageDialogVisible = true;
    },
    submitUsage() {
      if (!this.usageForm.usageReason) {
        return this.$message.warning("请输入申领理由！");
      }
      addOfficeSupplyUsage({
        supplyId: this.usageForm.supplyId,
        quantity: this.usageForm.quantity,
        usageReason: this.usageForm.usageReason,
      }).then(() => {
        this.$message.success("申领申请提交成功！");
        this.usageDialogVisible = false;
      });
    }
  },
};
</script>
