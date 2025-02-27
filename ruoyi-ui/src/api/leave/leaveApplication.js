import request from '@/utils/request'

// 获取所有请假申请记录
export function listAllLeaveApplications() {
  return request({
    url: '/leave/application/listAll',
    method: 'get'
  })
}

// 根据用户ID获取用户的请假记录
export function getLeaveApplicationsByUserId(userId) {
  return request({
    url: '/leave/application/listByUserId',
    method: 'get',
    params: { userId }
  })
}

// 新增请假申请记录
export function addLeaveApplication(data) {
  return request({
    url: '/leave/application/add',
    method: 'post',
    data: data
  })
}

// 修改请假申请记录
export function updateLeaveApplication(data) {
  return request({
    url: '/leave/application/update',
    method: 'post',
    data: data
  })
}

// 删除请假申请记录
export function deleteLeaveApplication(leaveId) {
  return request({
    url: '/leave/application/delete',
    method: 'get',
    params: { leaveId }
  })
}
