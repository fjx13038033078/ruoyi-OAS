package com.ruoyi.web.controller.property;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.property.domain.Feedback;
import com.ruoyi.property.service.FeedbackService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/13 9:44
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/property/feedback")
public class FeedbackController extends BaseController {
    private final FeedbackService feedbackService;

    /**
     * 获取所有反馈记录
     * @return 反馈记录列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllFeedbacks() {
        List<Feedback> allFeedbacks = feedbackService.getAllFeedbacks();
        return getDataTable(allFeedbacks);
    }

    /**
     * 根据反馈ID获取反馈记录详情
     * @param feedbackId 反馈ID
     * @return 反馈记录详情
     */
    @GetMapping("/detail")
    public AjaxResult getFeedbackById(@RequestParam Long feedbackId) {
        return success(feedbackService.getFeedbackById(feedbackId));
    }

    /**
     * 根据用户ID查询用户的反馈记录
     * @param userId 用户ID
     * @return 用户的反馈记录列表
     */
    @GetMapping("/listByUserId")
    public AjaxResult getFeedbacksByUserId(@RequestParam String userId) {
        List<Feedback> feedbacks = feedbackService.getFeedbacksByUserId(userId);
        return success(feedbacks);
    }

    /**
     * 添加反馈记录
     * @param feedback 反馈对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addFeedback(@RequestBody Feedback feedback) {
        return toAjax(feedbackService.addFeedback(feedback));
    }

    /**
     * 删除反馈记录
     * @param feedbackId 反馈ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteFeedback(@RequestParam Long feedbackId) {
        return toAjax(feedbackService.deleteFeedback(feedbackId));
    }
}
