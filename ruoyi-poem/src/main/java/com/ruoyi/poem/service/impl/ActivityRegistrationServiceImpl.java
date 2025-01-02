package com.ruoyi.poem.service.impl;

import com.ruoyi.poem.domain.ActivityRegistration;
import com.ruoyi.poem.mapper.ActivityRegistrationMapper;
import com.ruoyi.poem.service.ActivityRegistrationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/2 10:05
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ActivityRegistrationServiceImpl implements ActivityRegistrationService {
    private final ActivityRegistrationMapper activityRegistrationMapper;

    @Override
    public List<ActivityRegistration> getAllActivityRegistrations() {
        return activityRegistrationMapper.getAllActivityRegistrations();
    }

    @Override
    public ActivityRegistration getActivityRegistrationById(Long registrationId) {
        return activityRegistrationMapper.getActivityRegistrationById(registrationId);
    }

    @Override
    public boolean addActivityRegistration(ActivityRegistration activityRegistration) {
        int rows = activityRegistrationMapper.addActivityRegistration(activityRegistration);
        return rows > 0;
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
}
