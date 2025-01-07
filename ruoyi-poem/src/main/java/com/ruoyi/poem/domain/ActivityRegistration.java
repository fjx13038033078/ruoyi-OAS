package com.ruoyi.poem.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * @Author 范佳兴
 * @date 2024/12/31 11:45
 */
@TableName("ape_activity_registration")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class ActivityRegistration implements Serializable {

    /**
     * 报名ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long registrationId;

    /**
     * 活动ID，外键
     */
    private Long activityId;

    /**
     * 活动名称
     */
    @TableField(exist = false)
    private String activityName;

    /**
     * 报名用户ID，外键
     */
    private Long userId;

    /**
     * 报名用户名
     */
    @TableField(exist = false)
    private String userName;

    /**
     * 报名时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime registerTime;

    /**
     * 预约状态（1-已预约，0-已取消）
     */
    private Integer status;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
