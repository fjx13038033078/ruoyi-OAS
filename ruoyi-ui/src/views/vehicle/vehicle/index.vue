<template>
  <div>
    <div class="app-container">
      <!-- 新增车辆按钮 -->
      <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
        <el-col>
          <el-button type="primary" @click="handleAddVehicle" v-hasPermi="['vehicle:vehicle:add']">新增车辆</el-button>
        </el-col>
      </el-row>

      <!-- 车辆信息列表 -->
      <el-table :data="vehicleList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="车辆ID" prop="vehicleId" align="center"></el-table-column>
        <el-table-column label="车牌号" prop="vehicleNumber" align="center"></el-table-column>
        <el-table-column label="车辆类型" prop="vehicleType" align="center"></el-table-column>
        <el-table-column label="品牌" prop="brand" align="center"></el-table-column>
        <el-table-column label="型号" prop="model" align="center"></el-table-column>
        <el-table-column label="操作" align="center" width="300px">
          <template #default="{ row }">
            <el-button type="success" size="mini" @click="handleAddVehicleApplication(row)"
                       v-hasPermi="['vehicle:vehicle:apply']">用车申请
            </el-button>
            <el-button type="info" size="mini" @click="handleView(row)" v-hasPermi="['vehicle:vehicle:view']">查看
            </el-button>
            <el-button type="primary" size="mini" @click="handleEdit(row)" v-hasPermi="['vehicle:vehicle:edit']">编辑
            </el-button>
            <el-button type="danger" size="mini" @click="handleDelete(row)" v-hasPermi="['vehicle:vehicle:delete']">
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
        @pagination="fetchVehicles"
      />

      <!-- 新增/编辑车辆信息对话框 -->
      <el-dialog :visible.sync="dialogVisible" :title="dialogTitle" width="30%">
        <el-form :model="vehicleForm" label-width="100px" ref="vehicleFormRef" :rules="rules">
          <el-form-item label="车牌号" prop="vehicleNumber">
            <el-input v-model="vehicleForm.vehicleNumber" placeholder="请输入车牌号"></el-input>
          </el-form-item>
          <el-form-item label="车辆类型" prop="vehicleType">
            <el-select v-model="vehicleForm.vehicleType" placeholder="请选择车辆类型">
              <el-option
                v-for="type in vehicleTypes"
                :key="type.value"
                :label="type.label"
                :value="type.value"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="品牌" prop="brand">
            <el-input v-model="vehicleForm.brand" placeholder="请输入品牌"></el-input>
          </el-form-item>
          <el-form-item label="型号" prop="model">
            <el-input v-model="vehicleForm.model" placeholder="请输入型号"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSubmit">{{ dialogButton }}</el-button>
        </div>
      </el-dialog>

      <!-- 查看车辆详情对话框 -->
      <el-dialog :visible.sync="viewDialogVisible" title="车辆详情" width="30%">
        <el-form :model="viewVehicleForm" label-width="100px">
          <el-form-item label="车牌号">
            <el-input v-model="viewVehicleForm.vehicleNumber" readonly></el-input>
          </el-form-item>
          <el-form-item label="车辆类型">
            <el-input v-model="viewVehicleForm.vehicleType" readonly></el-input>
          </el-form-item>
          <el-form-item label="品牌">
            <el-input v-model="viewVehicleForm.brand" readonly></el-input>
          </el-form-item>
          <el-form-item label="型号">
            <el-input v-model="viewVehicleForm.model" readonly></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="viewDialogVisible = false">关闭</el-button>
        </div>
      </el-dialog>

      <!-- 用车申请对话框 -->
      <el-dialog :visible.sync="applicationDialogVisible" title="用车申请" width="40%">
        <el-form :model="vehicleApplicationForm" label-width="100px" ref="applicationFormRef" :rules="applicationRules">
          <el-form-item label="用车开始时间" prop="startDate">
            <el-date-picker v-model="vehicleApplicationForm.startDate" type="datetime"
                            placeholder="请选择用车开始时间"></el-date-picker>
          </el-form-item>
          <el-form-item label="用车结束时间" prop="endDate">
            <el-date-picker v-model="vehicleApplicationForm.endDate" type="datetime"
                            placeholder="请选择用车结束时间"></el-date-picker>
          </el-form-item>
          <el-form-item label="用车理由" prop="reason">
            <el-input v-model="vehicleApplicationForm.reason" placeholder="请输入用车理由"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="applicationDialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSubmitApplication">提交申请</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import {
  listAllVehicles,
  addVehicle,
  updateVehicle,
  deleteVehicle,
} from "@/api/vehicel/vehicle";
import {addVehicleApplication} from "@/api/vehicel/vehicleApplication";

export default {
  data() {
    return {
      loading: false,
      vehicleList: [],
      total: 0,
      dialogVisible: false,
      dialogTitle: "新增车辆信息",
      dialogButton: "添加",
      vehicleForm: {
        vehicleId: null,
        vehicleNumber: "",
        vehicleType: "",
        brand: "",
        model: "",
      },
      vehicleTypes: [
        {value: "Sedan", label: "轿车"},
        {value: "SUV", label: "SUV"},
        {value: "Truck", label: "卡车"},
        {value: "Van", label: "面包车"},
        {value: "Motorcycle", label: "摩托车"},
      ],
      viewDialogVisible: false,
      viewVehicleForm: {},
      applicationDialogVisible: false,  // 控制用车申请对话框的显示
      vehicleApplicationForm: {
        vehicleId: null,
        startDate: "",
        endDate: "",
        reason: "",
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
      rules: {
        vehicleNumber: [{required: true, message: "请输入车牌号", trigger: "blur"}],
        vehicleType: [{required: true, message: "请输入车辆类型", trigger: "blur"}],
        brand: [{required: true, message: "请输入品牌", trigger: "blur"}],
        model: [{required: true, message: "请输入型号", trigger: "blur"}],
      },
      applicationRules: {
        startDate: [{required: true, message: "请选择用车开始时间", trigger: "change"}],
        endDate: [{required: true, message: "请选择用车结束时间", trigger: "change"}],
        reason: [{required: true, message: "请输入用车理由", trigger: "blur"}],
      },
    };
  },
  created() {
    this.fetchVehicles();
  },
  methods: {
    // 获取车辆列表
    fetchVehicles() {
      this.loading = true;
      listAllVehicles().then((response) => {
        this.vehicleList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 新增车辆信息
    handleAddVehicle() {
      this.dialogTitle = "新增车辆信息";
      this.dialogButton = "添加";
      this.vehicleForm = {
        vehicleId: null,
        vehicleNumber: "",
        vehicleType: "",
        brand: "",
        model: "",
      };
      this.dialogVisible = true;
    },
    // 编辑车辆信息
    handleEdit(row) {
      this.dialogTitle = "编辑车辆信息";
      this.dialogButton = "更新";
      this.vehicleForm = {...row};
      this.dialogVisible = true;
    },
    // 查看车辆详情
    handleView(row) {
      this.viewVehicleForm = {...row};
      this.viewDialogVisible = true;
    },
    // 删除车辆信息
    handleDelete(row) {
      this.$confirm("确定删除该车辆吗？", "提示", {
        type: "warning",
      }).then(() => {
        deleteVehicle(row.vehicleId).then(() => {
          this.$message.success("删除成功");
          this.fetchVehicles();
        });
      });
    },
    // 提交表单
    handleSubmit() {
      this.$refs.vehicleFormRef.validate((valid) => {
        if (valid) {
          if (this.dialogButton === "添加") {
            addVehicle(this.vehicleForm).then(() => {
              this.$message.success("新增成功");
              this.dialogVisible = false;
              this.fetchVehicles();
            });
          } else {
            updateVehicle(this.vehicleForm).then(() => {
              this.$message.success("更新成功");
              this.dialogVisible = false;
              this.fetchVehicles();
            });
          }
        }
      });
    },
    // 新增用车申请
    handleAddVehicleApplication(row) {
      this.vehicleApplicationForm = {
        vehicleId: row.vehicleId,  // 设置当前车辆ID
        startDate: "",
        endDate: "",
        reason: "",
      };
      this.applicationDialogVisible = true;
    },
    // 提交用车申请
    handleSubmitApplication() {
      this.$refs.applicationFormRef.validate((valid) => {
        if (valid) {
          addVehicleApplication(this.vehicleApplicationForm).then(() => {
            this.$message.success("用车申请提交成功");
            this.applicationDialogVisible = false;
          });
        }
      });
    },
  },
};
</script>
