<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="LỊCH SỬ LỊCH HẸN ĐẶT XE" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <header class="mb-4 d-flex justify-content-between align-items-end flex-wrap gap-3">
        <div>
            <h1 class="font-heading text-uppercase tracking-tighter fs-3 m-0">Lịch Sử Lịch Hẹn Đặt Xe</h1>
            <div class="bg-danger mt-2" style="width: 64px; height: 4px;"></div>
        </div>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-ducati py-2 px-3 small">Đăng ký lịch hẹn mới</a>
    </header>

    <div class="table-responsive border border-secondary bg-black bg-opacity-50 mb-4">
        <table class="table table-hover font-mono-data text-white mb-0 align-middle">
            <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                <tr>
                    <th class="px-4 py-3">Mã lịch hẹn</th>
                    <th class="px-4 py-3">Sản phẩm</th>
                    <th class="px-4 py-3">Showroom</th>
                    <th class="px-4 py-3">Thời gian hẹn</th>
                    <th class="px-4 py-3">Thanh toán</th>
                    <th class="px-4 py-3">Tổng tiền</th>
                    <th class="px-4 py-3">Trạng thái</th>
                    <th class="px-4 py-3 text-end">Chi tiết</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-secondary">
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td class="px-4 py-4 fw-bold text-danger">#${order.code}</td>
                        <td class="px-4 py-4">
                            <c:forEach var="detail" items="${order.details}">
                                <div class="d-flex flex-column mb-2">
                                    <span class="font-heading fs-6 fw-bold text-white uppercase">${detail.product.name}</span>
                                    <span class="text-muted small uppercase" style="font-size:10px;">Màu: ${detail.color} | SL: ${detail.quantity}</span>
                                </div>
                            </c:forEach>
                        </td>
                        <td class="px-4 py-4 text-muted small">${order.showroom}</td>
                        <td class="px-4 py-4 small">
                            <div class="d-flex flex-column">
                                <span>${order.appointmentDate}</span>
                                <span class="text-muted small" style="font-size:10px;">${order.appointmentTime}</span>
                            </div>
                        </td>
                        <td class="px-4 py-4 text-uppercase small text-muted">${order.paymentMethod}</td>
                        <td class="px-4 py-4 fw-bold text-danger"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>đ</td>
                        <td class="px-4 py-4">
                            <div class="d-flex align-items-center gap-2">
                                <span class="d-inline-block rounded-circle ${order.status == 'Đã xác nhận' ? 'bg-success' : order.status == 'Đã hủy' ? 'bg-secondary' : 'bg-danger'}" style="width: 8px; height: 8px;"></span>
                                <span class="${order.status == 'Đã xác nhận' ? 'text-success' : order.status == 'Đã hủy' ? 'text-muted' : 'text-danger'} text-uppercase small fw-bold">${order.status}</span>
                            </div>
                        </td>
                        <td class="px-4 py-4 text-end">
                            <a href="${pageContext.request.contextPath}/order-detail?id=${order.id}" class="btn btn-outline-secondary py-1 px-3 rounded-0 small text-uppercase font-heading" style="font-size:11px;">Xem phiếu</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty orders}">
                    <tr>
                        <td colspan="8" class="px-4 py-5 text-center text-muted">Chưa có đơn đặt lịch nào.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</main>

<%@ include file="/common/footer.jsp" %>
