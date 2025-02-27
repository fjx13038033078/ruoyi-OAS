package com.ruoyi.office.service;

import com.ruoyi.office.domain.OfficeSupply;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:06
 */
public interface OfficeSupplyService {

    /**
     * 获取所有办公用品记录
     *
     * @return 办公用品记录列表
     */
    List<OfficeSupply> getAllOfficeSupplies();

    /**
     * 根据办公用品ID获取办公用品详情
     *
     * @param supplyId 办公用品ID
     * @return 办公用品详情
     */
    OfficeSupply getOfficeSupplyById(Long supplyId);

    /**
     * 添加办公用品记录
     *
     * @param officeSupply 办公用品记录
     * @return 是否添加成功
     */
    boolean addOfficeSupply(OfficeSupply officeSupply);

    /**
     * 更新办公用品记录
     *
     * @param officeSupply 办公用品记录
     * @return 是否更新成功
     */
    boolean updateOfficeSupply(OfficeSupply officeSupply);

    /**
     * 删除办公用品记录
     *
     * @param supplyId 办公用品ID
     * @return 是否删除成功
     */
    boolean deleteOfficeSupply(Long supplyId);
}
