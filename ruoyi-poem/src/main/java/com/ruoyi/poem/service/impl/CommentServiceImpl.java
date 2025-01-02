package com.ruoyi.poem.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.poem.domain.Comment;
import com.ruoyi.poem.mapper.CommentMapper;
import com.ruoyi.poem.service.CommentService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author 范佳兴
 * @date 2024/12/31 16:22
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {

    private final CommentMapper commentMapper;
    private final ISysUserService sysUserService;

    /**
     * 根据古诗词ID获取评论列表
     *
     * @param poemId 古诗词ID
     * @return 评论列表
     */
    @Override
    public List<Comment> listCommentsByPoemId(Long poemId) {
        List<Comment> comments = commentMapper.listCommentsByPoemId(poemId);
        for (Comment comment : comments) {
            Long userId = comment.getUserId();
            String nickName = sysUserService.selectUserById(userId).getNickName();
            comment.setUserName(nickName);
        }
        return comments;
    }

    /**
     * 根据评论ID获取评论信息
     *
     * @param commentId 评论ID
     * @return 评论信息
     */
    @Override
    public Comment getCommentById(Long commentId) {
        return commentMapper.getCommentById(commentId);
    }

    /**
     * 添加评论
     *
     * @param comment 评论信息
     * @return 是否添加成功
     */
    @Override
    public boolean addComment(Comment comment) {
        Long userId = SecurityUtils.getUserId();
        comment.setUserId(userId);
        comment.setCreateTime(LocalDateTime.now());
        int rows = commentMapper.addComment(comment);
        return rows > 0;
    }

    /**
     * 删除评论
     *
     * @param commentId 评论ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteComment(Long commentId) {
        Long userId = SecurityUtils.getUserId();
        Comment comment = commentMapper.getCommentById(commentId);
        if (comment != null && userId.equals(comment.getUserId())) {
            int rows = commentMapper.deleteComment(commentId);
            return rows > 0;
        } else {
            throw new RuntimeException("仅可以删除自己的评论");
        }
    }
}