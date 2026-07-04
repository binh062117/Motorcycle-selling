<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="KẾT QUẢ THANH TOÁN" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto text-center" style="max-width: 560px;">
    <c:set var="order" value="${sessionScope.latestOrder}" />
    <div class="card card-ducati p-5 racing-stripe">
        <c:choose>
            <c:when test="${param.status == 'success' || empty param.status}">
                <span class="material-symbols-outlined display-1 text-success mb-4" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                <h1 class="font-heading text-uppercase text-white fs-3 mb-3">THANH TOÁN / ĐẶT LỊCH THÀNH CÔNG</h1>
                <p class="text-secondary small leading-relaxed mb-4">Đơn hàng đã được ghi nhận và email xác nhận sẽ được gửi tới khách hàng nếu SMTP đã cấu hình.</p>
                <c:if test="${not empty order}">
                    <div class="bg-black bg-opacity-50 p-3 mb-4 border border-secondary text-start font-mono-data small">
                        <div class="d-flex justify-content-between mb-1"><span class="text-muted">Mã đơn:</span><span class="text-danger">#${order.code}</span></div>
                        <div class="d-flex justify-content-between mb-1"><span class="text-muted">Đại lý:</span><span class="text-white">${order.showroom}</span></div>
                        <div class="d-flex justify-content-between mb-1"><span class="text-muted">Thời gian:</span><span class="text-white">${order.appointmentDate} - ${order.appointmentTime}</span></div>
                        <div class="d-flex justify-content-between"><span class="text-muted">Tổng tiền:</span><span class="text-danger"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>đ</span></div>
                    </div>
                </c:if>
            </c:when>
            <c:otherwise>
                <span class="material-symbols-outlined display-1 text-danger mb-4" style="font-variation-settings: 'FILL' 1;">cancel</span>
                <h1 class="font-heading text-uppercase text-white fs-3 mb-3">GIAO DỊCH THẤT BẠI</h1>
                <p class="text-secondary small leading-relaxed mb-4">Thanh toán hoặc xác thực callback không thành công. Vui lòng thử lại hoặc liên hệ showroom.</p>
            </c:otherwise>
        </c:choose>
        <div class="d-flex flex-column gap-2">
            <a href="${pageContext.request.contextPath}/order-history" class="btn btn-ducati py-3 text-uppercase">Xem lịch sử lịch hẹn</a>
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-ducati py-3 text-uppercase">Quay lại trang chủ</a>
        </div>
    </div>
</main>

<%@ include file="/common/footer.jsp" %>
