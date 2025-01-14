<template>
  <div>
    <div class="app-container">
      <!-- 新增缴费记录按钮 -->
      <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
        <el-col>
          <el-button type="primary" @click="handleAddPayment">新增缴费</el-button>
        </el-col>
      </el-row>

      <!-- 缴费记录列表 -->
      <el-table :data="paymentList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="缴费ID" prop="paymentId" align="center"></el-table-column>
        <el-table-column label="用户名" prop="userName" align="center"></el-table-column>
        <el-table-column label="缴纳金额" prop="amount" align="center"></el-table-column>
        <el-table-column label="缴费日期" prop="paymentDate" align="center"></el-table-column>
        <el-table-column label="缴费状态" prop="status" align="center">
          <template #default="scope">
            <el-tag :type="scope.row.status === 0 ? 'warning' : 'success'">
              {{ scope.row.status === 0 ? '待缴费' : '已缴费' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="详情描述" prop="description" align="center">
          <template #default="scope">
            <span>{{ (scope.row.description && scope.row.description.slice(0, 20)) || '-' }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="300px">
          <template #default="{ row }">
            <el-button
              v-if="row.status === 0"
              type="success"
              size="mini"
              @click="handleUpdateStatus(row)"
            >
              缴费
            </el-button>
            <el-button type="info" size="mini" @click="handleView(row)">查看</el-button>
            <el-button type="danger" size="mini" @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="fetchPayments"
      />

      <!-- 新增/编辑缴费记录对话框 -->
      <el-dialog :visible.sync="dialogVisible" :title="dialogTitle" width="30%">
        <el-form :model="paymentForm" label-width="100px">
          <el-form-item label="用户ID">
            <el-select v-model="paymentForm.userId" placeholder="请选用户" :disabled="isReadOnly">
              <el-option
                v-for="common in commonOptions"
                :key="common.userId"
                :label="common.userName"
                :value="common.userId"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="缴纳金额">
            <el-input-number v-model="paymentForm.amount" placeholder="请输入缴纳金额"></el-input-number>
          </el-form-item>
          <el-form-item label="缴费日期">
            <el-date-picker
              v-model="paymentForm.paymentDate"
              type="datetime"
              value-format="yyyy-MM-dd HH:mm:ss"
              placeholder="选择缴费截止时间">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="详情描述">
            <el-input
              type="textarea"
              v-model="paymentForm.description"
              placeholder="请输入详情描述"
            ></el-input>
          </el-form-item>
          <el-form-item label="附件上传">
            <FileUpload v-model="paymentForm.fileName"></FileUpload>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSubmit">{{ dialogButton }}</el-button>
        </div>
      </el-dialog>

      <!-- 查看缴费详情对话框 -->
      <el-dialog :visible.sync="viewDialogVisible" title="缴费详情" width="30%">
        <el-form :model="viewPaymentForm" label-width="100px">
          <el-form-item label="缴费ID">
            <el-input v-model="viewPaymentForm.paymentId" disabled></el-input>
          </el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="viewPaymentForm.userName" disabled></el-input>
          </el-form-item>
          <el-form-item label="缴纳金额">
            <el-input v-model="viewPaymentForm.amount" disabled></el-input>
          </el-form-item>
          <el-form-item label="缴费日期">
            <el-input v-model="viewPaymentForm.paymentDate" disabled></el-input>
          </el-form-item>
          <el-form-item label="详情描述">
            <el-input v-model="viewPaymentForm.description" disabled></el-input>
          </el-form-item>
          <el-form-item label="附件查看">
            <FileUpload v-model="viewPaymentForm.fileName" :is-show-tip="false" :disabled="true"></FileUpload>
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
import {
  listAllPayments,
  addPayment,
  updatePayment,
  deletePayment,
} from "@/api/property/payment";
import {listCommon} from "@/api/system/user";

export default {
  data() {
    return {
      loading: false,
      paymentList: [],
      total: 0,
      dialogVisible: false,
      dialogTitle: "新增缴费记录",
      dialogButton: "添加",
      commonOptions: [],
      isReadOnly: false,
      paymentForm: {
        paymentId: null,
        userId: "",
        amount: null,
        paymentDate: "",
        description: "",
        fileName: "",
      },
      viewDialogVisible: false,
      viewPaymentForm: {},
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
    };
  },
  created() {
    this.fetchPayments();
    this.fetchCommon();
  },
  methods: {
    // 获取缴费记录列表
    fetchPayments() {
      this.loading = true;
      listAllPayments().then((response) => {
        this.paymentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    fetchCommon() {
      listCommon(this.queryParams).then(response =>{
        this.commonOptions = response.rows.map(common => ({
          userId: common.userId,
          userName: common.nickName
        }))
      })
    },
    // 新增缴费记录
    handleAddPayment() {
      this.dialogTitle = "新增缴费记录";
      this.dialogButton = "添加";
      this.paymentForm = {
        paymentId: null,
        userId: "",
        amount: null,
        paymentDate: "",
        description: "",
      };
      this.dialogVisible = true;
    },
    // 更新缴费状态
    handleUpdateStatus(row) {
      const updatedRow = { ...row, status: 1 };
      updatePayment(updatedRow).then(() => {
        this.$message.success("缴费成功");
        this.fetchPayments();
      });
    },
    // 查看缴费记录
    handleView(row) {
      this.viewPaymentForm = { ...row };
      this.viewDialogVisible = true;
    },
    // 删除缴费记录
    handleDelete(row) {
      this.$confirm("确定删除该记录吗？", "提示", {
        type: "warning",
      }).then(() => {
        deletePayment(row.paymentId).then(() => {
          this.$message.success("删除成功");
          this.fetchPayments();
        });
      });
    },
    // 提交表单
    handleSubmit() {
      if (this.dialogButton === "添加") {
        addPayment(this.paymentForm).then(() => {
          this.$message.success("新增成功");
          this.dialogVisible = false;
          this.fetchPayments();
        });
      } else {
        updatePayment(this.paymentForm).then(() => {
          this.$message.success("更新成功");
          this.dialogVisible = false;
          this.fetchPayments();
        });
      }
    },
  },
};
</script>

