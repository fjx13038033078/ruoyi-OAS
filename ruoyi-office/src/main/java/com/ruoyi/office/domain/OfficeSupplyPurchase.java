package com.ruoyi.office.domain;

import com.baomidou.mybatisplus.annotation.IdType;
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
     * 办公用品ID，外键关联办公用品台账
     */
    private Long supplyId;

    /**
     * 申购数量
     */
    private Integer quantity;

    /**
     * 申购理由
     */
    private String purchaseReason;

    /**
     * 审批状态（待审批、已批准、已拒绝等）
     */
    private String status;

    /**
     * 审批人ID
     */
    private Long approvalUser;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    private static final long serialVersionUID = 1L;
}
