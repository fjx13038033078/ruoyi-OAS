package com.ruoyi.poem.service;

import com.ruoyi.poem.domain.Feedback;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2024/12/31 16:51
 */
public interface FeedbackService {

    /**
     * 获取所有反馈
     *
     * @return 反馈列表
     */
    List<Feedback> getAllFeedback();

    /**
     * 根据反馈ID获取反馈详情
     *
     * @param feedbackId 反馈ID
     * @return 反馈详情
     */
    Feedback getFeedbackById(Long feedbackId);

    /**
     * 添加反馈
     *
     * @param feedback 反馈信息
     * @return 是否添加成功
     */
    boolean addFeedback(Feedback feedback);

    /**
     * 删除反馈
     *
     * @param feedbackId 反馈ID
     * @return 是否删除成功
     */
    boolean deleteFeedback(Long feedbackId);
}
