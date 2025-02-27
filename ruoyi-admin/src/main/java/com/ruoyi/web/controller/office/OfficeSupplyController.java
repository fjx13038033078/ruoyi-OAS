package com.ruoyi.web.controller.office;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.office.domain.OfficeSupply;
import com.ruoyi.office.service.OfficeSupplyService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * @Author 范佳兴
 * @date 2025/2/27 9:15
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/office/supply")
public class OfficeSupplyController extends BaseController {

    private final OfficeSupplyService officeSupplyService;

    /**
     * 获取所有办公用品记录
     * @return 办公用品记录列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllOfficeSupplies() {
        List<OfficeSupply> officeSupplies = officeSupplyService.getAllOfficeSupplies();
        return getDataTable(officeSupplies);
    }

    /**
     * 根据办公用品ID获取办公用品详情
     * @param supplyId 办公用品ID
     * @return 办公用品详情
     */
    @GetMapping("/detail")
    public AjaxResult getOfficeSupplyById(@RequestParam Long supplyId) {
        return success(officeSupplyService.getOfficeSupplyById(supplyId));
    }

    /**
     * 添加办公用品记录
     * @param officeSupply 办公用品记录
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addOfficeSupply(@RequestBody OfficeSupply officeSupply) {
        return toAjax(officeSupplyService.addOfficeSupply(officeSupply));
    }

    /**
     * 更新办公用品记录
     * @param officeSupply 办公用品记录
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updateOfficeSupply(@RequestBody OfficeSupply officeSupply) {
        return toAjax(officeSupplyService.updateOfficeSupply(officeSupply));
    }

    /**
     * 删除办公用品记录
     * @param supplyId 办公用品ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteOfficeSupply(@RequestParam Long supplyId) {
        return toAjax(officeSupplyService.deleteOfficeSupply(supplyId));
    }
}
