<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Kho Xe Máy</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;600;700;800&family=Geist:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "secondary-fixed": "#e2e2e2",
                        "on-primary-container": "#ffe0dd",
                        "on-secondary-fixed": "#1b1b1b",
                        "surface-container-low": "#1a1c1c",
                        "inverse-surface": "#e2e2e2",
                        "on-primary-fixed-variant": "#93000f",
                        "on-secondary": "#303030",
                        "on-background": "#e2e2e2",
                        "surface-container": "#1e2020",
                        "secondary-container": "#474747",
                        "inverse-on-surface": "#2f3131",
                        "error-container": "#93000a",
                        "surface-container-highest": "#333535",
                        "tertiary": "#c8c6c5",
                        "primary-fixed": "#ffdad6",
                        "on-tertiary-container": "#e9e6e6",
                        "tertiary-container": "#686767",
                        "primary-fixed-dim": "#ffb3ac",
                        "secondary": "#c6c6c6",
                        "on-secondary-fixed-variant": "#474747",
                        "on-primary-fixed": "#410003",
                        "on-error": "#690005",
                        "on-error-container": "#ffdad6",
                        "surface-tint": "#ffb3ac",
                        "on-secondary-container": "#b5b5b5",
                        "primary-container": "#ce131f",
                        "surface-container-lowest": "#0c0f0f",
                        "secondary-fixed-dim": "#c6c6c6",
                        "background": "#121414",
                        "surface-variant": "#333535",
                        "surface": "#121414",
                        "on-tertiary": "#303030",
                        "outline": "#ad8884",
                        "error": "#ffb4ab",
                        "on-surface-variant": "#e6bdb9",
                        "on-tertiary-fixed-variant": "#474646",
                        "tertiary-fixed": "#e4e2e1",
                        "tertiary-fixed-dim": "#c8c6c5",
                        "surface-container-high": "#282a2b",
                        "surface-dim": "#121414",
                        "primary": "#ffb3ac",
                        "inverse-primary": "#c00017",
                        "on-tertiary-fixed": "#1b1c1c",
                        "outline-variant": "#5d3f3c",
                        "on-surface": "#e2e2e2",
                        "on-primary": "#680007",
                        "surface-bright": "#38393a"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    "spacing": {
                        "container-max": "1440px",
                        "gutter": "24px",
                        "unit": "8px",
                        "margin-mobile": "20px",
                        "margin-desktop": "64px"
                    },
                    "fontFamily": {
                        "mono-data": ["Geist"],
                        "headline-lg-mobile": ["Sora"],
                        "body-sm": ["Geist"],
                        "body-lg": ["Geist"],
                        "label-md": ["Geist"],
                        "body-md": ["Geist"],
                        "headline-sm": ["Sora"],
                        "display-lg": ["Sora"],
                        "headline-lg": ["Sora"],
                        "headline-md": ["Sora"]
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-background text-on-background font-body-md overflow-x-hidden">

    <!-- Left Sidebar Admin Navigation -->
    <aside class="fixed left-0 top-0 h-full w-64 bg-surface-container-lowest border-r border-surface-variant z-50 flex flex-col py-8">
        <div class="px-6 mb-10 select-none">
            <h1 class="font-headline-sm text-headline-sm font-black text-primary-container tracking-tighter uppercase">QUẢN TRỊ VIÊN</h1>
            <p class="font-mono-data text-mono-data uppercase text-on-surface-variant text-[10px]">Hệ thống vận hành chính</p>
        </div>
        <nav class="flex-1 space-y-1">
            <a class="flex items-center gap-4 text-on-surface-variant hover:bg-surface-container px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/dashboard.jsp">
                <span class="material-symbols-outlined">dashboard</span>
                <span>TỔNG QUAN</span>
            </a>
            <!-- Active State: Bike Management -->
            <a class="flex items-center gap-4 bg-primary-container text-white border-l-4 border-primary px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/manage-product.jsp">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">motorcycle</span>
                <span>QUẢN LÝ XE</span>
            </a>
            <a class="flex items-center gap-4 text-on-surface-variant hover:bg-surface-container px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/manage-brand.jsp">
                <span class="material-symbols-outlined">settings_input_component</span>
                <span>HÃNG XE</span>
            </a>
            <a class="flex items-center gap-4 text-on-surface-variant hover:bg-surface-container px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/manage-order.jsp">
                <span class="material-symbols-outlined">shopping_bag</span>
                <span>ĐƠN ĐẶT LỊCH</span>
            </a>
            <a class="flex items-center gap-4 text-on-surface-variant hover:bg-surface-container px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/manage-user.jsp">
                <span class="material-symbols-outlined">group</span>
                <span>NGƯỜI DÙNG</span>
            </a>
        </nav>
        
        <div class="px-6 mt-auto">
            <div class="mt-8 flex items-center gap-3 pt-6 border-t border-surface-variant">
                <div class="w-10 h-10 rounded-full bg-surface-variant flex items-center justify-center overflow-hidden">
                    <img alt="Admin Headshot" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuB6tW6MHhZVy1ux7y__g4OV3-P-eyQwgTV2Tz60fAEWIJXh2ozkPlPHokZrJdQBgjZqnNtTdDUqe0UNuMzQRuQWZrGkfoBO02I-ujF8m8K5ToHl4oahxYuaBpWv83eI9_5qlHcbXiaRv3sLXADJh9THS7l_bgLGhaJ9jePovnNGDVJ17FBRfbgdn22hd2N2CVJCGUrJVy0vENo47gbqCJouK5pWsPcQpKH_8gfVsudSmsTguOg8bqKUFSoNKFTy-k-TDHTxcNXfR0AP"/>
                </div>
                <div>
                    <p class="font-label-md text-label-md text-on-surface uppercase">Kỹ sư Enzo</p>
                    <p class="font-body-sm text-[10px] text-on-surface-variant uppercase">Quản trị cấp cao</p>
                </div>
            </div>
        </div>
    </aside>

    <!-- Main Content Grid -->
    <main class="ml-64 min-h-screen p-margin-desktop bg-background">
        
        <!-- Header -->
        <header class="flex justify-between items-end mb-12">
            <div>
                <h2 class="font-headline-lg text-headline-sm md:text-headline-lg uppercase tracking-tight text-white font-extrabold">Quản Lý Kho Xe Máy</h2>
                <p class="font-body-md text-on-surface-variant">Thêm mới, sửa đổi cấu hình hoặc điều tiết trạng thái dòng xe.</p>
            </div>
            
            <button onclick="openProductModal('add')" class="bg-primary-container hover:bg-red-700 text-white font-label-md text-label-md uppercase px-8 py-4 flex items-center gap-3 transition-all active:scale-95 shadow-lg shadow-red-900/20 font-bold">
                <span class="material-symbols-outlined">add_circle</span>
                <span>Thêm xe máy mới</span>
            </button>
        </header>

        <!-- Filters Grid -->
        <section class="bg-surface-container border border-surface-variant p-6 mb-8 flex flex-col md:flex-row gap-gutter items-center">
            <div class="relative flex-1 w-full font-mono-data">
                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-on-surface-variant">search</span>
                <input class="w-full bg-black border border-surface-variant focus:border-on-surface text-on-surface pl-12 pr-4 py-3 outline-none uppercase transition-all" placeholder="TÌM KIẾM THEO MẪU XE, HÃNG HOẶC MÃ SKU..." type="text"/>
            </div>
            <div class="flex gap-4 w-full md:w-auto font-mono-data">
                <select class="bg-black border border-surface-variant text-on-surface px-4 py-3 outline-none uppercase min-w-[160px]">
                    <option>Tất cả danh mục</option>
                    <option>Superbike</option>
                    <option>Streetfighter</option>
                    <option>Multistrada</option>
                </select>
                <select class="bg-black border border-surface-variant text-on-surface px-4 py-3 outline-none uppercase min-w-[160px]">
                    <option>Sắp xếp: Giá bán</option>
                    <option>Sắp xếp: Số lượng</option>
                    <option>Sắp xếp: SKU</option>
                </select>
            </div>
        </section>

        <!-- Product Inventory Data Table -->
        <div class="bg-surface-container-lowest border border-surface-variant overflow-hidden font-mono-data text-mono-data">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-surface-container font-label-md text-label-md uppercase text-on-surface-variant border-b border-surface-variant">
                        <th class="px-6 py-4 font-semibold">Ảnh xe</th>
                        <th class="px-6 py-4 font-semibold">Tên mẫu xe & SKU</th>
                        <th class="px-6 py-4 font-semibold">Phân loại</th>
                        <th class="px-6 py-4 font-semibold">Giá niêm yết (MSRP)</th>
                        <th class="px-6 py-4 font-semibold">Kho hàng</th>
                        <th class="px-6 py-4 font-semibold text-right">Hành động</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-surface-variant/30">
                    
                    <!-- Row 1 -->
                    <tr class="hover:bg-surface-container-low transition-colors group">
                        <td class="px-6 py-4">
                            <div class="w-24 h-16 bg-black border border-surface-variant overflow-hidden shrink-0">
                                <img alt="Panigale V4 R photo" class="w-full h-full object-cover grayscale hover:grayscale-0 transition-all duration-500" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA0ApTjhQpyKZK8nfwN1PRIec1ll4spQ1zez8IgIrv_0SPOcBkQNCnR5yxryTLtnZDKfM-kTHtGX0xCa_9G88NTBPFayf0SE6qhrVS9N8xujCTo7cEdRZNSzTYxiRMasEoS6sDnvqNwqca4tLkMt_t0Tjm8X2KpbJEqn2s0vx_TPEouCqm12nhhZRPhqpcK9zS1p2PoI5-VCQsM6H-j4md62kNJjIPjIXsCLxVSjOvQzyh1Dz3Jc629LOSuaECXnQ8ge0ns2Mvnu47p"/>
                            </div>
                        </td>
                        <td class="px-6 py-4">
                            <div class="flex flex-col">
                                <span class="font-headline-sm text-[18px] text-white tracking-tight font-semibold">Panigale V4 R</span>
                                <span class="text-[12px] text-on-surface-variant uppercase mt-1">SKU: DUC-PV4R-2026</span>
                            </div>
                        </td>
                        <td class="px-6 py-4">
                            <span class="px-3 py-1 bg-surface-variant/50 text-white uppercase text-[12px]">Superbike</span>
                        </td>
                        <td class="px-6 py-4 font-bold text-white text-lg">1.250.000.000đ</td>
                        <td class="px-6 py-4">
                            <div class="flex items-center gap-2">
                                <span class="w-2 h-2 rounded-full bg-green-500 shadow-[0_0_8px_rgba(34,197,94,0.6)]"></span>
                                <span class="text-green-500 uppercase text-[12px]">Còn 12 xe</span>
                            </div>
                        </td>
                        <td class="px-6 py-4 text-right">
                            <div class="flex justify-end gap-2">
                                <button onclick="openProductModal('edit')" class="p-2 hover:bg-surface-variant text-on-surface-variant hover:text-white transition-all" title="Chỉnh sửa">
                                    <span class="material-symbols-outlined text-[18px]">edit</span>
                                </button>
                                <button onclick="confirmDeleteBike('Panigale V4 R')" class="p-2 hover:bg-error-container/20 text-error transition-all" title="Xóa">
                                    <span class="material-symbols-outlined text-[18px]">delete</span>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 2 -->
                    <tr class="hover:bg-surface-container-low transition-colors group">
                        <td class="px-6 py-4">
                            <div class="w-24 h-16 bg-black border border-surface-variant overflow-hidden shrink-0">
                                <img alt="Monster SP photo" class="w-full h-full object-cover grayscale hover:grayscale-0 transition-all duration-500" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4"/>
                            </div>
                        </td>
                        <td class="px-6 py-4">
                            <div class="flex flex-col">
                                <span class="font-headline-sm text-[18px] text-white tracking-tight font-semibold">Monster SP</span>
                                <span class="text-[12px] text-on-surface-variant uppercase mt-1">SKU: DUC-MON-2026</span>
                            </div>
                        </td>
                        <td class="px-6 py-4">
                            <span class="px-3 py-1 bg-surface-variant/50 text-white uppercase text-[12px]">Monster</span>
                        </td>
                        <td class="px-6 py-4 font-bold text-white text-lg">455.000.000đ</td>
                        <td class="px-6 py-4">
                            <div class="flex items-center gap-2">
                                <span class="w-2 h-2 rounded-full bg-green-500 shadow-[0_0_8px_rgba(34,197,94,0.6)]"></span>
                                <span class="text-green-500 uppercase text-[12px]">Còn 8 xe</span>
                            </div>
                        </td>
                        <td class="px-6 py-4 text-right">
                            <div class="flex justify-end gap-2">
                                <button onclick="openProductModal('edit')" class="p-2 hover:bg-surface-variant text-on-surface-variant hover:text-white transition-all">
                                    <span class="material-symbols-outlined text-[18px]">edit</span>
                                </button>
                                <button onclick="confirmDeleteBike('Monster SP')" class="p-2 hover:bg-error-container/20 text-error transition-all">
                                    <span class="material-symbols-outlined text-[18px]">delete</span>
                                </button>
                            </div>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
        
    </main>

    <!-- CRUD Form Dialog Modal Overlay (Hidden by default) -->
    <div id="product-modal" class="hidden fixed inset-0 z-50 overflow-y-auto bg-black/80 backdrop-blur-sm flex items-center justify-center p-4">
        
        <!-- Modal Card Container -->
        <div class="bg-surface-container border border-surface-variant w-full max-w-3xl p-8 relative overflow-hidden racing-stripe animate-fade-in my-8">
            
            <header class="flex justify-between items-center border-b border-surface-variant pb-4 mb-6 select-none">
                <h3 id="modal-title" class="font-headline-sm text-headline-sm uppercase text-white font-extrabold">CẤU HÌNH THÊM XE MỚI</h3>
                <button onclick="closeProductModal()" class="text-on-surface-variant hover:text-white">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </header>
            
            <form action="${pageContext.request.contextPath}/admin/manage-product" method="post" enctype="multipart/form-data" class="space-y-6">
                <!-- Action Flag for Controller: Add or Edit -->
                <input type="hidden" name="action" id="modalActionInput" value="insert"/>
                <input type="hidden" name="txtProductId" id="modalProductIdInput" value=""/>

                <!-- Grid Details -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 font-mono-data text-xs">
                    
                    <div class="space-y-2">
                        <label class="font-label-md text-[11px] text-on-surface-variant uppercase tracking-wider block">Tên dòng xe máy</label>
                        <input name="txtProductName" id="form-name" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none uppercase" placeholder="PANIGALE V4 R" required type="text"/>
                    </div>
                    
                    <div class="space-y-2">
                        <label class="font-label-md text-[11px] text-on-surface-variant uppercase tracking-wider block">Mã hãng sản xuất (Brand)</label>
                        <select name="txtBrandId" id="form-brand" class="w-full bg-black border border-surface-variant text-on-surface px-4 py-3 outline-none uppercase">
                            <option value="1">Ducati (Ý)</option>
                            <option value="2">Honda (Nhật)</option>
                            <option value="3">Yamaha (Nhật)</option>
                            <option value="4">Suzuki (Nhật)</option>
                        </select>
                    </div>

                    <div class="space-y-2">
                        <label class="font-label-md text-[11px] text-on-surface-variant uppercase tracking-wider block">Danh mục / Phân khúc</label>
                        <select name="txtCategoryId" id="form-category" class="w-full bg-black border border-surface-variant text-on-surface px-4 py-3 outline-none uppercase">
                            <option value="1">Superbike</option>
                            <option value="2">Streetfighter</option>
                            <option value="3">Multistrada</option>
                            <option value="4">DesertX</option>
                        </select>
                    </div>

                    <div class="space-y-2">
                        <label class="font-label-md text-[11px] text-on-surface-variant uppercase tracking-wider block">Giá bán đề xuất (VNĐ)</label>
                        <input name="txtPrice" id="form-price" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none" placeholder="1250000000" required type="number"/>
                    </div>

                    <div class="space-y-2">
                        <label class="font-label-md text-[11px] text-on-surface-variant uppercase tracking-wider block">Số lượng tồn kho</label>
                        <input name="txtStock" id="form-stock" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none" placeholder="12" required type="number"/>
                    </div>
                    
                    <div class="space-y-2">
                        <label class="font-label-md text-[11px] text-on-surface-variant uppercase tracking-wider block">Mã số định danh (SKU)</label>
                        <input name="txtSku" id="form-sku" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none uppercase" placeholder="DUC-PV4R-2026" required type="text"/>
                    </div>
                </div>

                <!-- Engine Specifications Bento -->
                <div class="border-t border-surface-variant pt-6 space-y-4 font-mono-data text-xs">
                    <h4 class="font-label-md text-label-md uppercase text-primary-container font-bold">Thông số động cơ kỹ thuật</h4>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="space-y-2">
                            <label class="font-label-md text-[11px] text-on-surface-variant uppercase block">Dung tích xi lanh</label>
                            <input name="txtDisplacement" id="form-disp" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none placeholder:text-surface-variant" placeholder="998 cc" type="text"/>
                        </div>
                        <div class="space-y-2">
                            <label class="font-label-md text-[11px] text-on-surface-variant uppercase block">Công suất tối đa</label>
                            <input name="txtHorsepower" id="form-hp" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none placeholder:text-surface-variant" placeholder="218 cv" type="text"/>
                        </div>
                        <div class="space-y-2">
                            <label class="font-label-md text-[11px] text-on-surface-variant uppercase block">Khối lượng khô</label>
                            <input name="txtWeight" id="form-weight" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none placeholder:text-surface-variant" placeholder="175 kg" type="text"/>
                        </div>
                    </div>
                </div>

                <!-- Image upload input -->
                <div class="space-y-2 font-mono-data text-xs pt-4 border-t border-surface-variant">
                    <label class="font-label-md text-[11px] text-on-surface-variant uppercase tracking-wider block">Hình ảnh đại diện của xe</label>
                    <input name="fileImage" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none cursor-pointer" type="file"/>
                </div>

                <!-- Action Button Footer -->
                <div class="pt-6 border-t border-surface-variant flex justify-end gap-4">
                    <button type="button" onclick="closeProductModal()" class="px-6 py-3 border border-surface-variant text-on-surface font-label-md uppercase tracking-wider hover:bg-surface-container">Hủy bỏ</button>
                    <button type="submit" class="px-8 py-3 bg-primary-container text-white font-label-md uppercase tracking-wider hover:brightness-110 active:scale-95 font-bold">Xác nhận cập nhật</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function openProductModal(mode) {
            const modal = document.getElementById('product-modal');
            const title = document.getElementById('modal-title');
            const actionInput = document.getElementById('modalActionInput');
            
            modal.classList.remove('hidden');
            
            if (mode === 'add') {
                title.textContent = 'Cấu hình thêm xe mới';
                actionInput.value = 'insert';
                // Clear fields
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
                // Pre-fill fields for illustration
                document.getElementById('form-name').value = 'Panigale V4 R';
                document.getElementById('form-price').value = '1250000000';
                document.getElementById('form-stock').value = '12';
                document.getElementById('form-sku').value = 'DUC-PV4R-2026';
                document.getElementById('form-disp').value = '998 cc';
                document.getElementById('form-hp').value = '218 cv';
                document.getElementById('form-weight').value = '175 kg';
            }
        }

        function closeProductModal() {
            document.getElementById('product-modal').classList.add('hidden');
        }

        function confirmDeleteBike(bikeName) {
            if (typeof Swal !== 'undefined') {
                Swal.fire({
                    title: 'Xóa xe máy?',
                    text: `Bạn có chắc chắn muốn xóa dòng xe ${bikeName} khỏi kho hệ thống không?`,
                    icon: 'warning',
                    showCancelButton: true,
                    background: '#1e2020',
                    color: '#e2e2e2',
                    confirmButtonColor: '#ce131f',
                    cancelButtonColor: '#474747',
                    confirmButtonText: 'Đồng ý xóa',
                    cancelButtonText: 'Hủy bỏ'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: 'Đã xóa!',
                            text: `Đã xóa cấu hình ${bikeName} khỏi kho dữ liệu.`,
                            icon: 'success',
                            background: '#1e2020',
                            color: '#e2e2e2',
                            confirmButtonColor: '#ce131f'
                        });
                    }
                });
            } else {
                if (confirm(`Bạn có chắc chắn muốn xóa xe ${bikeName}?`)) {
                    alert('Đã xóa thành công!');
                }
            }
        }
    </script>
</body>
</html>
