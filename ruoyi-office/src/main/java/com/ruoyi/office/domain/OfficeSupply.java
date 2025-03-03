package com.ruoyi.office.domain;

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
 * @date 2025/2/26 17:09
 */
@TableName("oas_office")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class OfficeSupply implements Serializable {

    /**
     * 用品ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long supplyId;

    /**
     * 用品名称
     */
    private String supplyName;

    /**
     * 用品类别(0-文具，1-电子设备，2-日常用品)
     */
    private Integer supplyType;

    /**
     * 库存数量
     */
    private Integer quantity;

    private static final long serialVersionUID = 1L;
}
