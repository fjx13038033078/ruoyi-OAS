package com.ruoyi.vehicle.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * @Author 范佳兴
 * @date 2025/2/27 11:38
 */
@TableName("oas_vehicle")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class OasVehicle implements Serializable {

    /**
     * 车辆ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long vehicleId;

    /**
     * 车牌号
     */
    private String vehicleNumber;

    /**
     * 车辆类型
     */
    private String vehicleType;

    /**
     * 品牌
     */
    private String brand;

    /**
     * 型号
     */
    private String model;

    private static final long serialVersionUID = 1L;
}
