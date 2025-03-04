import request from '@/utils/request'

// 获取所有点位信息
export function listAllPoints() {
  return request({
    url: '/oas/point/listAll',
    method: 'get'
  })
}

// 根据ID获取点位信息
export function getPointById(pointId) {
  return request({
    url: '/oas/point/detail',
    method: 'get',
    params: { pointId }
  })
}

// 新增点位信息
export function addPoint(data) {
  return request({
    url: '/oas/point/add',
    method: 'post',
    data: data
  })
}

// 修改点位信息
export function updatePoint(data) {
  return request({
    url: '/oas/point/update',
    method: 'post',
    data: data
  })
}

// 删除点位信息
export function deletePoint(pointId) {
  return request({
    url: '/oas/point/delete',
    method: 'get',
    params: { pointId }
  })
}
