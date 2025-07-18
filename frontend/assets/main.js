// API endpoint for products
const API_BASE_URL = 'http://localhost:8080/api/products';

// Fetch and display products on index or products page
async function fetchAndRenderProducts() {
    const container = document.getElementById('product-list');
    if (!container) return; // Exit if not on products page

    try {
        const response = await fetch(API_BASE_URL);
        if (!response.ok) throw new Error('Network response was not ok');
        
        const products = await response.json();

        // Clear container
        container.innerHTML = '';

        // Loop through and render each product
        products.forEach(product => {
            const card = document.createElement('div');
            card.className = 'product-card';
            card.innerHTML = `
                <h3>${product.name}</h3>
                <p>${product.description}</p>
                <p><strong>₹${product.price}</strong></p>
                <p><small>Category: ${product.category}</small></p>
                <form action="/add-to-cart" method="post">
                    <input type="hidden" name="productId" value="${product.id}" />
                    <button type="submit" class="btn btn-primary mt-1">Add to Cart</button>
                </form>
            `;
            container.appendChild(card);
        });
    } catch (error) {
        console.error('Failed to fetch products:', error);
        container.innerHTML = `<p class="text-danger">Unable to load products. Please try again later.</p>`;
    }
}

// Call when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    fetchAndRenderProducts();
});
