package com.ruoyi.web.controller.property;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.property.domain.Payment;
import com.ruoyi.property.service.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/1/13 9:42
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/property/payment")
public class PaymentController extends BaseController {
    private final PaymentService paymentService;

    /**
     * 获取所有缴费记录
     * @return 缴费记录列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAllPayments() {
        List<Payment> allPayments = paymentService.getAllPayments();
        return getDataTable(allPayments);
    }

    /**
     * 根据缴费ID获取缴费记录详情
     * @param paymentId 缴费ID
     * @return 缴费记录详情
     */
    @GetMapping("/detail")
    public AjaxResult getPaymentById(@RequestParam Long paymentId) {
        return success(paymentService.getPaymentById(paymentId));
    }

    /**
     * 根据用户ID查询用户的缴费记录
     * @param userId 用户ID
     * @return 用户的缴费记录列表
     */
    @GetMapping("/listByUserId")
    public AjaxResult getPaymentsByUserId(@RequestParam String userId) {
        List<Payment> payments = paymentService.getPaymentsByUserId(userId);
        return success(payments);
    }

    /**
     * 添加缴费记录
     * @param payment 缴费对象
     * @return 操作结果
     */
    @PostMapping("/add")
    public AjaxResult addPayment(@RequestBody Payment payment) {
        return toAjax(paymentService.addPayment(payment));
    }

    /**
     * 更新缴费记录
     * @param payment 缴费对象
     * @return 操作结果
     */
    @PostMapping("/update")
    public AjaxResult updatePayment(@RequestBody Payment payment) {
        return toAjax(paymentService.updatePayment(payment));
    }

    /**
     * 删除缴费记录
     * @param paymentId 缴费ID
     * @return 操作结果
     */
    @GetMapping("/delete")
    public AjaxResult deletePayment(@RequestParam Long paymentId) {
        return toAjax(paymentService.deletePayment(paymentId));
    }
}
