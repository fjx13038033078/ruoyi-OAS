package com.ruoyi.leave.mapper;

import com.ruoyi.leave.domain.AnnualLeave;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/26 17:13
 */
@Mapper
public interface AnnualLeaveMapper {
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
     * @return 影响行数
     */
    int addAnnualLeave(AnnualLeave annualLeave);

    /**
     * 更新年假记录
     *
     * @param annualLeave 年假记录
     * @return 影响行数
     */
    int updateAnnualLeave(AnnualLeave annualLeave);

    /**
     * 删除年假记录
     *
     * @param leaveId 年假ID
     * @return 影响行数
     */
    int deleteAnnualLeave(Long leaveId);
}
