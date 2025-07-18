<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="../assets/style.css">
    <link rel="stylesheet" href="../assets/theme.css">
</head>
<body>

    <header class="bg-primary p-2">
        <h1 style="color: white; text-align: center;">Welcome to the Dashboard</h1>
    </header>

    <main class="p-3">
        <section class="card mb-3">
            <h2 class="text-primary">User Overview</h2>
            <p>Welcome, <strong>${username}</strong>!</p>
            <p>Here you can manage products, view orders, and track your activity.</p>
        </section>

        <section class="card">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="/products">Manage Products</a></li>
                <li><a href="/orders">View Orders</a></li>
                <li><a href="/users">User Management</a></li>
                <li><a href="/logout" class="text-danger">Logout</a></li>
            </ul>
        </section>
    </main>

</body>
</html>

