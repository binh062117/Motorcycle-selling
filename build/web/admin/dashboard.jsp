<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Hệ Thống Quản Trị</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    
    <style>
        .admin-sidebar {
            width: 260px;
            background-color: var(--surface-container-lowest);
            border-right: 1px solid var(--border-color);
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            z-index: 100;
            padding-top: 2rem;
            display: flex;
            flex-direction: column;
        }
        .admin-main {
            margin-left: 260px;
            padding: 2.5rem;
            background-color: var(--bg-dark);
            min-height: 100vh;
        }
        .sidebar-link {
            display: flex;
            align-items: center;
            gap: 1rem;
            color: var(--text-muted);
            text-decoration: none;
            padding: 0.85rem 1.5rem;
            font-family: var(--font-mono);
            font-size: 13px;
            text-transform: uppercase;
            border-left: 4px solid transparent;
            transition: all 0.2s ease;
        }
        .sidebar-link:hover {
            background-color: var(--surface-container-low);
            color: #fff;
        }
        .sidebar-link.active {
            background-color: var(--primary-color);
            color: #fff;
            border-left-color: var(--text-primary);
        }
        .chart-bar-custom {
            width: 40px;
            background-color: rgba(206, 19, 31, 0.2);
            border-top: 2px solid var(--primary-color);
            transition: all 0.3s ease;
            position: relative;
        }
        .chart-bar-custom:hover {
            filter: brightness(1.3);
            background-color: var(--primary-color);
        }
        .chart-grid-admin {
            border-left: 1px solid rgba(255, 255, 255, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            height: 200px;
            display: flex;
            align-items: flex-end;
            justify-content: space-around;
            padding-bottom: 5px;
        }
    </style>
</head>
<body class="bg-dark text-white">

    <!-- Left Sidebar Administration Panel Navigation -->
    <aside class="admin-sidebar">
        <div class="px-4 mb-4 select-none">
            <h1 class="font-heading fs-5 fw-black text-danger tracking-tighter uppercase mb-1" style="font-weight: 900;">QUẢN TRỊ VIÊN</h1>
            <p class="font-mono-data text-muted uppercase" style="font-size:9px; letter-spacing: 0.1em;">Hệ thống vận hành chính</p>
        </div>
        
        <nav class="flex-grow-1">
            <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/dashboard.jsp">
                <span class="material-symbols-outlined fs-5">dashboard</span>
                <span>TỔNG QUAN</span>
            </a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-product.jsp">
                <span class="material-symbols-outlined fs-5">motorcycle</span>
                <span>QUẢN LÝ XE</span>
            </a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-brand.jsp">
                <span class="material-symbols-outlined fs-5">settings_input_component</span>
                <span>HÃNG XE</span>
            </a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-order.jsp">
                <span class="material-symbols-outlined fs-5">shopping_bag</span>
                <span>ĐƠN ĐẶT LỊCH</span>
            </a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-user.jsp">
                <span class="material-symbols-outlined fs-5">group</span>
                <span>NGƯỜI DÙNG</span>
            </a>
        </nav>
        
        <div class="p-3 mt-auto border-top border-secondary" style="border-color: var(--border-color) !important;">
            <div class="d-flex align-items-center gap-3">
                <div class="rounded-circle bg-secondary overflow-hidden bg-opacity-25 d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                    <span class="material-symbols-outlined text-white">admin_panel_settings</span>
                </div>
                <div>
                    <p class="font-heading text-white small uppercase m-0 fw-bold">Kỹ sư Enzo</p>
                    <p class="text-muted m-0" style="font-size: 9px; font-family: var(--font-mono);">Quản trị cấp cao</p>
                </div>
            </div>
        </div>
    </aside>

    <!-- Main Content Canvas Layout -->
    <main class="admin-main">
        
        <!-- Header -->
        <header class="d-flex justify-content-between align-items-end mb-5 flex-wrap gap-3">
            <div>
                <h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Bảng điều khiển quản trị</h2>
                <p class="font-mono-data text-danger text-uppercase small m-0 mt-1">GIÁM SÁT HOẠT ĐỘNG THỜI GIAN THỰC</p>
            </div>
            <div class="d-flex gap-3">
                <div class="bg-black bg-opacity-50 border border-secondary px-3 py-2 d-flex align-items-center gap-2 font-mono-data small" style="border-color: var(--border-color) !important;">
                    <span class="material-symbols-outlined text-danger fs-6">calendar_today</span>
                    <span>Q2 FY2026</span>
                </div>
                <button class="btn btn-secondary rounded-0 font-mono-data text-uppercase small py-2 px-3 border-0">Xuất báo cáo</button>
            </div>
        </header>

        <!-- Bento Grid Statistics -->
        <section class="row g-4 mb-4">
            <!-- Stat 1 -->
            <div class="col-12 col-md-4">
                <div class="card card-ducati p-4 racing-stripe position-relative overflow-hidden">
                    <p class="font-heading text-muted text-uppercase small mb-2">Tổng sản phẩm kho xe máy</p>
                    <h3 class="font-heading fs-2 fw-black text-white m-0">1,284</h3>
                    <div class="mt-3 d-flex align-items-center gap-2 text-danger small font-mono-data">
                        <span class="material-symbols-outlined fs-6">trending_up</span>
                        <span>+12% so với tháng trước</span>
                    </div>
                </div>
            </div>
            <!-- Stat 2 -->
            <div class="col-12 col-md-4">
                <div class="card card-ducati p-4 position-relative overflow-hidden" style="border-left: 4px solid var(--border-color) !important;">
                    <p class="font-heading text-muted text-uppercase small mb-2">Số lịch hẹn chờ duyệt</p>
                    <h3 class="font-heading fs-2 fw-black text-white m-0">42</h3>
                    <div class="mt-3 d-flex align-items-center gap-2 text-muted small font-mono-data">
                        <span class="material-symbols-outlined fs-6">schedule</span>
                        <span>Thời gian xử lý: 3.2 ngày</span>
                    </div>
                </div>
            </div>
            <!-- Stat 3 -->
            <div class="col-12 col-md-4">
                <div class="card card-ducati p-4 racing-stripe position-relative overflow-hidden">
                    <p class="font-heading text-muted text-uppercase small mb-2">Đăng ký lái thử tuần này</p>
                    <h3 class="font-heading fs-2 fw-black text-white m-0">156</h3>
                    <div class="mt-3 d-flex align-items-center gap-2 text-danger small font-mono-data">
                        <span class="material-symbols-outlined fs-6">person_add</span>
                        <span>Tăng 24% tỉ lệ chuyển đổi</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- Charts Bento -->
        <section class="row g-4 mb-4">
            <!-- Columns Chart -->
            <div class="col-12 col-lg-8">
                <div class="card card-ducati p-4 h-100">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h4 class="font-heading fs-5 text-uppercase text-white m-0">Doanh thu dự kiến</h4>
                            <p class="font-mono-data text-muted small m-0 uppercase mt-1">DOANH SỐ ĐẶT CỌC (VNĐ)</p>
                        </div>
                        <div class="d-flex gap-2 align-items-center small font-mono-data">
                            <span class="d-inline-block bg-danger" style="width: 10px; height: 10px;"></span>
                            <span>Tháng này</span>
                        </div>
                    </div>
                    
                    <div class="chart-grid-admin">
                        <div class="chart-bar-custom" style="height: 40%">
                            <span class="position-absolute start-50 translate-middle-x text-white small" style="top: -24px; font-size:10px; font-family:var(--font-mono)">2.4T</span>
                        </div>
                        <div class="chart-bar-custom" style="height: 55%">
                            <span class="position-absolute start-50 translate-middle-x text-white small" style="top: -24px; font-size:10px; font-family:var(--font-mono)">3.1T</span>
                        </div>
                        <div class="chart-bar-custom" style="height: 85%">
                            <span class="position-absolute start-50 translate-middle-x text-white small" style="top: -24px; font-size:10px; font-family:var(--font-mono)">4.8T</span>
                        </div>
                        <div class="chart-bar-custom" style="height: 60%">
                            <span class="position-absolute start-50 translate-middle-x text-white small" style="top: -24px; font-size:10px; font-family:var(--font-mono)">3.4T</span>
                        </div>
                        <div class="chart-bar-custom" style="height: 92%">
                            <span class="position-absolute start-50 translate-middle-x text-white small" style="top: -24px; font-size:10px; font-family:var(--font-mono)">5.2T</span>
                        </div>
                    </div>
                    
                    <div class="d-flex justify-content-around mt-3 font-mono-data text-muted small">
                        <span>T12</span><span>T1</span><span>T2</span><span>T3</span><span>T4</span>
                    </div>
                </div>
            </div>

            <!-- Pie Chart Appointments -->
            <div class="col-12 col-lg-4">
                <div class="card card-ducati p-4 h-100 d-flex flex-column">
                    <h4 class="font-heading fs-5 text-uppercase text-white m-0">Loại hình đặt lịch</h4>
                    <p class="font-mono-data text-muted small m-0 uppercase mt-1">PHÂN BỔ THEO HẠNG MỤC YÊU CẦU</p>
                    
                    <div class="flex-grow-1 d-flex align-items-center justify-content-center my-4">
                        <div class="rounded-circle border border-5 border-secondary position-relative d-flex align-items-center justify-content-center bg-black bg-opacity-25" style="width: 140px; height: 140px; border-color: var(--border-color) !important;">
                            <div class="text-center font-mono-data">
                                <span class="fs-4 fw-bold text-white d-block">840</span>
                                <span class="text-muted small uppercase" style="font-size:9px;">Yêu cầu</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="d-flex flex-column gap-2 font-mono-data small mt-2">
                        <div class="d-flex justify-content-between">
                            <span class="text-muted text-uppercase">Đặt mua trực tiếp:</span>
                            <span class="fw-bold text-danger">62%</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="text-muted text-uppercase">Hẹn lái thử:</span>
                            <span class="fw-bold text-white">28%</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="text-muted text-uppercase">Tư vấn spec:</span>
                            <span class="fw-bold text-muted">10%</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Top Selling SKU table -->
        <section class="card card-ducati overflow-hidden mb-4">
            <div class="p-4 border-bottom border-secondary" style="border-color: var(--border-color) !important;">
                <h4 class="font-heading fs-5 text-uppercase text-white m-0">Mẫu xe bán chạy trong tháng</h4>
                <p class="font-mono-data text-muted small m-0 uppercase mt-1">THỐNG KÊ CHI TIẾT TỪNG MÃ XE (SKU)</p>
            </div>
            
            <div class="table-responsive">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                        <tr>
                            <th class="px-4 py-3">Mã dòng xe</th>
                            <th class="px-4 py-3">Số lượng đặt cọc</th>
                            <th class="px-4 py-3">Mức tồn kho</th>
                            <th class="px-4 py-3">Tăng trưởng</th>
                            <th class="px-4 py-3 text-end">Biên lợi nhuận</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-secondary">
                        <tr class="cart-item-row cursor-pointer">
                            <td class="px-4 py-4 fw-bold text-white">PANIGALE V4 R</td>
                            <td class="px-4 py-4">142 xe</td>
                            <td class="px-4 py-4">
                                <div class="d-flex align-items-center gap-2">
                                    <div class="progress bg-black rounded-0" style="width: 80px; height: 6px;">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 15%"></div>
                                    </div>
                                    <span class="text-danger fw-bold" style="font-size: 9px;">NGUY CƠ CHÁY HÀNG</span>
                                </div>
                            </td>
                            <td class="px-4 py-4 text-danger">+24%</td>
                            <td class="px-4 py-4 text-end fw-bold">18.4%</td>
                        </tr>
                        <tr class="cart-item-row cursor-pointer">
                            <td class="px-4 py-4 fw-bold text-white">STREETFIGHTER V4 SP2</td>
                            <td class="px-4 py-4">89 xe</td>
                            <td class="px-4 py-4">
                                <div class="d-flex align-items-center gap-2">
                                    <div class="progress bg-black rounded-0" style="width: 80px; height: 6px;">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 65%"></div>
                                    </div>
                                    <span class="text-success fw-bold" style="font-size: 9px;">ỔN ĐỊNH</span>
                                </div>
                            </td>
                            <td class="px-4 py-4 text-muted">0%</td>
                            <td class="px-4 py-4 text-end fw-bold">21.2%</td>
                        </tr>
                        <tr class="cart-item-row cursor-pointer">
                            <td class="px-4 py-4 fw-bold text-white">MONSTER SP</td>
                            <td class="px-4 py-4">214 xe</td>
                            <td class="px-4 py-4">
                                <div class="d-flex align-items-center gap-2">
                                    <div class="progress bg-black rounded-0" style="width: 80px; height: 6px;">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 40%"></div>
                                    </div>
                                    <span class="text-success fw-bold" style="font-size: 9px;">ỔN ĐỊNH</span>
                                </div>
                            </td>
                            <td class="px-4 py-4 text-danger">+15%</td>
                            <td class="px-4 py-4 text-end fw-bold">16.8%</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        
    </main>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
