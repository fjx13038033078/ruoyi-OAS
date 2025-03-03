package com.ruoyi.leave.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.leave.domain.AnnualLeave;
import com.ruoyi.leave.domain.LeaveApplication;
import com.ruoyi.leave.mapper.AnnualLeaveMapper;
import com.ruoyi.leave.service.AnnualLeaveService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:08
 */
@Service
@RequiredArgsConstructor
public class AnnualLeaveServiceImpl implements AnnualLeaveService {

    private final AnnualLeaveMapper annualLeaveMapper;

    private final ISysUserService iSysUserService;

    private final ISysRoleService iSysRoleService;

    /**
     * 获取所有年假记录
     *
     * @return 年假记录列表
     */
    @Override
    public List<AnnualLeave> getAllAnnualLeaves() {
        Long userId = SecurityUtils.getUserId();
        String role = iSysRoleService.selectStringRoleByUserId(userId);
        if (role.equals("admin")) {
            startPage();
            List<AnnualLeave> allAnnualLeaves = annualLeaveMapper.getAllAnnualLeaves();
            fillLeaveApplication(allAnnualLeaves);
            return allAnnualLeaves;
        } else {
            startPage();
            AnnualLeave annualLeaveByUserId = annualLeaveMapper.getAnnualLeaveByUserId(userId);
            List<AnnualLeave> annualLeaveByUser = new ArrayList<>();
            annualLeaveByUser.add(annualLeaveByUserId);
            return annualLeaveByUser;
        }
    }

    /**
     * 根据用户ID获取年假记录
     *
     * @param userId 用户ID
     * @return 年假记录
     */
    @Override
    public AnnualLeave getAnnualLeaveByUserId(Long userId) {
        return annualLeaveMapper.getAnnualLeaveByUserId(userId);
    }

    /**
     * 添加年假记录
     *
     * @param annualLeave 年假记录
     * @return 是否添加成功
     */
    @Override
    public boolean addAnnualLeave(AnnualLeave annualLeave) {
        return annualLeaveMapper.addAnnualLeave(annualLeave) > 0;
    }

    /**
     * 更新年假记录
     *
     * @param annualLeave 年假记录
     * @return 是否更新成功
     */
    @Override
    public boolean updateAnnualLeave(AnnualLeave annualLeave) {
        return annualLeaveMapper.updateAnnualLeave(annualLeave) > 0;
    }

    /**
     * 删除年假记录
     *
     * @param leaveId 年假ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAnnualLeave(Long leaveId) {
        return annualLeaveMapper.deleteAnnualLeave(leaveId) > 0;
    }

    /**
     * 填充请假申请信息
     *
     * @param annualLeaves 请假申请列表
     */
    private void fillLeaveApplication(List<AnnualLeave> annualLeaves) {
        for (AnnualLeave annualLeave : annualLeaves){
            Long userId = annualLeave.getUserId();
            String userName = iSysUserService.selectUserById(userId).getNickName();
            annualLeave.setUserName(userName);
        }
    }
}
