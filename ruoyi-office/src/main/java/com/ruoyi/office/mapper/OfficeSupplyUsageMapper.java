package com.ruoyi.office.mapper;

import com.ruoyi.office.domain.OfficeSupplyUsage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/26 17:15
 */
@Mapper
public interface OfficeSupplyUsageMapper {
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
     * @return 影响行数
     */
    int addOfficeSupplyUsage(OfficeSupplyUsage officeSupplyUsage);

    /**
     * 更新办公用品领用记录
     *
     * @param officeSupplyUsage 办公用品领用记录
     * @return 影响行数
     */
    int updateOfficeSupplyUsage(OfficeSupplyUsage officeSupplyUsage);

    /**
     * 删除办公用品领用记录
     *
     * @param usageId 领用ID
     * @return 影响行数
     */
    int deleteOfficeSupplyUsage(Long usageId);
}
