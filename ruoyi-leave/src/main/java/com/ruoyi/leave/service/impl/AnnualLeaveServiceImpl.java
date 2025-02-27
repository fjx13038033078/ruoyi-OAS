package com.ruoyi.leave.service.impl;

import com.ruoyi.leave.domain.AnnualLeave;
import com.ruoyi.leave.mapper.AnnualLeaveMapper;
import com.ruoyi.leave.service.AnnualLeaveService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:08
 */
@Service
@RequiredArgsConstructor
public class AnnualLeaveServiceImpl implements AnnualLeaveService {

    private final AnnualLeaveMapper annualLeaveMapper;

    /**
     * 获取所有年假记录
     *
     * @return 年假记录列表
     */
    @Override
    public List<AnnualLeave> getAllAnnualLeaves() {
        return annualLeaveMapper.getAllAnnualLeaves();
    }

    /**
     * 根据用户ID获取年假记录
     *
     * @param userId 用户ID
     * @return 年假记录
     */
    @Override
    public AnnualLeave getAnnualLeaveByUserId(Long userId) {
        return annualLeaveMapper.getAnnualLeaveByUserId(userId);
    }

    /**
     * 添加年假记录
     *
     * @param annualLeave 年假记录
     * @return 是否添加成功
     */
    @Override
    public boolean addAnnualLeave(AnnualLeave annualLeave) {
        return annualLeaveMapper.addAnnualLeave(annualLeave) > 0;
    }

    /**
     * 更新年假记录
     *
     * @param annualLeave 年假记录
     * @return 是否更新成功
     */
    @Override
    public boolean updateAnnualLeave(AnnualLeave annualLeave) {
        return annualLeaveMapper.updateAnnualLeave(annualLeave) > 0;
    }

    /**
     * 删除年假记录
     *
     * @param leaveId 年假ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAnnualLeave(Long leaveId) {
        return annualLeaveMapper.deleteAnnualLeave(leaveId) > 0;
    }
}
