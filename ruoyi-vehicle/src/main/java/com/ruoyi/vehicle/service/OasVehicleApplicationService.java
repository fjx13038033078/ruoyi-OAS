package com.ruoyi.vehicle.service;

import com.ruoyi.vehicle.domain.OasVehicleApplication;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:17
 */
public interface OasVehicleApplicationService {
    /**
     * 查询所有用车申请
     *
     * @return 用车申请列表
     */
    List<OasVehicleApplication> getAllVehicleApplications();

    /**
     * 根据用户ID查询用车申请记录
     *
     * @param userId 用户ID
     * @return 用车申请记录列表
     */
    List<OasVehicleApplication> getVehicleApplicationsByUserId(Long userId);

    /**
     * 添加用车申请记录
     *
     * @param application 用车申请
     * @return 是否添加成功
     */
    boolean addVehicleApplication(OasVehicleApplication application);

    /**
     * 更新用车申请记录
     *
     * @param application 用车申请
     * @return 是否更新成功
     */
    boolean updateVehicleApplication(OasVehicleApplication application);

    /**
     * 删除用车申请记录
     *
     * @param applicationId 用车申请ID
     * @return 是否删除成功
     */
    boolean deleteVehicleApplication(Long applicationId);
}
