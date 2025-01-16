<template>
  <div>
    <div class="app-container">
      <!-- 新增报修按钮 -->
      <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
        <el-col>
          <el-button type="primary" @click="handleAddRepair" v-hasPermi="['property:repair:add']">新增报修</el-button>
        </el-col>
      </el-row>

      <!-- 报修记录列表 -->
      <el-table :data="repairList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="报修ID" prop="repairId" align="center"></el-table-column>
        <el-table-column label="用户名称" prop="userName" align="center"></el-table-column>
        <el-table-column label="报修时间" prop="createdTime" align="center"></el-table-column>
        <el-table-column label="报修内容" prop="description" align="center">
          <template #default="scope">
            <span>{{ scope.row.description.slice(0, 20) }}...</span>
          </template>
        </el-table-column>
        <el-table-column label="状态" prop="status" align="center">
          <template #default="scope">
            <el-tag
              :type="scope.row.status === 0 ? 'warning' : scope.row.status === 1 ? 'info' : 'success'"
            >
              {{
                scope.row.status === 0
                  ? '待处理'
                  : scope.row.status === 1
                    ? '处理中'
                    : '已完成'
              }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="350px">
          <template #default="{ row }">
            <el-button type="success" size="mini" @click="handleUpdateStatus(row)" v-hasPermi="['property:repair:change']">更改状态</el-button>
            <el-button type="info" size="mini" @click="handleView(row)" v-hasPermi="['property:repair:view']">查看</el-button>
            <el-button
              v-if="row.status === 0"
              type="primary"
              size="mini"
              @click="handleEdit(row)"
              v-hasPermi="['property:repair:edit']"
            >
              编辑
            </el-button>
            <el-button type="danger" size="mini" @click="handleDelete(row)" v-hasPermi="['property:repair:delete']">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页组件 -->
      <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="fetchRepairs"
      />

      <!-- 新增/编辑报修对话框 -->
      <el-dialog :visible.sync="dialogVisible" :title="dialogTitle" width="30%">
        <el-form :model="repairForm" label-width="100px">
          <el-form-item label="报修类型">
            <el-select v-model="repairForm.repairType" placeholder="请选择报修类型">
              <el-option label="电路维修" value="电路维修"></el-option>
              <el-option label="水管维修" value="水管维修"></el-option>
              <el-option label="门窗维修" value="门窗维修"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="报修描述">
            <el-input type="textarea" v-model="repairForm.description" placeholder="请输入报修描述"></el-input>
          </el-form-item>
          <el-form-item label="报修图片">
            <ImageUpload v-model="repairForm.repairImage"></ImageUpload>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSubmit">{{ dialogButton }}</el-button>
        </div>
      </el-dialog>

      <!-- 查看报修详情对话框 -->
      <el-dialog :visible.sync="viewDialogVisible" title="报修详情" width="30%">
        <el-form :model="viewRepairForm" label-width="100px">
          <el-form-item label="报修ID">
            <el-input v-model="viewRepairForm.repairId" disabled></el-input>
          </el-form-item>
          <el-form-item label="用户名称">
            <el-input v-model="viewRepairForm.userName" disabled></el-input>
          </el-form-item>
          <el-form-item label="报修时间">
            <el-input v-model="viewRepairForm.createdTime" disabled></el-input>
          </el-form-item>
          <el-form-item label="报修类型">
            <el-input v-model="viewRepairForm.repairType" disabled></el-input>
          </el-form-item>
          <el-form-item label="报修内容">
            <el-input type="textarea" v-model="viewRepairForm.description" disabled></el-input>
          </el-form-item>
          <el-form-item label="报修图片">
            <ImagePreview :src="viewRepairForm.repairImage"></ImagePreview>
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
import {listAllRepairs, addRepair, updateRepair, deleteRepair} from "@/api/property/repair";

export default {
  data() {
    return {
      loading: false,
      repairList: [],
      total: 0,
      dialogVisible: false,
      dialogTitle: "新增报修",
      dialogButton: "添加",
      repairForm: {
        repairId: null,
        repairType: "", // 报修类型
        description: "", // 报修描述
        repairImage: "",
      },
      viewDialogVisible: false, // 控制查看对话框显示
      viewRepairForm: {
        repairId: "",
        userName: "",
        createdTime: "",
        repairType: "",
        description: "",
        status: "",
        repairImage: "",
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
    };
  },
  created() {
    this.fetchRepairs();
  },
  methods: {
    // 获取报修记录列表
    fetchRepairs() {
      this.loading = true;
      listAllRepairs().then((response) => {
        this.repairList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 新增报修
    handleAddRepair() {
      this.dialogTitle = "新增报修";
      this.dialogButton = "添加";
      this.repairForm = {repairId: null, repairType: "", description: ""}; // 重置表单数据
      this.dialogVisible = true;
    },
    // 编辑报修
    handleEdit(row) {
      this.dialogTitle = "编辑报修";
      this.dialogButton = "保存";
      this.repairForm = {...row}; // 填充编辑数据
      this.dialogVisible = true;
    },
    // 删除报修
    handleDelete(row) {
      this.$confirm("确定删除该报修记录吗？", "提示", {
        type: "warning",
      }).then(() => {
        deleteRepair(row.repairId).then(() => {
          this.$message.success("删除成功");
          this.fetchRepairs();
        });
      });
    },
    handleUpdateStatus(row){
      // 检查当前状态并执行相应逻辑
      if (row.status === 2) {
        this.$message.warning("该维修已维修完成，无法更新状态");
        return;
      }
      // 确认提示
      this.$confirm(
        `确定将报修状态从 ${row.status === 0 ? "待处理" : row.status === 1 ? "已处理" : ""} 更新为 ${
          row.status === 0 ? "已处理" : "维修完成"
        } 吗？`,
        "提示",
        {
          type: "warning",
        }
      ).then(() => {
        // 更新状态
        const updatedRow = {
          ...row,
          status: row.status + 1, // 状态值递增
        };
        updateRepair(updatedRow).then(() => {
          this.$message.success("状态更新成功");
          this.fetchRepairs(); // 刷新列表
        });
      })
    },
    // 提交表单
    handleSubmit() {
      if (this.dialogButton === "添加") {
        addRepair(this.repairForm).then(() => {
          this.$message.success("新增成功");
          this.dialogVisible = false;
          this.fetchRepairs();
        });
      } else {
        updateRepair(this.repairForm).then(() => {
          this.$message.success("更新成功");
          this.dialogVisible = false;
          this.fetchRepairs();
        });
      }
    },
    // 查看报修详情
    handleView(row) {
      this.viewRepairForm = { ...row }; // 填充数据
      this.viewDialogVisible = true; // 打开查看对话框
    },
  },
};
</script>
