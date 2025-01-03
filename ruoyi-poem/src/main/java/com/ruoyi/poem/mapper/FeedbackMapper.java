package com.ruoyi.poem.mapper;

import com.ruoyi.poem.domain.Feedback;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2024/12/31 16:47
 */
@Mapper
public interface FeedbackMapper {

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
     * @return 影响行数
     */
    int addFeedback(Feedback feedback);

    /**
     * 删除反馈
     *
     * @param feedbackId 反馈ID
     * @return 影响行数
     */
    int deleteFeedback(Long feedbackId);

    /**
     * 回复反馈
     *
     * @param feedback 反馈信息
     * @return 影响行数
     */
    int replyFeedback(Feedback feedback);
}
