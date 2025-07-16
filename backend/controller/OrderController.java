// backend/controller/OrderController.java
package backend.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private Map<Integer, Map<String, Object>> orders = new HashMap<>();
    private int orderIdCounter = 1;

    // Create new order
    @PostMapping("/create")
    public ResponseEntity<Map<String, Object>> createOrder(@RequestBody Map<String, Object> orderData) {
        int orderId = orderIdCounter++;
        orderData.put("orderId", orderId);
        orders.put(orderId, orderData);
        return ResponseEntity.ok(orderData);
    }

    // Get order by ID
    @GetMapping("/{orderId}")
    public ResponseEntity<Object> getOrder(@PathVariable int orderId) {
        Map<String, Object> order = orders.get(orderId);
        if (order != null) {
            return ResponseEntity.ok(order);
        } else {
            return ResponseEntity.status(404).body("Order not found");
        }
    }

    // Get all orders
    @GetMapping
    public ResponseEntity<List<Map<String, Object>>> getAllOrders() {
        return ResponseEntity.ok(new ArrayList<>(orders.values()));
    }

    // Delete order
    @DeleteMapping("/{orderId}")
    public ResponseEntity<String> deleteOrder(@PathVariable int orderId) {
        if (orders.containsKey(orderId)) {
            orders.remove(orderId);
            return ResponseEntity.ok("Order deleted successfully");
        } else {
            return ResponseEntity.status(404).body("Order not found");
        }
    }

    // Test endpoint
    @GetMapping("/test")
    public String test() {
        return "OrderController is working!";
    }
}
