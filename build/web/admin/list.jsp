<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Danh Sách</title>
    
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

    <!-- Main Content Area -->
    <main class="admin-main">
        
        <!-- Header -->
        <header class="d-flex justify-content-between align-items-end mb-5 flex-wrap gap-3">
            <div>
                <h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Danh Sách Quản Lý Hệ Thống</h2>
                <p class="text-secondary mt-1">Trang xem danh sách dùng chung hỗ trợ lọc dữ liệu và phân trang.</p>
            </div>
            
            <a href="${pageContext.request.contextPath}/admin/create.jsp" class="btn btn-ducati px-4 py-3 d-flex align-items-center gap-2">
                <span class="material-symbols-outlined fs-5">add_circle</span>
                <span>Tạo bản ghi mới</span>
            </a>
        </header>

        <!-- Filters Grid -->
        <section class="card card-ducati p-4 mb-4">
            <div class="row g-3">
                <div class="col-12 col-md-6 position-relative">
                    <span class="material-symbols-outlined position-absolute top-50 start-0 translate-middle-y ms-3 text-muted">search</span>
                    <input class="form-control bg-black border-secondary text-white font-mono-data rounded-0 ps-5 uppercase" placeholder="TÌM KIẾM DỮ LIỆU..." type="text"/>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase">
                        <option>Tất cả danh mục</option>
                        <option>Hoạt động</option>
                        <option>Tạm khóa</option>
                    </select>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase">
                        <option>Sắp xếp: Mới nhất</option>
                        <option>Sắp xếp: Cũ nhất</option>
                    </select>
                </div>
            </div>
        </section>

        <!-- List Table -->
        <section class="card card-ducati overflow-hidden mb-4">
            <div class="table-responsive">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                        <tr>
                            <th class="px-4 py-3">Mã bản ghi</th>
                            <th class="px-4 py-3">Tiêu đề / Tên</th>
                            <th class="px-4 py-3">Người cập nhật</th>
                            <th class="px-4 py-3">Ngày tạo</th>
                            <th class="px-4 py-3 text-end">Hành động</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-secondary">
                        <tr class="cart-item-row">
                            <td class="px-4 py-4 fw-bold text-white fs-6">#REC-001</td>
                            <td class="px-4 py-4 fw-bold text-white">Cấu hình máy Panigale V4 R</td>
                            <td class="px-4 py-4 text-muted">Kỹ sư Enzo</td>
                            <td class="px-4 py-4">12/06/2026</td>
                            <td class="px-4 py-4 text-end">
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="${pageContext.request.contextPath}/admin/edit.jsp" class="btn btn-sm btn-outline-light rounded-0 p-2 d-flex align-items-center justify-content-center">
                                        <span class="material-symbols-outlined fs-6">edit</span>
                                    </a>
                                    <button onclick="confirmDelete()" class="btn btn-sm btn-outline-danger rounded-0 p-2 d-flex align-items-center justify-content-center">
                                        <span class="material-symbols-outlined fs-6">delete</span>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr class="cart-item-row">
                            <td class="px-4 py-4 fw-bold text-white fs-6">#REC-002</td>
                            <td class="px-4 py-4 fw-bold text-white">Chính sách bảo hành Ducati Care</td>
                            <td class="px-4 py-4 text-muted">Hệ thống</td>
                            <td class="px-4 py-4">10/06/2026</td>
                            <td class="px-4 py-4 text-end">
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="${pageContext.request.contextPath}/admin/edit.jsp" class="btn btn-sm btn-outline-light rounded-0 p-2 d-flex align-items-center justify-content-center">
                                        <span class="material-symbols-outlined fs-6">edit</span>
                                    </a>
                                    <button onclick="confirmDelete()" class="btn btn-sm btn-outline-danger rounded-0 p-2 d-flex align-items-center justify-content-center">
                                        <span class="material-symbols-outlined fs-6">delete</span>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <!-- Pagination -->
        <nav aria-label="Page navigation" class="mt-4">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link bg-black border-secondary text-white rounded-0" href="#" tabindex="-1" aria-disabled="true">Trước</a>
                </li>
                <li class="page-item active">
                    <a class="page-link bg-danger border-danger text-white rounded-0" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link bg-black border-secondary text-white rounded-0" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link bg-black border-secondary text-white rounded-0" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link bg-black border-secondary text-white rounded-0" href="#">Sau</a>
                </li>
            </ul>
        </nav>

    </main>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmDelete() {
            if (confirm("Bạn có chắc chắn muốn xóa bản ghi này?")) {
                alert("Đã xóa bản ghi thành công!");
            }
        }
    </script>
</body>
</html>
