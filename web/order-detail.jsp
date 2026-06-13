<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="CHI TIẾT LỊCH HẸN - DUCATI" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    
    <header class="mb-4 text-start">
        <h1 class="font-heading text-uppercase tracking-tighter fs-3">CHI TIẾT LỊCH HẸN #DUC-998811</h1>
        <div class="bg-danger mt-2" style="width: 64px; height: 4px;"></div>
    </header>

    <div class="row g-4 align-items-start mb-5">
        
        <!-- Left: Summary Details (col-lg-8) -->
        <div class="col-12 col-lg-8">
            <div class="card card-ducati p-4 racing-stripe mb-4">
                <h3 class="font-heading text-uppercase fs-5 text-white mb-4 border-bottom border-secondary pb-2">Thông tin khách hàng & Bàn giao</h3>
                
                <div class="row g-3 font-mono-data text-white">
                    <div class="col-12 col-md-6">
                        <span class="text-muted small uppercase d-block">Họ và tên khách hàng</span>
                        <span class="fw-bold">ENZO FERRARI</span>
                    </div>
                    <div class="col-12 col-md-6">
                        <span class="text-muted small uppercase d-block">Số điện thoại</span>
                        <span>0912345678</span>
                    </div>
                    <div class="col-12 col-md-6">
                        <span class="text-muted small uppercase d-block">Địa chỉ Email</span>
                        <span>client@ducati-corse.vn</span>
                    </div>
                    <div class="col-12 col-md-6">
                        <span class="text-muted small uppercase d-block">Hình thức thanh toán</span>
                        <span class="text-uppercase text-danger fw-bold">Trả góp qua thẻ</span>
                    </div>
                    <div class="col-12">
                        <span class="text-muted small uppercase d-block">Đại lý showroom tiếp nhận</span>
                        <span>Showroom Bà Triệu - Số 110 Bà Triệu, Hai Bà Trưng, Hà Nội</span>
                    </div>
                </div>
            </div>

            <!-- Table of reserved motorbikes -->
            <div class="table-responsive border border-secondary bg-black bg-opacity-50">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                        <tr>
                            <th class="px-4 py-3">Mẫu xe đặt mua</th>
                            <th class="px-4 py-3">Màu sắc</th>
                            <th class="px-4 py-3">Đơn giá</th>
                            <th class="px-4 py-3">Số lượng</th>
                            <th class="px-4 py-3 text-end">Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-secondary">
                        <tr>
                            <td class="px-4 py-4 fw-bold">Panigale V4 R</td>
                            <td class="px-4 py-4 text-uppercase text-muted small">Ducati Red</td>
                            <td class="px-4 py-4 small">1.250.000.000đ</td>
                            <td class="px-4 py-4">1 xe</td>
                            <td class="px-4 py-4 text-end fw-bold text-danger">1.250.000.000đ</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Right: Summary receipt totals (col-lg-4) -->
        <div class="col-12 col-lg-4">
            <div class="card card-ducati p-4">
                <h3 class="font-heading text-uppercase tracking-wider fs-5 text-white border-bottom border-secondary pb-3 mb-4">Trạng thái đặt lịch</h3>
                
                <div class="d-flex align-items-center gap-3 mb-4 font-mono-data">
                    <span class="d-inline-block rounded-circle bg-danger" style="width: 12px; height: 12px; box-shadow: 0 0 8px rgba(206,19,31,0.6);"></span>
                    <span class="text-danger text-uppercase fw-bold fs-6">Chờ phê duyệt</span>
                </div>
                
                <div class="d-flex flex-column gap-3 font-mono-data text-white">
                    <div class="d-flex justify-content-between small">
                        <span class="text-muted uppercase">Tổng tiền cọc xe:</span>
                        <span class="fw-bold">1.250.000.000đ</span>
                    </div>
                    <div class="d-flex justify-content-between small">
                        <span class="text-muted uppercase">Thuế VAT (10%):</span>
                        <span class="text-muted">Đã bao gồm</span>
                    </div>
                    <hr class="bg-secondary my-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="uppercase fw-bold">Tổng thanh toán:</span>
                        <span class="fs-5 fw-black text-danger">1.250.000.000đ</span>
                    </div>
                </div>
                
                <div class="mt-4 pt-4 border-top border-secondary">
                    <a href="${pageContext.request.contextPath}/order-history.jsp" class="btn btn-outline-ducati w-100 py-3 text-uppercase small">Quay lại lịch sử</a>
                </div>
            </div>
        </div>
    </div>

</main>

<%@ include file="/common/footer.jsp" %>
