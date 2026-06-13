<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Tài Khoản</title>
    
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
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-order.jsp">
                <span class="material-symbols-outlined fs-5">shopping_bag</span>
                <span>ĐƠN ĐẶT LỊCH</span>
            </a>
            <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/manage-user.jsp">
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

    <!-- Main Content Area -->
    <main class="admin-main">
        
        <header class="mb-5">
            <h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Quản Lý Phân Quyền Người Dùng</h2>
            <p class="text-secondary mt-1">Điều tiết chức năng truy cập tài khoản trong hệ thống quản trị và mua hàng.</p>
        </header>

        <!-- User Accounts Table -->
        <section class="card card-ducati overflow-hidden mb-4">
            <div class="table-responsive">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                        <tr>
                            <th class="px-4 py-3">Mã tài khoản</th>
                            <th class="px-4 py-3">Tên họ người dùng</th>
                            <th class="px-4 py-3">Địa chỉ Email</th>
                            <th class="px-4 py-3">Số điện thoại</th>
                            <th class="px-4 py-3">Vai trò phân quyền</th>
                            <th class="px-4 py-3 text-end">Thay đổi vai trò</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-secondary">
                        
                        <tr class="cart-item-row">
                            <td class="px-4 py-4 fw-bold text-white fs-6">#ACC-887711</td>
                            <td class="px-4 py-4 fw-bold text-white">Enzo Ferrari</td>
                            <td class="px-4 py-4 text-lowercase text-muted">enzo@ferrari.it</td>
                            <td class="px-4 py-4 fw-semibold text-white">0912345678</td>
                            <td class="px-4 py-4">
                                <span class="badge bg-secondary text-white rounded-0 uppercase py-2 px-3 fw-bold">Khách hàng</span>
                            </td>
                            <td class="px-4 py-4 text-end">
                                <form action="${pageContext.request.contextPath}/admin/manage-user" method="post" class="d-inline-block">
                                    <input type="hidden" name="accountId" value="887711"/>
                                    <select name="txtRole" onchange="this.form.submit()" class="form-select form-select-sm bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase cursor-pointer focus:ring-0">
                                        <option value="Customer" selected>Customer</option>
                                        <option value="Admin">Admin (Quản trị)</option>
                                    </select>
                                </form>
                            </td>
                        </tr>

                        <tr class="cart-item-row">
                            <td class="px-4 py-4 fw-bold text-white fs-6">#ACC-443322</td>
                            <td class="px-4 py-4 fw-bold text-white">Valentino Rossi</td>
                            <td class="px-4 py-4 text-lowercase text-muted">rossi46@motogp.it</td>
                            <td class="px-4 py-4 fw-semibold text-white">0987654321</td>
                            <td class="px-4 py-4">
                                <span class="badge bg-danger text-white rounded-0 uppercase py-2 px-3 fw-bold">Quản trị viên</span>
                            </td>
                            <td class="px-4 py-4 text-end">
                                <form action="${pageContext.request.contextPath}/admin/manage-user" method="post" class="d-inline-block">
                                    <input type="hidden" name="accountId" value="443322"/>
                                    <select name="txtRole" onchange="this.form.submit()" class="form-select form-select-sm bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase cursor-pointer focus:ring-0">
                                        <option value="Customer">Customer</option>
                                        <option value="Admin" selected>Admin (Quản trị)</option>
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
</body>
</html>
