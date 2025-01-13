import request from '@/utils/request'

// 获取所有缴费记录
export function listAllPayments() {
  return request({
    url: '/property/payment/listAll',
    method: 'get'
  })
}

// 根据缴费ID获取缴费记录详情
export function getPaymentById(paymentId) {
  return request({
    url: '/property/payment/detail',
    method: 'get',
    params: { paymentId }
  })
}

// 根据用户ID查询用户的缴费记录
export function listPaymentsByUserId(userId) {
  return request({
    url: '/property/payment/listByUserId',
    method: 'get',
    params: { userId }
  })
}

// 新增缴费记录
export function addPayment(data) {
  return request({
    url: '/property/payment/add',
    method: 'post',
    data: data
  })
}

// 修改缴费记录
export function updatePayment(data) {
  return request({
    url: '/property/payment/update',
    method: 'post',
    data: data
  })
}

// 删除缴费记录
export function deletePayment(paymentId) {
  return request({
    url: '/property/payment/delete',
    method: 'get',
    params: { paymentId }
  })
}
