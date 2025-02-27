package com.ruoyi.vehicle.service;

import com.ruoyi.vehicle.domain.Vehicle;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:15
 */
public interface VehicleService {
    /**
     * 查询所有车辆信息
     *
     * @return 车辆列表
     */
    List<Vehicle> getAllVehicles();

    /**
     * 根据车辆ID查询车辆信息
     *
     * @param vehicleId 车辆ID
     * @return 车辆信息
     */
    Vehicle getVehicleById(Long vehicleId);

    /**
     * 添加车辆信息
     *
     * @param vehicle 车辆信息
     * @return 是否添加成功
     */
    boolean addVehicle(Vehicle vehicle);

    /**
     * 更新车辆信息
     *
     * @param vehicle 车辆信息
     * @return 是否更新成功
     */
    boolean updateVehicle(Vehicle vehicle);

    /**
     * 删除车辆信息
     *
     * @param vehicleId 车辆ID
     * @return 是否删除成功
     */
    boolean deleteVehicle(Long vehicleId);

}
