<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="CHI TIẾT LỊCH HẸN" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <c:if test="${empty order}">
        <div class="card card-ducati p-5 text-center">
            <h1 class="font-heading text-uppercase fs-3">Không tìm thấy đơn hàng</h1>
            <a href="${pageContext.request.contextPath}/order-history" class="btn btn-ducati mt-3">Quay lại lịch sử</a>
        </div>
    </c:if>
    <c:if test="${not empty order}">
        <header class="mb-4 text-start">
            <h1 class="font-heading text-uppercase tracking-tighter fs-3">CHI TIẾT LỊCH HẸN #${order.code}</h1>
            <div class="bg-danger mt-2" style="width: 64px; height: 4px;"></div>
        </header>
        <div class="row g-4 align-items-start mb-5">
            <div class="col-12 col-lg-8">
                <div class="card card-ducati p-4 racing-stripe mb-4">
                    <h3 class="font-heading text-uppercase fs-5 text-white mb-4 border-bottom border-secondary pb-2">Thông tin khách hàng & bàn giao</h3>
                    <div class="row g-3 font-mono-data text-white">
                        <div class="col-md-6"><span class="text-muted small uppercase d-block">Khách hàng</span><span class="fw-bold">${order.customer.fullName}</span></div>
                        <div class="col-md-6"><span class="text-muted small uppercase d-block">Số điện thoại</span><span>${order.customer.phone}</span></div>
                        <div class="col-md-6"><span class="text-muted small uppercase d-block">Email</span><span>${order.customer.email}</span></div>
                        <div class="col-md-6"><span class="text-muted small uppercase d-block">Thanh toán</span><span class="text-uppercase text-danger fw-bold">${order.paymentMethod}</span></div>
                        <div class="col-12"><span class="text-muted small uppercase d-block">Showroom</span><span>${order.showroom}</span></div>
                    </div>
                </div>
                <div class="table-responsive border border-secondary bg-black bg-opacity-50">
                    <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                        <thead class="table-dark font-heading text-uppercase small"><tr><th class="px-4 py-3">Sản phẩm</th><th class="px-4 py-3">Màu</th><th class="px-4 py-3">Đơn giá</th><th class="px-4 py-3">SL</th><th class="px-4 py-3 text-end">Thành tiền</th></tr></thead>
                        <tbody>
                            <c:forEach var="detail" items="${order.details}">
                                <tr>
                                    <td class="px-4 py-4 fw-bold">${detail.product.name}</td>
                                    <td class="px-4 py-4 text-uppercase text-muted small">${detail.color}</td>
                                    <td class="px-4 py-4 small"><fmt:formatNumber value="${detail.unitPrice}" pattern="#,##0"/>đ</td>
                                    <td class="px-4 py-4">${detail.quantity}</td>
                                    <td class="px-4 py-4 text-end fw-bold text-danger"><fmt:formatNumber value="${detail.lineTotal}" pattern="#,##0"/>đ</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-12 col-lg-4">
                <div class="card card-ducati p-4">
                    <h3 class="font-heading text-uppercase tracking-wider fs-5 text-white border-bottom border-secondary pb-3 mb-4">Trạng thái</h3>
                    <div class="d-flex align-items-center gap-3 mb-4 font-mono-data">
                        <span class="d-inline-block rounded-circle bg-danger" style="width: 12px; height: 12px;"></span>
                        <span class="text-danger text-uppercase fw-bold fs-6">${order.status}</span>
                    </div>
                    <div class="d-flex justify-content-between align-items-center font-mono-data">
                        <span class="uppercase fw-bold">Tổng thanh toán:</span>
                        <span class="fs-5 fw-black text-danger"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>đ</span>
                    </div>
                    <div class="mt-4 pt-4 border-top border-secondary">
                        <a href="${pageContext.request.contextPath}/order-history" class="btn btn-outline-ducati w-100 py-3 text-uppercase small">Quay lại lịch sử</a>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</main>

<%@ include file="/common/footer.jsp" %>
