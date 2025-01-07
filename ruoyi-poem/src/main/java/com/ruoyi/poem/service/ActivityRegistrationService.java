package com.ruoyi.poem.service;

import com.ruoyi.poem.domain.ActivityRegistration;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/2 10:04
 */
public interface ActivityRegistrationService {
    /**
     * 获取所有活动报名信息
     * @return 所有活动报名信息列表
     */
    List<ActivityRegistration> getAllActivityRegistrations();

    /**
     * 根据报名ID获取活动报名信息
     * @param registrationId 报名ID
     * @return 活动报名信息
     */
    ActivityRegistration getActivityRegistrationById(Long registrationId);

    /**
     * 判断用户是否已报名该活动
     *
     * @param activityId 活动ID
     * @param userId     用户ID
     * @return 已报名返回 true，否则返回 false
     */
    boolean isAlreadyRegistered(Long activityId, Long userId);

    /**
     * 添加活动报名信息
     * @param activityRegistration 待添加的活动报名信息
     * @return 添加成功返回 true，否则返回 false
     */
    boolean addActivityRegistration(ActivityRegistration activityRegistration);

    /**
     * 更新活动报名信息
     * @param activityRegistration 待更新的活动报名信息
     * @return 更新成功返回 true，否则返回 false
     */
    boolean updateActivityRegistration(ActivityRegistration activityRegistration);

    /**
     * 删除活动报名信息
     * @param registrationId 待删除的报名ID
     * @return 删除成功返回 true，否则返回 false
     */
    boolean deleteActivityRegistration(Long registrationId);

    /**
     * 根据活动ID获取报名信息
     * @param activityId 活动ID
     * @return 报名信息列表
     */
    List<ActivityRegistration> getActivityRegistrationsByActivityId(Long activityId);

    /**
     * 根据用户ID获取报名信息
     * @param userId 用户ID
     * @return 报名信息列表
     */
    List<ActivityRegistration> getActivityRegistrationsByUserId(Long userId);
}
