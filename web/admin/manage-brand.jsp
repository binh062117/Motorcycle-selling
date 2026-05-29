<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Hãng Xe</title>
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
            <a class="flex items-center gap-4 text-on-surface-variant hover:bg-surface-container px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/manage-product.jsp">
                <span class="material-symbols-outlined">motorcycle</span>
                <span>QUẢN LÝ XE</span>
            </a>
            <!-- Active State: Brand Management -->
            <a class="flex items-center gap-4 bg-primary-container text-white border-l-4 border-primary px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/manage-brand.jsp">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">settings_input_component</span>
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

    <!-- Main Content Area -->
    <main class="ml-64 min-h-screen p-margin-desktop bg-background">
        
        <!-- Header -->
        <header class="flex justify-between items-end mb-12">
            <div>
                <h2 class="font-headline-lg text-headline-sm md:text-headline-lg uppercase tracking-tight text-white font-extrabold">Quản Lý Danh Mục Hãng Xe</h2>
                <p class="font-body-md text-on-surface-variant">Thiết lập hồ sơ sản xuất đại lý hoặc thương hiệu.</p>
            </div>
            
            <button onclick="openBrandModal('add')" class="bg-primary-container hover:bg-red-700 text-white font-label-md text-label-md uppercase px-8 py-4 flex items-center gap-3 transition-all active:scale-95 shadow-lg shadow-red-900/20 font-bold">
                <span class="material-symbols-outlined">add_circle</span>
                <span>Thêm hãng xe mới</span>
            </button>
        </header>

        <!-- Brands List Table -->
        <div class="bg-surface-container-lowest border border-surface-variant overflow-hidden font-mono-data text-mono-data">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-surface-container font-label-md text-label-md uppercase text-on-surface-variant border-b border-surface-variant">
                        <th class="px-6 py-4 font-semibold w-1/4">Thương hiệu</th>
                        <th class="px-6 py-4 font-semibold">Xuất xứ quốc gia</th>
                        <th class="px-6 py-4 font-semibold">Số lượng dòng xe đang bán</th>
                        <th class="px-6 py-4 font-semibold text-right">Hành động</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-surface-variant/30">
                    
                    <tr class="hover:bg-surface-container-low transition-colors group">
                        <td class="px-6 py-6 font-bold text-white text-lg group-hover:text-primary-container">DUCATI</td>
                        <td class="px-6 py-6 uppercase text-on-surface-variant">Ý (Italy)</td>
                        <td class="px-6 py-6 font-semibold">12 cấu hình</td>
                        <td class="px-6 py-6 text-right">
                            <div class="flex justify-end gap-2">
                                <button onclick="openBrandModal('edit', 'DUCATI', 'Ý')" class="p-2 hover:bg-surface-variant text-on-surface-variant hover:text-white transition-all">
                                    <span class="material-symbols-outlined text-[18px]">edit</span>
                                </button>
                                <button onclick="confirmDeleteBrand('DUCATI')" class="p-2 hover:bg-error-container/20 text-error transition-all">
                                    <span class="material-symbols-outlined text-[18px]">delete</span>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <tr class="hover:bg-surface-container-low transition-colors group">
                        <td class="px-6 py-6 font-bold text-white text-lg group-hover:text-primary-container">HONDA</td>
                        <td class="px-6 py-6 uppercase text-on-surface-variant">Nhật Bản (Japan)</td>
                        <td class="px-6 py-6 font-semibold">32 cấu hình</td>
                        <td class="px-6 py-6 text-right">
                            <div class="flex justify-end gap-2">
                                <button onclick="openBrandModal('edit', 'HONDA', 'Nhật Bản')" class="p-2 hover:bg-surface-variant text-on-surface-variant hover:text-white transition-all">
                                    <span class="material-symbols-outlined text-[18px]">edit</span>
                                </button>
                                <button onclick="confirmDeleteBrand('HONDA')" class="p-2 hover:bg-error-container/20 text-error transition-all">
                                    <span class="material-symbols-outlined text-[18px]">delete</span>
                                </button>
                            </div>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>

    </main>

    <!-- CRUD Brand Modal Form (Hidden by default) -->
    <div id="brand-modal" class="hidden fixed inset-0 z-50 overflow-y-auto bg-black/80 backdrop-blur-sm flex items-center justify-center p-4">
        <div class="bg-surface-container border border-surface-variant w-full max-w-md p-8 relative overflow-hidden racing-stripe animate-fade-in">
            <header class="flex justify-between items-center border-b border-surface-variant pb-4 mb-6 select-none">
                <h3 id="brand-modal-title" class="font-headline-sm text-headline-sm uppercase text-white font-extrabold">CẤU HÌNH HÃNG XE</h3>
                <button onclick="closeBrandModal()" class="text-on-surface-variant hover:text-white">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </header>
            
            <form action="${pageContext.request.contextPath}/admin/manage-brand" method="post" class="space-y-6 font-mono-data text-xs">
                <input type="hidden" name="action" id="brandActionInput" value="insert"/>
                <input type="hidden" name="txtBrandId" id="brandIdInput" value=""/>

                <div class="space-y-2">
                    <label class="font-label-md text-[11px] text-on-surface-variant uppercase block">Tên hãng xe</label>
                    <input name="txtBrandName" id="brand-form-name" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none uppercase" placeholder="HONDA" required type="text"/>
                </div>
                
                <div class="space-y-2">
                    <label class="font-label-md text-[11px] text-on-surface-variant uppercase block">Quốc gia xuất xứ</label>
                    <input name="txtBrandOrigin" id="brand-form-origin" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:outline-none uppercase" placeholder="NHẬT BẢN" required type="text"/>
                </div>

                <div class="pt-6 border-t border-surface-variant flex justify-end gap-4">
                    <button type="button" onclick="closeBrandModal()" class="px-6 py-3 border border-surface-variant text-on-surface font-label-md uppercase tracking-wider hover:bg-surface-container">Hủy bỏ</button>
                    <button type="submit" class="px-8 py-3 bg-primary-container text-white font-label-md uppercase tracking-wider hover:brightness-110 active:scale-95 font-bold">Xác nhận</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function openBrandModal(mode, name = '', origin = '') {
            const modal = document.getElementById('brand-modal');
            const title = document.getElementById('brand-modal-title');
            const actionInput = document.getElementById('brandActionInput');
            
            modal.classList.remove('hidden');
            
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
        }

        function closeBrandModal() {
            document.getElementById('brand-modal').classList.add('hidden');
        }

        function confirmDeleteBrand(brandName) {
            if (confirm(`Bạn có chắc chắn muốn xóa hãng xe ${brandName} khỏi hệ thống?`)) {
                alert('Đã xóa thành công!');
            }
        }
    </script>
</body>
</html>
