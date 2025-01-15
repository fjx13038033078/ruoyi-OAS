package com.ruoyi.property.mapper;

import com.ruoyi.property.domain.Feedback;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/10 17:40
 */
@Mapper
public interface FeedbackMapper {
    /**
     * 获取所有反馈记录
     *
     * @return 反馈记录列表
     */
    List<Feedback> getAllFeedbacks();

    /**
     * 根据反馈ID获取反馈记录详情
     *
     * @param feedbackId 反馈ID
     * @return 反馈记录详情
     */
    Feedback getFeedbackById(Long feedbackId);

    /**
     * 根据用户ID获取反馈记录
     *
     * @param userId 用户ID
     * @return 用户的反馈记录
     */
    List<Feedback> getFeedbacksByUserId(Long userId);

    /**
     * 添加反馈记录
     *
     * @param feedback 反馈记录
     * @return 影响行数
     */
    int addFeedback(Feedback feedback);

    /**
     * 更新反馈记录
     *
     * @param feedback 反馈记录
     * @return 影响行数
     */
    int replyFeedback(Feedback feedback);

    /**
     * 删除反馈记录
     *
     * @param feedbackId 反馈记录ID
     * @return 影响行数
     */
    int deleteFeedback(Long feedbackId);
}
