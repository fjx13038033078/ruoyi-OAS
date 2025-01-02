package com.ruoyi.poem.mapper;

import com.ruoyi.poem.domain.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2024/12/31 15:56
 */
@Mapper
public interface CommentMapper {

    /**
     * 根据古诗词ID获取评论列表
     *
     * @param poemId 古诗词ID
     * @return 评论列表
     */
    List<Comment> listCommentsByPoemId(Long poemId);

    /**
     * 根据评论ID获取评论信息
     *
     * @param commentId 评论ID
     * @return 评论信息
     */
    Comment getCommentById(Long commentId);

    /**
     * 添加评论
     *
     * @param comment 待添加的评论信息
     * @return 添加成功返回影响的行数，否则返回 0
     */
    int addComment(Comment comment);

    /**
     * 删除评论
     *
     * @param commentId 待删除的评论ID
     * @return 删除成功返回影响的行数，否则返回 0
     */
    int deleteComment(Long commentId);
}
