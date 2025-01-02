import request from '@/utils/request'

// 获取反馈列表
export function listAllFeedback() {
  return request({
    url: '/poem/feedback/listAll',
    method: 'get'
  })
}

// 根据反馈ID获取反馈详情
export function getFeedbackById(feedbackId) {
  return request({
    url: '/poem/feedback/detail',
    method: 'get',
    params: {feedbackId}
  })
}

// 新增反馈
export function addFeedback(data) {
  return request({
    url: '/poem/feedback/add',
    method: 'post',
    data: data
  })
}

// 删除反馈
export function deleteFeedback(feedbackId) {
  return request({
    url: '/poem/feedback/delete',
    method: 'get',
    data: {feedbackId}
  })
}
