<template>
  <div>
    <div class="app-container">
      <el-table :data="registrationList" v-loading="loading" style="width: 100%" border>
        <el-table-column label="报名ID" prop="registrationId" align="center"></el-table-column>
        <el-table-column label="活动名称" prop="activityName" align="center"></el-table-column>
        <el-table-column label="报名用户" prop="userName" align="center"></el-table-column>
        <el-table-column label="报名时间" prop="registerTime" align="center"></el-table-column>
        <el-table-column label="状态" prop="status" align="center">
          <template #default="scope">
            <el-tag :type="scope.row.status === 1 ? 'success' : 'info'">
              {{ scope.row.status === 1 ? '已预约' : '已取消' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="160px">
          <template #default="scope">
            <el-button
              v-if="scope.row.status === 1"
              type="danger"
              size="mini"
              @click="cancelRegistration(scope.row)"
            >
              取消预约
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页组件 -->
      <pagination
        v-show="totalRegistrations > 0"
        :total="totalRegistrations"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="fetchRegistrations"
      />
    </div>
  </div>
</template>

<script>
import {
  listAllRegistrations,
  updateRegistration
} from '@/api/poem/activityRegistration'

export default {
  data() {
    return {
      loading: true,
      registrationList: [],
      totalRegistrations: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 10
      }
    };
  },
  created() {
    this.fetchRegistrations();
  },
  methods: {
    fetchRegistrations() {
      this.loading = true;
      listAllRegistrations(this.queryParams).then(response => {
        this.registrationList = response.rows;
        this.totalRegistrations = response.total;
        this.loading = false;
      });
    },
    cancelRegistration(row) {
      this.$confirm('确认取消该预约吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        row.status = 0;  // 设置状态为取消
        updateRegistration(row).then(() => {
          this.$message.success('预约已取消');
          this.fetchRegistrations();
        });
      });
    }
  }
};
</script>

<style scoped>
</style>
