import request from '@/utils/request'

// 获取活动列表
export function listAllActivities() {
  return request({
    url: '/poem/activity/listAll',
    method: 'get'
  })
}

// 查询活动详细信息
export function getActivityById(activityId) {
  return request({
    url: '/poem/activity/get',
    method: 'get',
    params: {activityId}
  })
}

// 新增活动
export function addActivity(data) {
  return request({
    url: '/poem/activity/add',
    method: 'post',
    data: data
  })
}

// 修改活动
export function updateActivity(data) {
  return request({
    url: '/poem/activity/update',
    method: 'post',
    data: data
  })
}

// 删除活动
export function deleteActivity(activityId) {
  return request({
    url: '/poem/activity/delete',
    method: 'get',
    params: {activityId}
  })
}
