<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jsp" %>

<main class="pt-28 pb-24 px-margin-mobile md:px-margin-desktop max-w-container-max mx-auto">
    
    <header class="mb-10 text-left">
        <h1 class="font-headline-lg text-headline-sm md:text-headline-lg uppercase tracking-tighter">GIỎ HÀNG CỦA BẠN</h1>
        <div class="w-16 h-1 bg-primary-container mt-2"></div>
    </header>

    <!-- Cart Layout Grid -->
    <div id="cart-content-grid" class="grid grid-cols-1 lg:grid-cols-12 gap-gutter items-start">
        
        <!-- Left 8 columns: Table of items -->
        <div class="lg:col-span-8 space-y-6">
            <div class="bg-surface-container-lowest border border-surface-variant overflow-hidden">
                <table class="w-full text-left font-mono-data text-mono-data">
                    <thead class="bg-surface-container font-label-md text-label-md uppercase text-on-surface-variant border-b border-surface-variant">
                        <tr>
                            <th class="px-6 py-4">Mẫu xe</th>
                            <th class="px-6 py-4 hidden md:table-cell">Màu sắc</th>
                            <th class="px-6 py-4">Đơn giá</th>
                            <th class="px-6 py-4">Số lượng</th>
                            <th class="px-6 py-4 text-right">Thành tiền</th>
                            <th class="px-6 py-4 text-center">Xóa</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-surface-variant/30" id="cart-items-body">
                        
                        <!-- Item 1 -->
                        <tr class="cart-item-row hover:bg-surface-container-low transition-colors" data-price="1250000000">
                            <td class="px-6 py-6 flex items-center gap-4">
                                <div class="w-20 h-14 bg-black border border-surface-variant overflow-hidden hidden sm:block shrink-0">
                                    <img alt="Panigale V4 R mini" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
                                </div>
                                <div class="flex flex-col">
                                    <span class="font-headline-sm text-[16px] text-white tracking-tight font-semibold">Panigale V4 R</span>
                                    <span class="text-[10px] text-on-surface-variant md:hidden">Màu: Ducati Red</span>
                                </div>
                            </td>
                            <td class="px-6 py-6 hidden md:table-cell uppercase">Ducati Red</td>
                            <td class="px-6 py-6 font-semibold">1.250.000.000đ</td>
                            <td class="px-6 py-6">
                                <div class="flex items-center bg-black border border-surface-variant w-24 h-10">
                                    <button class="qty-dec w-8 h-full flex items-center justify-center text-on-surface hover:text-primary-container">-</button>
                                    <input class="qty-input w-8 h-full bg-transparent border-none text-center font-mono-data text-on-surface text-[12px] focus:ring-0" value="1" readonly type="text"/>
                                    <button class="qty-inc w-8 h-full flex items-center justify-center text-on-surface hover:text-primary-container">+</button>
                                </div>
                            </td>
                            <td class="px-6 py-6 text-right font-bold text-primary-container item-total-price">1.250.000.000đ</td>
                            <td class="px-6 py-6 text-center">
                                <button onclick="removeCartItem(this)" class="text-on-surface-variant hover:text-primary-container transition-colors">
                                    <span class="material-symbols-outlined text-[20px]">delete</span>
                                </button>
                            </td>
                        </tr>

                        <!-- Item 2 -->
                        <tr class="cart-item-row hover:bg-surface-container-low transition-colors" data-price="455000000">
                            <td class="px-6 py-6 flex items-center gap-4">
                                <div class="w-20 h-14 bg-black border border-surface-variant overflow-hidden hidden sm:block shrink-0">
                                    <img alt="Monster SP mini" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4"/>
                                </div>
                                <div class="flex flex-col">
                                    <span class="font-headline-sm text-[16px] text-white tracking-tight font-semibold">Monster SP</span>
                                    <span class="text-[10px] text-on-surface-variant md:hidden">Màu: Star White</span>
                                </div>
                            </td>
                            <td class="px-6 py-6 hidden md:table-cell uppercase">Star White</td>
                            <td class="px-6 py-6 font-semibold">455.000.000đ</td>
                            <td class="px-6 py-6">
                                <div class="flex items-center bg-black border border-surface-variant w-24 h-10">
                                    <button class="qty-dec w-8 h-full flex items-center justify-center text-on-surface hover:text-primary-container">-</button>
                                    <input class="qty-input w-8 h-full bg-transparent border-none text-center font-mono-data text-on-surface text-[12px] focus:ring-0" value="1" readonly type="text"/>
                                    <button class="qty-inc w-8 h-full flex items-center justify-center text-on-surface hover:text-primary-container">+</button>
                                </div>
                            </td>
                            <td class="px-6 py-6 text-right font-bold text-primary-container item-total-price">455.000.000đ</td>
                            <td class="px-6 py-6 text-center">
                                <button onclick="removeCartItem(this)" class="text-on-surface-variant hover:text-primary-container transition-colors">
                                    <span class="material-symbols-outlined text-[20px]">delete</span>
                                </button>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
            
            <!-- Actions -->
            <div class="flex justify-between items-center">
                <a href="${pageContext.request.contextPath}/products.jsp" class="font-label-md text-label-md text-on-surface-variant hover:text-white uppercase tracking-widest flex items-center gap-2 border-b border-on-surface-variant pb-1">
                    <span class="material-symbols-outlined text-[16px]">arrow_back</span>
                    <span>Tiếp tục xem xe</span>
                </a>
                <button onclick="clearAllCart()" class="font-label-md text-label-md text-primary-container hover:underline uppercase tracking-widest">Xóa toàn bộ giỏ hàng</button>
            </div>
        </div>
        
        <!-- Right 4 columns: Checkout summary -->
        <aside class="lg:col-span-4 bg-surface-container-lowest p-8 border border-surface-variant relative overflow-hidden">
            <h3 class="font-headline-sm text-headline-sm uppercase tracking-widest text-white border-b border-surface-variant pb-4 mb-6">Tóm tắt đơn hàng</h3>
            
            <div class="space-y-4 font-mono-data text-mono-data">
                <div class="flex justify-between">
                    <span class="text-on-surface-variant uppercase">Tạm tính:</span>
                    <span id="cart-subtotal" class="font-bold text-white">1.705.000.000đ</span>
                </div>
                <div class="flex justify-between">
                    <span class="text-on-surface-variant uppercase">Thuế VAT (10%):</span>
                    <span id="cart-tax" class="text-on-surface-variant">Đã bao gồm</span>
                </div>
                <div class="h-[1px] bg-surface-variant my-4"></div>
                <div class="flex justify-between text-body-lg">
                    <span class="text-white uppercase font-bold">Tổng thanh toán:</span>
                    <span id="cart-grandtotal" class="font-extrabold text-primary-container">1.705.000.000đ</span>
                </div>
            </div>
            
            <!-- Voucher Promo -->
            <div class="mt-8 pt-6 border-t border-surface-variant space-y-3">
                <label class="font-label-md text-label-md text-on-surface-variant uppercase block">Mã giảm giá (Voucher)</label>
                <div class="flex">
                    <input id="voucher-input" class="bg-black border border-surface-variant px-4 py-3 text-on-surface flex-1 focus:ring-0 focus:outline-none uppercase font-mono-data text-sm" placeholder="NHẬP MÃ..." type="text"/>
                    <button onclick="applyVoucher()" class="bg-surface-container-highest border border-surface-variant px-6 hover:bg-primary-container hover:text-white hover:border-primary-container transition-colors uppercase font-label-md text-label-md">Áp dụng</button>
                </div>
            </div>
            
            <!-- Checkout action -->
            <div class="mt-8">
                <a href="${pageContext.request.contextPath}/checkout.jsp" class="w-full bg-primary-container text-white py-4 font-label-md text-label-md uppercase tracking-widest active:scale-[0.98] transition-all flex items-center justify-center gap-2">
                    <span>TIẾN HÀNH ĐẶT HÀNG</span>
                    <span class="material-symbols-outlined text-[18px]">credit_score</span>
                </a>
            </div>
        </aside>
    </div>
    
    <!-- Empty Cart Layout (Hidden by default) -->
    <div id="cart-empty-panel" class="hidden py-24 text-center max-w-md mx-auto space-y-6">
        <span class="material-symbols-outlined text-7xl text-on-surface-variant opacity-40">shopping_cart_off</span>
        <h2 class="font-headline-sm text-headline-sm uppercase text-white">Giỏ hàng của bạn đang trống</h2>
        <p class="font-body-md text-on-surface-variant leading-relaxed">Hãy lựa chọn những dòng xe phân khối lớn đỉnh cao và đẳng cấp của Ducati trước khi tiến hành thanh toán.</p>
        <a href="${pageContext.request.contextPath}/products.jsp" class="inline-block px-10 py-4 bg-primary-container text-white font-label-md text-label-md uppercase tracking-widest active:scale-95 transition-transform">
            Quay lại bộ sưu tập
        </a>
    </div>

</main>

<script>
    // Local quantity listener for cart calculation
    document.addEventListener('cart-qty-changed', (e) => {
        const input = e.detail.input;
        const row = input.closest('.cart-item-row');
        if (row) {
            const price = parseInt(row.getAttribute('data-price')) || 0;
            const qty = parseInt(input.value) || 1;
            
            // Format and update item total
            const total = price * qty;
            row.querySelector('.item-total-price').textContent = formatVND(total);
            
            recalculateSubtotal();
        }
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
        document.getElementById('cart-items-body').innerHTML = '';
        recalculateSubtotal();
        checkEmptyCart();
    }

    function checkEmptyCart() {
        const rows = document.querySelectorAll('.cart-item-row');
        if (rows.length === 0) {
            document.getElementById('cart-content-grid').classList.add('hidden');
            document.getElementById('cart-empty-panel').classList.remove('hidden');
            
            // Update floating cart badge header
            document.querySelectorAll('.cart-badge').forEach(badge => {
                badge.textContent = '0';
                badge.classList.add('hidden');
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

        // Update summaries
        document.getElementById('cart-subtotal').textContent = formatVND(subtotal);
        document.getElementById('cart-grandtotal').textContent = formatVND(subtotal);
    }

    function applyVoucher() {
        const input = document.getElementById('voucher-input');
        const code = input.value.trim().toUpperCase();
        if (code === 'DUCATI10') {
            showNotification('Thành công', 'Áp dụng mã DUCATI10 giảm giá 10% thành công!', 'success');
            // Mock discount subtraction
            const rows = document.querySelectorAll('.cart-item-row');
            let subtotal = 0;
            rows.forEach(row => {
                const price = parseInt(row.getAttribute('data-price')) || 0;
                const qty = parseInt(row.querySelector('.qty-input').value) || 1;
                subtotal += price * qty;
            });
            const discount = subtotal * 0.1;
            document.getElementById('cart-grandtotal').textContent = formatVND(subtotal - discount);
        } else {
            showNotification('Thất bại', 'Mã giảm giá không chính xác hoặc đã hết hạn!', 'error');
        }
    }

    function formatVND(num) {
        return num.toLocaleString('vi-VN') + 'đ';
    }
</script>

<%@ include file="/common/footer.jsp" %>
