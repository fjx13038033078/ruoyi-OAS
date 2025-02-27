package com.ruoyi.leave.service.impl;

import com.ruoyi.leave.domain.LeaveApplication;
import com.ruoyi.leave.mapper.LeaveApplicationMapper;
import com.ruoyi.leave.service.LeaveApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:10
 */
@Service
@RequiredArgsConstructor
public class LeaveApplicationServiceImpl implements LeaveApplicationService {

    private final LeaveApplicationMapper leaveApplicationMapper;

    /**
     * 获取所有请假申请记录
     *
     * @return 请假申请记录列表
     */
    @Override
    public List<LeaveApplication> getAllLeaveApplications() {
        return leaveApplicationMapper.getAllLeaveApplications();
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
     * 删除请假申请记录
     *
     * @param leaveId 请假申请ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteLeaveApplication(Long leaveId) {
        return leaveApplicationMapper.deleteLeaveApplication(leaveId) > 0;
    }
}
