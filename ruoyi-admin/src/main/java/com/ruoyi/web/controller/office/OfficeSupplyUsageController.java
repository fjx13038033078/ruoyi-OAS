package com.ruoyi.web.controller.office;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.office.domain.OfficeSupplyUsage;
import com.ruoyi.office.service.OfficeSupplyUsageService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:42
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/office/supply/usage")
public class OfficeSupplyUsageController extends BaseController {

    private final OfficeSupplyUsageService officeSupplyUsageService;

    @GetMapping("/listAll")
    public AjaxResult listAllOfficeSupplyUsages() {
        List<OfficeSupplyUsage> usages = officeSupplyUsageService.getAllOfficeSupplyUsages();
        return success(usages);
    }

    @GetMapping("/getByUserId")
    public AjaxResult getOfficeSupplyUsagesByUserId(@RequestParam Long userId) {
        List<OfficeSupplyUsage> usages = officeSupplyUsageService.getOfficeSupplyUsagesByUserId(userId);
        return success(usages);
    }

    @PostMapping("/add")
    public AjaxResult addOfficeSupplyUsage(@RequestBody OfficeSupplyUsage officeSupplyUsage) {
        return toAjax(officeSupplyUsageService.addOfficeSupplyUsage(officeSupplyUsage));
    }

    @PostMapping("/update")
    public AjaxResult updateOfficeSupplyUsage(@RequestBody OfficeSupplyUsage officeSupplyUsage) {
        return toAjax(officeSupplyUsageService.updateOfficeSupplyUsage(officeSupplyUsage));
    }

    @GetMapping("/delete")
    public AjaxResult deleteOfficeSupplyUsage(@RequestParam Long usageId) {
        return toAjax(officeSupplyUsageService.deleteOfficeSupplyUsage(usageId));
    }
}
