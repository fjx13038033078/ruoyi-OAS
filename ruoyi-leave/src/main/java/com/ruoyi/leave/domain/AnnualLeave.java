package com.ruoyi.leave.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * @Author 范佳兴
 * @date 2025/2/26 17:07
 */
@TableName("oas_annual_leave")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class AnnualLeave implements Serializable {

    /**
     * 年假记录ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long leaveId;

    /**
     * 用户ID，外键关联用户表
     */
    private Long userId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 总年假天数
     */
    private Integer totalLeaveDays;

    /**
     * 已使用年假天数
     */
    private Integer usedLeaveDays;

    /**
     * 剩余年假天数
     */
    private Integer remainingLeaveDays;

    private static final long serialVersionUID = 1L;
}
