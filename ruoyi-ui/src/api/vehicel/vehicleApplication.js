import request from '@/utils/request'

// 获取所有用车申请记录
export function listAllVehicleApplications() {
  return request({
    url: '/oas/vehicle/application/listAll',
    method: 'get'
  })
}

// 根据用户ID查询用车申请记录
export function listVehicleApplicationsByUserId(userId) {
  return request({
    url: '/oas/vehicle/application/listByUserId',
    method: 'get',
    params: { userId }
  })
}

// 新增用车申请记录
export function addVehicleApplication(data) {
  return request({
    url: '/oas/vehicle/application/add',
    method: 'post',
    data: data
  })
}

// 修改用车申请记录
export function updateVehicleApplication(data) {
  return request({
    url: '/oas/vehicle/application/update',
    method: 'post',
    data: data
  })
}

// 删除用车申请记录
export function deleteVehicleApplication(applicationId) {
  return request({
    url: '/oas/vehicle/application/delete',
    method: 'get',
    params: { applicationId }
  })
}
