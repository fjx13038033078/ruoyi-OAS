package com.ruoyi.vehicle.mapper;

import com.ruoyi.vehicle.domain.Vehicle;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 11:40
 */
@Mapper
public interface VehicleMapper {
    /**
     * 获取所有车辆信息
     */
    List<Vehicle> getAllVehicles();

    /**
     * 根据车辆ID获取车辆信息
     */
    Vehicle getVehicleById(Long vehicleId);

    /**
     * 添加车辆信息
     */
    int addVehicle(Vehicle vehicle);

    /**
     * 更新车辆信息
     */
    int updateVehicle(Vehicle vehicle);

    /**
     * 删除车辆信息
     */
    int deleteVehicle(Long vehicleId);
}
