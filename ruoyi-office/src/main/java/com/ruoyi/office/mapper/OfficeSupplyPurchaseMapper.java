package com.ruoyi.office.mapper;

import com.ruoyi.office.domain.OfficeSupplyPurchase;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/26 17:14
 */
@Mapper
public interface OfficeSupplyPurchaseMapper {

    /**
     * 获取所有办公用品申购记录
     *
     * @return 办公用品申购记录列表
     */
    List<OfficeSupplyPurchase> getAllOfficeSupplyPurchases();

    /**
     * 根据用户ID获取用户的办公用品申购记录
     *
     * @param userId 用户ID
     * @return 办公用品申购记录
     */
    List<OfficeSupplyPurchase> getOfficeSupplyPurchasesByUserId(Long userId);

    /**
     * 添加办公用品申购记录
     *
     * @param officeSupplyPurchase 办公用品申购记录
     * @return 影响行数
     */
    int addOfficeSupplyPurchase(OfficeSupplyPurchase officeSupplyPurchase);

    /**
     * 更新办公用品申购记录
     *
     * @param officeSupplyPurchase 办公用品申购记录
     * @return 影响行数
     */
    int updateOfficeSupplyPurchase(OfficeSupplyPurchase officeSupplyPurchase);

    /**
     * 删除办公用品申购记录
     *
     * @param purchaseId 申购ID
     * @return 影响行数
     */
    int deleteOfficeSupplyPurchase(Long purchaseId);
}
