import request from '@/utils/request'

// 获取所有车辆归还记录
export function listAllVehicleReturns() {
  return request({
    url: '/oas/vehicle/return/listAll',
    method: 'get'
  })
}

// 根据用车申请ID获取车辆归还记录
export function getVehicleReturnByApplicationId(applicationId) {
  return request({
    url: '/oas/vehicle/return/detail',
    method: 'get',
    params: { applicationId }
  })
}

// 新增车辆归还记录
export function addVehicleReturn(data) {
  return request({
    url: '/oas/vehicle/return/add',
    method: 'post',
    data: data
  })
}

// 修改车辆归还记录
export function updateVehicleReturn(data) {
  return request({
    url: '/oas/vehicle/return/update',
    method: 'post',
    data: data
  })
}

// 删除车辆归还记录
export function deleteVehicleReturn(returnId) {
  return request({
    url: '/oas/vehicle/return/delete',
    method: 'get',
    params: { returnId }
  })
}
