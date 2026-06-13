<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="GIỎ HÀNG CỦA BẠN - DUCATI" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    
    <header class="mb-4 text-start">
        <h1 class="font-heading text-uppercase tracking-tighter fs-3">GIỎ HÀNG CỦA BẠN</h1>
        <div class="bg-danger mt-2" style="width: 64px; height: 4px;"></div>
    </header>

    <!-- Cart Layout Grid -->
    <div id="cart-content-grid" class="row g-4 align-items-start">
        
        <!-- Left 8 columns: Table of items -->
        <div class="col-12 col-lg-8">
            <div class="table-responsive border border-secondary bg-black bg-opacity-50 mb-3">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                        <tr>
                            <th class="px-4 py-3">Mẫu xe</th>
                            <th class="px-4 py-3 d-none d-md-table-cell">Màu sắc</th>
                            <th class="px-4 py-3">Đơn giá</th>
                            <th class="px-4 py-3">Số lượng</th>
                            <th class="px-4 py-3 text-end">Thành tiền</th>
                            <th class="px-4 py-3 text-center">Xóa</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-secondary" id="cart-items-body">
                        
                        <!-- Item 1 -->
                        <tr class="cart-item-row" data-price="1250000000">
                            <td class="px-4 py-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="bg-dark border border-secondary overflow-hidden d-none d-sm-block shrink-0" style="width: 80px; height: 56px;">
                                        <img alt="Panigale V4 R mini" class="w-100 h-100 object-fit-cover" style="object-fit: cover;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
                                    </div>
                                    <div class="d-flex flex-column">
                                        <span class="font-heading fs-6 fw-bold text-white uppercase">Panigale V4 R</span>
                                        <span class="text-muted d-md-none" style="font-size: 10px;">Màu: Ducati Red</span>
                                    </div>
                                </div>
                            </td>
                            <td class="px-4 py-4 d-none d-md-table-cell text-uppercase small text-muted">Ducati Red</td>
                            <td class="px-4 py-4 fw-semibold small">1.250.000.000đ</td>
                            <td class="px-4 py-4">
                                <div class="d-inline-flex bg-black border border-secondary align-items-center" style="height: 36px; padding: 2px;">
                                    <button class="qty-dec btn text-white px-2 py-0 h-100 border-0">-</button>
                                    <input class="qty-input bg-transparent border-0 text-center font-mono-data text-white" value="1" readonly style="width: 32px; outline: none; font-size:12px;" type="text"/>
                                    <button class="qty-inc btn text-white px-2 py-0 h-100 border-0">+</button>
                                </div>
                            </td>
                            <td class="px-4 py-4 text-end fw-bold text-danger item-total-price">1.250.000.000đ</td>
                            <td class="px-4 py-4 text-center">
                                <button onclick="removeCartItem(this)" class="btn p-1 text-muted hover-text-danger border-0">
                                    <span class="material-symbols-outlined fs-5">delete</span>
                                </button>
                            </td>
                        </tr>

                        <!-- Item 2 -->
                        <tr class="cart-item-row" data-price="455000000">
                            <td class="px-4 py-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="bg-dark border border-secondary overflow-hidden d-none d-sm-block shrink-0" style="width: 80px; height: 56px;">
                                        <img alt="Monster SP mini" class="w-100 h-100 object-fit-cover" style="object-fit: cover;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4"/>
                                    </div>
                                    <div class="d-flex flex-column">
                                        <span class="font-heading fs-6 fw-bold text-white uppercase">Monster SP</span>
                                        <span class="text-muted d-md-none" style="font-size: 10px;">Màu: Star White</span>
                                    </div>
                                </div>
                            </td>
                            <td class="px-4 py-4 d-none d-md-table-cell text-uppercase small text-muted">Star White</td>
                            <td class="px-4 py-4 fw-semibold small">455.000.000đ</td>
                            <td class="px-4 py-4">
                                <div class="d-inline-flex bg-black border border-secondary align-items-center" style="height: 36px; padding: 2px;">
                                    <button class="qty-dec btn text-white px-2 py-0 h-100 border-0">-</button>
                                    <input class="qty-input bg-transparent border-0 text-center font-mono-data text-white" value="1" readonly style="width: 32px; outline: none; font-size:12px;" type="text"/>
                                    <button class="qty-inc btn text-white px-2 py-0 h-100 border-0">+</button>
                                </div>
                            </td>
                            <td class="px-4 py-4 text-end fw-bold text-danger item-total-price">455.000.000đ</td>
                            <td class="px-4 py-4 text-center">
                                <button onclick="removeCartItem(this)" class="btn p-1 text-muted hover-text-danger border-0">
                                    <span class="material-symbols-outlined fs-5">delete</span>
                                </button>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
            
            <!-- Actions -->
            <div class="d-flex justify-content-between align-items-center mt-4">
                <a href="${pageContext.request.contextPath}/products.jsp" class="font-heading text-secondary text-uppercase text-decoration-none border-bottom border-secondary pb-1 small hover-text-white transition-colors d-inline-flex align-items-center gap-2">
                    <span class="material-symbols-outlined fs-6">arrow_back</span>
                    <span>Tiếp tục xem xe</span>
                </a>
                <button onclick="clearAllCart()" class="btn btn-link text-danger text-uppercase tracking-wider small fw-bold text-decoration-none p-0">Xóa toàn bộ giỏ hàng</button>
            </div>
        </div>
        
        <!-- Right 4 columns: Checkout summary -->
        <aside class="col-12 col-lg-4">
            <div class="card card-ducati p-4">
                <h3 class="font-heading text-uppercase tracking-wider fs-5 text-white border-bottom border-secondary pb-3 mb-4">Tóm tắt đơn hàng</h3>
                
                <div class="d-flex flex-column gap-3 font-mono-data">
                    <div class="d-flex justify-content-between">
                        <span class="text-muted uppercase small">Tạm tính:</span>
                        <span id="cart-subtotal" class="fw-bold text-white">1.705.000.000đ</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted uppercase small">Thuế VAT (10%):</span>
                        <span id="cart-tax" class="text-muted small">Đã bao gồm</span>
                    </div>
                    <hr class="bg-secondary my-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="text-white uppercase fw-bold">Tổng thanh toán:</span>
                        <span id="cart-grandtotal" class="fs-5 fw-black text-danger">1.705.000.000đ</span>
                    </div>
                </div>
                
                <!-- Voucher Promo -->
                <div class="mt-4 pt-4 border-top border-secondary">
                    <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Mã giảm giá (Voucher)</label>
                    <div class="input-group">
                        <input id="voucher-input" class="form-control bg-black border-secondary text-white uppercase font-mono-data rounded-0" placeholder="NHẬP MÃ..." type="text"/>
                        <button onclick="applyVoucher()" class="btn btn-outline-ducati border-secondary py-2 rounded-0">Áp dụng</button>
                    </div>
                </div>
                
                <!-- Checkout action -->
                <div class="mt-4">
                    <a href="${pageContext.request.contextPath}/checkout.jsp" class="btn btn-ducati w-100 py-3 d-flex align-items-center justify-content-center gap-2">
                        <span>TIẾN HÀNH ĐẶT HÀNG</span>
                        <span class="material-symbols-outlined fs-5">credit_score</span>
                    </a>
                </div>
            </div>
        </aside>
    </div>
    
    <!-- Empty Cart Layout (Hidden by default) -->
    <div id="cart-empty-panel" class="d-none py-5 text-center max-w-md mx-auto" style="max-width: 450px;">
        <span class="material-symbols-outlined display-1 text-muted opacity-25 mb-4">shopping_cart_off</span>
        <h2 class="font-heading text-uppercase text-white mb-3">Giỏ hàng của bạn đang trống</h2>
        <p class="text-secondary mb-4">Hãy lựa chọn những dòng xe phân khối lớn đỉnh cao và đẳng cấp của Ducati trước khi tiến hành thanh toán.</p>
        <a href="${pageContext.request.contextPath}/products.jsp" class="btn btn-ducati px-5 py-3">
            Quay lại bộ sưu tập
        </a>
    </div>

</main>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        // Local quantity listener for cart calculation
        document.addEventListener('cart-qty-changed', (e) => {
            const input = e.detail.input;
            const row = input.closest('.cart-item-row');
            if (row) {
                const price = parseInt(row.getAttribute('data-price')) || 0;
                const qty = parseInt(input.value) || 1;
                
                const total = price * qty;
                row.querySelector('.item-total-price').textContent = formatVND(total);
                recalculateSubtotal();
            }
        });
    });

    function removeCartItem(btn) {
        const row = btn.closest('.cart-item-row');
        if (row) {
            row.remove();
            recalculateSubtotal();
            checkEmptyCart();
        }
    }

    function clearAllCart() {
        const body = document.getElementById('cart-items-body');
        if(body) body.innerHTML = '';
        recalculateSubtotal();
        checkEmptyCart();
    }

    function checkEmptyCart() {
        const rows = document.querySelectorAll('.cart-item-row');
        if (rows.length === 0) {
            document.getElementById('cart-content-grid').classList.add('d-none');
            document.getElementById('cart-empty-panel').classList.remove('d-none');
            
            document.querySelectorAll('.cart-badge').forEach(badge => {
                badge.textContent = '0';
                badge.classList.add('d-none');
            });
        }
    }

    function recalculateSubtotal() {
        const rows = document.querySelectorAll('.cart-item-row');
        let subtotal = 0;
        
        rows.forEach(row => {
            const price = parseInt(row.getAttribute('data-price')) || 0;
            const qtyInput = row.querySelector('.qty-input');
            const qty = parseInt(qtyInput ? qtyInput.value : 1) || 1;
            subtotal += price * qty;
        });

        const subEl = document.getElementById('cart-subtotal');
        const grandEl = document.getElementById('cart-grandtotal');
        if(subEl) subEl.textContent = formatVND(subtotal);
        if(grandEl) grandEl.textContent = formatVND(subtotal);
    }

    function applyVoucher() {
        const input = document.getElementById('voucher-input');
        const code = input.value.trim().toUpperCase();
        if (code === 'DUCATI10') {
            showToast('Áp dụng mã DUCATI10 giảm giá 10% thành công!', 'success');
            
            const rows = document.querySelectorAll('.cart-item-row');
            let subtotal = 0;
            rows.forEach(row => {
                const price = parseInt(row.getAttribute('data-price')) || 0;
                const qty = parseInt(row.querySelector('.qty-input').value) || 1;
                subtotal += price * qty;
            });
            const discount = subtotal * 0.1;
            const grandEl = document.getElementById('cart-grandtotal');
            if(grandEl) grandEl.textContent = formatVND(subtotal - discount);
        } else {
            showToast('Mã giảm giá không chính xác hoặc đã hết hạn!', 'danger');
        }
    }

    function formatVND(num) {
        return num.toLocaleString('vi-VN') + 'đ';
    }
</script>

<%@ include file="/common/footer.jsp" %>
