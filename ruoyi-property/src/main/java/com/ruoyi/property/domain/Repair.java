package com.ruoyi.property.domain;

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
 * @date 2025/1/10 16:50
 */
@TableName("cps_repair")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Repair implements Serializable {
    /**
     * 报修ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long repairId;

    /**
     * 用户ID，外键关联用户表
     */
    private Long userId;

    /**
     * 用户名
     */
    @TableField(exist = false)
    private String userName;

    /**
     * 报修类型
     */
    private String repairType;

    /**
     * 报修描述
     */
    private String description;

    /**
     * 报修状态
     * 0 - 待处理，1 - 处理中，2 - 已解决，3 - 已取消
     */
    private Integer status;

    /**
     * 报修申请时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createdTime;

    /**
     * 解决时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime resolvedTime;

    /**
     * 报修图片
     */
    private String repairImage;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
