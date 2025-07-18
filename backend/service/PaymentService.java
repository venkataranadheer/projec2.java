// backend/service/PaymentService.javapackage backend.service;

import backend.model.Payment;
import backend.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    // Create a new payment
    public Payment createPayment(Payment payment) {
        return paymentRepository.save(payment);
    }

    // Get all payments
    public List<Payment> getAllPayments() {
        return paymentRepository.findAll();
    }

    // Get a payment by ID
    public Optional<Payment> getPaymentById(Long id) {
        return paymentRepository.findById(id);
    }

    // Update a payment
    public Payment updatePayment(Long id, Payment updatedPayment) {
        return paymentRepository.findById(id).map(payment -> {
            payment.setOrderId(updatedPayment.getOrderId());
            payment.setPaymentMethod(updatedPayment.getPaymentMethod());
            payment.setAmount(updatedPayment.getAmount());
            payment.setStatus(updatedPayment.getStatus());
            payment.setPaymentDate(updatedPayment.getPaymentDate());
            return paymentRepository.save(payment);
        }).orElse(null);
    }

    // Delete a payment
    public void deletePayment(Long id) {
        paymentRepository.deleteById(id);
    }
}

