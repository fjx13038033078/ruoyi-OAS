package com.ruoyi.leave.mapper;

import com.ruoyi.leave.domain.AnnualLeave;
import com.ruoyi.leave.domain.LeaveApplication;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/26 17:13
 */
@Mapper
public interface LeaveApplicationMapper {
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
     * 根据请假申请ID获取请假申请记录
     *
     * @param leaveId 请假申请ID
     * @return 请假申请记录
     */
    LeaveApplication getLeaveApplicationById(Long leaveId);

    /**
     * 添加请假申请记录
     *
     * @param leaveApplication 请假申请记录
     * @return 影响行数
     */
    int addLeaveApplication(LeaveApplication leaveApplication);

    /**
     * 更新请假申请记录
     *
     * @param leaveApplication 请假申请记录
     * @return 影响行数
     */
    int updateLeaveApplication(LeaveApplication leaveApplication);

    /**
     * 更新审批
     *
     * @param leaveApplication 年假记录
     * @return 影响行数
     */
    int updateApprovalUserAndStatus(LeaveApplication leaveApplication);

    /**
     * 删除请假申请记录
     *
     * @param leaveId 请假申请ID
     * @return 影响行数
     */
    int deleteLeaveApplication(Long leaveId);
}
