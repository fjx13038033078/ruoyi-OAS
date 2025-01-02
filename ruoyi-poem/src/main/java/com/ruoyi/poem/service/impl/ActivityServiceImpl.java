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
        fillActivityStatus(activities);
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
        validateDuplicateActivity(activity);
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
        if (!isActivityNameChanged(activity)) {
            int rows = activityMapper.updateActivity(activity);
            return rows > 0;
        }

        validateDuplicateActivity(activity);
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

    /**
     * 填充活动状态
     * @param activities 活动列表
     */
    private void fillActivityStatus(List<Activity> activities) {
        for (Activity activity : activities) {
            if (activity.getEndTime().isBefore(java.time.LocalDateTime.now())) {
                activity.setStatus("已结束");
            } else {
                activity.setStatus("进行中");
            }
        }
    }

    /**
     * 校验活动是否重复
     * @param activity 活动信息
     */
    private void validateDuplicateActivity(Activity activity) {
//        if (activityMapper.countByNameAndDate(activity.getActivityName(), activity.getStartTime()) > 0) {
//            throw new RuntimeException("该活动已存在，不能重复添加");
//        }
    }

    /**
     * 判断活动名称是否变化
     * @param activity 活动信息
     * @return true 如果名称有变化，否则 false
     */
    private boolean isActivityNameChanged(Activity activity) {
        Activity existingActivity = activityMapper.getActivityById(activity.getActivityId());
        return !existingActivity.getActivityName().equals(activity.getActivityName());
    }
}
