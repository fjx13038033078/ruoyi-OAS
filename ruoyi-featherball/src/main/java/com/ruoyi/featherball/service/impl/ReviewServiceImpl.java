package com.ruoyi.featherball.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.featherball.domain.Review;
import com.ruoyi.featherball.mapper.ReviewMapper;
import com.ruoyi.featherball.service.ReviewService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 场地评价 Service 实现类
 *
 * @Author fanjaixing
 * @Date 2024/2/29 22:55
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;

    private final ISysUserService sysUserService;

    /**
     * 获取某场地的评价列表
     *
     * @param venueId 场地ID
     * @return 评价列表
     */
    @Override
    public List<Review> listReviewsByVenueId(Long venueId) {
        List<Review> reviews = reviewMapper.listReviewsByVenueId(venueId);
        for (Review review : reviews) {
            Long userId = review.getUserId();
            String nickName = sysUserService.selectUserById(userId).getNickName();
            review.setUserName(nickName);
        }
        return reviews;
    }

    /**
     * 根据评价ID获取评价信息
     *
     * @param reviewId 评价ID
     * @return 评价信息
     */
    @Override
    public Review getReviewById(Long reviewId) {
        return reviewMapper.getReviewById(reviewId);
    }

    /**
     * 添加评价
     *
     * @param review 评价信息
     * @return 是否添加成功
     */
    @Override
    public boolean addReview(Review review) {
        //获取当前登录用户ID
        Long userId = SecurityUtils.getUserId();
        review.setUserId(userId);
        // 设置评价时间为当前时间
        review.setReviewTime(LocalDateTime.now());
        int rows = reviewMapper.addReview(review);
        return rows > 0;
    }

    /**
     * 删除评价
     *
     * @param reviewId 评价ID
     * @return 是否删除成功
     */
    @Override
    public boolean deleteReview(Long reviewId) {
        Long userId = SecurityUtils.getUserId(); // 获取当前登录用户的ID
        // 根据评价ID查询评价信息
        Review review = reviewMapper.getReviewById(reviewId);
        if (userId != 1 || userId != review.getUserId()) { // 检查当前用户是否是评价的作者
            int rows = reviewMapper.deleteReview(reviewId); // 执行删除操作
            return rows > 0;
        } else {
            // 当前用户不是评价的作者，不能删除评价
            throw new RuntimeException("仅可以删除自己的评价");
        }
    }
}

