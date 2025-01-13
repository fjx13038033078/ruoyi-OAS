package com.ruoyi.property.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.property.domain.Feedback;
import com.ruoyi.property.mapper.FeedbackMapper;
import com.ruoyi.property.service.FeedbackService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/13 8:51
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FeedbackServiceImpl implements FeedbackService {

    private final FeedbackMapper feedbackMapper;

    private final ISysUserService iSysUserService;

    /**
     * 查询所有反馈记录
     *
     * @return 反馈记录列表
     */
    @Override
    public List<Feedback> getAllFeedbacks() {
        List<Feedback> feedbackList = feedbackMapper.getAllFeedbacks();
        fillUserName(feedbackList);
        return feedbackList;
    }

    /**
     * 根据反馈ID查询反馈记录详情
     *
     * @param feedbackId 反馈ID
     * @return 反馈记录详情
     */
    @Override
    public Feedback getFeedbackById(Long feedbackId) {
        return feedbackMapper.getFeedbackById(feedbackId);
    }

    /**
     * 根据用户ID查询反馈记录
     *
     * @param userId 用户ID
     * @return 用户的反馈记录列表
     */
    @Override
    public List<Feedback> getFeedbacksByUserId(String userId) {
        return feedbackMapper.getFeedbacksByUserId(userId);
    }

    /**
     * 添加反馈记录
     *
     * @param feedback 反馈对象
     * @return 是否添加成功
     */
    @Override
    public boolean addFeedback(Feedback feedback) {
        Long userId = SecurityUtils.getUserId();
        feedback.setUserId(userId);
        feedback.setStatus(0); // 设置状态为未处理
        int rows = feedbackMapper.addFeedback(feedback);
        return rows > 0;
    }

    /**
     * 更新反馈记录
     *
     * @param feedback 反馈对象
     * @return 是否更新成功
     */
    @Override
    public boolean updateFeedback(Feedback feedback) {
//        feedback.setUpdateTime(LocalDateTime.now());
        int rows = feedbackMapper.updateFeedback(feedback);
        return rows > 0;
    }

    /**
     * 删除反馈记录
     *
     * @param feedbackId 反馈ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteFeedback(Long feedbackId) {
        Long userId = SecurityUtils.getUserId();
        Feedback feedback = feedbackMapper.getFeedbackById(feedbackId);
        if (feedback == null) {
            throw new RuntimeException("反馈记录不存在");
        }
        if (!userId.equals(1L) && !userId.equals(feedback.getUserId())) {
            throw new RuntimeException("当前用户无权删除此反馈");
        }
        int rows = feedbackMapper.deleteFeedback(feedbackId);
        return rows > 0;
    }

    // 填充用户名
    private void fillUserName(List<Feedback> feedbackList) {
        for (Feedback feedback : feedbackList) {
            Long userId = feedback.getUserId();
            if (userId != null) {
                String userName = iSysUserService.selectUserById(userId).getNickName();
                feedback.setUserName(userName);
            }
        }
    }
}
