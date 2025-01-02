package com.ruoyi.poem.mapper;

import com.ruoyi.poem.domain.Activity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2024/12/31 16:59
 */
@Mapper
public interface ActivityMapper {

    /**
     * 获取所有活动
     *
     * @return 活动列表
     */
    List<Activity> getAllActivities();

    /**
     * 根据活动ID获取活动详情
     *
     * @param activityId 活动ID
     * @return 活动详情
     */
    Activity getActivityById(Long activityId);

    /**
     * 添加活动
     *
     * @param activity 活动信息
     * @return 影响的行数
     */
    int addActivity(Activity activity);

    /**
     * 更新活动
     *
     * @param activity 活动信息
     * @return 影响的行数
     */
    int updateActivity(Activity activity);

    /**
     * 删除活动
     *
     * @param activityId 活动ID
     * @return 影响的行数
     */
    int deleteActivity(Long activityId);
}
