package com.ruoyi.poem.service.impl;

import com.ruoyi.poem.domain.Activity;
import com.ruoyi.poem.mapper.ActivityMapper;
import com.ruoyi.poem.service.ActivityService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/2 9:56
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ActivityServiceImpl implements ActivityService {
    private final ActivityMapper activityMapper;

    /**
     * 获取所有活动
     *
     * @return 活动列表
     */
    @Override
    public List<Activity> getAllActivities() {
        List<Activity> activities = activityMapper.getAllActivities();
        return activities;
    }

    /**
     * 根据活动ID获取活动详情
     *
     * @param activityId 活动ID
     * @return 活动详情
     */
    @Override
    public Activity getActivityById(Long activityId) {
        return activityMapper.getActivityById(activityId);
    }

    /**
     * 添加活动
     *
     * @param activity 活动信息
     * @return 添加成功返回 true，否则返回 false
     */
    @Override
    public boolean addActivity(Activity activity) {
        int rows = activityMapper.addActivity(activity);
        return rows > 0;
    }

    /**
     * 更新活动信息
     *
     * @param activity 活动信息
     * @return 更新成功返回 true，否则返回 false
     */
    @Override
    public boolean updateActivity(Activity activity) {
        int rows = activityMapper.updateActivity(activity);
        return rows > 0;
    }

    /**
     * 删除活动
     *
     * @param activityId 待删除的活动ID
     * @return 删除成功返回 true，否则返回 false
     */
    @Override
    public boolean deleteActivity(Long activityId) {
        int rows = activityMapper.deleteActivity(activityId);
        return rows > 0;
    }
}
