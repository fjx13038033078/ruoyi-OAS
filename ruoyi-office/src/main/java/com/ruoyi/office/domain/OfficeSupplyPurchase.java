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
@TableName("oas_office_purchase")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class OfficeSupplyPurchase implements Serializable {

    /**
     * 申购ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long purchaseId;

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
     * 办公用品ID，外键关联办公用品台账
     */
    private Long supplyId;

    /**
     * 办公用品名称
    */
    @TableField(exist = false)
    private String supplyName;

    /**
     * 申购数量
     */
    private Integer quantity;

    /**
     * 申购理由
     */
    private String purchaseReason;

    /**
     * 审批状态（0-待审批、1-已批准、2-已拒绝）
     */
    private int status;

    /**
     * 审批人ID
     */
    private Long approvalUser;

    /**
     * 审批人姓名
     */
    @TableField(exist = false)
    private String approvalUserName;

    /**
     * 创建时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime;

    private static final long serialVersionUID = 1L;
}
