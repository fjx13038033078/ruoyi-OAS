import request from '@/utils/request'

// 获取所有报修记录
export function listAllRepairs() {
  return request({
    url: '/property/repair/listAll',
    method: 'get'
  })
}

// 根据报修ID获取报修详情
export function getRepairById(repairId) {
  return request({
    url: '/property/repair/detail',
    method: 'get',
    params: { repairId }
  })
}

// 根据用户ID查询用户报修记录
export function listRepairsByUserId(userId) {
  return request({
    url: '/property/repair/listByUserId',
    method: 'get',
    params: { userId }
  })
}

// 新增报修记录
export function addRepair(data) {
  return request({
    url: '/property/repair/add',
    method: 'post',
    data: data
  })
}

// 修改报修记录
export function updateRepair(data) {
  return request({
    url: '/property/repair/update',
    method: 'post',
    data: data
  })
}

// 删除报修记录
export function deleteRepair(repairId) {
  return request({
    url: '/property/repair/delete',
    method: 'get',
    params: { repairId }
  })
}
