package com.ruoyi.web.controller.poem;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.poem.domain.Activity;
import com.ruoyi.poem.service.ActivityService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/2 10:48
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/poem/activity")
public class ActivityController extends BaseController {
    private final ActivityService activityService;

    /**
     * 获取所有活动列表
     *
     * @return 活动列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllActivities() {
        startPage();
        List<Activity> activities = activityService.getAllActivities();
        return getDataTable(activities);
    }

    /**
     * 根据活动ID获取活动详情
     *
     * @param activityId 活动ID
     * @return 活动详情
     */
    @GetMapping("/get")
    public AjaxResult getActivityById(@RequestParam Long activityId) {
        return success(activityService.getActivityById(activityId));
    }

    /**
     * 添加活动
     *
     * @param activity 活动对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addActivity(@RequestBody Activity activity) {
        return toAjax(activityService.addActivity(activity));
    }

    /**
     * 更新活动信息
     *
     * @param activity 活动对象
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updateActivity(@RequestBody Activity activity) {
        return toAjax(activityService.updateActivity(activity));
    }

    /**
     * 删除活动
     *
     * @param activityId 活动ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteActivity(@RequestParam Long activityId) {
        return toAjax(activityService.deleteActivity(activityId));
    }
}
