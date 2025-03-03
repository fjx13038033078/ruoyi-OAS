package com.ruoyi.web.controller.office;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.office.domain.OfficeSupplyPurchase;
import com.ruoyi.office.service.OfficeSupplyPurchaseService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 9:41
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/office/supply/purchase")
public class OfficeSupplyPurchaseController extends BaseController {

    private final OfficeSupplyPurchaseService officeSupplyPurchaseService;

    @GetMapping("/listAll")
    public TableDataInfo listAllOfficeSupplyPurchases() {
        List<OfficeSupplyPurchase> purchases = officeSupplyPurchaseService.getAllOfficeSupplyPurchases();
        return getDataTable(purchases);
    }

    @GetMapping("/getByUserId")
    public AjaxResult getOfficeSupplyPurchasesByUserId(@RequestParam Long userId) {
        List<OfficeSupplyPurchase> purchases = officeSupplyPurchaseService.getOfficeSupplyPurchasesByUserId(userId);
        return success(purchases);
    }

    @PostMapping("/add")
    public AjaxResult addOfficeSupplyPurchase(@RequestBody OfficeSupplyPurchase officeSupplyPurchase) {
        return toAjax(officeSupplyPurchaseService.addOfficeSupplyPurchase(officeSupplyPurchase));
    }

    @PostMapping("/update")
    public AjaxResult updateOfficeSupplyPurchase(@RequestBody OfficeSupplyPurchase officeSupplyPurchase) {
        return toAjax(officeSupplyPurchaseService.updateOfficeSupplyPurchase(officeSupplyPurchase));
    }

    @PostMapping("/updateStatus")
    public AjaxResult updateOfficeSupplyPurchaseStatus(@RequestBody OfficeSupplyPurchase officeSupplyPurchase) {
        return toAjax(officeSupplyPurchaseService.updateOfficeSupplyPurchaseStatus(officeSupplyPurchase));
    }

    @GetMapping("/delete")
    public AjaxResult deleteOfficeSupplyPurchase(@RequestParam Long purchaseId) {
        return toAjax(officeSupplyPurchaseService.deleteOfficeSupplyPurchase(purchaseId));
    }
}
