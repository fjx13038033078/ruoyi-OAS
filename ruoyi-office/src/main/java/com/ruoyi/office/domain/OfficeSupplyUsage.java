package com.ruoyi.office.domain;

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
 * @date 2025/2/26 17:10
 */
@TableName("oas_office_usage")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class OfficeSupplyUsage implements Serializable {

    /**
     * 领用ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long usageId;

    /**
     * 用户ID，外键关联用户表
     */
    private Long userId;

    @TableField(exist = false)
    private String userName;

    /**
     * 办公用品ID，外键关联办公用品台账
     */
    private Long supplyId;

    @TableField(exist = false)
    private String supplyName;

    /**
     * 领用数量
     */
    private Integer quantity;

    /**
     * 领用理由
     */
    private String usageReason;

    /**
     * 申请状态（待审批、已批准、已拒绝等）
     */
    private int status;

    /**
     * 审批人ID
     */
    private Long approvalUser;

    @TableField(exist = false)
    private String approvalUserName;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime;

    private static final long serialVersionUID = 1L;
}
