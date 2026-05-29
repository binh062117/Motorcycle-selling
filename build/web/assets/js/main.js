/**
 * main.js - Custom JavaScript interactivity for Motorbike Ecommerce Site
 */

document.addEventListener('DOMContentLoaded', () => {
    initQuantityControls();
    initColorSelectors();
    initNotificationsMock();
});

// Quantity controls (+/-) on product detail or cart
function initQuantityControls() {
    const decBtns = document.querySelectorAll('.qty-dec');
    const incBtns = document.querySelectorAll('.qty-inc');

    decBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            const input = e.target.parentElement.querySelector('input.qty-input');
            if (input) {
                let val = parseInt(input.value) || 1;
                if (val > 1) {
                    input.value = val - 1;
                    triggerCartRecalculate(input);
                }
            }
        });
    });

    incBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            const input = e.target.parentElement.querySelector('input.qty-input');
            if (input) {
                let val = parseInt(input.value) || 1;
                input.value = val + 1;
                triggerCartRecalculate(input);
            }
        });
    });
}

function triggerCartRecalculate(inputEl) {
    // If we are on the cart page, we can trigger event or update total price
    const event = new CustomEvent('cart-qty-changed', { detail: { input: inputEl } });
    document.dispatchEvent(event);
}

// Color Swatches interaction on Product Detail
function initColorSelectors() {
    const swatches = document.querySelectorAll('.color-swatch');
    swatches.forEach(swatch => {
        swatch.addEventListener('click', () => {
            const container = swatch.closest('.color-swatch-container');
            if (container) {
                container.querySelectorAll('.color-swatch').forEach(s => {
                    s.classList.remove('ring-primary-container', 'ring-2', 'border-primary');
                    s.classList.add('opacity-50');
                });
            }
            swatch.classList.add('ring-primary-container', 'ring-2', 'border-primary');
            swatch.classList.remove('opacity-50');

            // Optionally, switch preview image if dynamic mockup exists
            const colorName = swatch.getAttribute('data-color-name');
            const displayEl = document.querySelector('.selected-color-display');
            if (displayEl && colorName) {
                displayEl.textContent = colorName;
            }
        });
    });
}

// Mock alerts using SweetAlert2 if loaded, fallback to native alert
function showNotification(title, text, icon = 'success') {
    if (typeof Swal !== 'undefined') {
        Swal.fire({
            title: title,
            text: text,
            icon: icon,
            background: '#1e2020',
            color: '#e2e2e2',
            confirmButtonColor: '#ce131f',
            customClass: {
                popup: 'border border-surface-variant'
            }
        });
    } else {
        alert(`${title}: ${text}`);
    }
}

function initNotificationsMock() {
    // Add to cart click animations
    const addToCartBtns = document.querySelectorAll('.btn-add-to-cart');
    addToCartBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            const bikeName = btn.getAttribute('data-bike-name') || 'Xe máy';
            showNotification('Thành công', `Đã thêm ${bikeName} vào giỏ hàng!`, 'success');
            
            // Increment cart count floating indicator
            const cartBadges = document.querySelectorAll('.cart-badge');
            cartBadges.forEach(badge => {
                let currentCount = parseInt(badge.textContent) || 0;
                badge.textContent = currentCount + 1;
                badge.classList.remove('hidden');
                
                // Add bounce effect
                badge.classList.add('scale-125');
                setTimeout(() => badge.classList.remove('scale-125'), 200);
            });
        });
    });
}
