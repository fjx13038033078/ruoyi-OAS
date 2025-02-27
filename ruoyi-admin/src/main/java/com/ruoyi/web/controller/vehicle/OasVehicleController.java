package com.ruoyi.web.controller.vehicle;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.vehicle.domain.OasVehicle;
import com.ruoyi.vehicle.service.OasVehicleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:23
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/oas/vehicle")
public class OasVehicleController extends BaseController {

    private final OasVehicleService vehicleService;

    /**
     * 获取所有车辆信息
     * @return 车辆列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllVehicles() {
        startPage();
        List<OasVehicle> allVehicles = vehicleService.getAllVehicles();
        return getDataTable(allVehicles);
    }

    /**
     * 根据车辆ID获取车辆信息
     * @param vehicleId 车辆ID
     * @return 车辆信息
     */
    @GetMapping("/detail")
    public AjaxResult getVehicleById(@RequestParam Long vehicleId) {
        return success(vehicleService.getVehicleById(vehicleId));
    }

    /**
     * 添加车辆信息
     * @param vehicle 车辆对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addVehicle(@RequestBody OasVehicle vehicle) {
        return toAjax(vehicleService.addVehicle(vehicle));
    }

    /**
     * 更新车辆信息
     * @param vehicle 车辆对象
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updateVehicle(@RequestBody OasVehicle vehicle) {
        return toAjax(vehicleService.updateVehicle(vehicle));
    }

    /**
     * 删除车辆信息
     * @param vehicleId 车辆ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteVehicle(@RequestParam Long vehicleId) {
        return toAjax(vehicleService.deleteVehicle(vehicleId));
    }
}
