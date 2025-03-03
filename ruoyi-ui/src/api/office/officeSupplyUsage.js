import request from '@/utils/request'

// 获取所有办公用品领用记录
export function listAllOfficeSupplyUsages() {
  return request({
    url: '/office/supply/usage/listAll',
    method: 'get'
  })
}

// 根据用户ID获取办公用品领用记录
export function getOfficeSupplyUsagesByUserId(userId) {
  return request({
    url: '/office/supply/usage/getByUserId',
    method: 'get',
    params: { userId }
  })
}

// 新增办公用品领用记录
export function addOfficeSupplyUsage(data) {
  return request({
    url: '/office/supply/usage/add',
    method: 'post',
    data: data
  })
}

// 更新办公用品领用记录
export function updateOfficeSupplyUsage(data) {
  return request({
    url: '/office/supply/usage/update',
    method: 'post',
    data: data
  })
}

// 更新办公用品领用记录状态
export function updateOfficeSupplyUsageStatus(data) {
  return request({
    url: '/office/supply/usage/updateStatus',
    method: 'post',
    data: data
  })
}

// 删除办公用品领用记录
export function deleteOfficeSupplyUsage(usageId) {
  return request({
    url: '/office/supply/usage/delete',
    method: 'get',
    params: { usageId }
  })
}
