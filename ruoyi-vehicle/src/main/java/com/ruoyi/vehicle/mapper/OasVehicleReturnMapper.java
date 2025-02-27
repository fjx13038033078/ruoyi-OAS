package com.ruoyi.vehicle.mapper;

import com.ruoyi.vehicle.domain.OasVehicleReturn;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
/**
 * @Author 范佳兴
 * @date 2025/2/27 11:42
 */
@Mapper
public interface OasVehicleReturnMapper {
    /**
     * 获取所有车辆归还记录
     */
    List<OasVehicleReturn> getAllReturns();

    /**
     * 根据用车申请ID获取车辆归还记录
     */
    OasVehicleReturn getReturnByApplicationId(Long applicationId);

    /**
     * 添加车辆归还记录
     */
    int addReturn(OasVehicleReturn vehicleReturn);

    /**
     * 更新车辆归还记录
     */
    int updateReturn(OasVehicleReturn vehicleReturn);

    /**
     * 删除车辆归还记录
     */
    int deleteReturn(Long returnId);
}
