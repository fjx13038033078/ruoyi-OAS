<template>
  <div>
    <div class="app-container">
      <!-- 用车申请记录列表 -->
      <el-table :data="vehicleApplicationList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="申请ID" prop="applicationId" align="center"></el-table-column>
        <el-table-column label="申请人" prop="userName" align="center"></el-table-column>
        <el-table-column label="车牌号" prop="vehicleNumber" align="center"></el-table-column>
        <el-table-column label="用车理由" prop="reason" align="center"></el-table-column>
        <el-table-column label="用车开始时间" prop="startDate" align="center"></el-table-column>
        <el-table-column label="用车结束时间" prop="endDate" align="center"></el-table-column>
        <el-table-column label="申请状态" prop="status" align="center">
          <template #default="scope">
            <el-tag :type="scope.row.status === 0 ? 'warning' : (scope.row.status === 1 ? 'success' : 'danger')">
              {{ scope.row.status === 0 ? '待审批' : (scope.row.status === 1 ? '已批准' : '已拒绝') }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="300px">
          <template #default="{ row }">
            <el-button
              v-if="row.status === 0"
              type="primary"
              size="mini"
              @click="handleApproval(row)"
              v-hasPermi="['vehicle:application:approve']"
            >
              审批
            </el-button>
            <el-button
              v-if="row.status === 0"
              type="danger"
              size="mini"
              @click="handleDelete(row)"
              v-hasPermi="['vehicle:application:delete']"
            >
              删除
            </el-button>
            <el-button
              v-if="row.status === 1"
              type="primary"
              size="mini"
              @click="handleReturn(row)"
              v-hasPermi="['vehicle:application:return']"
            >
              车辆归还
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
        @pagination="fetchVehicleApplications"
      />

      <!-- 审批用车申请对话框 -->
      <el-dialog :visible.sync="dialogVisible" title="审批用车申请" width="30%">
        <el-form :model="approvalForm" label-width="100px" ref="approvalFormRef">
          <el-form-item label="审批状态">
            <el-select v-model="approvalForm.status" placeholder="请选择审批状态">
              <el-option label="批准" :value=1></el-option>
              <el-option label="拒绝" :value=2></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleApproveSubmit">提交审批</el-button>
        </div>
      </el-dialog>

      <!-- 还车申请对话框 -->
      <el-dialog :visible.sync="returnDialogVisible" title="审批用车申请" width="30%">
        <el-form :model="returnForm" label-width="100px" ref="returnFormRef">
          <el-form-item label="还车日期">
            <el-date-picker
              v-model="returnForm.returnDate"
              type="date"
              placeholder="选择日期"
              value-format="yyyy-MM-dd"
            ></el-date-picker>
          </el-form-item>
          <el-form-item label="里程数">
            <el-input v-model="returnForm.odometerReading" type="number" style="width: 220px"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleReturnSubmit">提交申请</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>

import {
  deleteVehicleApplication,
  listAllVehicleApplications,
  updateVehicleApplication
} from "@/api/vehicel/vehicleApplication";
import {addVehicleReturn} from "@/api/vehicel/vehicleReturn";

export default {
  data() {
    return {
      loading: false,
      vehicleApplicationList: [],
      total: 0,
      dialogVisible: false,
      returnDialogVisible: false,
      returnForm: {
        applicationId: null,
        returnDate: '',
        odometerReading: null,
      },
      approvalForm: {
        applicationId: null,
        status: null,
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
    };
  },
  created() {
    this.fetchVehicleApplications();
  },
  methods: {
    // 获取用车申请记录列表
    fetchVehicleApplications() {
      this.loading = true;
      listAllVehicleApplications().then((response) => {
        this.vehicleApplicationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 审批用车申请
    handleApproval(row) {
      this.approvalForm = {
        applicationId: row.applicationId,
        status: null, // 初始状态
      };
      this.dialogVisible = true;
    },
    // 提交审批
    handleApproveSubmit() {
      updateVehicleApplication(this.approvalForm).then(() => {
        this.$message.success("审批成功");
        this.dialogVisible = false;
        this.fetchVehicleApplications();
      });
    },
    // 删除用车申请
    handleDelete(row) {
      this.$confirm("确定删除该申请吗？", "提示", {
        type: "warning",
      }).then(() => {
        deleteVehicleApplication(row.applicationId).then(() => {
          this.$message.success("删除成功");
          this.fetchVehicleApplications();
        });
      });
    },
    handleReturn(row){
      this.returnForm = {
        applicationId: row.applicationId,
        returnDate: '',
        odometerReading: null,
      };
      this.returnDialogVisible = true;
    },
    handleReturnSubmit(){
      addVehicleReturn( this.returnForm).then(() => {
        this.$message.success("提交成功");
      }).then(() => {
        this.returnDialogVisible = false;
      })
    }
  },
};
</script>
