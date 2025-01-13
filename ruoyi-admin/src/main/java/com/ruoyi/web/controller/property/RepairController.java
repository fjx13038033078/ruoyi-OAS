package com.ruoyi.web.controller.property;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.property.domain.Repair;
import com.ruoyi.property.service.RepairService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/13 9:40
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/property/repair")
public class RepairController extends BaseController {
    private final RepairService repairService;

    /**
     * 获取所有报修记录
     * @return 报修记录列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllRepairs() {
        List<Repair> allRepairs = repairService.getAllRepairs();
        return getDataTable(allRepairs);
    }

    /**
     * 根据报修ID获取报修详情
     * @param repairId 报修ID
     * @return 报修详情
     */
    @GetMapping("/detail")
    public AjaxResult getRepairById(@RequestParam Long repairId) {
        return success(repairService.getRepairById(repairId));
    }

    /**
     * 根据用户ID查询用户报修记录
     * @param userId 用户ID
     * @return 用户报修记录列表
     */
    @GetMapping("/listByUserId")
    public AjaxResult getRepairsByUserId(@RequestParam Long userId) {
        List<Repair> repairs = repairService.getRepairsByUserId(userId);
        return success(repairs);
    }

    /**
     * 添加报修记录
     * @param repair 报修对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addRepair(@RequestBody Repair repair) {
        return toAjax(repairService.addRepair(repair));
    }

    /**
     * 更新报修记录
     * @param repair 报修对象
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updateRepair(@RequestBody Repair repair) {
        return toAjax(repairService.updateRepair(repair));
    }

    /**
     * 删除报修记录
     * @param repairId 报修ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteRepair(@RequestParam Long repairId) {
        return toAjax(repairService.deleteRepair(repairId));
    }
}
