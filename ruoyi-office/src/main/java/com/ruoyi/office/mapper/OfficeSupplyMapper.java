package com.ruoyi.office.mapper;

import com.ruoyi.office.domain.OfficeSupply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/26 17:14
 */
@Mapper
public interface OfficeSupplyMapper {

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
     * @return 影响行数
     */
    int addOfficeSupply(OfficeSupply officeSupply);

    /**
     * 更新办公用品记录
     *
     * @param officeSupply 办公用品记录
     * @return 影响行数
     */
    int updateOfficeSupply(OfficeSupply officeSupply);

    /**
     * 更新办公用品数量
     *
     * @param officeSupply 办公用品记录
     * @return 影响行数
     */
    int updateOfficeSupplyQuantity(OfficeSupply officeSupply);

    /**
     * 删除办公用品记录
     *
     * @param supplyId 办公用品ID
     * @return 影响行数
     */
    int deleteOfficeSupply(Long supplyId);
}
