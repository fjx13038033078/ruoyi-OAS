package com.ruoyi.poem.service;

import com.ruoyi.poem.domain.Activity;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/2 9:54
 */
public interface ActivityService {
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
     * @param activity 待添加的活动信息
     * @return 添加成功返回 true，否则返回 false
     */
    boolean addActivity(Activity activity);

    /**
     * 更新活动信息
     *
     * @param activity 待更新的活动信息
     * @return 更新成功返回 true，否则返回 false
     */
    boolean updateActivity(Activity activity);

    /**
     * 删除活动
     *
     * @param activityId 待删除的活动ID
     * @return 删除成功返回 true，否则返回 false
     */
    boolean deleteActivity(Long activityId);
}
