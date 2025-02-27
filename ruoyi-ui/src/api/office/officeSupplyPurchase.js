import request from '@/utils/request'

// 获取所有办公用品申购记录
export function listAllOfficeSupplyPurchases() {
  return request({
    url: '/office/supply/purchase/listAll',
    method: 'get'
  })
}

// 根据用户ID获取办公用品申购记录
export function getOfficeSupplyPurchasesByUserId(userId) {
  return request({
    url: '/office/supply/purchase/getByUserId',
    method: 'get',
    params: { userId }
  })
}

// 新增办公用品申购记录
export function addOfficeSupplyPurchase(data) {
  return request({
    url: '/office/supply/purchase/add',
    method: 'post',
    data: data
  })
}

// 更新办公用品申购记录
export function updateOfficeSupplyPurchase(data) {
  return request({
    url: '/office/supply/purchase/update',
    method: 'post',
    data: data
  })
}

// 删除办公用品申购记录
export function deleteOfficeSupplyPurchase(purchaseId) {
  return request({
    url: '/office/supply/purchase/delete',
    method: 'get',
    params: { purchaseId }
  })
}
