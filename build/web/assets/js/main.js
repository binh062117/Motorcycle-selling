/**
 * main.js - Custom JavaScript interactivity for Motorbike Ecommerce Site
 */

document.addEventListener('DOMContentLoaded', () => {
    initQuantityControls();
    initColorSelectors();
    initDebounceSearch();
    initAddToCartHandlers();
    initDeleteConfirmations();
});

// Utility to show Bootstrap toasts dynamically
function showToast(message, type = 'success') {
    const toastContainer = document.getElementById('toastContainer');
    if (!toastContainer) {
        // Create container if not exists
        const container = document.createElement('div');
        container.id = 'toastContainer';
        container.className = 'toast-container position-fixed bottom-0 end-0 p-3';
        document.body.appendChild(container);
    }

    const toastId = 'toast_' + Date.now();
    const toastHtml = `
        <div id="${toastId}" class="toast align-items-center text-white bg-${type === 'success' ? 'danger' : 'secondary'} border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body font-mono-data uppercase text-xs">
                    ${message}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    `;

    document.getElementById('toastContainer').insertAdjacentHTML('beforeend', toastHtml);
    const toastEl = document.getElementById(toastId);
    const toast = new bootstrap.Toast(toastEl, { delay: 4000 });
    toast.show();

    toastEl.addEventListener('hidden.bs.toast', () => {
        toastEl.remove();
    });
}

// Fetch API wrapper with Loading State & Error Handling
async function fetchData(url, options = {}) {
    let loadingEl = document.getElementById('loading-overlay');
    if (!loadingEl) {
        loadingEl = document.createElement('div');
        loadingEl.id = 'loading-overlay';
        loadingEl.className = 'd-none';
        loadingEl.innerHTML = '<div class="spinner-border text-danger" role="status"><span class="visually-hidden">Loading...</span></div>';
        document.body.appendChild(loadingEl);
    }

    try {
        loadingEl.classList.remove('d-none');
        const response = await fetch(url, {
            headers: { 'Content-Type': 'application/json' },
            ...options
        });
        if (!response.ok) throw new Error(`HTTP Error ${response.status}`);
        return await response.json();
    } catch (error) {
        showToast('Có lỗi xảy ra: ' + error.message, 'danger');
        console.error('Fetch error:', error);
        return null;
    } finally {
        loadingEl.classList.add('d-none');
    }
}

// Debounce helper
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Debounce Search input integration
function initDebounceSearch() {
    const searchInputs = document.querySelectorAll('.debounce-search');
    searchInputs.forEach(input => {
        const targetUrl = input.getAttribute('data-search-url') || 'products.jsp';
        input.addEventListener('input', debounce((e) => {
            const query = e.target.value;
            console.log(`Performing live search for: "${query}" to ${targetUrl}`);
            // Fetch live results or filter view container
            // Example live query:
            // fetchData(`${targetUrl}?ajax=true&searchQuery=${encodeURIComponent(query)}`).then(data => { ... })
        }, 500));
    });
}

// Quantity controls (+/-) on product detail or cart
function initQuantityControls() {
    document.addEventListener('click', (e) => {
        if (e.target.classList.contains('qty-dec') || e.target.closest('.qty-dec')) {
            const btn = e.target.classList.contains('qty-dec') ? e.target : e.target.closest('.qty-dec');
            const input = btn.parentElement.querySelector('input.qty-input');
            if (input) {
                let val = parseInt(input.value) || 1;
                if (val > 1) {
                    input.value = val - 1;
                    triggerCartRecalculate(input);
                }
            }
        }
        if (e.target.classList.contains('qty-inc') || e.target.closest('.qty-inc')) {
            const btn = e.target.classList.contains('qty-inc') ? e.target : e.target.closest('.qty-inc');
            const input = btn.parentElement.querySelector('input.qty-input');
            if (input) {
                let val = parseInt(input.value) || 1;
                input.value = val + 1;
                triggerCartRecalculate(input);
            }
        }
    });
}

function triggerCartRecalculate(inputEl) {
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
                    s.classList.remove('border-danger');
                    s.classList.add('opacity-50');
                });
            }
            swatch.classList.add('border-danger');
            swatch.classList.remove('opacity-50');

            const colorName = swatch.getAttribute('data-color-name');
            const displayEl = document.querySelector('.selected-color-display');
            if (displayEl && colorName) {
                displayEl.textContent = colorName;
            }
        });
    });
}

// Add to cart click animation & badge updater
function initAddToCartHandlers() {
    document.addEventListener('click', (e) => {
        const btn = e.target.classList.contains('btn-add-to-cart') ? e.target : e.target.closest('.btn-add-to-cart');
        if (btn) {
            e.preventDefault();
            const bikeName = btn.getAttribute('data-bike-name') || 'Xe máy';
            showToast(`Đã thêm ${bikeName} vào giỏ hàng!`, 'success');
            
            // Increment cart count floating indicator
            const cartBadges = document.querySelectorAll('.cart-badge');
            cartBadges.forEach(badge => {
                let currentCount = parseInt(badge.textContent) || 0;
                badge.textContent = currentCount + 1;
                badge.classList.remove('d-none');
            });
        }
    });
}

// Custom Modal Confirmation instead of native confirm()
function initDeleteConfirmations() {
    document.addEventListener('click', (e) => {
        const btn = e.target.classList.contains('btn-delete-confirm') ? e.target : e.target.closest('.btn-delete-confirm');
        if (btn) {
            e.preventDefault();
            const entityName = btn.getAttribute('data-entity-name') || 'mục';
            const actionUrl = btn.getAttribute('href') || '#';
            
            confirmDeleteModal(entityName, () => {
                window.location.href = actionUrl;
            });
        }
    });
}

function confirmDeleteModal(entityName, onConfirmCallback) {
    let confirmModalEl = document.getElementById('globalConfirmDeleteModal');
    if (!confirmModalEl) {
        const modalHtml = `
            <div class="modal fade" id="globalConfirmDeleteModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title font-heading uppercase text-white">Xác nhận xóa</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body font-mono-data text-xs">
                            Bạn có chắc chắn muốn xóa <span id="deleteEntityName" class="text-danger font-bold"></span> này khỏi hệ thống? Hành động này không thể hoàn tác.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-ducati py-2" data-bs-dismiss="modal">Hủy</button>
                            <button type="button" id="confirmDeleteBtn" class="btn btn-ducati py-2">Xóa ngay</button>
                        </div>
                    </div>
                </div>
            </div>
        `;
        document.body.insertAdjacentHTML('beforeend', modalHtml);
        confirmModalEl = document.getElementById('globalConfirmDeleteModal');
    }

    document.getElementById('deleteEntityName').textContent = entityName;
    const confirmBtn = document.getElementById('confirmDeleteBtn');
    
    // Remove old listeners by cloning
    const newConfirmBtn = confirmBtn.cloneNode(true);
    confirmBtn.parentNode.replaceChild(newConfirmBtn, confirmBtn);

    const bootstrapModal = new bootstrap.Modal(confirmModalEl);
    
    newConfirmBtn.addEventListener('click', () => {
        bootstrapModal.hide();
        if (onConfirmCallback) onConfirmCallback();
    });

    bootstrapModal.show();
}
