package com.ruoyi.property.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @Author 范佳兴
 * @date 2025/1/10 16:55
 */
@TableName("cps_feedback")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Feedback implements Serializable {
    /**
     * 反馈ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long feedbackId;

    /**
     * 用户ID，外键关联用户表
     */
    private String userId;

    /**
     * 用户名
     */
    @TableField(exist = false)
    private String userName;

    /**
     * 反馈内容
     */
    private String content;

    /**
     * 状态（0-未解答，1-已解答）
     */
    private Integer status;

    /**
     * 图片
     */
    private String image;

    /**
     * 回复内容
     */
    private String replyContent;

    /**
     * 回复时间
     */
    private LocalDateTime replyTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
