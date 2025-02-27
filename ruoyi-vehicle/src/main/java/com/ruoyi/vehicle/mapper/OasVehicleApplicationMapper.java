package com.ruoyi.vehicle.mapper;

import com.ruoyi.vehicle.domain.OasVehicleApplication;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 11:41
 */
@Mapper
public interface OasVehicleApplicationMapper {
    /**
     * 获取所有用车申请
     */
    List<OasVehicleApplication> getAllApplications();

    /**
     * 根据用车申请ID获取用车申请
     */
    OasVehicleApplication getApplicationById(Long applicationId);

    /**
     * 根据用户ID获取用车申请
     */
    List<OasVehicleApplication> getApplicationsByUserId(Long userId);

    /**
     * 添加用车申请
     */
    int addApplication(OasVehicleApplication application);

    /**
     * 更新用车申请
     */
    int updateApplication(OasVehicleApplication application);

    /**
     * 删除用车申请
     */
    int deleteApplication(Long applicationId);
}
