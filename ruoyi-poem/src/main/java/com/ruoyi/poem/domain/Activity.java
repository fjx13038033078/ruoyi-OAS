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

/**
 * @Author 范佳兴
 * @date 2024/12/31 14:16
 */
@TableName("ape_activity")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Activity implements Serializable {

    /**
     * 活动ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long activityId;

    /**
     * 活动名称
     */
    private String activityName;

    /**
     * 活动地点
     */
    private String activityLocation;

    /**
     * 活动内容
     */
    private String activityContent;

    /**
     * 活动开始时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime startTime;

    /**
     * 活动结束时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime endTime;

    /**
     * 状态（1-可预约，0-不可预约）
     */
    private Integer status;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
