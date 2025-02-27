package com.ruoyi.vehicle.domain;

import com.baomidou.mybatisplus.annotation.IdType;
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

    /**
     * 车辆ID，外键关联车辆信息表
     */
    private Long vehicleId;

    /**
     * 用车开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime startDate;

    /**
     * 用车结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime endDate;

    /**
     * 用车理由
     */
    private String reason;

    /**
     * 申请状态（待审批、已批准、已拒绝等）
     */
    private String status;

    /**
     * 审批人ID
     */
    private Long approvalUser;

    private static final long serialVersionUID = 1L;
}
