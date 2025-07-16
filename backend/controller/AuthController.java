// backend/controller/AuthController.java
package backend.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    // In-memory user storage (mock)
    private Map<String, String> users = new HashMap<>();

    // Register a new user
    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody Map<String, String> userData) {
        String username = userData.get("username");
        String password = userData.get("password");

        if (users.containsKey(username)) {
            return ResponseEntity.badRequest().body("User already exists");
        }

        users.put(username, password);
        return ResponseEntity.ok("User registered successfully");
    }

    // Login user
    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody Map<String, String> loginData) {
        String username = loginData.get("username");
        String password = loginData.get("password");

        if (users.containsKey(username) && users.get(username).equals(password)) {
            return ResponseEntity.ok("Login successful");
        } else {
            return ResponseEntity.status(401).body("Invalid username or password");
        }
    }

    // Just a test endpoint
    @GetMapping("/test")
    public String test() {
        return "AuthController is working!";
    }
}
