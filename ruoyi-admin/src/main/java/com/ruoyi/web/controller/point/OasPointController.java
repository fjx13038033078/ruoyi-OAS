package com.ruoyi.web.controller.point;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.point.domain.OasPoint;
import com.ruoyi.point.service.OasPointService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/3/4 9:24
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/oas/point")
public class OasPointController extends BaseController {
    private final OasPointService oasPointService;

    /**
     * 获取所有点位信息（支持分页）
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllPoints() {
        startPage();
        List<OasPoint> points = oasPointService.getAllPoints();
        return getDataTable(points);
    }

    /**
     * 根据ID获取点位信息
     */
    @GetMapping("/detail")
    public AjaxResult getPointById(@RequestParam Long pointId) {
        return success(oasPointService.getPointById(pointId));
    }

    /**
     * 新增点位
     */
    @PostMapping("/add")
    public AjaxResult addPoint(@RequestBody OasPoint point) {
        return toAjax(oasPointService.addPoint(point));
    }

    /**
     * 更新点位信息
     */
    @PostMapping("/update")
    public AjaxResult updatePoint(@RequestBody OasPoint point) {
        return toAjax(oasPointService.updatePoint(point));
    }

    /**
     * 删除点位
     */
    @GetMapping("/delete")
    public AjaxResult deletePoint(@RequestParam Long pointId) {
        return toAjax(oasPointService.deletePoint(pointId));
    }
}
