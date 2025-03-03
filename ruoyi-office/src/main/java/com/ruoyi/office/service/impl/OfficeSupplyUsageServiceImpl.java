package com.ruoyi.office.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.office.domain.OfficeSupply;
import com.ruoyi.office.domain.OfficeSupplyPurchase;
import com.ruoyi.office.domain.OfficeSupplyUsage;
import com.ruoyi.office.mapper.OfficeSupplyUsageMapper;
import com.ruoyi.office.service.OfficeSupplyService;
import com.ruoyi.office.service.OfficeSupplyUsageService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:40
 */
@Service
@RequiredArgsConstructor
public class OfficeSupplyUsageServiceImpl implements OfficeSupplyUsageService {

    private final OfficeSupplyUsageMapper officeSupplyUsageMapper;

    private final OfficeSupplyService officeSupplyService;

    private final ISysUserService iSysUserService;

    private final ISysRoleService iSysRoleService;

    @Override
    public List<OfficeSupplyUsage> getAllOfficeSupplyUsages() {
        Long userId = SecurityUtils.getUserId();
        String role = iSysRoleService.selectStringRoleByUserId(userId);
        if (role.equals("admin")) {
            startPage();
            List<OfficeSupplyUsage> allOfficeSupplyUsages = officeSupplyUsageMapper.getAllOfficeSupplyUsages();
            fillOfficeSupplyUsage(allOfficeSupplyUsages);
            return allOfficeSupplyUsages;
        } else {
            startPage();
            List<OfficeSupplyUsage> officeSupplyUsagesByUserId = officeSupplyUsageMapper.getOfficeSupplyUsagesByUserId(userId);
            fillOfficeSupplyUsage(officeSupplyUsagesByUserId);
            return officeSupplyUsagesByUserId;
        }
    }

    @Override
    public List<OfficeSupplyUsage> getOfficeSupplyUsagesByUserId(Long userId) {
        return officeSupplyUsageMapper.getOfficeSupplyUsagesByUserId(userId);
    }

    @Override
    public boolean addOfficeSupplyUsage(OfficeSupplyUsage officeSupplyUsage) {
        officeSupplyUsage.setUserId(SecurityUtils.getUserId());
        officeSupplyUsage.setStatus(0);
        officeSupplyUsage.setCreateTime(LocalDateTime.now());
        return officeSupplyUsageMapper.addOfficeSupplyUsage(officeSupplyUsage) > 0;
    }

    @Override
    public boolean updateOfficeSupplyUsage(OfficeSupplyUsage officeSupplyUsage) {
        return officeSupplyUsageMapper.updateOfficeSupplyUsage(officeSupplyUsage) > 0;
    }

    @Override
    public boolean updateOfficeSupplyUsageStatus(OfficeSupplyUsage officeSupplyUsage) {
        officeSupplyUsage.setApprovalUser(SecurityUtils.getUserId());
        return officeSupplyUsageMapper.updateApprovalUserAndStatus(officeSupplyUsage) > 0;
    }

    @Override
    public boolean deleteOfficeSupplyUsage(Long usageId) {
        return officeSupplyUsageMapper.deleteOfficeSupplyUsage(usageId) > 0;
    }

    //填充办公用品名称和申请人
    private void fillOfficeSupplyUsage(List<OfficeSupplyUsage> officeSupplyUsages) {
        for (OfficeSupplyUsage officeSupplyUsage : officeSupplyUsages) {
            Long supplyId = officeSupplyUsage.getSupplyId();
            OfficeSupply officeSupply = officeSupplyService.getOfficeSupplyById(supplyId);
            officeSupplyUsage.setSupplyName(officeSupply.getSupplyName());
            Long userId = officeSupplyUsage.getUserId();
            String userName = iSysUserService.selectUserById(userId).getNickName();
            officeSupplyUsage.setUserName(userName);
            if (officeSupplyUsage.getApprovalUser() != null){
                Long approvalUser = officeSupplyUsage.getApprovalUser();
                String approvalUserName = iSysUserService.selectUserById(approvalUser).getNickName();
                officeSupplyUsage.setApprovalUserName(approvalUserName);
            }
        }
    }
}
