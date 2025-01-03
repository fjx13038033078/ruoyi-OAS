package com.ruoyi.poem.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.poem.domain.Feedback;
import com.ruoyi.poem.mapper.FeedbackMapper;
import com.ruoyi.poem.service.FeedbackService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author 范佳兴
 * @date 2024/12/31 16:52
 */
@Service
@RequiredArgsConstructor
public class FeedbackServiceImpl implements FeedbackService {

    private final FeedbackMapper feedbackMapper;

    private final ISysUserService iSysUserService;

    /**
     * 获取所有反馈
     *
     * @return 反馈列表
     */
    @Override
    public List<Feedback> getAllFeedback() {
        List<Feedback> allFeedback = feedbackMapper.getAllFeedback();
        fillUserName(allFeedback);
        return allFeedback;
    }

    /**
     * 根据反馈ID获取反馈详情
     *
     * @param feedbackId 反馈ID
     * @return 反馈详情
     */
    @Override
    public Feedback getFeedbackById(Long feedbackId) {
        return feedbackMapper.getFeedbackById(feedbackId);
    }

    /**
     * 添加反馈
     *
     * @param feedback 反馈信息
     * @return 是否添加成功
     */
    @Override
    public boolean addFeedback(Feedback feedback) {
        Long userId = SecurityUtils.getUserId();
        feedback.setUserId(userId);
        feedback.setStatus(0);
        int rows = feedbackMapper.addFeedback(feedback);
        return rows > 0;
    }

    /**
     * 删除反馈
     *
     * @param feedbackId 反馈ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteFeedback(Long feedbackId) {
        int rows = feedbackMapper.deleteFeedback(feedbackId);
        return rows > 0;
    }

    /**
     * 回复反馈
     *
     * @param feedback 反馈信息
     * @return 是否回复成功
     */
    @Override
    public boolean replyFeedback(Feedback feedback) {
        feedback.setStatus(1);
        feedback.setReplyTime(LocalDateTime.now());
        int rows = feedbackMapper.replyFeedback(feedback);
        return rows > 0;
    }

    // 填充用户名
    private void fillUserName(List<Feedback> feedbackList) {
        for (Feedback feedback : feedbackList) {
            Long userId = feedback.getUserId();
            String userName = iSysUserService.selectUserById(userId).getNickName();
            feedback.setUserName(userName);
        }
    }
}
