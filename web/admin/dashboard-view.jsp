<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Hệ Thống Quản Trị</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <style>
        .admin-sidebar{width:260px;background-color:var(--surface-container-lowest);border-right:1px solid var(--border-color);position:fixed;top:0;bottom:0;left:0;z-index:100;padding-top:2rem;display:flex;flex-direction:column}
        .admin-main{margin-left:260px;padding:2.5rem;background-color:var(--bg-dark);min-height:100vh}
        .sidebar-link{display:flex;align-items:center;gap:1rem;color:var(--text-muted);text-decoration:none;padding:.85rem 1.5rem;font-family:var(--font-mono);font-size:13px;text-transform:uppercase;border-left:4px solid transparent;transition:all .2s ease}
        .sidebar-link:hover{background-color:var(--surface-container-low);color:#fff}
        .sidebar-link.active{background-color:var(--primary-color);color:#fff;border-left-color:var(--text-primary)}
    </style>
</head>
<body class="bg-dark text-white">
    <aside class="admin-sidebar">
        <div class="px-4 mb-4 select-none">
            <h1 class="font-heading fs-5 fw-black text-danger tracking-tighter uppercase mb-1" style="font-weight:900;">QUẢN TRỊ VIÊN</h1>
            <p class="font-mono-data text-muted uppercase" style="font-size:9px;letter-spacing:.1em;">Dữ liệu trực tiếp từ SQL Server</p>
        </div>
        <nav class="flex-grow-1">
            <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/dashboard"><span class="material-symbols-outlined fs-5">dashboard</span><span>TỔNG QUAN</span></a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-product"><span class="material-symbols-outlined fs-5">motorcycle</span><span>QUẢN LÝ XE</span></a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-brand"><span class="material-symbols-outlined fs-5">settings_input_component</span><span>HÃNG XE</span></a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-order"><span class="material-symbols-outlined fs-5">shopping_bag</span><span>ĐƠN ĐẶT LỊCH</span></a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-user"><span class="material-symbols-outlined fs-5">group</span><span>NGƯỜI DÙNG</span></a>
        </nav>
        <div class="p-3 mt-auto border-top border-secondary" style="border-color:var(--border-color)!important;">
            <div class="d-flex align-items-center gap-3">
                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser.avatarUrl}">
                        <img src="${sessionScope.currentUser.avatarUrl}" alt="${sessionScope.currentUser.fullName}" class="rounded-circle border border-secondary" style="width:40px;height:40px;object-fit:cover;"/>
                    </c:when>
                    <c:otherwise>
                        <div class="rounded-circle bg-secondary bg-opacity-25 d-flex align-items-center justify-content-center" style="width:40px;height:40px;"><span class="material-symbols-outlined text-white">admin_panel_settings</span></div>
                    </c:otherwise>
                </c:choose>
                <div>
                    <p class="font-heading text-white small uppercase m-0 fw-bold">${sessionScope.currentUser.fullName}</p>
                    <p class="text-muted m-0" style="font-size:9px;font-family:var(--font-mono);">${sessionScope.currentUser.role.name}</p>
                </div>
            </div>
        </div>
    </aside>

    <main class="admin-main">
        <header class="d-flex justify-content-between align-items-end mb-5 flex-wrap gap-3">
            <div>
                <h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Bảng điều khiển quản trị</h2>
                <p class="font-mono-data text-danger text-uppercase small m-0 mt-1">Số liệu lấy từ database hiện tại</p>
            </div>
            <a class="btn btn-outline-ducati rounded-0 font-mono-data text-uppercase small py-2 px-3" href="${pageContext.request.contextPath}/home">Về website</a>
        </header>

        <section class="row g-4 mb-4">
            <div class="col-12 col-md-3"><div class="card card-ducati p-4 racing-stripe"><p class="font-heading text-muted text-uppercase small mb-2">Sản phẩm đang bán</p><h3 class="font-heading fs-2 fw-black text-white m-0">${productCount}</h3></div></div>
            <div class="col-12 col-md-3"><div class="card card-ducati p-4"><p class="font-heading text-muted text-uppercase small mb-2">Tổng tồn kho</p><h3 class="font-heading fs-2 fw-black text-white m-0">${stockTotal}</h3></div></div>
            <div class="col-12 col-md-3"><div class="card card-ducati p-4 racing-stripe"><p class="font-heading text-muted text-uppercase small mb-2">Đơn chờ xử lý</p><h3 class="font-heading fs-2 fw-black text-white m-0">${pendingOrders}</h3></div></div>
            <div class="col-12 col-md-3"><div class="card card-ducati p-4"><p class="font-heading text-muted text-uppercase small mb-2">Tổng đơn đặt</p><h3 class="font-heading fs-2 fw-black text-white m-0">${orderCount}</h3></div></div>
        </section>

        <section class="row g-4 mb-4">
            <div class="col-12 col-lg-5">
                <div class="card card-ducati p-4 h-100">
                    <p class="font-heading text-muted text-uppercase small mb-2">Doanh thu đơn hàng đã ghi nhận</p>
                    <h3 class="font-heading fs-2 fw-black text-danger m-0"><fmt:formatNumber value="${dashboardRevenue}" pattern="#,##0"/>đ</h3>
                    <p class="text-muted small mt-3 mb-0">Bao gồm các đơn trong bảng orders, cập nhật theo dữ liệu thật.</p>
                </div>
            </div>
            <div class="col-12 col-lg-7">
                <div class="card card-ducati p-4 h-100">
                    <h4 class="font-heading fs-5 text-uppercase text-white m-0">Tình trạng kho</h4>
                    <div class="d-flex flex-column gap-3 mt-4">
                        <c:forEach var="product" items="${topProducts}">
                            <div>
                                <div class="d-flex justify-content-between font-mono-data small mb-1">
                                    <span class="text-white">${product.name}</span>
                                    <span class="text-muted">Tồn: ${product.stock}</span>
                                </div>
                                <div class="progress bg-black rounded-0" style="height:7px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width:${product.stock > 50 ? 100 : product.stock * 2}%;"></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <section class="card card-ducati overflow-hidden">
            <div class="p-4 border-bottom border-secondary" style="border-color:var(--border-color)!important;">
                <h4 class="font-heading fs-5 text-uppercase text-white m-0">Sản phẩm trong kho</h4>
                <p class="font-mono-data text-muted small m-0 uppercase mt-1">Không dùng dữ liệu mẫu</p>
            </div>
            <div class="table-responsive">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small">
                        <tr><th class="px-4 py-3">SKU</th><th class="px-4 py-3">Tên xe</th><th class="px-4 py-3">Hãng</th><th class="px-4 py-3">Đã đặt</th><th class="px-4 py-3 text-end">Tồn kho</th></tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${topProducts}">
                            <tr>
                                <td class="px-4 py-4 text-danger fw-bold">${product.sku}</td>
                                <td class="px-4 py-4 text-white fw-bold">${product.name}</td>
                                <td class="px-4 py-4 text-muted">${product.brand.name}</td>
                                <td class="px-4 py-4">${bookedByProduct[product.id]}</td>
                                <td class="px-4 py-4 text-end fw-bold">${product.stock}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
