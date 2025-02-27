package com.ruoyi.vehicle.domain;

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
 * @date 2025/2/27 11:39
 */
@TableName("oas_vehicle_return")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class OasVehicleReturn implements Serializable {
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
     * 归还日期
     */
    private LocalDateTime returnDate;

    /**
     * 归还时里程表读数
     */
    private Integer odometerReading;

    private static final long serialVersionUID = 1L;
}
