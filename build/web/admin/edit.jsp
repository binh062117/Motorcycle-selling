<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Chỉnh Sửa Bản Ghi</title>
    
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
        
        <header class="mb-5">
            <h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Chỉnh Sửa Bản Ghi</h2>
            <p class="text-secondary mt-1">Cập nhật thông tin chi tiết của bản ghi hiện tại trong hệ thống.</p>
        </header>

        <section class="card card-ducati p-4 mb-4 racing-stripe">
            <form action="${pageContext.request.contextPath}/admin/list.jsp" method="post" enctype="multipart/form-data" class="needs-validation-custom" novalidate>
                <div class="row g-4">
                    
                    <div class="col-12 col-md-6">
                        <div class="mb-3">
                            <label for="txtName" class="form-label font-heading text-uppercase small text-muted">Tên bản ghi</label>
                            <input name="txtName" id="txtName" class="form-control bg-black border-secondary text-white rounded-0" value="Cấu hình máy Panigale V4 R" required type="text"/>
                            <div class="invalid-feedback font-mono-data uppercase" style="font-size: 10px;">Vui lòng nhập tên bản ghi hợp lệ.</div>
                        </div>

                        <div class="mb-3">
                            <label for="txtCategory" class="form-label font-heading text-uppercase small text-muted">Danh mục</label>
                            <select name="txtCategory" id="txtCategory" class="form-select bg-black border-secondary text-white rounded-0" required>
                                <option value="" disabled>-- Chọn danh mục --</option>
                                <option value="superbike" selected>Superbike</option>
                                <option value="streetfighter">Streetfighter</option>
                                <option value="accessory">Phụ tùng</option>
                            </select>
                            <div class="invalid-feedback font-mono-data uppercase" style="font-size: 10px;">Vui lòng chọn danh mục.</div>
                        </div>

                        <div class="mb-3">
                            <label for="txtDescription" class="form-label font-heading text-uppercase small text-muted">Mô tả chi tiết</label>
                            <textarea name="txtDescription" id="txtDescription" rows="4" class="form-control bg-black border-secondary text-white rounded-0" required>Động cơ Desmosedici Stradale R dung tích 998 cc, sản sinh công suất 218 mã lực tại 15.500 vòng/phút.</textarea>
                            <div class="invalid-feedback font-mono-data uppercase" style="font-size: 10px;">Vui lòng nhập mô tả chi tiết.</div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="mb-3">
                            <label for="fileImage" class="form-label font-heading text-uppercase small text-muted">Thay đổi hình ảnh minh họa (Không bắt buộc)</label>
                            <input name="fileImage" id="fileImage" class="form-control bg-black border-secondary text-white rounded-0" type="file" accept="image/*"/>
                        </div>

                        <div class="mb-3">
                            <span class="d-block font-heading text-uppercase small text-muted mb-2">Xem trước hình ảnh</span>
                            <div class="border border-secondary bg-black bg-opacity-50 d-flex align-items-center justify-content-center overflow-hidden position-relative" style="height: 180px;">
                                <img id="imagePreview" src="https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?q=80&w=600" alt="Image Preview" class="img-fluid" style="max-height: 100%; object-fit: contain;"/>
                                <span id="previewPlaceholder" class="text-muted font-mono-data small uppercase d-none">Chưa chọn ảnh</span>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="border-top border-secondary pt-4 mt-4 d-flex justify-content-end gap-3">
                    <a href="${pageContext.request.contextPath}/admin/list.jsp" class="btn btn-secondary rounded-0 font-mono-data text-uppercase small py-2 px-4 border-0">Quay lại</a>
                    <button type="submit" class="btn btn-ducati rounded-0 font-mono-data text-uppercase small py-2 px-4">Lưu thay đổi</button>
                </div>
            </form>
        </section>

    </main>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('fileImage').addEventListener('change', function(event) {
            const file = event.target.files[0];
            const preview = document.getElementById('imagePreview');
            const placeholder = document.getElementById('previewPlaceholder');

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.classList.remove('d-none');
                    placeholder.classList.add('d-none');
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>
