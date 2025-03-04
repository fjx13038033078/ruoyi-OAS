<template>
  <div>
    <div class="app-container">
      <!-- 新增点位按钮 -->
      <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
        <el-col>
          <el-button type="primary" @click="handleAddPoint" v-hasPermi="['point:point:add']">新增点位</el-button>
        </el-col>
      </el-row>

      <!-- 点位信息列表 -->
      <el-table :data="pointList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="点位ID" prop="pointId" align="center"></el-table-column>
        <el-table-column label="点位名称" prop="pointName" align="center"></el-table-column>
        <el-table-column label="用户名" prop="userName" align="center"></el-table-column>
        <el-table-column label="下一节点" prop="pointNext" align="center"></el-table-column>
        <el-table-column label="返回节点" prop="pointBack" align="center"></el-table-column>
        <el-table-column label="操作" align="center" width="220px">
          <template #default="{ row }">
            <el-button type="info" size="mini" @click="handleView(row)" v-hasPermi="['point:point:view']">查看</el-button>
            <el-button type="primary" size="mini" @click="handleEdit(row)" v-hasPermi="['point:point:edit']">编辑</el-button>
            <el-button type="danger" size="mini" @click="handleDelete(row)" v-hasPermi="['point:point:delete']">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="fetchPoints"
      />

      <!-- 新增/编辑点位对话框 -->
      <el-dialog :visible.sync="dialogVisible" :title="dialogTitle" width="30%">
        <el-form :model="pointForm" label-width="100px" ref="pointFormRef" :rules="rules">
          <el-form-item label="点位名称" prop="pointName">
            <el-input v-model="pointForm.pointName" placeholder="请输入点位名称"></el-input>
          </el-form-item>
          <el-form-item label="用户名" prop="userName">
            <el-input v-model="pointForm.userName" placeholder="请输入用户名"></el-input>
          </el-form-item>
          <el-form-item label="下一节点" prop="pointNext">
            <el-input v-model.number="pointForm.pointNext" placeholder="请输入下一节点ID" type="number"></el-input>
          </el-form-item>
          <el-form-item label="返回节点" prop="pointBack">
            <el-input v-model.number="pointForm.pointBack" placeholder="请输入返回节点ID" type="number"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSubmit">{{ dialogButton }}</el-button>
        </div>
      </el-dialog>

      <!-- 查看点位详情对话框 -->
      <el-dialog :visible.sync="viewDialogVisible" title="点位详情" width="30%">
        <el-form :model="viewPointForm" label-width="100px">
          <el-form-item label="点位ID">
            <el-input v-model="viewPointForm.pointId" readonly></el-input>
          </el-form-item>
          <el-form-item label="点位名称">
            <el-input v-model="viewPointForm.pointName" readonly></el-input>
          </el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="viewPointForm.userName" readonly></el-input>
          </el-form-item>
          <el-form-item label="下一节点">
            <el-input v-model="viewPointForm.pointNext" readonly></el-input>
          </el-form-item>
          <el-form-item label="返回节点">
            <el-input v-model="viewPointForm.pointBack" readonly></el-input>
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
import { listAllPoints, addPoint, updatePoint, deletePoint } from "@/api/point/oasPoint";

export default {
  data() {
    return {
      loading: false,
      pointList: [],
      total: 0,
      dialogVisible: false,
      dialogTitle: "新增点位",
      dialogButton: "添加",
      pointForm: {
        pointId: null,
        pointName: "",
        userName: "",
        pointNext: null,
        pointBack: null,
      },
      viewDialogVisible: false,
      viewPointForm: {},
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
      rules: {
        pointName: [{ required: true, message: "请输入点位名称", trigger: "blur" }],
        userName: [{ required: true, message: "请输入用户名", trigger: "blur" }],
      },
    };
  },
  created() {
    this.fetchPoints();
  },
  methods: {
    // 获取点位列表
    fetchPoints() {
      this.loading = true;
      listAllPoints(this.queryParams).then((response) => {
        this.pointList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 新增点位
    handleAddPoint() {
      this.dialogTitle = "新增点位";
      this.dialogButton = "添加";
      this.pointForm = {
        pointId: null,
        pointName: "",
        userName: "",
        pointNext: null,
        pointBack: null,
      };
      this.dialogVisible = true;
    },
    // 编辑点位
    handleEdit(row) {
      this.dialogTitle = "编辑点位";
      this.dialogButton = "更新";
      this.pointForm = { ...row };
      this.dialogVisible = true;
    },
    // 查看详情
    handleView(row) {
      this.viewPointForm = { ...row };
      this.viewDialogVisible = true;
    },
    // 删除点位
    handleDelete(row) {
      this.$confirm("确定删除该点位吗？", "提示", {
        type: "warning",
      }).then(() => {
        deletePoint(row.pointId).then(() => {
          this.$message.success("删除成功");
          this.fetchPoints();
        });
      });
    },
    // 提交表单
    handleSubmit() {
      this.$refs.pointFormRef.validate((valid) => {
        if (valid) {
          const api = this.dialogButton === "添加" ? addPoint : updatePoint;
          api(this.pointForm).then(() => {
            this.$message.success(this.dialogButton + "成功");
            this.dialogVisible = false;
            this.fetchPoints();
          });
        }
      });
    },
  },
};
</script>
