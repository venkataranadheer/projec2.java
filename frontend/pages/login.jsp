<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | MyShop</title>
    <link rel="stylesheet" href="../assets/style.css">
    <link rel="stylesheet" href="../assets/theme.css">
</head>
<body>

    <header class="bg-primary p-2">
        <h1 style="color: white; text-align: center;">Login to MyShop</h1>
    </header>

    <main style="max-width: 400px; margin: 40px auto;">
        <div class="card">
            <form action="/login" method="post">
                <h2 class="text-primary">Login</h2>

                <!-- Show error message if present -->
                <c:if test="${not empty errorMessage}">
                    <p class="text-danger">${errorMessage}</p>
                </c:if>

                <label for="username">Username</label><br>
                <input type="text" id="username" name="username" required class="p-1" style="width: 100%;"><br><br>

                <label for="password">Password</label><br>
                <input type="password" id="password" name="password" required class="p-1" style="width: 100%;"><br><br>

                <button type="submit" class="btn btn-primary" style="width: 100%;">Login</button>

                <p class="mt-2" style="text-align: center;">
                    Don't have an account? <a href="/register">Register</a>
                </p>
            </form>
        </div>
    </main>

</body>
</html>
