package com.ruoyi.leave.service;

import com.ruoyi.leave.domain.AnnualLeave;
import java.util.List;
/**
 * @Author 范佳兴
 * @date 2025/2/27 9:07
 */
public interface AnnualLeaveService {
    /**
     * 获取所有年假记录
     *
     * @return 年假记录列表
     */
    List<AnnualLeave> getAllAnnualLeaves();

    /**
     * 根据用户ID获取年假记录
     *
     * @param userId 用户ID
     * @return 年假记录
     */
    AnnualLeave getAnnualLeaveByUserId(Long userId);

    /**
     * 添加年假记录
     *
     * @param annualLeave 年假记录
     * @return 是否添加成功
     */
    boolean addAnnualLeave(AnnualLeave annualLeave);

    /**
     * 更新年假记录
     *
     * @param annualLeave 年假记录
     * @return 是否更新成功
     */
    boolean updateAnnualLeave(AnnualLeave annualLeave);

    /**
     * 删除年假记录
     *
     * @param leaveId 年假ID
     * @return 是否删除成功
     */
    boolean deleteAnnualLeave(Long leaveId);
}
