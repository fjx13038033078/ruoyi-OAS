package com.ruoyi.web.controller.vehicle;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.vehicle.domain.OasVehicleReturn;
import com.ruoyi.vehicle.service.OasVehicleReturnService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:32
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/oas/vehicle/return")
public class OasVehicleReturnController extends BaseController {

    private final OasVehicleReturnService oasVehicleReturnService;

    /**
     * 获取所有车辆归还记录
     * @return 车辆归还记录列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllVehicleReturns() {
        startPage();
        List<OasVehicleReturn> allVehicleReturns = oasVehicleReturnService.getAllVehicleReturns();
        return getDataTable(allVehicleReturns);
    }

    /**
     * 根据用车申请ID获取车辆归还记录
     * @param applicationId 用车申请ID
     * @return 车辆归还记录
     */
    @GetMapping("/detail")
    public AjaxResult getVehicleReturnByApplicationId(@RequestParam Long applicationId) {
        return success(oasVehicleReturnService.getVehicleReturnByApplicationId(applicationId));
    }

    /**
     * 新增车辆归还记录
     * @param vehicleReturn 车辆归还对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addVehicleReturn(@RequestBody OasVehicleReturn vehicleReturn) {
        return toAjax(oasVehicleReturnService.addVehicleReturn(vehicleReturn));
    }

    /**
     * 更新车辆归还记录
     * @param vehicleReturn 车辆归还对象
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updateVehicleReturn(@RequestBody OasVehicleReturn vehicleReturn) {
        return toAjax(oasVehicleReturnService.updateVehicleReturn(vehicleReturn));
    }

    /**
     * 删除车辆归还记录
     * @param returnId 车辆归还记录ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteVehicleReturn(@RequestParam Long returnId) {
        return toAjax(oasVehicleReturnService.deleteVehicleReturn(returnId));
    }
}
