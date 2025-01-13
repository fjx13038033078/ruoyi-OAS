import request from '@/utils/request'

// 获取所有反馈记录
export function listAllFeedbacks() {
  return request({
    url: '/property/feedback/listAll',
    method: 'get'
  })
}

// 根据反馈ID查询反馈记录详情
export function getFeedbackById(feedbackId) {
  return request({
    url: '/property/feedback/detail',
    method: 'get',
    params: { feedbackId }
  })
}

// 根据用户ID查询反馈记录
export function listFeedbacksByUserId(userId) {
  return request({
    url: '/property/feedback/listByUserId',
    method: 'get',
    params: { userId }
  })
}

// 新增反馈记录
export function addFeedback(data) {
  return request({
    url: '/property/feedback/add',
    method: 'post',
    data: data
  })
}

// 删除反馈记录
export function deleteFeedback(feedbackId) {
  return request({
    url: '/property/feedback/delete',
    method: 'get',
    params: { feedbackId }
  })
}
