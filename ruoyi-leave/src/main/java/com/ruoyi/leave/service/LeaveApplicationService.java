package com.ruoyi.leave.service;

import com.ruoyi.leave.domain.LeaveApplication;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:09
 */
public interface LeaveApplicationService {

    /**
     * 获取所有请假申请记录
     *
     * @return 请假申请记录列表
     */
    List<LeaveApplication> getAllLeaveApplications();

    /**
     * 根据用户ID获取用户的请假记录
     *
     * @param userId 用户ID
     * @return 请假记录列表
     */
    List<LeaveApplication> getLeaveApplicationsByUserId(Long userId);

    /**
     * 添加请假申请记录
     *
     * @param leaveApplication 请假申请记录
     * @return 是否添加成功
     */
    boolean addLeaveApplication(LeaveApplication leaveApplication);

    /**
     * 更新请假申请记录
     *
     * @param leaveApplication 请假申请记录
     * @return 是否更新成功
     */
    boolean updateLeaveApplication(LeaveApplication leaveApplication);

    /**
     * 删除请假申请记录
     *
     * @param leaveId 请假申请ID
     * @return 是否删除成功
     */
    boolean deleteLeaveApplication(Long leaveId);
}
