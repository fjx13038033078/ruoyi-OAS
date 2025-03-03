package com.ruoyi.vehicle.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.vehicle.domain.Vehicle;
import com.ruoyi.vehicle.domain.VehicleApplication;
import com.ruoyi.vehicle.domain.VehicleReturn;
import com.ruoyi.vehicle.mapper.VehicleApplicationMapper;
import com.ruoyi.vehicle.mapper.VehicleReturnMapper;
import com.ruoyi.vehicle.service.VehicleReturnService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:21
 */
@Service
@RequiredArgsConstructor
public class VehicleReturnServiceImpl implements VehicleReturnService {

    private final VehicleReturnMapper vehicleReturnMapper;

    private final VehicleApplicationMapper vehicleApplicationMapper;

    private final ISysUserService iSysUserService;

    private final VehicleServiceImpl vehicleService;

    private final ISysRoleService iSysRoleService;

    /**
     * 查询所有车辆归还记录
     *
     * @return 车辆归还记录列表
     */
    @Override
    public List<VehicleReturn> getAllVehicleReturns() {
        Long userId = SecurityUtils.getUserId();
        String role = iSysRoleService.selectStringRoleByUserId(userId);
        if (role.equals("admin")) {
            startPage();
            List<VehicleReturn> allReturns = vehicleReturnMapper.getAllReturns();
            fillReturnInfo(allReturns);
            return allReturns;
        } else {
            startPage();
            List<VehicleReturn> vehicleReturnsByUserId = vehicleReturnMapper.getReturnsByUserId(userId);
            fillReturnInfo(vehicleReturnsByUserId);
            return vehicleReturnsByUserId;
        }
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
        vehicleReturn.setUserId(SecurityUtils.getUserId());
        Long applicationId = vehicleReturn.getApplicationId();
        VehicleReturn returnByApplicationId = vehicleReturnMapper.getReturnByApplicationId(applicationId);
        if (returnByApplicationId != null){
            throw new RuntimeException("该用车申请归还，请勿重复申请");
        }
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

    private void fillReturnInfo(List<VehicleReturn> vehicleReturns) {
        for (VehicleReturn vehicleReturn : vehicleReturns) {
            Long applicationId = vehicleReturn.getApplicationId();
            VehicleApplication application = vehicleApplicationMapper.getApplicationById(applicationId);
            Long vehicleId = application.getVehicleId();
            Vehicle vehicleById = vehicleService.getVehicleById(vehicleId);
            vehicleReturn.setVehicleNumber(vehicleById.getVehicleNumber());
            Long userId = application.getUserId();
            String userName = iSysUserService.selectUserById(userId).getNickName();
            vehicleReturn.setUserName(userName);
        }
    }
}
