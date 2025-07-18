<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Orders | MyShop</title>
    <link rel="stylesheet" href="../assets/style.css">
    <link rel="stylesheet" href="../assets/theme.css">
</head>
<body>

    <header class="bg-primary p-2">
        <h1 style="color: white; text-align: center;">Your Orders</h1>
    </header>

    <main class="p-3">
        <c:if test="${empty orders}">
            <div class="card">
                <p>No orders found.</p>
            </div>
        </c:if>

        <c:if test="${not empty orders}">
            <div class="card">
                <table style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr style="background-color: #ecf0f1;">
                            <th style="padding: 10px; text-align: left;">Order ID</th>
                            <th style="padding: 10px; text-align: left;">Date</th>
                            <th style="padding: 10px; text-align: left;">Amount</th>
                            <th style="padding: 10px; text-align: left;">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td style="padding: 10px;">${order.id}</td>
                                <td style="padding: 10px;">${order.orderDate}</td>
                                <td style="padding: 10px;">₹${order.totalAmount}</td>
                                <td style="padding: 10px;">${order.orderStatus}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </main>

</body>
</html>
