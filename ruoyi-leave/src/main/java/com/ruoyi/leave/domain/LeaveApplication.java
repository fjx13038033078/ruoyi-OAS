package com.ruoyi.leave.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

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

    @TableField(exist = false)
    private String userName;

    /**
     * 请假类型（0-年假，1-病假，2-事假）
     */
    private Integer leaveType;

    /**
     * 请假开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startDate;

    /**
     * 请假结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    /**
     * 请假理由
     */
    private String leaveReason;

    /**
     * 请假状态（0-待审批、1-已批准、2-已拒绝）
     */
    private int status;

    /**
     * 审批人ID
     */
    private Long approvalUser;

    /**
     * 审批人姓名
     */
    @TableField(exist = false)
    private String approvalUserName;

    private static final long serialVersionUID = 1L;
}
