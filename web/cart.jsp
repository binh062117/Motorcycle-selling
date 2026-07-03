<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="GIỎ HÀNG CỦA BẠN" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <header class="mb-4 text-start">
        <h1 class="font-heading text-uppercase tracking-tighter fs-3">GIỎ HÀNG CỦA BẠN</h1>
        <div class="bg-danger mt-2" style="width: 64px; height: 4px;"></div>
    </header>

    <c:if test="${not empty cartItems}">
        <div id="cart-content-grid" class="row g-4 align-items-start">
            <div class="col-12 col-lg-8">
                <div class="table-responsive border border-secondary bg-black bg-opacity-50 mb-3">
                    <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                        <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                            <tr>
                                <th class="px-4 py-3">Mẫu xe / mặt hàng</th>
                                <th class="px-4 py-3 d-none d-md-table-cell">Màu sắc</th>
                                <th class="px-4 py-3">Đơn giá</th>
                                <th class="px-4 py-3">Số lượng</th>
                                <th class="px-4 py-3 text-end">Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-secondary" id="cart-items-body">
                            <c:forEach var="item" items="${cartItems}">
                                <tr class="cart-item-row" data-price="${item.product.price}">
                                    <td class="px-4 py-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="bg-dark border border-secondary overflow-hidden d-none d-sm-block shrink-0" style="width: 80px; height: 56px;">
                                                <img alt="${item.product.name}" class="w-100 h-100 object-fit-cover" style="object-fit: cover;" src="${pageContext.request.contextPath}/${item.product.imageUrl}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/product-placeholder.svg';"/>
                                            </div>
                                            <div class="d-flex flex-column">
                                                <span class="font-heading fs-6 fw-bold text-white uppercase">${item.product.name}</span>
                                                <span class="text-muted d-md-none" style="font-size: 10px;">Màu: ${item.color}</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-4 py-4 d-none d-md-table-cell text-uppercase small text-muted">${item.color}</td>
                                    <td class="px-4 py-4 fw-semibold small"><fmt:formatNumber value="${item.product.price}" pattern="#,##0"/>đ</td>
                                    <td class="px-4 py-4">${item.quantity}</td>
                                    <td class="px-4 py-4 text-end fw-bold text-danger item-total-price"><fmt:formatNumber value="${item.lineTotal}" pattern="#,##0"/>đ</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-4">
                    <a href="${pageContext.request.contextPath}/products" class="font-heading text-secondary text-uppercase text-decoration-none border-bottom border-secondary pb-1 small hover-text-white transition-colors d-inline-flex align-items-center gap-2">
                        <span class="material-symbols-outlined fs-6">arrow_back</span>
                        <span>Tiếp tục xem xe</span>
                    </a>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="m-0">
                        <input type="hidden" name="action" value="clear"/>
                        <button type="submit" class="btn btn-link text-danger text-uppercase tracking-wider small fw-bold text-decoration-none p-0">Xóa toàn bộ giỏ hàng</button>
                    </form>
                </div>
            </div>

            <aside class="col-12 col-lg-4">
                <div class="card card-ducati p-4">
                    <h3 class="font-heading text-uppercase tracking-wider fs-5 text-white border-bottom border-secondary pb-3 mb-4">Tóm tắt đơn hàng</h3>
                    <div class="d-flex flex-column gap-3 font-mono-data">
                        <div class="d-flex justify-content-between">
                            <span class="text-muted uppercase small">Tạm tính:</span>
                            <span id="cart-subtotal" class="fw-bold text-white"><fmt:formatNumber value="${cartSubtotal}" pattern="#,##0"/>đ</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="text-muted uppercase small">Thuế VAT (10%):</span>
                            <span id="cart-tax" class="text-muted small">Đã bao gồm</span>
                        </div>
                        <hr class="bg-secondary my-2">
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-white uppercase fw-bold">Tổng thanh toán:</span>
                            <span id="cart-grandtotal" class="fs-5 fw-black text-danger"><fmt:formatNumber value="${cartSubtotal}" pattern="#,##0"/>đ</span>
                        </div>
                    </div>
                    <div class="mt-4">
                        <a href="${pageContext.request.contextPath}/checkout" class="btn btn-ducati w-100 py-3 d-flex align-items-center justify-content-center gap-2">
                            <span>TIẾN HÀNH ĐẶT HÀNG</span>
                            <span class="material-symbols-outlined fs-5">credit_score</span>
                        </a>
                    </div>
                </div>
            </aside>
        </div>
    </c:if>

    <c:if test="${empty cartItems}">
        <div id="cart-empty-panel" class="py-5 text-center max-w-md mx-auto" style="max-width: 450px;">
            <span class="material-symbols-outlined display-1 text-muted opacity-25 mb-4">shopping_cart_off</span>
            <h2 class="font-heading text-uppercase text-white mb-3">Giỏ hàng của bạn đang trống</h2>
            <p class="text-secondary mb-4">Hãy lựa chọn xe hoặc mặt hàng trước khi thanh toán.</p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-ducati px-5 py-3">Quay lại bộ sưu tập</a>
        </div>
    </c:if>
</main>

<%@ include file="/common/footer.jsp" %>
