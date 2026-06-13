<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="KẾT QUẢ ĐẶT LỊCH HẸN - DUCATI" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto text-center" style="max-width: 500px;">
    
    <div class="card card-ducati p-5 racing-stripe">
        
        <c:choose>
            <c:when test="${param.status == 'success' || empty param.status}">
                <!-- Success State -->
                <span class="material-symbols-outlined display-1 text-success mb-4" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                <h1 class="font-heading text-uppercase text-white fs-3 mb-3">ĐẶT LỊCH THÀNH CÔNG</h1>
                <p class="text-secondary small leading-relaxed mb-4">
                    Yêu cầu đặt cọc xe máy và lịch hẹn tư vấn tại showroom của bạn đã được chuyển tới bộ phận điều phối. Mã đặt chỗ của bạn là <strong class="text-danger font-mono-data">#DUC-998811</strong>.
                </p>
                <div class="bg-black bg-opacity-50 p-3 mb-4 border border-secondary text-start font-mono-data small">
                    <div class="d-flex justify-content-between mb-1">
                        <span class="text-muted">Mẫu xe:</span>
                        <span class="text-white">Panigale V4 R</span>
                    </div>
                    <div class="d-flex justify-content-between mb-1">
                        <span class="text-muted">Đại lý:</span>
                        <span class="text-white">Showroom Bà Triệu - HN</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Thời gian:</span>
                        <span class="text-danger">05/06/2026 - 09:00</span>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Failed State -->
                <span class="material-symbols-outlined display-1 text-danger mb-4" style="font-variation-settings: 'FILL' 1;">cancel</span>
                <h1 class="font-heading text-uppercase text-white fs-3 mb-3">GIAO DỊCH THẤT BẠI</h1>
                <p class="text-secondary small leading-relaxed mb-4">
                    Thanh toán hoặc thiết lập lịch hẹn không thành công do gián đoạn đường truyền kết nối ngân hàng. Xin vui lòng thử lại hoặc liên hệ hotline đại lý.
                </p>
            </c:otherwise>
        </c:choose>
        
        <div class="d-flex flex-column gap-2">
            <a href="${pageContext.request.contextPath}/order-history.jsp" class="btn btn-ducati py-3 text-uppercase">Xem lịch sử lịch hẹn</a>
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-ducati py-3 text-uppercase">Quay lại trang chủ</a>
        </div>
        
    </div>

</main>

<%@ include file="/common/footer.jsp" %>
