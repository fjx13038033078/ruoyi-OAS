package com.ruoyi.web.controller.leave;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.leave.domain.LeaveApplication;
import com.ruoyi.leave.service.LeaveApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:26
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/leave/application")
public class LeaveApplicationController extends BaseController {

    private final LeaveApplicationService leaveApplicationService;

    /**
     * 获取所有请假申请记录
     * @return 请假申请记录列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllLeaveApplications() {
        List<LeaveApplication> leaveApplications = leaveApplicationService.getAllLeaveApplications();
        return getDataTable(leaveApplications);
    }

    /**
     * 根据用户ID获取用户的请假记录
     * @param userId 用户ID
     * @return 请假记录列表
     */
    @GetMapping("/listByUserId")
    public AjaxResult getLeaveApplicationsByUserId(@RequestParam Long userId) {
        List<LeaveApplication> leaveApplications = leaveApplicationService.getLeaveApplicationsByUserId(userId);
        return success(leaveApplications);
    }

    /**
     * 添加请假申请记录
     * @param leaveApplication 请假申请记录
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addLeaveApplication(@RequestBody LeaveApplication leaveApplication) {
        return toAjax(leaveApplicationService.addLeaveApplication(leaveApplication));
    }

    /**
     * 更新请假申请记录
     * @param leaveApplication 请假申请记录
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updateLeaveApplication(@RequestBody LeaveApplication leaveApplication) {
        return toAjax(leaveApplicationService.updateLeaveApplication(leaveApplication));
    }

    /**
     * 删除请假申请记录
     * @param leaveId 请假申请ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteLeaveApplication(@RequestParam Long leaveId) {
        return toAjax(leaveApplicationService.deleteLeaveApplication(leaveId));
    }
}
