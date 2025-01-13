package com.ruoyi.property.service;

import com.ruoyi.property.domain.Feedback;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/13 8:50
 */
public interface FeedbackService {
    /**
     * 查询所有反馈记录
     *
     * @return 反馈记录列表
     */
    List<Feedback> getAllFeedbacks();

    /**
     * 根据反馈ID查询反馈记录详情
     *
     * @param feedbackId 反馈ID
     * @return 反馈记录详情
     */
    Feedback getFeedbackById(Long feedbackId);

    /**
     * 根据用户ID查询反馈记录
     *
     * @param userId 用户ID
     * @return 用户的反馈记录列表
     */
    List<Feedback> getFeedbacksByUserId(String userId);

    /**
     * 添加反馈记录
     *
     * @param feedback 反馈对象
     * @return 是否添加成功
     */
    boolean addFeedback(Feedback feedback);

    /**
     * 删除反馈记录
     *
     * @param feedbackId 反馈ID
     * @return 是否删除成功
     */
    boolean deleteFeedback(Long feedbackId);
}
