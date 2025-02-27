package com.ruoyi.web.controller.vehicle;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.vehicle.domain.OasVehicleApplication;
import com.ruoyi.vehicle.service.OasVehicleApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/2/27 14:25
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/oas/vehicle/application")
public class OasVehicleApplicationController extends BaseController {

    private final OasVehicleApplicationService oasVehicleApplicationService;

    /**
     * 获取所有用车申请记录
     * @return 用车申请列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllVehicleApplications() {
        startPage();
        List<OasVehicleApplication> allVehicleApplications = oasVehicleApplicationService.getAllVehicleApplications();
        return getDataTable(allVehicleApplications);
    }

    /**
     * 根据用户ID查询用车申请记录
     * @param userId 用户ID
     * @return 用车申请记录列表
     */
    @GetMapping("/listByUserId")
    public AjaxResult listVehicleApplicationsByUserId(@RequestParam Long userId) {
        List<OasVehicleApplication> applications = oasVehicleApplicationService.getVehicleApplicationsByUserId(userId);
        return success(applications);
    }

    /**
     * 新增用车申请记录
     * @param application 用车申请对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addVehicleApplication(@RequestBody OasVehicleApplication application) {
        return toAjax(oasVehicleApplicationService.addVehicleApplication(application));
    }

    /**
     * 修改用车申请记录
     * @param application 用车申请对象
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updateVehicleApplication(@RequestBody OasVehicleApplication application) {
        return toAjax(oasVehicleApplicationService.updateVehicleApplication(application));
    }

    /**
     * 删除用车申请记录
     * @param applicationId 用车申请ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deleteVehicleApplication(@RequestParam Long applicationId) {
        return toAjax(oasVehicleApplicationService.deleteVehicleApplication(applicationId));
    }
}
