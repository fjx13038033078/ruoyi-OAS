package com.ruoyi.leave.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.leave.domain.AnnualLeave;
import com.ruoyi.leave.domain.LeaveApplication;
import com.ruoyi.leave.mapper.LeaveApplicationMapper;
import com.ruoyi.leave.service.AnnualLeaveService;
import com.ruoyi.leave.service.LeaveApplicationService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:10
 */
@Service
@RequiredArgsConstructor
public class LeaveApplicationServiceImpl implements LeaveApplicationService {

    private final LeaveApplicationMapper leaveApplicationMapper;

    private final ISysUserService iSysUserService;

    private final ISysRoleService iSysRoleService;

    private final AnnualLeaveService annualLeaveService;

    /**
     * 获取所有请假申请记录
     *
     * @return 请假申请记录列表
     */
    @Override
    public List<LeaveApplication> getAllLeaveApplications() {
        Long userId = SecurityUtils.getUserId();
        String role = iSysRoleService.selectStringRoleByUserId(userId);
        if (role.equals("admin")) {
            startPage();
            List<LeaveApplication> allLeaveApplications = leaveApplicationMapper.getAllLeaveApplications();
            fillLeaveApplication(allLeaveApplications);
            return allLeaveApplications;
        } else {
            startPage();
            List<LeaveApplication> leaveApplicationsByUserId = leaveApplicationMapper.getLeaveApplicationsByUserId(userId);
            fillLeaveApplication(leaveApplicationsByUserId);
            return leaveApplicationsByUserId;
        }
    }

    /**
     * 根据用户ID获取用户的请假记录
     *
     * @param userId 用户ID
     * @return 请假记录列表
     */
    @Override
    public List<LeaveApplication> getLeaveApplicationsByUserId(Long userId) {
        return leaveApplicationMapper.getLeaveApplicationsByUserId(userId);
    }

    /**
     * 添加请假申请记录
     *
     * @param leaveApplication 请假申请记录
     * @return 是否添加成功
     */
    @Override
    public boolean addLeaveApplication(LeaveApplication leaveApplication) {
        leaveApplication.setUserId(SecurityUtils.getUserId());
        int leaveDays = getLeaveDays(leaveApplication.getStartDate(), leaveApplication.getEndDate());
        // 限制请假天数
        if (leaveDays > 15) {
            throw new RuntimeException("请假天数不能超过15天");
        }
        // 这里不再对年假进行处理，而是在审批通过后再计算
        return leaveApplicationMapper.addLeaveApplication(leaveApplication) > 0;
    }

    /**
     * 更新请假申请记录
     *
     * @param leaveApplication 请假申请记录
     * @return 是否更新成功
     */
    @Override
    public boolean updateLeaveApplication(LeaveApplication leaveApplication) {
        return leaveApplicationMapper.updateLeaveApplication(leaveApplication) > 0;
    }

    /**
     * 审批请假申请记录的状态
     *
     * @param leaveApplication 请假申请记录
     * @return 是否更新成功
     */
    @Override
    public boolean updateLeaveApplicationStatus(LeaveApplication leaveApplication) {
        Long userId = SecurityUtils.getUserId();
        leaveApplication.setApprovalUser(userId);

        // 获取申请记录
        LeaveApplication existingApplication = leaveApplicationMapper.getLeaveApplicationById(leaveApplication.getLeaveId());
        if (existingApplication == null) {
            throw new RuntimeException("请假申请记录不存在");
        }

        // 只有当审批通过 (status == 1) 才计算年假
        if (leaveApplication.getStatus() == 1 && existingApplication.getLeaveType() == 0) {
            Long applicantId = existingApplication.getUserId();
            int leaveDays = getLeaveDays(existingApplication.getStartDate(), existingApplication.getEndDate());

            AnnualLeave annualLeave = annualLeaveService.getAnnualLeaveByUserId(applicantId);

            if (annualLeave == null) {
                // 若该用户无年假记录，则初始化
                annualLeave = new AnnualLeave();
                annualLeave.setUserId(applicantId);
                annualLeave.setTotalLeaveDays(15);
                annualLeave.setUsedLeaveDays(leaveDays);
                annualLeave.setRemainingLeaveDays(15 - leaveDays);
                annualLeaveService.addAnnualLeave(annualLeave);
            } else {
                // 若年假不足，则拒绝审批
                if (annualLeave.getRemainingLeaveDays() < leaveDays) {
                    throw new RuntimeException("年假不足，审批无法通过");
                }
                // 更新年假记录
                annualLeave.setUsedLeaveDays(annualLeave.getUsedLeaveDays() + leaveDays);
                annualLeave.setRemainingLeaveDays(annualLeave.getRemainingLeaveDays() - leaveDays);
                annualLeaveService.updateAnnualLeave(annualLeave);
            }
        }

        return leaveApplicationMapper.updateApprovalUserAndStatus(leaveApplication) > 0;
    }

    /**
     * 删除请假申请记录
     *
     * @param leaveId 请假申请ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteLeaveApplication(Long leaveId) {
        return leaveApplicationMapper.deleteLeaveApplication(leaveId) > 0;
    }

    /**
     * 填充请假申请记录的审批人姓名
     *
     * @param leaveApplications 请假申请记录
     */
    private void fillLeaveApplication(List<LeaveApplication> leaveApplications) {
        for (LeaveApplication leaveApplication : leaveApplications) {
            Long userId = SecurityUtils.getUserId();
            leaveApplication.setUserName(iSysUserService.selectUserById(userId).getNickName());
            if (leaveApplication.getApprovalUser() != null){
                String nickName = iSysUserService.selectUserById(leaveApplication.getApprovalUser()).getNickName();
                leaveApplication.setApprovalUserName(nickName);
            }
        }
    }

    /**
     * 计算请假天数
     *
     * @param startDate 开始日期
     * @param endDate   结束日期
     * @return 请假天数
     */
    private int getLeaveDays(Date startDate, Date endDate) {
        if (startDate == null || endDate == null) {
            return 0; // 如果日期为空，返回0天
        }
        long startTime = startDate.getTime(); // 获取开始时间的毫秒数
        long endTime = endDate.getTime(); // 获取结束时间的毫秒数
        long diffTime = endTime - startTime; // 计算时间差（毫秒）
        // 将时间差转换为天数（毫秒/一天的毫秒数）
        long diffDays = diffTime / (1000 * 60 * 60 * 24);
        // 返回天数
        return (int) diffDays + 1; // 包含开始当天，所以加1
    }
}
