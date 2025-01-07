<template>
  <div>
    <div ref="echartsText" style="height: 100px; display: flex; justify-content: center; align-items: center;">
      <!-- 这里 ECharts 动画文本会被渲染 -->
    </div>
    <div>
      <el-carousel :interval="4000" type="card" height="300px">
        <el-carousel-item>
          <a href="https://www.baidu.com" target="_blank">
            <img src="../assets/images/01.jpg" alt="Image 1" style="width: 100%;">
          </a>
        </el-carousel-item>
        <el-carousel-item>
          <a href="https://www.jd.com" target="_blank">
            <img src="../assets/images/02.jpg" alt="Image 2" style="width: 100%;">
          </a>
        </el-carousel-item>
        <el-carousel-item>
          <a href="https://www.taobao.com" target="_blank">
            <img src="../assets/images/03.jpg" alt="Image 3" style="width: 100%;">
          </a>
        </el-carousel-item>
      </el-carousel>
      <!-- 通知公告 -->
      <el-row style="margin-top: 20px;">
        <el-col :span="12">
          <el-card style="margin-right: 20px; height: 420px;">
            <h3 slot="header">通知公告</h3>
            <el-table v-loading="loading" :data="noticeList" @selection-change="handleSelectionChange">
              <el-table-column label="序号" align="center" prop="noticeId" width="100"/>
              <el-table-column
                label="公告标题"
                align="center"
                prop="noticeTitle"
                :show-overflow-tooltip="true"
              >
                <template slot-scope="scope">
                  <span @click="showNoticeContent(scope.row)">{{ scope.row.noticeTitle }}</span>
                </template>
              </el-table-column>
              <el-table-column label="公告类型" align="center" prop="noticeType" width="100">
                <template slot-scope="scope">
                  <dict-tag :options="dict.type.sys_notice_type" :value="scope.row.noticeType"/>
                </template>
              </el-table-column>
              <el-table-column label="创建时间" align="center" prop="createTime" width="100">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
            </el-table>
          </el-card>
        </el-col>
        <!-- 场馆场地数量 -->
        <el-col :span="12">
          <el-card style="margin-right: 20px; height: 420px;">
            <h3 slot="header">古诗词发布排行榜</h3>
              <div id="poemCourtChart" style="height: 300px;"></div> <!-- echarts 柱状图 -->
          </el-card>
        </el-col>
      </el-row>
      <!-- 弹出的公告内容卡片 -->
      <el-dialog :title="selectedNotice.title" :visible.sync="showNoticeDialog" width="780px" append-to-body>
        <div slot="title" style="text-align: center;">{{ selectedNotice.title }}</div>
        <div v-html="selectedNotice.content" class="notice-content"></div>
      </el-dialog>
    </div>
  </div>
</template>
<script>
import {listNotice, getNotice} from "@/api/system/notice";
import request from '@/utils/request';
import {getVenueCourtCountMap} from "@/api/featherball/court";
import * as echarts from 'echarts'
import {getTopUsersByPoemCount} from "@/api/poem/poem";


export default {
  name: "Notice",
  dicts: ['sys_notice_status', 'sys_notice_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 公告表格数据
      noticeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      venueCourtMapData: {}, // 存储场馆场地数量映射的数据
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        noticeTitle: undefined,
        createBy: undefined,
        status: undefined
      },
      selectedNotice: {
        title: '',
        content: ''
      },
      showNoticeDialog: false,
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        noticeTitle: [
          {required: true, message: "公告标题不能为空", trigger: "blur"}
        ],
        noticeType: [
          {required: true, message: "公告类型不能为空", trigger: "change"}
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  mounted() {
    this.initPoemCourtChart(); // 初始化 echarts 柱状图
    this.initEchartsText(); // 初始化 ECharts 动画文本
  },
  methods: {
    /** 查询公告列表 */
    getList() {
      this.loading = true;
      listNotice(this.queryParams).then(response => {
        this.noticeList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    showNoticeContent(row) {
      this.loading = true;
      getNotice(row.noticeId).then((response) => {
        this.selectedNotice.title = response.data.noticeTitle;
        this.selectedNotice.content = response.data.noticeContent;
        this.showNoticeDialog = true;
        this.loading = false;
      });
    },
    // 获取场馆场地数量映射的数据并更新到图表中
    fetchPoemCourtMapData() {
      getTopUsersByPoemCount().then(response => {
        this.topUserMapData = response.data;
        this.updateTopUserChart();
      })
    },
    // 初始化 echarts 柱状图
    initPoemCourtChart() {
      this.poemCourtChart = echarts.init(document.getElementById("poemCourtChart"));
      this.fetchPoemCourtMapData(); // 获取数据并更新图表
    },
    updateTopUserChart(){
      // 使用获取到的数据更新图表
      const userNames = Object.keys(this.topUserMapData);
      const countPoems = Object.values(this.topUserMapData);
      const option = {
        // echarts 配置项
        xAxis: {
          type: "category",
          data: userNames
        },
        yAxis: {
          type: "value"
        },
        series: [{
          data: countPoems,
          type: "bar"
        }]
      };
      this.poemCourtChart.setOption(option);
    },
    // 初始化 ECharts 动画文本
    initEchartsText() {
      const chartDom = this.$refs.echartsText;
      const myChart = echarts.init(chartDom);
      const option = {
        graphic: {
          elements: [
            {
              type: 'text',
              left: 'center',
              top: 'center',
              style: {
                text: '古诗词交流平台',
                fontSize: 80,
                fontWeight: 'bold',
                lineDash: [0, 200],
                lineDashOffset: 0,
                fill: 'transparent',
                stroke: '#000',
                lineWidth: 1
              },
              keyframeAnimation: {
                duration: 3000,
                loop: true,
                keyframes: [
                  {
                    percent: 0.7,
                    style: {
                      fill: 'transparent',
                      lineDashOffset: 200,
                      lineDash: [200, 0]
                    }
                  },
                  {
                    percent: 0.8,
                    style: {
                      fill: 'transparent'
                    }
                  },
                  {
                    percent: 1,
                    style: {
                      fill: 'black'
                    }
                  }
                ]
              }
            }
          ]
        }
      };
      myChart.setOption(option);
    }
  }
};
</script>

<style scoped lang="scss">
.notice-content::v-deep img {
  max-width: 100%;
  height: auto;
  display: block;
  margin: 0 auto;
}

</style>
