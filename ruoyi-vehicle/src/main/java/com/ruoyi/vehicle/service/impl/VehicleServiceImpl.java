package com.ruoyi.vehicle.service.impl;

import com.ruoyi.vehicle.domain.Vehicle;
import com.ruoyi.vehicle.mapper.VehicleMapper;
import com.ruoyi.vehicle.service.VehicleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:19
 */
@Service
@RequiredArgsConstructor
public class VehicleServiceImpl implements VehicleService {

    private final VehicleMapper vehicleMapper;

    /**
     * 查询所有车辆信息
     *
     * @return 车辆列表
     */
    @Override
    public List<Vehicle> getAllVehicles() {
        return vehicleMapper.getAllVehicles();
    }

    /**
     * 根据车辆ID查询车辆信息
     *
     * @param vehicleId 车辆ID
     * @return 车辆信息
     */
    @Override
    public Vehicle getVehicleById(Long vehicleId) {
        return vehicleMapper.getVehicleById(vehicleId);
    }

    /**
     * 添加车辆信息
     *
     * @param vehicle 车辆信息
     * @return 是否添加成功
     */
    @Override
    public boolean addVehicle(Vehicle vehicle) {
        int rows = vehicleMapper.addVehicle(vehicle);
        return rows > 0;
    }

    /**
     * 更新车辆信息
     *
     * @param vehicle 车辆信息
     * @return 是否更新成功
     */
    @Override
    public boolean updateVehicle(Vehicle vehicle) {
        int rows = vehicleMapper.updateVehicle(vehicle);
        return rows > 0;
    }

    /**
     * 删除车辆信息
     *
     * @param vehicleId 车辆ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteVehicle(Long vehicleId) {
        int rows = vehicleMapper.deleteVehicle(vehicleId);
        return rows > 0;
    }
}
