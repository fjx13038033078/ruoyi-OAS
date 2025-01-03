<template>
  <div>
    <!-- 场馆管理页面内容 -->
    <div v-if="activeTab === 'venue'">
      <div class="app-container">
        <!-- 添加场馆按钮 -->
        <el-row :gutter="20" class="mb-20" style="margin-bottom: 20px;">
          <el-col>
            <el-button type="primary" @click="handleAddVenue" v-hasPermi="['featherball:venue:add']">新增场馆</el-button>
          </el-col>
        </el-row>

        <!-- 场馆列表 -->
        <el-table :data="venueList" v-loading="loading" style="width: 100%" border>
          <el-table-column label="场馆ID" prop="venueId" align="center"></el-table-column>
          <el-table-column label="场馆名称" prop="venueName" align="center"></el-table-column>
          <el-table-column label="场馆地址" prop="venueAddress" align="center"></el-table-column>
          <el-table-column label="场馆联系方式" prop="venueContact" align="center"></el-table-column>
          <el-table-column label="淋浴设施" prop="isShower" align="center">
            <template slot-scope="scope">
              {{ scope.row.isShower === 1 ? '有' : '无' }}
            </template>
          </el-table-column>
          <el-table-column label="是否户外场馆" prop="isOutdoor" align="center">
            <template slot-scope="scope">
              {{ scope.row.isOutdoor === 1 ? '是' : '否' }}
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center" width="350px">
            <template slot-scope="scope">
              <el-button type="info" size="mini" @click="openReviewDialog(scope.row)" v-hasPermi="['featherball:venue:review']">评论</el-button>
              <el-button type="success" size="mini" @click="handleView(scope.row)" v-hasPermi="['featherball:venue:detail']">查看</el-button>
              <el-button type="primary" size="mini" @click="handleEdit(scope.row)" v-hasPermi="['featherball:venue:edit']">编辑</el-button>
              <el-button type="danger" size="mini" @click="handleDelete(scope.row)" v-hasPermi="['featherball:venue:delete']">删除</el-button>
            </template>
          </el-table-column>
        </el-table>

        <!-- 分页组件 -->
        <pagination
          v-show="totalVenues > 0"
          :total="totalVenues"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="fetchVenues"
        />

        <!-- 添加/编辑场馆对话框 -->
        <el-dialog :visible.sync="dialogVisible" :title="dialogTitle" width="30%" @close="handleCloseDialog">
          <!-- 对话框内容 -->
          <div>
            <el-form :model="venueForm" label-width="100px">
              <!--              &lt;!&ndash; 场馆ID &ndash;&gt;-->
              <!--              <el-form-item label="场馆ID">-->
              <!--                <el-input v-model="venueForm.venueId" disabled></el-input>-->
              <!--              </el-form-item>-->
              <!-- 场馆名称 -->
              <el-form-item label="场馆名称">
                <el-input v-model="venueForm.venueName" :disabled="isReadOnly"></el-input>
              </el-form-item>
              <!-- 场馆地址 -->
              <el-form-item label="场馆地址">
                <el-input v-model="venueForm.venueAddress" :disabled="isReadOnly"></el-input>
              </el-form-item>
              <!-- 场馆联系方式 -->
              <el-form-item label="场馆联系方式">
                <el-input v-model="venueForm.venueContact" :disabled="isReadOnly"></el-input>
              </el-form-item>
              <!-- 是否有淋浴设施 -->
              <el-form-item label="有无淋浴设施">
                <el-select v-model="venueForm.isShower" :disabled="isReadOnly">
                  <el-option label="有" :value="1"></el-option>
                  <el-option label="无" :value="0"></el-option>
                </el-select>
              </el-form-item>
              <!-- 是否户外场馆 -->
              <el-form-item label="是否户外场馆">
                <el-select v-model="venueForm.isOutdoor" :disabled="isReadOnly">
                  <el-option label="是" :value="1"></el-option>
                  <el-option label="否" :value="0"></el-option>
                </el-select>
              </el-form-item>
              <!-- 场馆描述 -->
              <el-form-item label="场馆描述">
                <el-input v-model="venueForm.venueDescription" :disabled="isReadOnly" type="textarea"
                          autosize></el-input>
              </el-form-item>
            </el-form>
          </div>
          <!-- 对话框按钮 -->
          <div slot="footer" class="dialog-footer" style="text-align: center;">
            <el-button @click="handleCloseDialog">取消</el-button>
            <el-button type="primary" @click="handleSubmit">{{ dialogButtonText }}</el-button>
          </div>
        </el-dialog>

        <!-- 评论对话框 -->
        <el-dialog :visible.sync="reviewDialogVisible" title="评论详情" class="review-dialog">
          <!-- 判断是否有评论，如果没有则显示暂无评论 -->
          <div v-if="reviews.length === 0" class="no-review">
            <p class="center-text">该场馆暂无评论</p>
          </div>
          <!-- 评论内容 -->
          <div v-for="(review, index) in reviews" :key="index" class="review-item">
            <div class="review-info">
              <span class="review-user">评论人：{{ review.userName }}</span>
              <span class="review-time">评论时间：{{ review.reviewTime }}</span>
            </div>
            <div class="review-content">
              <p>{{ review.comment }}</p>
              <!-- 删除按钮 -->
              <el-button type="danger" size="mini" @click="handleDeleteReview(review.reviewId)" v-hasPermi="['featherball:venue:reviewdelete']">删除</el-button>
            </div>
          </div>

          <!-- 分割线 -->
          <div class="divider"></div>

          <!-- 新增评论输入框 -->
          <div class="new-review">
            <el-input v-model="newReview" placeholder="请输入评论内容"></el-input>
            <el-button type="success" size="mini" @click="handleAddReview" v-hasPermi="['featherball:venue:reviewadd']">发送评论</el-button>
          </div>
        </el-dialog>

      </div>
    </div>
  </div>
</template>

<script>
import {listVenues, addVenue, updateVenue, deleteVenue, getVenue} from '@/api/featherball/venue'
import {addReview, deleteReview, listReviewsByVenueId, getReview} from '@/api/featherball/review'

export default {
  data() {
    return {
      // 遮罩层
      loading: true,
      activeTab: 'venue', // 当前激活的选项卡，默认为场馆管理
      venueList: [], // 场馆列表数据
      // 总条数
      totalVenues: 0,
      dialogVisible: false, // 控制新增场馆对话框的显示与隐藏
      dialogTitle: '', // 对话框标题
      dialogButtonText: '', // 对话框按钮文本
      venueForm: { // 新增场馆表单
        venueName: '',
        venueAddress: '',
        venueContact: '',
        isShower: 0, // 默认无淋浴设施
        isOutdoor: 0, // 默认不是户外场馆
        venueDescription: ''
      },
      isReadOnly: false, // 是否只读模式
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
      reviewDialogVisible: false,
      selectedVenue: {}, // 保存当前选中的场馆信息
      reviews: [],
      newReview: ''
    }
  },
  created() {
    // 在页面加载时获取场馆列表
    this.fetchVenues()
  },
  methods: {
    // 获取场馆列表
    fetchVenues() {
      this.loading = true
      listVenues(this.queryParams).then(response => {
        this.venueList = response.rows
        this.totalVenues = response.total
        this.loading = false
      })
    },

    // 清空表单数据
    clearForm() {
      this.venueForm = {
        venueName: '',
        venueAddress: '',
        venueContact: '',
        isShower: 0,
        isOutdoor: 0,
        venueDescription: ''
      }
    },

    // 添加场馆
    handleAddVenue() {
      this.dialogTitle = "新增场馆"
      this.dialogButtonText = "添加"
      this.isReadOnly = false // 设置为可编辑模式
      this.dialogVisible = true // 打开对话框
    },
    // 添加场馆
    addVenue() {
      // 验证场馆名称是否为空
      if (!this.venueForm.venueName) {
        this.$message.error('场馆名称不能为空')
        return
      }
      // 将布尔值转换为整数值
      this.venueForm.isShower = this.venueForm.isShower ? 1 : 0;
      this.venueForm.isOutdoor = this.venueForm.isOutdoor ? 1 : 0;
      addVenue(this.venueForm).then(response => {
        // 处理添加场馆成功的情况
        // 添加成功后重新获取场馆列表
        this.fetchVenues()
        this.dialogVisible = false // 关闭对话框
        // 清空表单数据
        this.clearForm()
      })
    },

    // 更新场馆
    updateVenue() {
      updateVenue(this.venueForm).then(response => {
        // 处理更新场馆成功的情况
        // 更新成功后重新获取场馆列表
        this.fetchVenues()
        this.dialogVisible = false // 关闭对话框
        // 清空表单数据
        this.clearForm()
        // 将对话框按钮文本设置为其他值，避免再次触发更新操作
        this.dialogButtonText = '更新成功'
      })
    },

    // 删除场馆
    deleteVenue(venueId) {
      deleteVenue(venueId).then(response => {
        // 处理删除场馆成功的情况
        // 删除成功后重新获取场馆列表
        this.fetchVenues()
      })
    },

    // 编辑按钮点击事件
    handleEdit(row) {
      // 将编辑的场馆数据填充到表单中
      this.venueForm = Object.assign({}, row)
      this.dialogTitle = '编辑场馆' // 设置对话框标题为编辑场馆
      this.dialogButtonText = '更新' // 设置对话框按钮文本为更新
      this.isReadOnly = false // 设置为可编辑模式
      this.dialogVisible = true // 打开对话框
    },

    // 提交表单
    handleSubmit() {
      if (this.dialogButtonText === '更新') {
        // 调用更新场馆的方法
        this.updateVenue()
      } else if (this.dialogButtonText === "添加") {
        // 调用添加场馆的方法
        this.addVenue()
      } else {
        this.handleCloseDialog()
      }
    },

    // 删除按钮点击事件
    handleDelete(row) {
      // 弹出确认框，确认删除后调用删除场馆方法
      this.$confirm('确认删除该场馆吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log(row)
        this.deleteVenue(row.venueId)
      })
    },

    // 查看场馆
    handleView(row) {
      this.dialogTitle = '查看场馆' // 设置对话框标题为查看场馆
      this.dialogButtonText = '关闭' // 设置对话框按钮文本为关闭
      this.isReadOnly = true // 设置为只读模式
      // 调用后端接口获取场馆详细信息
      getVenue(row.venueId).then(response => {
        this.venueForm = response.data // 填充表单数据
        this.dialogVisible = true // 打开对话框
      })
    },

    // 关闭对话框
    handleCloseDialog() {
      this.clearForm()
      this.dialogVisible = false
    },

    // 打开评论对话框并加载评论列表
    openReviewDialog(row) {
      this.selectedVenue = row
      listReviewsByVenueId(row.venueId).then(response => {
        // 将获取到的评论列表赋值给 selectedCourseComments
        this.reviews = response.rows;
        // 打开评论对话框
        this.reviewDialogVisible = true;
      }).catch(error => {
        // 处理请求失败的情况
        console.error('获取评论列表失败：', error);
        this.$message.error('获取评论列表失败，请稍后重试');
      });
    },

    // 添加评论
    handleAddReview() {
      // 获取用户输入的评论内容
      const reviewComment = this.newReview.trim();
      if (!reviewComment) {
        // 如果评论内容为空，提示用户输入评论内容
        this.$message.error('请输入评论内容');
        return;
      }
      // 构造评论数据
      const reviewData = {
        venueId: this.selectedVenue.venueId, // 课程ID
        comment: reviewComment, // 评论内容
      };
      // 调用新增评论的方法
      addReview(reviewData).then(response => {
        // 处理新增评论成功的情况
        this.$message.success('评论成功');
        // 清空输入框内容
        this.newReview = '';
        this.reviewDialogVisible = false; // 关闭评论对话框
      })
    },

    // 删除评论
    handleDeleteReview(reviewId) {
      deleteReview(reviewId).then(response => {
        this.$message.success('删除成功')
        this.reviewDialogVisible = false; // 关闭评论对话框
      }).catch(error => {
        console.log('Error:', error)
        this.$message.error('删除失败')
      })
    }
  }
}
</script>

<style scoped>
/* 分割线样式 */
.center-text {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  font-size: 15px; /* 设置字体大小为15像素 */
}

/* 评论对话框样式 */
.review-dialog {
  max-height: 800px; /* 设置最大高度 */
  overflow-y: auto; /* 添加纵向滚动条 */
}

/* 评论样式 */
.review-item {
  margin-bottom: 20px;
  border: 1px solid #eee;
  padding: 10px;
}

/* 调整评论人和评论时间的间距 */
.review-info {
  margin-bottom: 5px; /* 增加评论人和评论时间之间的垂直间距 */
  border-bottom: 1px solid #ccc; /* 添加底部边框，实现表格线效果 */
  padding-bottom: 15px; /* 调整底部边框与评论内容之间的间距 */
}

.review-time {
  margin-left: 300px; /* 增加评论时间与评论人之间的水平间距 */
}

/* 新增评论输入框样式 */
.new-review {
  margin-top: 20px; /* 设置输入框与上方元素的垂直间距 */
}

/* 调整发送评论按钮的垂直间距 */
.new-review .el-button {
  margin-top: 10px; /* 设置按钮与上方元素的垂直间距 */
}

/* 分割线样式 */
.divider {
  border-top: 3px solid #ccc;
  margin-top: 20px; /* 调整分割线上方的间距 */
  margin-bottom: 20px; /* 调整分割线下方的间距 */
}


</style>
