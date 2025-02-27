package com.ruoyi.vehicle.service.impl;

import com.ruoyi.vehicle.domain.VehicleApplication;
import com.ruoyi.vehicle.mapper.VehicleApplicationMapper;
import com.ruoyi.vehicle.service.VehicleApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:20
 */
@Service
@RequiredArgsConstructor
public class VehicleApplicationServiceImpl implements VehicleApplicationService {

    private final VehicleApplicationMapper vehicleApplicationMapper;

    /**
     * 查询所有用车申请
     *
     * @return 用车申请列表
     */
    @Override
    public List<VehicleApplication> getAllVehicleApplications() {
        return vehicleApplicationMapper.getAllApplications();
    }

    /**
     * 根据用户ID查询用车申请记录
     *
     * @param userId 用户ID
     * @return 用车申请记录列表
     */
    @Override
    public List<VehicleApplication> getVehicleApplicationsByUserId(Long userId) {
        return vehicleApplicationMapper.getApplicationsByUserId(userId);
    }

    /**
     * 添加用车申请记录
     *
     * @param application 用车申请
     * @return 是否添加成功
     */
    @Override
    public boolean addVehicleApplication(VehicleApplication application) {
        application.setStatus("待审批"); // 默认待审批
        int rows = vehicleApplicationMapper.addApplication(application);
        return rows > 0;
    }

    /**
     * 更新用车申请记录
     *
     * @param application 用车申请
     * @return 是否更新成功
     */
    @Override
    public boolean updateVehicleApplication(VehicleApplication application) {
        int rows = vehicleApplicationMapper.updateApplication(application);
        return rows > 0;
    }

    /**
     * 删除用车申请记录
     *
     * @param applicationId 用车申请ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteVehicleApplication(Long applicationId) {
        int rows = vehicleApplicationMapper.deleteApplication(applicationId);
        return rows > 0;
    }
}
