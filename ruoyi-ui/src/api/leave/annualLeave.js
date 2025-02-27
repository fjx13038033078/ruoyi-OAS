import request from '@/utils/request'

// 获取所有年假记录
export function listAllAnnualLeaves() {
  return request({
    url: '/leave/annual/listAll',
    method: 'get'
  })
}

// 根据用户ID获取年假记录
export function getAnnualLeaveByUserId(userId) {
  return request({
    url: '/leave/annual/getByUserId',
    method: 'get',
    params: { userId }
  })
}

// 新增年假记录
export function addAnnualLeave(data) {
  return request({
    url: '/leave/annual/add',
    method: 'post',
    data: data
  })
}

// 修改年假记录
export function updateAnnualLeave(data) {
  return request({
    url: '/leave/annual/update',
    method: 'post',
    data: data
  })
}

// 删除年假记录
export function deleteAnnualLeave(leaveId) {
  return request({
    url: '/leave/annual/delete',
    method: 'get',
    params: { leaveId }
  })
}
