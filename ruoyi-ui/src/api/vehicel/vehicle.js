import request from '@/utils/request'

// 获取所有车辆信息
export function listAllVehicles() {
  return request({
    url: '/oas/vehicle/listAll',
    method: 'get'
  })
}

// 根据车辆ID获取车辆信息
export function getVehicleById(vehicleId) {
  return request({
    url: '/oas/vehicle/detail',
    method: 'get',
    params: { vehicleId }
  })
}

// 新增车辆信息
export function addVehicle(data) {
  return request({
    url: '/oas/vehicle/add',
    method: 'post',
    data: data
  })
}

// 修改车辆信息
export function updateVehicle(data) {
  return request({
    url: '/oas/vehicle/update',
    method: 'post',
    data: data
  })
}

// 删除车辆信息
export function deleteVehicle(vehicleId) {
  return request({
    url: '/oas/vehicle/delete',
    method: 'get',
    params: { vehicleId }
  })
}
