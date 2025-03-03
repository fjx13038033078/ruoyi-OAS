package com.ruoyi.office.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.office.domain.OfficeSupply;
import com.ruoyi.office.domain.OfficeSupplyPurchase;
import com.ruoyi.office.mapper.OfficeSupplyPurchaseMapper;
import com.ruoyi.office.service.OfficeSupplyPurchaseService;
import com.ruoyi.office.service.OfficeSupplyService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:38
 */
@Service
@RequiredArgsConstructor
public class OfficeSupplyPurchaseServiceImpl implements OfficeSupplyPurchaseService {

    private final OfficeSupplyPurchaseMapper officeSupplyPurchaseMapper;

    private final OfficeSupplyService officeSupplyService;

    private final ISysUserService iSysUserService;

    private final ISysRoleService iSysRoleService;

    @Override
    public List<OfficeSupplyPurchase> getAllOfficeSupplyPurchases() {
        Long userId = SecurityUtils.getUserId();
        String role = iSysRoleService.selectStringRoleByUserId(userId);
        if (role.equals("admin")) {
            startPage();
            List<OfficeSupplyPurchase> allOfficeSupplyPurchases = officeSupplyPurchaseMapper.getAllOfficeSupplyPurchases();
            fillOfficeSupplyPurchase(allOfficeSupplyPurchases);
            return allOfficeSupplyPurchases;
        } else {
            startPage();
            List<OfficeSupplyPurchase> officeSupplyPurchasesByUserId = officeSupplyPurchaseMapper.getOfficeSupplyPurchasesByUserId(userId);
            fillOfficeSupplyPurchase(officeSupplyPurchasesByUserId);
            return officeSupplyPurchasesByUserId;
        }
    }

    @Override
    public List<OfficeSupplyPurchase> getOfficeSupplyPurchasesByUserId(Long userId) {
        return officeSupplyPurchaseMapper.getOfficeSupplyPurchasesByUserId(userId);
    }

    //添加采购单
    @Override
    public boolean addOfficeSupplyPurchase(OfficeSupplyPurchase officeSupplyPurchase) {
        officeSupplyPurchase.setStatus(0);
        Long userId = SecurityUtils.getUserId();
        officeSupplyPurchase.setUserId(userId);
        officeSupplyPurchase.setCreateTime(LocalDateTime.now());
        return officeSupplyPurchaseMapper.addOfficeSupplyPurchase(officeSupplyPurchase) > 0;
    }

    @Override
    public boolean updateOfficeSupplyPurchase(OfficeSupplyPurchase officeSupplyPurchase) {
        return officeSupplyPurchaseMapper.updateOfficeSupplyPurchase(officeSupplyPurchase) > 0;
    }

    //审批采购单
    @Override
    public boolean updateOfficeSupplyPurchaseStatus(OfficeSupplyPurchase officeSupplyPurchase) {
        officeSupplyPurchase.setApprovalUser(SecurityUtils.getUserId());
        if (officeSupplyPurchase.getStatus() == 1){
            Integer quantity = officeSupplyPurchaseMapper.getOfficeSupplyPurchaseById(officeSupplyPurchase.getPurchaseId()).getQuantity();
            OfficeSupplyPurchase officeSupplyPurchaseById = officeSupplyPurchaseMapper.getOfficeSupplyPurchaseById(officeSupplyPurchase.getPurchaseId());
            OfficeSupply officeSupplyById = officeSupplyService.getOfficeSupplyById(officeSupplyPurchaseById.getSupplyId());
            int existingQuantity = officeSupplyById.getQuantity();
            officeSupplyById.setQuantity(existingQuantity + quantity);
            officeSupplyService.updateOfficeSupplyQuantity(officeSupplyById);
        }
        return officeSupplyPurchaseMapper.updateApprovalUserAndStatus(officeSupplyPurchase) > 0;
    }

    @Override
    public boolean deleteOfficeSupplyPurchase(Long purchaseId) {
        return officeSupplyPurchaseMapper.deleteOfficeSupplyPurchase(purchaseId) > 0;
    }

    private void fillOfficeSupplyPurchase(List<OfficeSupplyPurchase> officeSupplyPurchases) {
        for (OfficeSupplyPurchase officeSupplyPurchase : officeSupplyPurchases) {
            Long supplyId = officeSupplyPurchase.getSupplyId();
            OfficeSupply officeSupply = officeSupplyService.getOfficeSupplyById(supplyId);
            officeSupplyPurchase.setSupplyName(officeSupply.getSupplyName());
            String nickName = iSysUserService.selectUserById(officeSupplyPurchase.getUserId()).getNickName();
            officeSupplyPurchase.setUserName(nickName);
            if (officeSupplyPurchase.getApprovalUser() != null) {
                Long approvalUser = officeSupplyPurchase.getApprovalUser();
                String approvalUserName = iSysUserService.selectUserById(approvalUser).getNickName();
                officeSupplyPurchase.setApprovalUserName(approvalUserName);
            }
        }
    }
}
