import request from '@/utils/request'

// 获取所有办公用品记录
export function listAllOfficeSupplies() {
  return request({
    url: '/office/supply/listAll',
    method: 'get'
  })
}

// 根据办公用品ID获取办公用品详情
export function getOfficeSupplyById(supplyId) {
  return request({
    url: '/office/supply/detail',
    method: 'get',
    params: { supplyId }
  })
}

// 新增办公用品记录
export function addOfficeSupply(data) {
  return request({
    url: '/office/supply/add',
    method: 'post',
    data: data
  })
}

// 修改办公用品记录
export function updateOfficeSupply(data) {
  return request({
    url: '/office/supply/update',
    method: 'post',
    data: data
  })
}

// 删除办公用品记录
export function deleteOfficeSupply(supplyId) {
  return request({
    url: '/office/supply/delete',
    method: 'get',
    params: { supplyId }
  })
}
