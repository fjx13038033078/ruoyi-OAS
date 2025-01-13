package com.ruoyi.property.service;

import com.ruoyi.property.domain.Repair;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/13 8:49
 */
public interface RepairService {
    /**
     * 查询所有报修记录
     *
     * @return 报修记录列表
     */
    List<Repair> getAllRepairs();

    /**
     * 根据报修ID查询报修详情
     *
     * @param repairId 报修ID
     * @return 报修详情
     */
    Repair getRepairById(Long repairId);

    /**
     * 根据用户ID查询用户报修记录
     *
     * @param userId 用户ID
     * @return 用户报修记录列表
     */
    List<Repair> getRepairsByUserId(Long userId);

    /**
     * 添加报修记录
     *
     * @param repair 报修对象
     * @return 是否添加成功
     */
    boolean addRepair(Repair repair);

    /**
     * 更新报修记录
     *
     * @param repair 报修对象
     * @return 是否更新成功
     */
    boolean updateRepair(Repair repair);

    /**
     * 删除报修记录
     *
     * @param repairId 报修ID
     * @return 是否删除成功
     */
    boolean deleteRepair(Long repairId);
}
