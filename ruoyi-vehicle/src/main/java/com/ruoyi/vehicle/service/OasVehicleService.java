package com.ruoyi.vehicle.service;

import com.ruoyi.vehicle.domain.OasVehicle;
import com.ruoyi.vehicle.domain.OasVehicleReturn;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:15
 */
public interface OasVehicleService {
    /**
     * 查询所有车辆信息
     *
     * @return 车辆列表
     */
    List<OasVehicle> getAllVehicles();

    /**
     * 根据车辆ID查询车辆信息
     *
     * @param vehicleId 车辆ID
     * @return 车辆信息
     */
    OasVehicle getVehicleById(Long vehicleId);

    /**
     * 添加车辆信息
     *
     * @param vehicle 车辆信息
     * @return 是否添加成功
     */
    boolean addVehicle(OasVehicle vehicle);

    /**
     * 更新车辆信息
     *
     * @param vehicle 车辆信息
     * @return 是否更新成功
     */
    boolean updateVehicle(OasVehicle vehicle);

    /**
     * 删除车辆信息
     *
     * @param vehicleId 车辆ID
     * @return 是否删除成功
     */
    boolean deleteVehicle(Long vehicleId);

}
