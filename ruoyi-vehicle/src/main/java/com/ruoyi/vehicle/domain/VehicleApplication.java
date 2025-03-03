package com.ruoyi.vehicle.domain;

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

/**
 * @Author 范佳兴
 * @date 2025/2/27 11:38
 */
@TableName("oas_vehicle_application")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class VehicleApplication implements Serializable {
    /**
     * 申请ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long applicationId;

    /**
     * 用户ID，外键关联用户表
     */
    private Long userId;

    @TableField(exist = false)
    private String userName;

    /**
     * 车辆ID，外键关联车辆信息表
     */
    private Long vehicleId;

    @TableField(exist = false)
    private String vehicleNumber;

    /**
     * 用车开始时间
     */
    private LocalDateTime startDate;

    /**
     * 用车结束时间
     */
    private LocalDateTime endDate;

    /**
     * 用车理由
     */
    private String reason;

    /**
     * 申请状态（0-待审批、1-已批准、2-已拒绝等）
     */
    private int status;

    /**
     * 审批人ID
     */
    private Long approvalUser;

    private static final long serialVersionUID = 1L;
}
