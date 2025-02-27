package com.ruoyi.vehicle.service.impl;

import com.ruoyi.vehicle.domain.OasVehicleReturn;
import com.ruoyi.vehicle.mapper.OasVehicleReturnMapper;
import com.ruoyi.vehicle.service.OasVehicleReturnService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:21
 */
@Service
@RequiredArgsConstructor
public class OasVehicleReturnServiceImpl implements OasVehicleReturnService {

    private final OasVehicleReturnMapper vehicleReturnMapper;

    /**
     * 查询所有车辆归还记录
     *
     * @return 车辆归还记录列表
     */
    @Override
    public List<OasVehicleReturn> getAllVehicleReturns() {
        return vehicleReturnMapper.getAllReturns();
    }

    /**
     * 根据用车申请ID查询车辆归还记录
     *
     * @param applicationId 用车申请ID
     * @return 车辆归还记录
     */
    @Override
    public OasVehicleReturn getVehicleReturnByApplicationId(Long applicationId) {
        return vehicleReturnMapper.getReturnByApplicationId(applicationId);
    }

    /**
     * 添加车辆归还记录
     *
     * @param vehicleReturn 车辆归还记录
     * @return 是否添加成功
     */
    @Override
    public boolean addVehicleReturn(OasVehicleReturn vehicleReturn) {
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
    public boolean updateVehicleReturn(OasVehicleReturn vehicleReturn) {
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
