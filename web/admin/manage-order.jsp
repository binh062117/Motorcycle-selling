<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Lịch Hẹn Đặt Xe</title>
    
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
    </style>
</head>
<body class="bg-dark text-white">

    <!-- Left Sidebar Admin Navigation -->
    <aside class="admin-sidebar">
        <div class="px-4 mb-4 select-none">
            <h1 class="font-heading fs-5 fw-black text-danger tracking-tighter uppercase mb-1" style="font-weight: 900;">QUẢN TRỊ VIÊN</h1>
            <p class="font-mono-data text-muted uppercase" style="font-size:9px; letter-spacing: 0.1em;">Hệ thống vận hành chính</p>
        </div>
        
        <nav class="flex-grow-1">
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/dashboard.jsp">
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
            <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/manage-order.jsp">
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

    <!-- Main Order list area -->
    <main class="admin-main">
        
        <header class="mb-5">
            <h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Quản Lý Lịch Hẹn & Đơn Đặt Xe</h2>
            <p class="text-secondary mt-1">Quản lý duyệt yêu cầu đặt cọc mua xe hoặc đăng ký lái thử từ khách hàng.</p>
        </header>

        <!-- Orders Table -->
        <section class="card card-ducati overflow-hidden mb-4">
            <div class="table-responsive">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                        <tr>
                            <th class="px-4 py-3">Mã lịch hẹn</th>
                            <th class="px-4 py-3">Thông tin khách hàng</th>
                            <th class="px-4 py-3">Xe đăng ký</th>
                            <th class="px-4 py-3">Địa điểm & Thời gian</th>
                            <th class="px-4 py-3">Trạng thái hiện tại</th>
                            <th class="px-4 py-3 text-end">Duyệt trạng thái</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-secondary">
                        
                        <!-- Row 1 -->
                        <tr class="cart-item-row">
                            <td class="px-4 py-4 fw-bold text-white fs-6">#DUC-998811</td>
                            <td class="px-4 py-4">
                                <div class="d-flex flex-column">
                                    <span class="fw-bold text-white">Enzo Ferrari</span>
                                    <span class="text-muted small mt-1">SĐT: 0912345678</span>
                                    <span class="text-muted small">Email: client@ducati.it</span>
                                </div>
                            </td>
                            <td class="px-4 py-4">
                                <div class="d-flex flex-column">
                                    <span class="fw-semibold text-white">Panigale V4 R</span>
                                    <span class="text-muted small mt-1">Màu: DUCATI RED | SL: 1</span>
                                </div>
                            </td>
                            <td class="px-4 py-4 small text-white">
                                <strong>Đại lý:</strong> Showroom Bà Triệu - Hà Nội<br/>
                                <strong>Ngày hẹn:</strong> 05/06/2026<br/>
                                <strong>Giờ hẹn:</strong> 09:00 sáng
                            </td>
                            <td class="px-4 py-4">
                                <div class="d-flex align-items-center gap-2">
                                    <span id="status-dot-998811" class="d-inline-block rounded-circle bg-danger" style="width: 10px; height: 10px;"></span>
                                    <span id="status-text-998811" class="text-danger uppercase fw-bold small">Chờ duyệt</span>
                                </div>
                            </td>
                            <td class="px-4 py-4 text-end">
                                <form action="${pageContext.request.contextPath}/admin/manage-order" method="post" class="d-inline-block">
                                    <input type="hidden" name="orderId" value="998811"/>
                                    <select name="txtOrderStatus" onchange="updateOrderStatus(this, '998811')" class="form-select form-select-sm bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase cursor-pointer focus:ring-0">
                                        <option value="Chờ duyệt" selected>Chờ duyệt</option>
                                        <option value="Đã xác nhận">Đã xác nhận</option>
                                        <option value="Đã giao xe">Đã giao xe</option>
                                        <option value="Đã hủy">Đã hủy</option>
                                    </select>
                                </form>
                            </td>
                        </tr>

                        <!-- Row 2 -->
                        <tr class="cart-item-row">
                            <td class="px-4 py-4 fw-bold text-white fs-6">#DUC-442200</td>
                            <td class="px-4 py-4">
                                <div class="d-flex flex-column">
                                    <span class="fw-bold text-white">Valentino Rossi</span>
                                    <span class="text-muted small mt-1">SĐT: 0987654321</span>
                                    <span class="text-muted small">Email: rossi46@motogp.it</span>
                                </div>
                            </td>
                            <td class="px-4 py-4">
                                <div class="d-flex flex-column">
                                    <span class="fw-semibold text-white">Monster SP</span>
                                    <span class="text-muted small mt-1">Màu: STAR WHITE | SL: 1</span>
                                </div>
                            </td>
                            <td class="px-4 py-4 small text-white">
                                <strong>Đại lý:</strong> Showroom Phú Mỹ Hưng - Q7<br/>
                                <strong>Ngày hẹn:</strong> 28/05/2026<br/>
                                <strong>Giờ hẹn:</strong> 14:00 chiều
                            </td>
                            <td class="px-4 py-4">
                                <div class="d-flex align-items-center gap-2">
                                    <span id="status-dot-442200" class="d-inline-block rounded-circle bg-success" style="width: 10px; height: 10px;"></span>
                                    <span id="status-text-442200" class="text-success uppercase fw-bold small">Đã xác nhận</span>
                                </div>
                            </td>
                            <td class="px-4 py-4 text-end">
                                <form action="${pageContext.request.contextPath}/admin/manage-order" method="post" class="d-inline-block">
                                    <input type="hidden" name="orderId" value="442200"/>
                                    <select name="txtOrderStatus" onchange="updateOrderStatus(this, '442200')" class="form-select form-select-sm bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase cursor-pointer focus:ring-0">
                                        <option value="Chờ duyệt">Chờ duyệt</option>
                                        <option value="Đã xác nhận" selected>Đã xác nhận</option>
                                        <option value="Đã giao xe">Đã giao xe</option>
                                        <option value="Đã hủy">Đã hủy</option>
                                    </select>
                                </form>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </section>

    </main>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function updateOrderStatus(selectEl, orderId) {
            const val = selectEl.value;
            const textEl = document.getElementById(`status-text-${orderId}`);
            const dotEl = document.getElementById(`status-dot-${orderId}`);
            
            // Front-end interactive visual updates on change before server submit
            if (val === 'Chờ duyệt') {
                textEl.textContent = 'Chờ duyệt';
                textEl.className = 'text-danger uppercase fw-bold small';
                dotEl.className = 'd-inline-block rounded-circle bg-danger';
            } else if (val === 'Đã xác nhận') {
                textEl.textContent = 'Đã xác nhận';
                textEl.className = 'text-success uppercase fw-bold small';
                dotEl.className = 'd-inline-block rounded-circle bg-success';
            } else if (val === 'Đã giao xe') {
                textEl.textContent = 'Đã giao xe';
                textEl.className = 'text-info uppercase fw-bold small';
                dotEl.className = 'd-inline-block rounded-circle bg-info';
            } else {
                textEl.textContent = 'Đã hủy';
                textEl.className = 'text-muted uppercase fw-bold small opacity-60';
                dotEl.className = 'd-inline-block rounded-circle bg-secondary';
            }
            
            // Trigger automatic background submit simulation
            console.log(`Submitting order status update for ${orderId}: ${val}`);
        }
    </script>
</body>
</html>
