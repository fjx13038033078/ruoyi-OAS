package com.ruoyi.vehicle.service;

import com.ruoyi.vehicle.domain.VehicleApplication;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:17
 */
public interface VehicleApplicationService {
    /**
     * 查询所有用车申请
     *
     * @return 用车申请列表
     */
    List<VehicleApplication> getAllVehicleApplications();

    /**
     * 根据用户ID查询用车申请记录
     *
     * @param userId 用户ID
     * @return 用车申请记录列表
     */
    List<VehicleApplication> getVehicleApplicationsByUserId(Long userId);

    /**
     * 添加用车申请记录
     *
     * @param application 用车申请
     * @return 是否添加成功
     */
    boolean addVehicleApplication(VehicleApplication application);

    /**
     * 更新用车申请记录
     *
     * @param application 用车申请
     * @return 是否更新成功
     */
    boolean updateVehicleApplication(VehicleApplication application);

    /**
     * 删除用车申请记录
     *
     * @param applicationId 用车申请ID
     * @return 是否删除成功
     */
    boolean deleteVehicleApplication(Long applicationId);
}
