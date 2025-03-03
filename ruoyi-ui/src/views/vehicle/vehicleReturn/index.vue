<template>
  <div>
    <div class="app-container">
      <!-- 车辆归还记录列表 -->
      <el-table :data="vehicleReturnList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="归还ID" prop="returnId" align="center"></el-table-column>
        <el-table-column label="车辆编号" prop="vehicleNumber" align="center"></el-table-column>
        <el-table-column label="申请归还人" prop="userName" align="center"></el-table-column>
        <el-table-column label="归还日期" prop="returnDate" align="center"></el-table-column>
        <el-table-column label="里程数" prop="odometerReading" align="center"></el-table-column>
        <el-table-column label="操作" align="center" width="200px">
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
              v-hasPermi="['vehicle:return:delete']"
            >
              删除
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
        @pagination="fetchVehicleReturns"
      />

      <!-- 车辆归还记录查看对话框 -->
      <el-dialog :visible.sync="viewDialogVisible" title="查看归还记录" width="30%">
        <el-form :model="viewForm" label-width="100px" ref="viewFormRef">
          <el-form-item label="车辆编号">
            <el-input v-model="viewForm.vehicleNumber" readonly></el-input>
          </el-form-item>
          <el-form-item label="归还人">
            <el-input v-model="viewForm.userName" readonly></el-input>
          </el-form-item>
          <el-form-item label="归还日期">
            <el-input v-model="viewForm.returnDate" readonly></el-input>
          </el-form-item>
          <el-form-item label="里程数">
            <el-input v-model="viewForm.odometerReading" readonly></el-input>
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
import { listAllVehicleReturns, deleteVehicleReturn } from "@/api/vehicel/vehicleReturn";

export default {
  data() {
    return {
      loading: false,
      vehicleReturnList: [],
      total: 0,
      viewDialogVisible: false,
      viewForm: {
        vehicleNumber: '',
        returnDate: '',
        odometerReading: null,
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
    };
  },
  created() {
    this.fetchVehicleReturns();
  },
  methods: {
    // 获取所有车辆归还记录
    fetchVehicleReturns() {
      this.loading = true;
      listAllVehicleReturns().then((response) => {
        this.vehicleReturnList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    // 查看归还记录
    handleView(row) {
      this.viewForm = {
        vehicleNumber: row.vehicleNumber,
        userName: row.userName,
        returnDate: row.returnDate,
        odometerReading: row.odometerReading,
      };
      this.viewDialogVisible = true;
    },

    // 删除车辆归还记录
    handleDelete(row) {
      this.$confirm("确定删除该归还记录吗？", "提示", {
        type: "warning",
      }).then(() => {
        deleteVehicleReturn(row.returnId).then(() => {
          this.$message.success("删除成功");
          this.fetchVehicleReturns();
        });
      });
    }
  },
};
</script>


<style scoped lang="scss">

</style>
