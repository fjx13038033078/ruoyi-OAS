package com.ruoyi.office.service.impl;

import com.ruoyi.office.domain.OfficeSupplyPurchase;
import com.ruoyi.office.mapper.OfficeSupplyPurchaseMapper;
import com.ruoyi.office.service.OfficeSupplyPurchaseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:38
 */
@Service
@RequiredArgsConstructor
public class OfficeSupplyPurchaseServiceImpl implements OfficeSupplyPurchaseService {

    private final OfficeSupplyPurchaseMapper officeSupplyPurchaseMapper;

    @Override
    public List<OfficeSupplyPurchase> getAllOfficeSupplyPurchases() {
        return officeSupplyPurchaseMapper.getAllOfficeSupplyPurchases();
    }

    @Override
    public List<OfficeSupplyPurchase> getOfficeSupplyPurchasesByUserId(Long userId) {
        return officeSupplyPurchaseMapper.getOfficeSupplyPurchasesByUserId(userId);
    }

    @Override
    public boolean addOfficeSupplyPurchase(OfficeSupplyPurchase officeSupplyPurchase) {
        return officeSupplyPurchaseMapper.addOfficeSupplyPurchase(officeSupplyPurchase) > 0;
    }

    @Override
    public boolean updateOfficeSupplyPurchase(OfficeSupplyPurchase officeSupplyPurchase) {
        return officeSupplyPurchaseMapper.updateOfficeSupplyPurchase(officeSupplyPurchase) > 0;
    }

    @Override
    public boolean deleteOfficeSupplyPurchase(Long purchaseId) {
        return officeSupplyPurchaseMapper.deleteOfficeSupplyPurchase(purchaseId) > 0;
    }
}
