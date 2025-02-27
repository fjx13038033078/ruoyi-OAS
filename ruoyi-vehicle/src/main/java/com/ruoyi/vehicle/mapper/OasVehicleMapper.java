package com.ruoyi.vehicle.mapper;

import com.ruoyi.vehicle.domain.OasVehicle;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 11:40
 */
@Mapper
public interface OasVehicleMapper {
    /**
     * 获取所有车辆信息
     */
    List<OasVehicle> getAllVehicles();

    /**
     * 根据车辆ID获取车辆信息
     */
    OasVehicle getVehicleById(Long vehicleId);

    /**
     * 添加车辆信息
     */
    int addVehicle(OasVehicle vehicle);

    /**
     * 更新车辆信息
     */
    int updateVehicle(OasVehicle vehicle);

    /**
     * 删除车辆信息
     */
    int deleteVehicle(Long vehicleId);
}
