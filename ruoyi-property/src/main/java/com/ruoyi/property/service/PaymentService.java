package com.ruoyi.property.service;

import com.ruoyi.property.domain.Payment;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/13 8:49
 */
public interface PaymentService {
    /**
     * 查询所有缴费记录
     *
     * @return 缴费记录列表
     */
    List<Payment> getAllPayments();

    /**
     * 根据缴费ID查询缴费记录详情
     *
     * @param paymentId 缴费ID
     * @return 缴费记录详情
     */
    Payment getPaymentById(Long paymentId);

    /**
     * 根据用户ID查询缴费记录
     *
     * @param userId 用户ID
     * @return 用户的缴费记录列表
     */
    List<Payment> getPaymentsByUserId(Long userId);

    /**
     * 添加缴费记录
     *
     * @param payment 缴费对象
     * @return 是否添加成功
     */
    boolean addPayment(Payment payment);

    /**
     * 更新缴费记录
     *
     * @param payment 缴费对象
     * @return 是否更新成功
     */
    boolean updatePayment(Payment payment);

    /**
     * 删除缴费记录
     *
     * @param paymentId 缴费ID
     * @return 是否删除成功
     */
    boolean deletePayment(Long paymentId);
}
