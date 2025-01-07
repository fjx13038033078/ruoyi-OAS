package com.ruoyi.poem.mapper;

import com.ruoyi.poem.domain.ActivityRegistration;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2024/12/31 17:08
 */
@Mapper
public interface ActivityRegistrationMapper {

    /**
     * 查询所有活动报名信息
     *
     * @return 活动报名信息列表
     */
    List<ActivityRegistration> getAllActivityRegistrations();

    /**
     * 根据报名ID查询活动报名信息
     *
     * @param registrationId 报名ID
     * @return 活动报名信息
     */
    ActivityRegistration getActivityRegistrationById(Long registrationId);

    int checkUserRegistration(@Param("activityId") Long activityId, @Param("userId") Long userId);

    ActivityRegistration getRegistrationByActivityAndUser(@Param("activityId") Long activityId,
                                                          @Param("userId") Long userId);

    /**
     * 添加活动报名信息
     *
     * @param activityRegistration 待添加的活动报名信息
     * @return 添加成功返回影响的行数，否则返回0
     */
    int addActivityRegistration(ActivityRegistration activityRegistration);

    /**
     * 更新活动报名信息
     *
     * @param activityRegistration 待更新的活动报名信息
     * @return 更新成功返回影响的行数，否则返回0
     */
    int updateActivityRegistration(ActivityRegistration activityRegistration);

    /**
     * 删除活动报名信息
     *
     * @param registrationId 待删除的报名ID
     * @return 删除成功返回影响的行数，否则返回0
     */
    int deleteActivityRegistration(Long registrationId);

    /**
     * 根据活动ID查询报名信息
     *
     * @param activityId 活动ID
     * @return 活动报名信息
     */
    List<ActivityRegistration> getActivityRegistrationsByActivityId(Long activityId);

    /**
     * 根据用户ID查询报名信息
     *
     * @param userId 用户ID
     * @return 活动报名信息
     */
    List<ActivityRegistration> getActivityRegistrationsByUserId(Long userId);
}
