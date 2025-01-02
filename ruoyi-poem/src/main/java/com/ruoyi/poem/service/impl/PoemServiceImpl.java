package com.ruoyi.poem.service.impl;

import com.ruoyi.poem.domain.Poem;
import com.ruoyi.poem.mapper.PoemMapper;
import com.ruoyi.poem.service.PoemService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2024/12/31 16:41
 */
@Service
@RequiredArgsConstructor
public class PoemServiceImpl implements PoemService {
    private final PoemMapper poemMapper;

    /**
     * 获取所有古诗词
     *
     * @return 古诗词列表
     */
    @Override
    public List<Poem> getAllPoems() {
        return poemMapper.getAllPoems();
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
}
