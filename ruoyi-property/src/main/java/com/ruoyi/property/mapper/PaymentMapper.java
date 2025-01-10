package com.ruoyi.property.mapper;

import com.ruoyi.property.domain.Payment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/10 17:18
 */
@Mapper
public interface PaymentMapper {
    /**
     * 获取所有缴费记录
     *
     * @return 缴费记录列表
     */
    List<Payment> getAllPayments();

    /**
     * 根据缴费ID获取缴费记录详情
     *
     * @param paymentId 缴费ID
     * @return 缴费记录详情
     */
    Payment getPaymentById(Long paymentId);

    /**
     * 根据用户ID获取缴费记录
     *
     * @param userId 用户ID
     * @return 用户的缴费记录
     */
    List<Payment> getPaymentsByUserId(String userId);

    /**
     * 添加缴费记录
     *
     * @param payment 缴费记录
     * @return 影响行数
     */
    int addPayment(Payment payment);

    /**
     * 更新缴费记录
     *
     * @param payment 缴费记录
     * @return 影响行数
     */
    int updatePayment(Payment payment);

    /**
     * 删除缴费记录
     *
     * @param paymentId 缴费记录ID
     * @return 影响行数
     */
    int deletePayment(Long paymentId);
}
