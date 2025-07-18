<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products | MyShop</title>
    <link rel="stylesheet" href="../assets/style.css">
    <link rel="stylesheet" href="../assets/theme.css">
</head>
<body>

    <!-- Header -->
    <header class="bg-primary p-2">
        <h1 style="color: white; text-align: center;">All Products</h1>
    </header>

    <!-- Product Grid -->
    <main class="p-3">
        <div id="product-list">
            <c:forEach var="product" items="${products}">
                <div class="product-card">
                    <h3>${product.name}</h3>
                    <p>${product.description}</p>
                    <p><strong>₹${product.price}</strong></p>
                    <p><small>Category: ${product.category}</small></p>
                    <form action="/add-to-cart" method="post">
                        <input type="hidden" name="productId" value="${product.id}" />
                        <button type="submit" class="btn btn-primary mt-1">Add to Cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </main>

</body>
</html>
