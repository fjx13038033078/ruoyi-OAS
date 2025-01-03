<template>
  <div class="app-container">
    <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
      <el-col>
        <el-button type="primary" @click="handleAdd">新增诗词</el-button>
      </el-col>
    </el-row>

    <el-table :data="poemList" v-loading="loading" border style="width: 100%">
      <el-table-column label="诗词ID" prop="poemId" align="center"></el-table-column>
      <el-table-column label="发布人" prop="userName" align="center"></el-table-column>
      <el-table-column label="标题" prop="poemTitle" align="center"></el-table-column>
      <el-table-column label="作者" prop="poemAuthor" align="center"></el-table-column>
      <el-table-column label="内容" prop="poemContent" align="center">
        <template #default="scope">
          <span>{{ scope.row.poemContent.slice(0, 20) }}...</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" prop="status" align="center">
        <template #default="scope">
          <el-tag :type="scope.row.status === 1 ? 'success' : 'warning'">
            {{ scope.row.status === 1 ? '审核通过' : '审核中' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="280px">
        <template #default="scope">
          <el-button
            v-if="scope.row.status === 0"
            type="success"
            size="mini"
            @click="handleAudit(scope.row)"
          >
            审核
          </el-button>
          <el-button size="mini" @click="handleView(scope.row)">查看</el-button>
          <el-button type="primary" size="mini" @click="handleEdit(scope.row)">编辑</el-button>
          <el-button type="danger" size="mini" @click="handleDelete(scope.row.poemId)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页组件 -->
    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="fetchPoems"
    />

    <!-- 添加/编辑诗词对话框 -->
    <el-dialog :visible.sync="dialogVisible" :title="dialogTitle" width="600px" @close="resetForm">
      <el-form :model="poemForm" label-width="100px" ref="poemFormRef" :rules="rules">
        <el-form-item label="标题" prop="poemTitle">
          <el-input v-model="poemForm.poemTitle"></el-input>
        </el-form-item>
        <el-form-item label="作者" prop="poemAuthor">
          <el-input v-model="poemForm.poemAuthor"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="poemContent">
          <el-input v-model="poemForm.poemContent" type="textarea" :rows="5"></el-input>
        </el-form-item>
<!--        <el-form-item label="状态" prop="status">-->
<!--          <el-select v-model="poemForm.status" placeholder="请选择状态">-->
<!--            <el-option label="审核通过" :value="1"></el-option>-->
<!--            <el-option label="审核中" :value="0"></el-option>-->
<!--          </el-select>-->
<!--        </el-form-item>-->
        <el-form-item label="诗词背景" prop="poemBackground">
          <el-input v-model="poemForm.poemBackground" type="textarea" :rows="3"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitForm">确定</el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="viewDialogVisible" title="诗词详情" width="600px">
      <el-form :model="viewPoemForm" label-width="100px">
        <el-form-item label="标题">
          <el-input v-model="viewPoemForm.poemTitle" disabled></el-input>
        </el-form-item>
        <el-form-item label="作者">
          <el-input v-model="viewPoemForm.poemAuthor" disabled></el-input>
        </el-form-item>
        <el-form-item label="内容">
          <el-input v-model="viewPoemForm.poemContent" type="textarea" :rows="5" disabled></el-input>
        </el-form-item>
        <el-form-item label="诗词背景">
          <el-input v-model="viewPoemForm.poemBackground" type="textarea" :rows="3" disabled></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="viewDialogVisible = false">关闭</el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="auditDialogVisible" title="审核确认" width="400px">
      <span>确定要审核通过这首诗词吗？</span>
      <div slot="footer" class="dialog-footer">
        <el-button @click="auditDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="confirmAudit">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAllPoems, addPoem, updatePoem, deletePoem, getPoemById } from '@/api/poem/poem'

export default {
  data() {
    return {
      loading: true,
      poemList: [],
      total: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
      dialogVisible: false,
      dialogTitle: '',
      poemForm: {
        poemId: null,
        poemTitle: '',
        poemAuthor: '',
        poemContent: '',
        status: 0,
        poemBackground: ''
      },
      viewDialogVisible: false,
      viewPoemForm: {
        poemTitle: '',
        poemAuthor: '',
        poemContent: '',
        poemBackground: ''
      },
      auditDialogVisible: false,
      rules: {
        poemTitle: [{ required: true, message: '请输入标题', trigger: 'blur' }],
        poemAuthor: [{ required: true, message: '请输入作者', trigger: 'blur' }],
        poemContent: [{ required: true, message: '请输入内容', trigger: 'blur' }],
      }
    }
  },
  created() {
    this.fetchPoems()
  },
  methods: {
    // 查询诗词列表
    fetchPoems() {
      this.loading = true
      listAllPoems(this.queryParams).then(response => {
        this.poemList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 打开新增诗词对话框
    handleAdd() {
      this.resetForm()
      this.dialogTitle = '新增诗词'
      this.dialogVisible = true
    },
    // 编辑诗词
    handleEdit(row) {
      getPoemById(row.poemId).then(response => {
        this.poemForm = {...response.data}
        this.dialogTitle = '编辑诗词'
        this.dialogVisible = true
      })
    },
    // 提交表单
    submitForm() {
      this.$refs.poemFormRef.validate(valid => {
        if (valid) {
          if (this.poemForm.poemId) {
            updatePoem(this.poemForm).then(() => {
              this.$message.success('更新成功')
              this.fetchPoems()
              this.dialogVisible = false
            })
          } else {
            addPoem(this.poemForm).then(() => {
              this.$message.success('新增成功')
              this.fetchPoems()
              this.dialogVisible = false
            })
          }
        }
      })
    },
    confirmAudit() {
      updatePoem( this.poemForm ).then(() => {
        this.$message.success('审核成功')
        this.auditDialogVisible = false
        this.fetchPoems() // 重新加载诗词列表
      }).catch(() => {
        this.$message.error('审核失败，请稍后重试')
      })
    },
    // 删除诗词
    handleDelete(poemId) {
      this.$confirm('确定要删除该诗词吗？', '提示', {
        type: 'warning'
      }).then(() => {
        deletePoem(poemId).then(() => {
          this.$message.success('删除成功')
          this.fetchPoems()
        })
      })
    },
    handleView(row) {
      getPoemById(row.poemId).then(response => {
        this.viewPoemForm = { ...response.data }
        this.viewDialogVisible = true
      })
    },
    handleAudit(row) {
      this.poemForm = { ...row }
      this.poemForm.status = 1
      this.auditDialogVisible = true
    },
    // 重置表单
    resetForm() {
      this.poemForm = {
        poemId: null,
        poemTitle: '',
        poemAuthor: '',
        poemContent: '',
        poemBackground: ''
      }
      this.$refs.poemFormRef?.resetFields()
    }
  }
}
</script>
