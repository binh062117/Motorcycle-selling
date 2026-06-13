<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Hãng Xe</title>
    
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
            <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/manage-brand.jsp">
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
                <h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Quản Lý Danh Mục Hãng Xe</h2>
                <p class="text-secondary mt-1">Thiết lập hồ sơ sản xuất đại lý hoặc thương hiệu.</p>
            </div>
            
            <button onclick="openBrandModal('add')" class="btn btn-ducati px-4 py-3 d-flex align-items-center gap-2">
                <span class="material-symbols-outlined fs-5">add_circle</span>
                <span>Thêm hãng xe mới</span>
            </button>
        </header>

        <!-- Brands List Table -->
        <section class="card card-ducati overflow-hidden mb-4">
            <div class="table-responsive">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                        <tr>
                            <th class="px-4 py-3">Thương hiệu</th>
                            <th class="px-4 py-3">Xuất xứ quốc gia</th>
                            <th class="px-4 py-3">Số lượng dòng xe đang bán</th>
                            <th class="px-4 py-3 text-end">Hành động</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-secondary">
                        
                        <tr class="cart-item-row">
                            <td class="px-4 py-4 fw-bold text-white fs-6">DUCATI</td>
                            <td class="px-4 py-4 text-uppercase text-muted">Ý (Italy)</td>
                            <td class="px-4 py-4 fw-semibold text-white">12 cấu hình</td>
                            <td class="px-4 py-4 text-end">
                                <div class="d-flex justify-content-end gap-2">
                                    <button onclick="openBrandModal('edit', 'DUCATI', 'Ý')" class="btn btn-sm btn-outline-light rounded-0 p-2 d-flex align-items-center justify-content-center">
                                        <span class="material-symbols-outlined fs-6">edit</span>
                                    </button>
                                    <button onclick="confirmDeleteBrand('DUCATI')" class="btn btn-sm btn-outline-danger rounded-0 p-2 d-flex align-items-center justify-content-center">
                                        <span class="material-symbols-outlined fs-6">delete</span>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <tr class="cart-item-row">
                            <td class="px-4 py-4 fw-bold text-white fs-6">HONDA</td>
                            <td class="px-4 py-4 text-uppercase text-muted">Nhật Bản (Japan)</td>
                            <td class="px-4 py-4 fw-semibold text-white">32 cấu hình</td>
                            <td class="px-4 py-4 text-end">
                                <div class="d-flex justify-content-end gap-2">
                                    <button onclick="openBrandModal('edit', 'HONDA', 'Nhật Bản')" class="btn btn-sm btn-outline-light rounded-0 p-2 d-flex align-items-center justify-content-center">
                                        <span class="material-symbols-outlined fs-6">edit</span>
                                    </button>
                                    <button onclick="confirmDeleteBrand('HONDA')" class="btn btn-sm btn-outline-danger rounded-0 p-2 d-flex align-items-center justify-content-center">
                                        <span class="material-symbols-outlined fs-6">delete</span>
                                    </button>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </section>

    </main>

    <!-- CRUD Brand Modal Form -->
    <div class="modal fade" id="brandModal" tabindex="-1" aria-labelledby="brandModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content card-ducati border border-secondary racing-stripe">
                <div class="modal-header border-bottom border-secondary">
                    <h5 class="modal-title font-heading text-white text-uppercase fw-bold fs-5" id="brandModalLabel">Cấu Hình Hãng Xe</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="${pageContext.request.contextPath}/admin/manage-brand" method="post" class="needs-validation-custom" novalidate>
                    <div class="modal-body">
                        <input type="hidden" name="action" id="brandActionInput" value="insert"/>
                        <input type="hidden" name="txtBrandId" id="brandIdInput" value=""/>

                        <div class="mb-3">
                            <label for="brand-form-name" class="form-label font-heading text-uppercase small text-muted">Tên hãng xe</label>
                            <input name="txtBrandName" id="brand-form-name" class="form-control bg-black border-secondary text-white rounded-0" placeholder="HONDA" required type="text"/>
                        </div>
                        
                        <div class="mb-3">
                            <label for="brand-form-origin" class="form-label font-heading text-uppercase small text-muted">Quốc gia xuất xứ</label>
                            <input name="txtBrandOrigin" id="brand-form-origin" class="form-control bg-black border-secondary text-white rounded-0" placeholder="NHẬT BẢN" required type="text"/>
                        </div>
                    </div>
                    <div class="modal-footer border-top border-secondary">
                        <button type="button" class="btn btn-secondary rounded-0 font-mono-data text-uppercase small py-2 px-3 border-0" data-bs-dismiss="modal">Hủy bỏ</button>
                        <button type="submit" class="btn btn-ducati rounded-0 font-mono-data text-uppercase small py-2 px-3">Xác nhận</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let brandBsModal;
        document.addEventListener('DOMContentLoaded', function() {
            brandBsModal = new bootstrap.Modal(document.getElementById('brandModal'));
        });

        function openBrandModal(mode, name = '', origin = '') {
            const title = document.getElementById('brandModalLabel');
            const actionInput = document.getElementById('brandActionInput');
            
            if (mode === 'add') {
                title.textContent = 'Thêm hãng xe mới';
                actionInput.value = 'insert';
                document.getElementById('brand-form-name').value = '';
                document.getElementById('brand-form-origin').value = '';
            } else {
                title.textContent = 'Cập nhật hãng xe';
                actionInput.value = 'update';
                document.getElementById('brand-form-name').value = name;
                document.getElementById('brand-form-origin').value = origin;
            }
            brandBsModal.show();
        }

        function confirmDeleteBrand(brandName) {
            if (confirm(`Bạn có chắc chắn muốn xóa hãng xe ${brandName} khỏi hệ thống?`)) {
                alert('Đã xóa thành công!');
            }
        }
    </script>
</body>
</html>
