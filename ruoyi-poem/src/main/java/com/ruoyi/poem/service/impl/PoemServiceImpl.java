package com.ruoyi.poem.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.poem.domain.Poem;
import com.ruoyi.poem.mapper.PoemMapper;
import com.ruoyi.poem.service.PoemService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static com.ruoyi.common.utils.PageUtils.startPage;

/**
 * @Author 范佳兴
 * @date 2024/12/31 16:41
 */
@Service
@RequiredArgsConstructor
public class PoemServiceImpl implements PoemService {

    private final PoemMapper poemMapper;

    private final ISysUserService iSysUserService;

    private final ISysRoleService iSysRoleService;

    /**
     * 获取所有古诗词
     *
     * @return 古诗词列表
     */
    @Override
    public List<Poem> getAllPoems() {
        Long userId = SecurityUtils.getUserId();
        String role = iSysRoleService.selectStringRoleByUserId(userId);
        if (role.equals("admin")) {
            startPage();
            List<Poem> allPoems = poemMapper.getAllPoems();
            fillUserName(allPoems);
            return allPoems;
        } else {
            startPage();
            List<Poem> PoemsWithCheck = poemMapper.getAllPoems().stream()
                    .filter(poem -> poem.getStatus() == 1 || poem.getUserId().equals(userId))
                    .collect(Collectors.toList());
            return PoemsWithCheck;
        }
    }

    /**
     * 根据诗词ID获取古诗词详情
     *
     * @param poemId 诗词ID
     * @return 诗词详情
     */
    @Override
    public Poem getPoemById(Long poemId) {
        return poemMapper.getPoemById(poemId);
    }

    /**
     * 添加古诗词
     *
     * @param poem 古诗词信息
     * @return 是否添加成功
     */
    @Override
    @Transactional
    public boolean addPoem(Poem poem) {
        //获取当前登录用户ID
        Long userId = SecurityUtils.getUserId();
        poem.setUserId(userId);
        poem.setStatus(0);
        int rows = poemMapper.addPoem(poem);
        return rows > 0;
    }

    /**
     * 更新古诗词
     *
     * @param poem 古诗词信息
     * @return 是否更新成功
     */
    @Override
    @Transactional
    public boolean updatePoem(Poem poem) {
        int rows = poemMapper.updatePoem(poem);
        return rows > 0;
    }

    /**
     * 删除古诗词
     *
     * @param poemId 诗词ID
     * @return 是否删除成功
     */
    @Override
    @Transactional
    public boolean deletePoem(Long poemId) {
        int rows = poemMapper.deletePoem(poemId);
        return rows > 0;
    }

    //填充用户姓名
    private void fillUserName(List<Poem> poems) {
        for (Poem poem : poems) {
            Long userId = poem.getUserId();
            String userName = iSysUserService.selectUserById(userId).getNickName();
            poem.setUserName(userName);
        }
    }
}
