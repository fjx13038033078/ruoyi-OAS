package com.ruoyi.poem.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
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
     * 报名用户ID，外键
     */
    private Long userId;

    /**
     * 报名时间
     */
    private Date registerTime;

    /**
     * 预约状态（1-已预约，0-已取消）
     */
    private Integer status;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
