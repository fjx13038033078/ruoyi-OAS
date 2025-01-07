package com.ruoyi.poem.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.poem.domain.ActivityRegistration;
import com.ruoyi.poem.mapper.ActivityRegistrationMapper;
import com.ruoyi.poem.service.ActivityRegistrationService;
import com.ruoyi.poem.service.ActivityService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

/**
 * @Author 范佳兴
 * @date 2025/1/2 10:05
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ActivityRegistrationServiceImpl implements ActivityRegistrationService {

    private final ActivityRegistrationMapper activityRegistrationMapper;

    private final ISysUserService iSysUserService;

    private final ISysRoleService iSysRoleService;

    private final ActivityService activityService;

    @Override
    public List<ActivityRegistration> getAllActivityRegistrations() {
        Long userId = SecurityUtils.getUserId();
        String role = iSysRoleService.selectStringRoleByUserId(userId);
        if (role.equals("admin")) {
            startPage();
            List<ActivityRegistration> allActivityRegistrations = activityRegistrationMapper.getAllActivityRegistrations();
            fillUserName(allActivityRegistrations);
            fillActivityName(allActivityRegistrations);
            return allActivityRegistrations;
        } else {
            startPage();
            List<ActivityRegistration> activityRegistrationsByUserId = activityRegistrationMapper.getActivityRegistrationsByUserId(userId);
            fillUserName(activityRegistrationsByUserId);
            fillActivityName(activityRegistrationsByUserId);
            return activityRegistrationsByUserId;
        }

    }

    @Override
    public ActivityRegistration getActivityRegistrationById(Long registrationId) {
        return activityRegistrationMapper.getActivityRegistrationById(registrationId);
    }

    @Override
    public boolean isAlreadyRegistered(Long activityId, Long userId) {
        int count = activityRegistrationMapper.checkUserRegistration(activityId, userId);
        return count > 0;
    }

    @Transactional
    @Override
    public boolean addActivityRegistration(ActivityRegistration activityRegistration) {
        Long userId = SecurityUtils.getUserId();
        activityRegistration.setUserId(userId);
        Long activityId = activityRegistration.getActivityId();
        // 执行预约校验
        validateActivityRegistration(activityId, userId);
        ActivityRegistration registrationByActivityAndUser = activityRegistrationMapper.getRegistrationByActivityAndUser(activityId, userId);
        if (registrationByActivityAndUser != null && registrationByActivityAndUser.getStatus() == 0){
            activityRegistration.setRegistrationId(registrationByActivityAndUser.getRegistrationId());
            activityRegistration.setStatus(1);  // 1表示预约成功
            activityRegistration.setRegisterTime(LocalDateTime.now());
            int rows = activityRegistrationMapper.updateActivityRegistration(activityRegistration);
            return rows > 0;
        } else if (registrationByActivityAndUser == null) {
            activityRegistration.setStatus(1);
            int rows = activityRegistrationMapper.addActivityRegistration(activityRegistration);
            return rows > 0;
        }
        return false;
    }

    @Override
    public boolean updateActivityRegistration(ActivityRegistration activityRegistration) {
        int rows = activityRegistrationMapper.updateActivityRegistration(activityRegistration);
        return rows > 0;
    }

    @Override
    public boolean deleteActivityRegistration(Long registrationId) {
        int rows = activityRegistrationMapper.deleteActivityRegistration(registrationId);
        return rows > 0;
    }

    @Override
    public List<ActivityRegistration> getActivityRegistrationsByActivityId(Long activityId) {
        return activityRegistrationMapper.getActivityRegistrationsByActivityId(activityId);
    }

    @Override
    public List<ActivityRegistration> getActivityRegistrationsByUserId(Long userId) {
        return activityRegistrationMapper.getActivityRegistrationsByUserId(userId);
    }

    /**
     * 填充用户名
     * @param allActivityRegistrations
     */
    private void fillUserName(List<ActivityRegistration> allActivityRegistrations) {
        for (ActivityRegistration activityRegistration : allActivityRegistrations) {
            Long userId = activityRegistration.getUserId();
            String userName = iSysUserService.selectUserById(userId).getNickName();
            activityRegistration.setUserName(userName);
        }
    }

    /**
     * 填充活动名
     * @param allActivityRegistrations
     */
    private void fillActivityName(List<ActivityRegistration> allActivityRegistrations) {
        for (ActivityRegistration activityRegistration : allActivityRegistrations) {
            Long activityId = activityRegistration.getActivityId();
            String activityName = activityService.getActivityById(activityId).getActivityName();
            activityRegistration.setActivityName(activityName);
        }
    }

    /**
     * 验证预约活动
     * @param activityId
     * @param userId
     */
    private void validateActivityRegistration(Long activityId, Long userId) {

        Integer status = activityService.getActivityById(activityId).getStatus();
        if (status == 0) {
            throw new RuntimeException("该活动暂时不可预约！");
        }

        // 查询该用户该活动的预约记录（包含已取消）
        ActivityRegistration existingRegistration = activityRegistrationMapper
                .getRegistrationByActivityAndUser(activityId, userId);

        // 校验是否已预约
        if (existingRegistration != null && existingRegistration.getStatus() != 0) {
            throw new RuntimeException("您已预约该活动，不能重复预约！");
        }

        // 统计有效预约数量
        long activeCount = activityRegistrationMapper
                .getActivityRegistrationsByUserId(userId)
                .stream()
                .filter(r -> r.getStatus() == 1)
                .count();
        if (activeCount >= 3) {
            throw new RuntimeException("您已预约3个活动，不能再预约！");
        }
    }
}
