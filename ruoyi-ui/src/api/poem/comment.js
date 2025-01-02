import request from '@/utils/request'

// 根据古诗词ID获取评论列表
export function listCommentsByPoemId(poemId) {
  return request({
    url: '/poem/comment/listByPoemId',
    method: 'get',
    params: { poemId }
  })
}

//根据评论ID获取评论详情
export function getCommentById(commentId) {
  return request({
    url: '/poem/comment/get',
    method: 'get',
    params: { commentId }
  })
}

// 添加评论
export function addComment(data) {
  return request({
    url: '/poem/comment/add',
    method: 'post',
    data: data
  })
}

// 删除评论
export function deleteComment(commentId) {
  return request({
    url: '/poem/comment/delete',
    method: 'post',
    data: { commentId }
  })
}
