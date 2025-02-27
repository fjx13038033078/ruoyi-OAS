package com.ruoyi.office.service.impl;

import com.ruoyi.office.domain.OfficeSupply;
import com.ruoyi.office.mapper.OfficeSupplyMapper;
import com.ruoyi.office.service.OfficeSupplyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:07
 */
@Service
@RequiredArgsConstructor
public class OfficeSupplyServiceImpl implements OfficeSupplyService {

    private final OfficeSupplyMapper officeSupplyMapper;

    /**
     * 获取所有办公用品记录
     *
     * @return 办公用品记录列表
     */
    @Override
    public List<OfficeSupply> getAllOfficeSupplies() {
        return officeSupplyMapper.getAllOfficeSupplies();
    }

    /**
     * 根据办公用品ID获取办公用品详情
     *
     * @param supplyId 办公用品ID
     * @return 办公用品详情
     */
    @Override
    public OfficeSupply getOfficeSupplyById(Long supplyId) {
        return officeSupplyMapper.getOfficeSupplyById(supplyId);
    }

    /**
     * 添加办公用品记录
     *
     * @param officeSupply 办公用品记录
     * @return 是否添加成功
     */
    @Override
    public boolean addOfficeSupply(OfficeSupply officeSupply) {
        return officeSupplyMapper.addOfficeSupply(officeSupply) > 0;
    }

    /**
     * 更新办公用品记录
     *
     * @param officeSupply 办公用品记录
     * @return 是否更新成功
     */
    @Override
    public boolean updateOfficeSupply(OfficeSupply officeSupply) {
        return officeSupplyMapper.updateOfficeSupply(officeSupply) > 0;
    }

    /**
     * 删除办公用品记录
     *
     * @param supplyId 办公用品ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteOfficeSupply(Long supplyId) {
        return officeSupplyMapper.deleteOfficeSupply(supplyId) > 0;
    }
}
