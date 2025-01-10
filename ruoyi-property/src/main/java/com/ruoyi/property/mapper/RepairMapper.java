package com.ruoyi.property.mapper;

import com.ruoyi.property.domain.Repair;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/10 17:17
 */
@Mapper
public interface RepairMapper {
    /**
     * 获取所有报修记录
     *
     * @return 报修记录列表
     */
    List<Repair> getAllRepairs();

    /**
     * 根据报修ID获取报修详情
     *
     * @param repairId 报修ID
     * @return 报修详情
     */
    Repair getRepairById(Long repairId);

    /**
     * 根据用户ID获取用户报修记录
     *
     * @param userId 用户ID
     * @return 用户报修记录
     */
    List<Repair> getRepairsByUserId(Long userId);

    /**
     * 添加报修记录
     *
     * @param repair 报修信息
     * @return 影响行数
     */
    int addRepair(Repair repair);

    /**
     * 更新报修记录
     *
     * @param repair 报修信息
     * @return 影响行数
     */
    int updateRepair(Repair repair);

    /**
     * 删除报修记录
     *
     * @param repairId 报修ID
     * @return 影响行数
     */
    int deleteRepair(Long repairId);
}
