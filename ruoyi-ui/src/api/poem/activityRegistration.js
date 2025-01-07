import request from '@/utils/request'

// 查询活动报名列表
export function listAllRegistrations() {
  return request({
    url: '/poem/activityRegistration/listAll',
    method: 'get'
  })
}

// 根据报名ID获取报名详情
export function getRegistrationById(registrationId) {
  return request({
    url: '/poem/activityRegistration/get',
    method: 'get',
    params: {registrationId}
  })
}

// 新增活动报名
export function addRegistration(data) {
  return request({
    url: '/poem/activityRegistration/add',
    method: 'post',
    data: data
  })
}

// 修改活动报名
export function updateRegistration(data) {
  return request({
    url: '/poem/activityRegistration/update',
    method: 'post',
    data: data
  })
}

// 删除活动报名
export function deleteRegistration(registrationId) {
  return request({
    url: '/poem/activityRegistration/delete',
    method: 'get',
    params: {registrationId}
  })
}

// 根据活动ID获取报名列表
export function listByActivityId(activityId) {
  return request({
    url: '/poem/activityRegistration/listByActivityId',
    method: 'get',
    params: {activityId}
  })
}

// 根据用户ID获取报名列表
export function listByUserId(userId) {
  return request({
    url: '/poem/activityRegistration/listByUserId',
    method: 'get',
    params: {userId}
  })
}
