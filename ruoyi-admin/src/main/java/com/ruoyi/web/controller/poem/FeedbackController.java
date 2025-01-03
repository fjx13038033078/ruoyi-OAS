package com.ruoyi.web.controller.poem;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.poem.domain.Feedback;
import com.ruoyi.poem.service.FeedbackService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/2 10:21
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("poem/feedback")
public class FeedbackController extends BaseController {
    private final FeedbackService feedbackService;

    /**
     * 获取所有反馈
     * @return 反馈列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllFeedback() {
        startPage();
        List<Feedback> allFeedback = feedbackService.getAllFeedback();
        return getDataTable(allFeedback);
    }

    /**
     * 根据反馈ID获取反馈详情
     * @param feedbackId 反馈ID
     * @return 反馈详情
     */
    @GetMapping("/detail")
    public AjaxResult getFeedbackById(@RequestParam Long feedbackId) {
        return success(feedbackService.getFeedbackById(feedbackId));
    }

    /**
     * 添加反馈
     * @param feedback 反馈对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addFeedback(@RequestBody Feedback feedback) {
        return toAjax(feedbackService.addFeedback(feedback));
    }

    /**
     * 回复反馈
     * @param feedback 反馈对象
     * @return 操作结果
     */
    @PostMapping("/reply")
    public AjaxResult replyFeedback(@RequestBody Feedback feedback) {
        return toAjax(feedbackService.replyFeedback(feedback));
    }

    /**
     * 删除反馈
     * @param feedbackId 反馈ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteFeedback(@RequestParam Long feedbackId) {
        return toAjax(feedbackService.deleteFeedback(feedbackId));
    }
}
