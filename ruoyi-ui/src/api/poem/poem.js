import request from '@/utils/request'

// 查询所有诗词列表
export function listAllPoems(query) {
  return request({
    url: '/poem/poem/listAll',
    method: 'get',
    params: query
  })
}

// 查询诗词详细信息
export function getPoemById(poemId) {
  return request({
    url: '/poem/poem/detail',
    method: 'get',
    params: { poemId }
  })
}

// 添加诗词
export function addPoem(data) {
  return request({
    url: '/poem/poem/add',
    method: 'post',
    data: data
  })
}

// 更新诗词信息
export function updatePoem(data) {
  return request({
    url: '/poem/poem/update',
    method: 'post',
    data: data
  })
}

// 删除诗词
export function deletePoem(poemId) {
  return request({
    url: '/poem/poem/delete',
    method: 'get',
    params: { poemId }
  })
}
