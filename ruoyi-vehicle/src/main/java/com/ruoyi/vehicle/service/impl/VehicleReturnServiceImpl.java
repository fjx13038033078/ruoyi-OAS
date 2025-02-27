package com.ruoyi.vehicle.service.impl;

import com.ruoyi.vehicle.domain.VehicleReturn;
import com.ruoyi.vehicle.mapper.VehicleReturnMapper;
import com.ruoyi.vehicle.service.VehicleReturnService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:21
 */
@Service
@RequiredArgsConstructor
public class VehicleReturnServiceImpl implements VehicleReturnService {

    private final VehicleReturnMapper vehicleReturnMapper;

    /**
     * 查询所有车辆归还记录
     *
     * @return 车辆归还记录列表
     */
    @Override
    public List<VehicleReturn> getAllVehicleReturns() {
        return vehicleReturnMapper.getAllReturns();
    }

    /**
     * 根据用车申请ID查询车辆归还记录
     *
     * @param applicationId 用车申请ID
     * @return 车辆归还记录
     */
    @Override
    public VehicleReturn getVehicleReturnByApplicationId(Long applicationId) {
        return vehicleReturnMapper.getReturnByApplicationId(applicationId);
    }

    /**
     * 添加车辆归还记录
     *
     * @param vehicleReturn 车辆归还记录
     * @return 是否添加成功
     */
    @Override
    public boolean addVehicleReturn(VehicleReturn vehicleReturn) {
        int rows = vehicleReturnMapper.addReturn(vehicleReturn);
        return rows > 0;
    }

    /**
     * 更新车辆归还记录
     *
     * @param vehicleReturn 车辆归还记录
     * @return 是否更新成功
     */
    @Override
    public boolean updateVehicleReturn(VehicleReturn vehicleReturn) {
        int rows = vehicleReturnMapper.updateReturn(vehicleReturn);
        return rows > 0;
    }

    /**
     * 删除车辆归还记录
     *
     * @param returnId 车辆归还记录ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteVehicleReturn(Long returnId) {
        int rows = vehicleReturnMapper.deleteReturn(returnId);
        return rows > 0;
    }
}
