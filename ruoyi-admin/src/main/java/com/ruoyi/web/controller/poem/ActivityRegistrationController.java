package com.ruoyi.web.controller.poem;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.poem.domain.ActivityRegistration;
import com.ruoyi.poem.service.ActivityRegistrationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/2 10:51
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/poem/activityRegistration")
public class ActivityRegistrationController extends BaseController {
    private final ActivityRegistrationService registrationService;

    /**
     * 获取所有活动报名信息
     *
     * @return 报名信息列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllRegistrations() {
        List<ActivityRegistration> registrations = registrationService.getAllActivityRegistrations();
        return getDataTable(registrations);
    }

    /**
     * 根据报名ID获取活动报名信息
     *
     * @param registrationId 报名ID
     * @return 报名详情
     */
    @GetMapping("/get")
    public AjaxResult getRegistrationById(@RequestParam Long registrationId) {
        return success(registrationService.getActivityRegistrationById(registrationId));
    }

    /**
     * 添加活动报名信息
     *
     * @param registration 报名对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addRegistration(@RequestBody ActivityRegistration registration) {
        return toAjax(registrationService.addActivityRegistration(registration));
    }

    /**
     * 更新活动报名信息
     *
     * @param registration 报名对象
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updateRegistration(@RequestBody ActivityRegistration registration) {
        return toAjax(registrationService.updateActivityRegistration(registration));
    }

    /**
     * 删除活动报名信息
     *
     * @param registrationId 报名ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteRegistration(@RequestParam Long registrationId) {
        return toAjax(registrationService.deleteActivityRegistration(registrationId));
    }

    /**
     * 根据活动ID获取报名列表
     *
     * @param activityId 活动ID
     * @return 报名信息列表
     */
    @GetMapping("/listByActivityId")
    public TableDataInfo listByActivityId(@RequestParam Long activityId) {
        List<ActivityRegistration> registrations = registrationService.getActivityRegistrationsByActivityId(activityId);
        return getDataTable(registrations);
    }

    /**
     * 根据用户ID获取报名列表
     *
     * @param userId 用户ID
     * @return 报名信息列表
     */
    @GetMapping("/listByUserId")
    public TableDataInfo listByUserId(@RequestParam Long userId) {
        List<ActivityRegistration> registrations = registrationService.getActivityRegistrationsByUserId(userId);
        return getDataTable(registrations);
    }
}
