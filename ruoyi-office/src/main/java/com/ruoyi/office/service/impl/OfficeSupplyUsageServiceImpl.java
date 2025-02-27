package com.ruoyi.office.service.impl;

import com.ruoyi.office.domain.OfficeSupplyUsage;
import com.ruoyi.office.mapper.OfficeSupplyUsageMapper;
import com.ruoyi.office.service.OfficeSupplyUsageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:40
 */
@Service
@RequiredArgsConstructor
public class OfficeSupplyUsageServiceImpl implements OfficeSupplyUsageService {

    private final OfficeSupplyUsageMapper officeSupplyUsageMapper;

    @Override
    public List<OfficeSupplyUsage> getAllOfficeSupplyUsages() {
        return officeSupplyUsageMapper.getAllOfficeSupplyUsages();
    }

    @Override
    public List<OfficeSupplyUsage> getOfficeSupplyUsagesByUserId(Long userId) {
        return officeSupplyUsageMapper.getOfficeSupplyUsagesByUserId(userId);
    }

    @Override
    public boolean addOfficeSupplyUsage(OfficeSupplyUsage officeSupplyUsage) {
        return officeSupplyUsageMapper.addOfficeSupplyUsage(officeSupplyUsage) > 0;
    }

    @Override
    public boolean updateOfficeSupplyUsage(OfficeSupplyUsage officeSupplyUsage) {
        return officeSupplyUsageMapper.updateOfficeSupplyUsage(officeSupplyUsage) > 0;
    }

    @Override
    public boolean deleteOfficeSupplyUsage(Long usageId) {
        return officeSupplyUsageMapper.deleteOfficeSupplyUsage(usageId) > 0;
    }
}
