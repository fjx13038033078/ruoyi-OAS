package com.ruoyi.office.service;

import com.ruoyi.office.domain.OfficeSupplyPurchase;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:38
 */
public interface OfficeSupplyPurchaseService {

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
     * @return 办公用品申购记录列表
     */
    List<OfficeSupplyPurchase> getOfficeSupplyPurchasesByUserId(Long userId);

    /**
     * 添加办公用品申购记录
     *
     * @param officeSupplyPurchase 办公用品申购记录
     * @return 是否添加成功
     */
    boolean addOfficeSupplyPurchase(OfficeSupplyPurchase officeSupplyPurchase);

    /**
     * 更新办公用品申购记录
     *
     * @param officeSupplyPurchase 办公用品申购记录
     * @return 是否更新成功
     */
    boolean updateOfficeSupplyPurchase(OfficeSupplyPurchase officeSupplyPurchase);

    /**
     * 更新办公用品申购记录的状态
     *
     * @param officeSupplyPurchase 办公用品申购记录
     * @return 是否更新成功
     */
    boolean updateOfficeSupplyPurchaseStatus(OfficeSupplyPurchase officeSupplyPurchase);

    /**
     * 删除办公用品申购记录
     *
     * @param purchaseId 申购ID
     * @return 是否删除成功
     */
    boolean deleteOfficeSupplyPurchase(Long purchaseId);
}
