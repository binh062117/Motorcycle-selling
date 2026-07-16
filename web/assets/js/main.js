/**
 * main.js - Custom JavaScript interactivity for Motorbike Ecommerce Site
 */

document.addEventListener('DOMContentLoaded', () => {
    initQuantityControls();
    initColorSelectors();
    initDebounceSearch();
    initAddToCartHandlers();
    initDeleteConfirmations();
    initNotificationCenter();
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

function initNotificationCenter() {
    const center = document.querySelector('.notification-center');
    if (!center) return;

    const listEl = document.getElementById('notificationList');
    const badgeEl = document.getElementById('notificationBadge');
    const toggleEl = document.getElementById('notificationDropdown');
    const notificationsUrl = center.dataset.notificationsUrl;
    const readUrl = center.dataset.notificationsReadUrl;
    const emptyText = center.dataset.notificationEmpty || 'No notifications yet.';
    let items = [];

    function render() {
        if (!listEl) return;
        if (!items.length) {
            listEl.innerHTML = `<div class="notification-empty px-3 py-4 text-muted font-mono-data small">${escapeHtml(emptyText)}</div>`;
            return;
        }
        listEl.innerHTML = items.map(item => `
            <div class="notification-item ${item.read ? '' : 'unread'}" data-notification-id="${item.id}">
                <div class="notification-item-title">${escapeHtml(item.title)}</div>
                <div class="notification-item-message">${escapeHtml(item.message)}</div>
                <div class="notification-item-time">${formatNotificationTime(item.createdAt)}</div>
            </div>
        `).join('');
    }

    function updateBadge(count) {
        if (!badgeEl) return;
        const safeCount = Math.max(0, Number(count || 0));
        badgeEl.textContent = safeCount > 9 ? '9+' : String(safeCount);
        badgeEl.classList.toggle('d-none', safeCount === 0);
    }

    function addNotification(notification) {
        if (!notification) return;
        items = [notification, ...items.filter(item => item.id !== notification.id)].slice(0, 30);
        render();
        const current = badgeEl && !badgeEl.classList.contains('d-none') ? Number(badgeEl.textContent.replace('+', '')) || 0 : 0;
        updateBadge(current + 1);
        showToast(`${escapeHtml(notification.title)}: ${escapeHtml(notification.message)}`, 'success');
    }

    function markRead() {
        if (!readUrl) return;
        fetch(readUrl, { method: 'POST', credentials: 'same-origin' })
            .then(() => {
                items = items.map(item => ({ ...item, read: true }));
                updateBadge(0);
                render();
            })
            .catch(error => console.error('Cannot mark notifications as read', error));
    }

    if (toggleEl) {
        toggleEl.addEventListener('shown.bs.dropdown', markRead);
    }

    if (notificationsUrl) {
        fetch(notificationsUrl, { credentials: 'same-origin' })
            .then(response => response.ok ? response.json() : null)
            .then(data => {
                if (!data) return;
                items = Array.isArray(data.items) ? data.items : [];
                render();
                updateBadge(data.unreadCount || 0);
            })
            .catch(error => console.error('Cannot load notifications', error));
    }

    connectNotificationSocket(notificationsUrl, addNotification);
}

function connectNotificationSocket(notificationsUrl, onNotification) {
    if (!window.WebSocket || !notificationsUrl) return;
    const url = new URL(notificationsUrl, window.location.href);
    const contextPath = url.pathname.replace(/\/notifications$/, '');
    const protocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
    const socket = new WebSocket(protocol + window.location.host + contextPath + '/ws/notifications');
    socket.onmessage = (message) => {
        try {
            const event = JSON.parse(message.data);
            if (event.type === 'NOTIFICATION') {
                onNotification(event.notification);
            }
        } catch (error) {
            console.error('Invalid notification event', error);
        }
    };
    socket.onclose = () => window.setTimeout(() => connectNotificationSocket(notificationsUrl, onNotification), 5000);
}

function formatNotificationTime(value) {
    if (!value) return '';
    const date = new Date(value);
    if (Number.isNaN(date.getTime())) return value.replace('T', ' ').slice(0, 16);
    return new Intl.DateTimeFormat(document.documentElement.lang || 'vi', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit'
    }).format(date);
}

function escapeHtml(value) {
    return String(value == null ? '' : value)
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;');
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
        showToast('C\u00f3 l\u1ed7i x\u1ea3y ra: ' + error.message, 'danger');
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
        const targetUrl = input.getAttribute('data-search-url') || 'products';
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

// Add to cart toast only. Cart count is rendered by the backend from the real session cart.
function initAddToCartHandlers() {
    document.addEventListener('click', (e) => {
        const btn = e.target.classList.contains('btn-add-to-cart') ? e.target : e.target.closest('.btn-add-to-cart');
        if (btn) {
            const bikeName = btn.getAttribute('data-bike-name') || 'Xe m\u00e1y';
            showToast(`\u0110\u00e3 th\u00eam ${bikeName} v\u00e0o gi\u1ecf h\u00e0ng!`, 'success');
        }
    });
}

// Custom Modal Confirmation instead of native confirm()
function initDeleteConfirmations() {
    document.addEventListener('click', (e) => {
        const btn = e.target.classList.contains('btn-delete-confirm') ? e.target : e.target.closest('.btn-delete-confirm');
        if (btn) {
            e.preventDefault();
            const entityName = btn.getAttribute('data-entity-name') || 'm\u1ee5c';
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
                            <h5 class="modal-title font-heading uppercase text-white">X\u00e1c nh\u1eadn x\u00f3a</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body font-mono-data text-xs">
                            B\u1ea1n c\u00f3 ch\u1eafc ch\u1eafn mu\u1ed1n x\u00f3a <span id="deleteEntityName" class="text-danger font-bold"></span> n\u00e0y kh\u1ecfi h\u1ec7 th\u1ed1ng? H\u00e0nh \u0111\u1ed9ng n\u00e0y kh\u00f4ng th\u1ec3 ho\u00e0n t\u00e1c.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-ducati py-2" data-bs-dismiss="modal">H\u1ee7y</button>
                            <button type="button" id="confirmDeleteBtn" class="btn btn-ducati py-2">X\u00f3a ngay</button>
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
