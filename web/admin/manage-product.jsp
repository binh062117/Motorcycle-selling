<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Kho Xe Máy</title>
    
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
            <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/manage-product.jsp">
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

    <!-- Main Content Grid -->
    <main class="admin-main">
        
        <!-- Header -->
        <header class="d-flex justify-content-between align-items-end mb-5 flex-wrap gap-3">
            <div>
                <h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Quản Lý Kho Xe Máy</h2>
                <p class="text-secondary mt-1">Thêm mới, sửa đổi cấu hình hoặc điều tiết trạng thái dòng xe.</p>
            </div>
            
            <button onclick="openProductModal('add')" class="btn btn-ducati px-4 py-3 d-flex align-items-center gap-2">
                <span class="material-symbols-outlined fs-5">add_circle</span>
                <span>Thêm xe máy mới</span>
            </button>
        </header>

        <!-- Filters Grid -->
        <section class="card card-ducati p-4 mb-4">
            <div class="row g-3">
                <div class="col-12 col-md-6 position-relative">
                    <span class="material-symbols-outlined position-absolute top-50 start-0 translate-middle-y ms-3 text-muted">search</span>
                    <input class="form-control bg-black border-secondary text-white font-mono-data rounded-0 ps-5 uppercase" placeholder="TÌM KIẾM THEO MẪU XE, HÃNG HOẶC MÃ SKU..." type="text"/>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase">
                        <option>Tất cả danh mục</option>
                        <option>Superbike</option>
                        <option>Streetfighter</option>
                        <option>Multistrada</option>
                    </select>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase">
                        <option>Sắp xếp: Giá bán</option>
                        <option>Sắp xếp: Số lượng</option>
                        <option>Sắp xếp: SKU</option>
                    </select>
                </div>
            </div>
        </section>

        <!-- Product Inventory Data Table -->
        <div class="table-responsive border border-secondary bg-black bg-opacity-50">
            <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                    <tr>
                        <th class="px-4 py-3">Ảnh xe</th>
                        <th class="px-4 py-3">Tên mẫu xe & SKU</th>
                        <th class="px-4 py-3">Phân loại</th>
                        <th class="px-4 py-3">Giá niêm yết (MSRP)</th>
                        <th class="px-4 py-3">Kho hàng</th>
                        <th class="px-4 py-3 text-end">Hành động</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-secondary">
                    
                    <!-- Row 1 -->
                    <tr class="cart-item-row">
                        <td class="px-4 py-3">
                            <div class="bg-dark border border-secondary overflow-hidden" style="width: 80px; height: 56px;">
                                <img alt="Panigale V4 R photo" class="w-100 h-100 object-fit-cover" style="object-fit: cover; filter: grayscale(100%);" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA0ApTjhQpyKZK8nfwN1PRIec1ll4spQ1zez8IgIrv_0SPOcBkQNCnR5yxryTLtnZDKfM-kTHtGX0xCa_9G88NTBPFayf0SE6qhrVS9N8xujCTo7cEdRZNSzTYxiRMasEoS6sDnvqNwqca4tLkMt_t0Tjm8X2KpbJEqn2s0vx_TPEouCqm12nhhZRPhqpcK9zS1p2PoI5-VCQsM6H-j4md62kNJjIPjIXsCLxVSjOvQzyh1Dz3Jc629LOSuaECXnQ8ge0ns2Mvnu47p"/>
                            </div>
                        </td>
                        <td class="px-4 py-3">
                            <div class="d-flex flex-column">
                                <span class="font-heading fs-6 fw-bold text-white uppercase">Panigale V4 R</span>
                                <span class="text-muted small uppercase" style="font-size:10px;">SKU: DUC-PV4R-2026</span>
                            </div>
                        </td>
                        <td class="px-4 py-3">
                            <span class="badge bg-secondary rounded-0 uppercase">Superbike</span>
                        </td>
                        <td class="px-4 py-3 fw-bold text-danger">1.250.000.000đ</td>
                        <td class="px-4 py-3">
                            <div class="d-flex align-items-center gap-2">
                                <span class="d-inline-block rounded-circle bg-success" style="width: 8px; height: 8px; box-shadow: 0 0 8px rgba(34,197,94,0.6);"></span>
                                <span class="text-success small uppercase">Còn 12 xe</span>
                            </div>
                        </td>
                        <td class="px-4 py-3 text-end">
                            <div class="d-inline-flex gap-2">
                                <button onclick="openProductModal('edit')" class="btn btn-outline-secondary p-2 rounded-0 border-0 hover-text-white">
                                    <span class="material-symbols-outlined fs-5">edit</span>
                                </button>
                                <button onclick="confirmDeleteBike('Panigale V4 R')" class="btn btn-outline-secondary p-2 rounded-0 border-0 text-danger hover-text-danger">
                                    <span class="material-symbols-outlined fs-5">delete</span>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 2 -->
                    <tr class="cart-item-row">
                        <td class="px-4 py-3">
                            <div class="bg-dark border border-secondary overflow-hidden" style="width: 80px; height: 56px;">
                                <img alt="Monster SP photo" class="w-100 h-100 object-fit-cover" style="object-fit: cover; filter: grayscale(100%);" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4"/>
                            </div>
                        </td>
                        <td class="px-4 py-3">
                            <div class="d-flex flex-column">
                                <span class="font-heading fs-6 fw-bold text-white uppercase">Monster SP</span>
                                <span class="text-muted small uppercase" style="font-size:10px;">SKU: DUC-MON-2026</span>
                            </div>
                        </td>
                        <td class="px-4 py-3">
                            <span class="badge bg-secondary rounded-0 uppercase">Monster</span>
                        </td>
                        <td class="px-4 py-3 fw-bold text-danger">455.000.000đ</td>
                        <td class="px-4 py-3">
                            <div class="d-flex align-items-center gap-2">
                                <span class="d-inline-block rounded-circle bg-success" style="width: 8px; height: 8px; box-shadow: 0 0 8px rgba(34,197,94,0.6);"></span>
                                <span class="text-success small uppercase">Còn 8 xe</span>
                            </div>
                        </td>
                        <td class="px-4 py-3 text-end">
                            <div class="d-inline-flex gap-2">
                                <button onclick="openProductModal('edit')" class="btn btn-outline-secondary p-2 rounded-0 border-0 hover-text-white">
                                    <span class="material-symbols-outlined fs-5">edit</span>
                                </button>
                                <button onclick="confirmDeleteBike('Monster SP')" class="btn btn-outline-secondary p-2 rounded-0 border-0 text-danger hover-text-danger">
                                    <span class="material-symbols-outlined fs-5">delete</span>
                                </button>
                            </div>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
        
    </main>

    <!-- CRUD Form Dialog Modal Overlay -->
    <div class="modal fade" id="product-modal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content card-ducati border-secondary racing-stripe">
                <div class="modal-header">
                    <h3 id="modal-title" class="font-heading fs-5 text-uppercase text-white fw-bold">CẤU HÌNH THÊM XE MỚI</h3>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <form action="${pageContext.request.contextPath}/admin/manage-product" method="post" enctype="multipart/form-data" class="needs-validation-custom" novalidate>
                    <div class="modal-body d-flex flex-column gap-4">
                        <!-- Action Flag for Controller: Add or Edit -->
                        <input type="hidden" name="action" id="modalActionInput" value="insert"/>
                        <input type="hidden" name="txtProductId" id="modalProductIdInput" value=""/>

                        <!-- Grid Details -->
                        <div class="row g-3 font-mono-data text-xs">
                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Tên dòng xe máy</label>
                                <input name="txtProductName" id="form-name" class="form-control bg-black border-secondary text-white rounded-0 uppercase" placeholder="PANIGALE V4 R" required type="text"/>
                            </div>
                            
                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Mã hãng sản xuất (Brand)</label>
                                <select name="txtBrandId" id="form-brand" class="form-select bg-black border-secondary text-white rounded-0 text-uppercase">
                                    <option value="1">Ducati (Ý)</option>
                                    <option value="2">Honda (Nhật)</option>
                                    <option value="3">Yamaha (Nhật)</option>
                                    <option value="4">Suzuki (Nhật)</option>
                                </select>
                            </div>

                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Danh mục / Phân khúc</label>
                                <select name="txtCategoryId" id="form-category" class="form-select bg-black border-secondary text-white rounded-0 text-uppercase">
                                    <option value="1">Superbike</option>
                                    <option value="2">Streetfighter</option>
                                    <option value="3">Multistrada</option>
                                    <option value="4">DesertX</option>
                                </select>
                            </div>

                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Giá bán đề xuất (VNĐ)</label>
                                <input name="txtPrice" id="form-price" class="form-control bg-black border-secondary text-white rounded-0" placeholder="1250000000" required type="number"/>
                            </div>

                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Số lượng tồn kho</label>
                                <input name="txtStock" id="form-stock" class="form-control bg-black border-secondary text-white rounded-0" placeholder="12" required type="number"/>
                            </div>
                            
                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Mã số định danh (SKU)</label>
                                <input name="txtSku" id="form-sku" class="form-control bg-black border-secondary text-white rounded-0 uppercase" placeholder="DUC-PV4R-2026" required type="text"/>
                            </div>
                        </div>

                        <!-- Engine Specifications -->
                        <div class="border-top border-secondary pt-3">
                            <h4 class="font-heading text-danger text-uppercase tracking-wider small fw-bold mb-3">Thông số động cơ kỹ thuật</h4>
                            <div class="row g-3 font-mono-data text-xs">
                                <div class="col-12 col-md-4">
                                    <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Dung tích xi lanh</label>
                                    <input name="txtDisplacement" id="form-disp" class="form-control bg-black border-secondary text-white rounded-0" placeholder="998 cc" type="text"/>
                                </div>
                                <div class="col-12 col-md-4">
                                    <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Công suất tối đa</label>
                                    <input name="txtHorsepower" id="form-hp" class="form-control bg-black border-secondary text-white rounded-0" placeholder="218 cv" type="text"/>
                                </div>
                                <div class="col-12 col-md-4">
                                    <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Khối lượng khô</label>
                                    <input name="txtWeight" id="form-weight" class="form-control bg-black border-secondary text-white rounded-0" placeholder="175 kg" type="text"/>
                                </div>
                            </div>
                        </div>

                        <!-- Image upload input -->
                        <div class="border-top border-secondary pt-3 font-mono-data">
                            <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Hình ảnh đại diện của xe</label>
                            <input name="fileImage" class="form-control bg-black border-secondary text-white rounded-0 preview-image-input" data-preview-target="bike-preview-img" type="file"/>
                            <div class="mt-3 text-center">
                                <img id="bike-preview-img" class="d-none bg-dark border border-secondary" style="max-width: 200px; height: auto;" src="" alt="Bike Preview"/>
                            </div>
                        </div>
                    </div>

                    <!-- Action Button Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-ducati border-secondary py-2" data-bs-dismiss="modal">Hủy bỏ</button>
                        <button type="submit" class="btn btn-ducati py-2">Xác nhận cập nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/validation.js"></script>
    <script>
        let productModal;
        document.addEventListener('DOMContentLoaded', () => {
            productModal = new bootstrap.Modal(document.getElementById('product-modal'));
        });

        function openProductModal(mode) {
            const title = document.getElementById('modal-title');
            const actionInput = document.getElementById('modalActionInput');
            const previewImg = document.getElementById('bike-preview-img');
            
            previewImg.classList.add('d-none');
            previewImg.src = '';
            
            if (mode === 'add') {
                title.textContent = 'Cấu hình thêm xe mới';
                actionInput.value = 'insert';
                
                document.getElementById('form-name').value = '';
                document.getElementById('form-price').value = '';
                document.getElementById('form-stock').value = '';
                document.getElementById('form-sku').value = '';
                document.getElementById('form-disp').value = '';
                document.getElementById('form-hp').value = '';
                document.getElementById('form-weight').value = '';
            } else {
                title.textContent = 'Cập nhật thông tin xe máy';
                actionInput.value = 'update';
                
                document.getElementById('form-name').value = 'Panigale V4 R';
                document.getElementById('form-price').value = '1250000000';
                document.getElementById('form-stock').value = '12';
                document.getElementById('form-sku').value = 'DUC-PV4R-2026';
                document.getElementById('form-disp').value = '998 cc';
                document.getElementById('form-hp').value = '218 cv';
                document.getElementById('form-weight').value = '175 kg';
            }
            productModal.show();
        }

        function confirmDeleteBike(bikeName) {
            // Use custom modal confirm from main.js if loaded or standard browser confirm
            if (window.confirmDeleteModal) {
                confirmDeleteModal(`xe máy ${bikeName}`, () => {
                    // Send request to backend
                    window.location.href = '${pageContext.request.contextPath}/admin/manage-product?action=delete&name=' + encodeURIComponent(bikeName);
                });
            } else {
                if (confirm(`Bạn có chắc chắn muốn xóa xe ${bikeName}?`)) {
                    window.location.href = '${pageContext.request.contextPath}/admin/manage-product?action=delete&name=' + encodeURIComponent(bikeName);
                }
            }
        }
    </script>
</body>
</html>
