package com.ruoyi.poem.service;

import com.ruoyi.poem.domain.Poem;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2024/12/31 16:38
 */
public interface PoemService {

    /**
     * 查询所有古诗词
     *
     * @return 古诗词列表
     */
    List<Poem> getAllPoems();

    /**
     * 根据诗词ID查询古诗词
     *
     * @param poemId 诗词ID
     * @return 诗词详情
     */
    Poem getPoemById(Long poemId);

    /**
     * 添加古诗词
     *
     * @param poem 古诗词对象
     * @return 是否添加成功
     */
    boolean addPoem(Poem poem);

    /**
     * 更新古诗词
     *
     * @param poem 古诗词对象
     * @return 是否更新成功
     */
    boolean updatePoem(Poem poem);

    /**
     * 删除古诗词
     *
     * @param poemId 诗词ID
     * @return 是否删除成功
     */
    boolean deletePoem(Long poemId);
}
