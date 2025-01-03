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

/**
 * @Author 范佳兴
 * @date 2024/12/31 11:37
 */
@TableName("ape_poem")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Poem implements Serializable {

    /**
     * 古诗词ID，主键，自增
     */
    @TableId(type = IdType.AUTO)
    private Long poemId;

    /**
     * 发布用户ID，外键
     */
    private Long userId;

    /**
     * 用户姓名
     */
    @TableField(exist = false)
    private String userName;

    /**
     * 诗词标题
     */
    private String poemTitle;

    /**
     * 诗人
     */
    private String poemAuthor;

    /**
     * 诗词内容
     */
    private String poemContent;

    /**
     * 状态（1-审核通过，0-审核中）
     */
    private Integer status;

    /**
     * 诗词背景
     */
    private String poemBackground;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
