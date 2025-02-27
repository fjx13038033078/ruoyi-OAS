package com.ruoyi.vehicle.service;

import com.ruoyi.vehicle.domain.OasVehicleReturn;
import java.util.List;
/**
 * @Author 范佳兴
 * @date 2025/2/27 14:18
 */
public interface OasVehicleReturnService {

    /**
     * 查询所有车辆归还记录
     *
     * @return 车辆归还记录列表
     */
    List<OasVehicleReturn> getAllVehicleReturns();

    /**
     * 根据用车申请ID查询车辆归还记录
     *
     * @param applicationId 用车申请ID
     * @return 车辆归还记录
     */
    OasVehicleReturn getVehicleReturnByApplicationId(Long applicationId);

    /**
     * 添加车辆归还记录
     *
     * @param vehicleReturn 车辆归还记录
     * @return 是否添加成功
     */
    boolean addVehicleReturn(OasVehicleReturn vehicleReturn);

    /**
     * 更新车辆归还记录
     *
     * @param vehicleReturn 车辆归还记录
     * @return 是否更新成功
     */
    boolean updateVehicleReturn(OasVehicleReturn vehicleReturn);

    /**
     * 删除车辆归还记录
     *
     * @param returnId 车辆归还记录ID
     * @return 是否删除成功
     */
    boolean deleteVehicleReturn(Long returnId);
}
