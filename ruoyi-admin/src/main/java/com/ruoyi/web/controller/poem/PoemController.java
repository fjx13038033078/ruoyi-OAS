package com.ruoyi.web.controller.poem;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.poem.domain.Poem;
import com.ruoyi.poem.service.PoemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/2 10:15
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/poem/poem")
public class PoemController extends BaseController {
    private final PoemService poemService;

    /**
     * 获取所有古诗词
     * @return 古诗词列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllPoems() {
        startPage();
        List<Poem> allPoems = poemService.getAllPoems();
        return getDataTable(allPoems);
    }

    /**
     * 根据诗词ID获取古诗词详情
     * @param poemId 诗词ID
     * @return 古诗词详情
     */
    @GetMapping("/detail")
    public AjaxResult getPoemById(@RequestParam Long poemId) {
        return success(poemService.getPoemById(poemId));
    }

    /**
     * 添加古诗词
     * @param poem 古诗词对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addPoem(@RequestBody Poem poem) {
        return toAjax(poemService.addPoem(poem));
    }

    /**
     * 更新古诗词
     * @param poem 古诗词对象
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updatePoem(@RequestBody Poem poem) {
        return toAjax(poemService.updatePoem(poem));
    }

    /**
     * 删除古诗词
     * @param poemId 诗词ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deletePoem(@RequestParam Long poemId) {
        return toAjax(poemService.deletePoem(poemId));
    }
}
