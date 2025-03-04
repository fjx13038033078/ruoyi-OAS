package com.ruoyi.point.domain;


import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/**
 * @Author 范佳兴
 * @date 2025/3/4 9:17
 */
@TableName("oas_point")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class OasPoint implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long pointId;

    private String pointName;

    private String userName;

    private Long pointNext;

    private Long pointBack;

    private static final long serialVersionUID = 1L;
}
