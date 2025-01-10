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
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @Author 范佳兴
 * @date 2025/1/10 16:52
 */
@TableName("cps_payment")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Payment implements Serializable {
    /**
     * 缴费记录ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long paymentId;

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
     * 缴纳金额
     */
    private BigDecimal amount;

    /**
     * 截止日期
     */
    private LocalDateTime paymentDate;

    /**
     * 缴费状态
     * 0 - 待缴费，1 - 已缴费，2 - 缴费失败
     */
    private Integer status;

    /**
     * 详情描述
     */
    private String description;

    /**
     * 附件
     */
    private String file;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
