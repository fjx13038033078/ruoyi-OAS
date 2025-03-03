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
import java.util.Date;

/**
 * @Author 范佳兴
 * @date 2025/2/27 11:39
 */
@TableName("oas_vehicle_return")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class VehicleReturn implements Serializable {
    /**
     * 归还ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long returnId;

    /**
     * 用车申请ID，外键关联用车申请表
     */
    private Long applicationId;

    /**
     * 车辆编号
     */
    @TableField(exist = false)
    private String vehicleNumber;

    /**
     * 归还人ID，外键关联用户表
     */
    private Long userId;

    /**
     * 用车人姓名
     */
    @TableField(exist = false)
    private String userName;

    /**
     * 归还日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date returnDate;

    /**
     * 归还时里程表读数
     */
    private Integer odometerReading;

    private static final long serialVersionUID = 1L;
}
