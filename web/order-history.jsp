<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="LỊCH SỬ LỊCH HẸN ĐẶT XE - DUCATI" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    
    <!-- Title Header -->
    <header class="mb-4 d-flex justify-content-between align-items-end flex-wrap gap-3">
        <div>
            <h1 class="font-heading text-uppercase tracking-tighter fs-3 m-0">Lịch Sử Lịch Hẹn Đặt Xe</h1>
            <div class="bg-danger mt-2" style="width: 64px; height: 4px;"></div>
        </div>
        <a href="${pageContext.request.contextPath}/products.jsp" class="btn btn-outline-ducati py-2 px-3 small">
            Đăng ký lịch hẹn mới
        </a>
    </header>

    <!-- Search / Filter bar for history list -->
    <section class="card card-ducati p-4 mb-4">
        <div class="row g-3 align-items-center">
            <div class="col-12 col-md-9 position-relative">
                <span class="material-symbols-outlined position-absolute top-50 start-0 translate-middle-y ms-3 text-muted">search</span>
                <input class="form-control bg-black border-secondary text-white font-mono-data text-uppercase rounded-0 ps-5" placeholder="TÌM MÃ ĐƠN HÀNG, TÊN XE HOẶC ĐẠI LÝ..." type="text"/>
            </div>
            <div class="col-12 col-md-3">
                <select class="form-select bg-black border-secondary text-white font-mono-data text-uppercase rounded-0">
                    <option>Tất cả trạng thái</option>
                    <option>Chờ duyệt</option>
                    <option>Đã xác nhận</option>
                    <option>Đã giao xe</option>
                    <option>Đã hủy</option>
                </select>
            </div>
        </div>
    </section>

    <!-- History Orders Table -->
    <div class="table-responsive border border-secondary bg-black bg-opacity-50 mb-4">
        <table class="table table-hover font-mono-data text-white mb-0 align-middle">
            <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                <tr>
                    <th class="px-4 py-3">Mã lịch hẹn</th>
                    <th class="px-4 py-3">Mẫu xe đăng ký</th>
                    <th class="px-4 py-3">Operational Hub (Đại lý)</th>
                    <th class="px-4 py-3">Thời gian hẹn</th>
                    <th class="px-4 py-3">Hình thức</th>
                    <th class="px-4 py-3">Trạng thái</th>
                    <th class="px-4 py-3 text-end">Chi tiết</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-secondary">
                
                <!-- Row 1 -->
                <tr class="cart-item-row">
                    <td class="px-4 py-4 fw-bold text-danger">#DUC-998811</td>
                    <td class="px-4 py-4">
                        <div class="d-flex flex-column">
                            <span class="font-heading fs-6 fw-bold text-white uppercase">Panigale V4 R</span>
                            <span class="text-muted small uppercase" style="font-size:10px;">Màu: DUCATI RED | SL: 1</span>
                        </div>
                    </td>
                    <td class="px-4 py-4 text-muted small">Showroom Bà Triệu - Hà Nội</td>
                    <td class="px-4 py-4 small">
                        <div class="d-flex flex-column">
                            <span>05/06/2026</span>
                            <span class="text-muted small" style="font-size:10px;">09:00 sáng</span>
                        </div>
                    </td>
                    <td class="px-4 py-4 text-uppercase small text-muted">Trả góp thẻ</td>
                    <td class="px-4 py-4">
                        <div class="d-flex align-items-center gap-2">
                            <span class="d-inline-block rounded-circle bg-danger" style="width: 8px; height: 8px; box-shadow: 0 0 8px rgba(206,19,31,0.6);"></span>
                            <span class="text-danger text-uppercase small fw-bold">Chờ duyệt</span>
                        </div>
                    </td>
                    <td class="px-4 py-4 text-end">
                        <a href="${pageContext.request.contextPath}/order-detail.jsp" class="btn btn-outline-secondary py-1 px-3 rounded-0 small text-uppercase font-heading" style="font-size:11px;">Xem phiếu</a>
                    </td>
                </tr>

                <!-- Row 2 -->
                <tr class="cart-item-row">
                    <td class="px-4 py-4 fw-bold text-danger">#DUC-442200</td>
                    <td class="px-4 py-4">
                        <div class="d-flex flex-column">
                            <span class="font-heading fs-6 fw-bold text-white uppercase">Monster SP</span>
                            <span class="text-muted small uppercase" style="font-size:10px;">Màu: STAR WHITE | SL: 1</span>
                        </div>
                    </td>
                    <td class="px-4 py-4 text-muted small">Showroom Phú Mỹ Hưng - Q7</td>
                    <td class="px-4 py-4 small">
                        <div class="d-flex flex-column">
                            <span>28/05/2026</span>
                            <span class="text-muted small" style="font-size:10px;">14:00 chiều</span>
                        </div>
                    </td>
                    <td class="px-4 py-4 text-uppercase small text-muted">Chuyển khoản</td>
                    <td class="px-4 py-4">
                        <div class="d-flex align-items-center gap-2">
                            <span class="d-inline-block rounded-circle bg-success" style="width: 8px; height: 8px; box-shadow: 0 0 8px rgba(34,197,94,0.6);"></span>
                            <span class="text-success text-uppercase small fw-bold">Đã xác nhận</span>
                        </div>
                    </td>
                    <td class="px-4 py-4 text-end">
                        <a href="${pageContext.request.contextPath}/order-detail.jsp" class="btn btn-outline-secondary py-1 px-3 rounded-0 small text-uppercase font-heading" style="font-size:11px;">Xem phiếu</a>
                    </td>
                </tr>

                <!-- Row 3 -->
                <tr class="cart-item-row opacity-50">
                    <td class="px-4 py-4 fw-bold text-danger">#DUC-110022</td>
                    <td class="px-4 py-4">
                        <div class="d-flex flex-column">
                            <span class="font-heading fs-6 fw-bold text-white uppercase">Streetfighter V4 SP2</span>
                            <span class="text-muted small uppercase" style="font-size:10px;">Màu: WINTER TEST | SL: 1</span>
                        </div>
                    </td>
                    <td class="px-4 py-4 text-muted small">Showroom Bà Triệu - Hà Nội</td>
                    <td class="px-4 py-4 small">
                        <div class="d-flex flex-column">
                            <span>15/04/2026</span>
                            <span class="text-muted small" style="font-size:10px;">10:00 sáng</span>
                        </div>
                    </td>
                    <td class="px-4 py-4 text-uppercase small text-muted">Tiền mặt</td>
                    <td class="px-4 py-4">
                        <div class="d-flex align-items-center gap-2">
                            <span class="d-inline-block rounded-circle bg-secondary bg-opacity-50" style="width: 8px; height: 8px;"></span>
                            <span class="text-muted text-uppercase small fw-bold">Đã hủy</span>
                        </div>
                    </td>
                    <td class="px-4 py-4 text-end">
                        <a href="${pageContext.request.contextPath}/order-detail.jsp" class="btn btn-outline-secondary py-1 px-3 rounded-0 small text-uppercase font-heading" style="font-size:11px;">Xem phiếu</a>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <!-- Alert / System info note -->
    <div class="card card-ducati p-4 position-relative overflow-hidden mb-5">
        <div class="carbon-overlay"></div>
        <p class="small leading-relaxed m-0 text-white">
            <strong>* LƯU Ý BẢO MẬT:</strong> Khi đến nhận xe hoặc lái thử trực tiếp tại showroom, quý khách vui lòng mang theo <strong>Căn cước công dân (hoặc Hộ chiếu)</strong> và <strong>Bằng lái xe phân khối lớn (A2)</strong> hợp lệ để làm thủ tục xác minh vận hành.
        </p>
    </div>

</main>

<%@ include file="/common/footer.jsp" %>
