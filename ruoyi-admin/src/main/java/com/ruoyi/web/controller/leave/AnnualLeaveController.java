package com.ruoyi.web.controller.leave;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.leave.domain.AnnualLeave;
import com.ruoyi.leave.service.AnnualLeaveService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:33
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/leave/annual")
public class AnnualLeaveController extends BaseController {

    private final AnnualLeaveService annualLeaveService;

    /**
     * 获取所有年假记录
     * @return 年假记录列表
     */
    @GetMapping("/listAll")
    public AjaxResult listAllAnnualLeaves() {
        List<AnnualLeave> annualLeaves = annualLeaveService.getAllAnnualLeaves();
        return success(annualLeaves);
    }

    /**
     * 根据用户ID获取年假记录
     * @param userId 用户ID
     * @return 年假记录
     */
    @GetMapping("/getByUserId")
    public AjaxResult getAnnualLeaveByUserId(@RequestParam Long userId) {
        AnnualLeave annualLeave = annualLeaveService.getAnnualLeaveByUserId(userId);
        return success(annualLeave);
    }

    /**
     * 添加年假记录
     * @param annualLeave 年假记录
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addAnnualLeave(@RequestBody AnnualLeave annualLeave) {
        return toAjax(annualLeaveService.addAnnualLeave(annualLeave));
    }

    /**
     * 更新年假记录
     * @param annualLeave 年假记录
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updateAnnualLeave(@RequestBody AnnualLeave annualLeave) {
        return toAjax(annualLeaveService.updateAnnualLeave(annualLeave));
    }

    /**
     * 删除年假记录
     * @param leaveId 年假ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteAnnualLeave(@RequestParam Long leaveId) {
        return toAjax(annualLeaveService.deleteAnnualLeave(leaveId));
    }
}
