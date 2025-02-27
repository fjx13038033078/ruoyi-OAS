package com.ruoyi.vehicle.mapper;

import com.ruoyi.vehicle.domain.VehicleApplication;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 11:41
 */
@Mapper
public interface VehicleApplicationMapper {
    /**
     * 获取所有用车申请
     */
    List<VehicleApplication> getAllApplications();

    /**
     * 根据用车申请ID获取用车申请
     */
    VehicleApplication getApplicationById(Long applicationId);

    /**
     * 根据用户ID获取用车申请
     */
    List<VehicleApplication> getApplicationsByUserId(Long userId);

    /**
     * 添加用车申请
     */
    int addApplication(VehicleApplication application);

    /**
     * 更新用车申请
     */
    int updateApplication(VehicleApplication application);

    /**
     * 删除用车申请
     */
    int deleteApplication(Long applicationId);
}
