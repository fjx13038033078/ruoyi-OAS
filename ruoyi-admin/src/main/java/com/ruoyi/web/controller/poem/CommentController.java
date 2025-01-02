package com.ruoyi.web.controller.poem;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.poem.domain.Comment;
import com.ruoyi.poem.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/2 10:23
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/poem/comment")
public class CommentController extends BaseController {
    private final CommentService commentService;

    /**
     * 根据古诗词ID获取评论列表
     *
     * @param poemId 古诗词ID
     * @return 评论列表
     */
    @GetMapping("/listByPoemId")
    public TableDataInfo listCommentsByPoemId(@RequestParam Long poemId) {
        startPage();
        List<Comment> comments = commentService.listCommentsByPoemId(poemId);
        return getDataTable(comments);
    }

    /**
     * 根据评论ID获取评论详情
     *
     * @param commentId 评论ID
     * @return 评论详情
     */
    @GetMapping("/get")
    public AjaxResult getCommentById(@RequestParam Long commentId) {
        return success(commentService.getCommentById(commentId));
    }

    /**
     * 添加评论
     *
     * @param comment 评论对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addComment(@RequestBody Comment comment) {
        return toAjax(commentService.addComment(comment));
    }

    /**
     * 删除评论
     *
     * @param commentId 评论ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteComment(@RequestParam Long commentId) {
        return toAjax(commentService.deleteComment(commentId));
    }
}
