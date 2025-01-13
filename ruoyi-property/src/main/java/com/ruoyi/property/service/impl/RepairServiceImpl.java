package com.ruoyi.property.service.impl;

import com.ruoyi.property.domain.Repair;
import com.ruoyi.property.mapper.RepairMapper;
import com.ruoyi.property.service.RepairService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/13 9:05
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RepairServiceImpl implements RepairService {

    private final RepairMapper repairMapper;

    private final ISysUserService sysUserService;

    /**
     * 查询所有报修记录
     *
     * @return 报修记录列表
     */
    @Override
    public List<Repair> getAllRepairs() {
        List<Repair> repairs = repairMapper.getAllRepairs();
        fillUserNames(repairs);
        return repairs;
    }

    /**
     * 根据报修ID查询报修详情
     *
     * @param repairId 报修ID
     * @return 报修详情
     */
    @Override
    public Repair getRepairById(Long repairId) {
        Repair repair = repairMapper.getRepairById(repairId);
        if (repair != null) {
            repair.setUserName(getUserNameById(repair.getUserId()));
        }
        return repair;
    }

    /**
     * 根据用户ID查询用户报修记录
     *
     * @param userId 用户ID
     * @return 用户报修记录列表
     */
    @Override
    public List<Repair> getRepairsByUserId(Long userId) {
        List<Repair> repairs = repairMapper.getRepairsByUserId(userId);
        fillUserNames(repairs);
        return repairs;
    }

    /**
     * 添加报修记录
     *
     * @param repair 报修对象
     * @return 是否添加成功
     */
    @Override
    public boolean addRepair(Repair repair) {
        repair.setCreatedTime(LocalDateTime.now());
        repair.setStatus(0); // 初始化状态为待处理
        int rows = repairMapper.addRepair(repair);
        return rows > 0;
    }

    /**
     * 更新报修记录
     *
     * @param repair 报修对象
     * @return 是否更新成功
     */
    @Override
    public boolean updateRepair(Repair repair) {
        repair.setResolvedTime(
                repair.getStatus() == 2 ? LocalDateTime.now() : null); // 如果状态为已解决，设置解决时间
        int rows = repairMapper.updateRepair(repair);
        return rows > 0;
    }

    /**
     * 删除报修记录
     *
     * @param repairId 报修ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteRepair(Long repairId) {
        int rows = repairMapper.deleteRepair(repairId);
        return rows > 0;
    }

    /**
     * 根据用户ID获取用户名
     *
     * @param userId 用户ID
     * @return 用户名
     */
    private String getUserNameById(Long userId) {
        return sysUserService.selectUserById(userId).getNickName();
    }

    /**
     * 填充报修记录的用户名
     *
     * @param repairs 报修记录列表
     */
    private void fillUserNames(List<Repair> repairs) {
        for (Repair repair : repairs) {
            repair.setUserName(getUserNameById(repair.getUserId()));
        }
    }
}
