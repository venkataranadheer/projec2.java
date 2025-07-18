// Base API URL
const API_URL = 'http://localhost:8080/api/products';

// Fetch products from backend and display them
async function loadProducts() {
    try {
        const response = await fetch(API_URL);
        const products = await response.json();
        displayProducts(products);
    } catch (error) {
        console.error('Error fetching products:', error);
    }
}

// Display products in the DOM
function displayProducts(products) {
    const productList = document.getElementById('product-list');
    productList.innerHTML = ''; // Clear previous content

    products.forEach(product => {
        const card = document.createElement('div');
        card.className = 'product-card';

        card.innerHTML = `
            <h3>${product.name}</h3>
            <p>${product.description}</p>
            <p><strong>Price:</strong> ₹${product.price}</p>
            <p><strong>Category:</strong> ${product.category}</p>
        `;

        productList.appendChild(card);
    });
}

// Call the load function when DOM is ready
document.addEventListener('DOMContentLoaded', loadProducts);
