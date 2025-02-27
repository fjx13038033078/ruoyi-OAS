package com.ruoyi.office.service;

import com.ruoyi.office.domain.OfficeSupplyUsage;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:40
 */
public interface OfficeSupplyUsageService {

    /**
     * 获取所有办公用品领用记录
     *
     * @return 办公用品领用记录列表
     */
    List<OfficeSupplyUsage> getAllOfficeSupplyUsages();

    /**
     * 根据用户ID获取用户的办公用品领用记录
     *
     * @param userId 用户ID
     * @return 办公用品领用记录
     */
    List<OfficeSupplyUsage> getOfficeSupplyUsagesByUserId(Long userId);

    /**
     * 添加办公用品领用记录
     *
     * @param officeSupplyUsage 办公用品领用记录
     * @return 是否添加成功
     */
    boolean addOfficeSupplyUsage(OfficeSupplyUsage officeSupplyUsage);

    /**
     * 更新办公用品领用记录
     *
     * @param officeSupplyUsage 办公用品领用记录
     * @return 是否更新成功
     */
    boolean updateOfficeSupplyUsage(OfficeSupplyUsage officeSupplyUsage);

    /**
     * 删除办公用品领用记录
     *
     * @param usageId 领用ID
     * @return 是否删除成功
     */
    boolean deleteOfficeSupplyUsage(Long usageId);
}
