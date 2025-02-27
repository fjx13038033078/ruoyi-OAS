package com.ruoyi.leave.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @Author 范佳兴
 * @date 2025/2/26 17:08
 */
@TableName("oas_leave_application")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class LeaveApplication implements Serializable {
    /**
     * 请假申请ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long leaveId;

    /**
     * 用户ID，外键关联用户表
     */
    private Long userId;

    /**
     * 请假类型
     */
    private Integer leaveType;

    /**
     * 请假开始时间
     */
    private LocalDateTime startDate;

    /**
     * 请假结束时间
     */
    private LocalDateTime endDate;

    /**
     * 请假理由
     */
    private String leaveReason;

    /**
     * 请假状态（待审批、已批准、已拒绝等）
     */
    private String status;

    /**
     * 审批人ID
     */
    private Long approvalUser;

    private static final long serialVersionUID = 1L;
}
