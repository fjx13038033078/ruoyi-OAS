package com.ruoyi.property.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.property.domain.Payment;
import com.ruoyi.property.mapper.PaymentMapper;
import com.ruoyi.property.service.PaymentService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/13 9:00
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {

    private final PaymentMapper paymentMapper;

    private final ISysUserService iSysUserService;

    private final ISysRoleService iSysRoleService;

    /**
     * 查询所有缴费记录
     *
     * @return 缴费记录列表
     */
    @Override
    public List<Payment> getAllPayments() {
        Long userId = SecurityUtils.getUserId();
        String role = iSysRoleService.selectStringRoleByUserId(userId);
        if (role.equals("admin")) {
            List<Payment> paymentList = paymentMapper.getAllPayments();
            fillUserName(paymentList);
            return paymentList;
        } else {
            List<Payment> paymentsByUserId = paymentMapper.getPaymentsByUserId(userId);
            fillUserName(paymentsByUserId);
            return paymentsByUserId;
        }
    }

    /**
     * 根据缴费ID查询缴费记录详情
     *
     * @param paymentId 缴费ID
     * @return 缴费记录详情
     */
    @Override
    public Payment getPaymentById(Long paymentId) {
        return paymentMapper.getPaymentById(paymentId);
    }

    /**
     * 根据用户ID查询缴费记录
     *
     * @param userId 用户ID
     * @return 用户的缴费记录列表
     */
    @Override
    public List<Payment> getPaymentsByUserId(Long userId) {
        return paymentMapper.getPaymentsByUserId(userId);
    }

    /**
     * 添加缴费记录
     *
     * @param payment 缴费对象
     * @return 是否添加成功
     */
    @Override
    public boolean addPayment(Payment payment) {
        Long userId = SecurityUtils.getUserId();
        payment.setUserId(userId);

        payment.setStatus(0); // 初始化状态为未支付
        int rows = paymentMapper.addPayment(payment);
        return rows > 0;
    }

    /**
     * 更新缴费记录
     *
     * @param payment 缴费对象
     * @return 是否更新成功
     */
    @Override
    public boolean updatePayment(Payment payment) {
        if (payment.getStatus() == 1){
            payment.setPaymentDate(LocalDateTime.now());
            int rows = paymentMapper.updatePayment(payment);
            return rows > 0;
        } else {
            int rows = paymentMapper.updatePayment(payment);
            return rows > 0;
        }
    }

    /**
     * 删除缴费记录
     *
     * @param paymentId 缴费ID
     * @return 是否删除成功
     */
    @Override
    public boolean deletePayment(Long paymentId) {
        Long userId = SecurityUtils.getUserId();
        Payment payment = paymentMapper.getPaymentById(paymentId);
        if (payment == null) {
            throw new RuntimeException("缴费记录不存在");
        }
        if (!userId.equals(1L) && !userId.equals(payment.getUserId())) {
            throw new RuntimeException("当前用户无权删除此缴费记录");
        }
        int rows = paymentMapper.deletePayment(paymentId);
        return rows > 0;
    }

    // 填充用户名
    private void fillUserName(List<Payment> paymentList) {
        for (Payment payment : paymentList) {
            Long userId = payment.getUserId();
            if (userId != null) {
                String userName = iSysUserService.selectUserById(userId).getNickName();
                payment.setUserName(userName);
            }
        }
    }
}
