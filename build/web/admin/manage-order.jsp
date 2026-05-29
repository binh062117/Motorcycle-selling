<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Lịch Hẹn Đặt Xe</title>
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
            <a class="flex items-center gap-4 text-on-surface-variant hover:bg-surface-container px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/manage-brand.jsp">
                <span class="material-symbols-outlined">settings_input_component</span>
                <span>HÃNG XE</span>
            </a>
            <!-- Active State: Order management -->
            <a class="flex items-center gap-4 bg-primary-container text-white border-l-4 border-primary px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/manage-order.jsp">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">shopping_bag</span>
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

    <!-- Main Order list area -->
    <main class="ml-64 min-h-screen p-margin-desktop bg-background">
        
        <header class="mb-12">
            <h2 class="font-headline-lg text-headline-sm md:text-headline-lg uppercase tracking-tight text-white font-extrabold">Quản Lý Lịch Hẹn & Đơn Đặt Xe</h2>
            <p class="font-body-md text-on-surface-variant mt-1">Quản lý duyệt yêu cầu đặt cọc mua xe hoặc đăng ký lái thử từ khách hàng.</p>
        </header>

        <!-- Orders Table -->
        <div class="bg-surface-container-lowest border border-surface-variant overflow-hidden font-mono-data text-mono-data">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-surface-container font-label-md text-label-md uppercase text-on-surface-variant border-b border-surface-variant">
                        <th class="px-6 py-4 font-semibold w-1/6">Mã lịch hẹn</th>
                        <th class="px-6 py-4 font-semibold">Thông tin khách hàng</th>
                        <th class="px-6 py-4 font-semibold">Xe đăng ký</th>
                        <th class="px-6 py-4 font-semibold">Địa điểm & Thời gian</th>
                        <th class="px-6 py-4 font-semibold">Trạng thái hiện tại</th>
                        <th class="px-6 py-4 font-semibold text-right">Duyệt trạng thái</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-surface-variant/30">
                    
                    <!-- Row 1 -->
                    <tr class="hover:bg-surface-container-low transition-colors group">
                        <td class="px-6 py-6 font-bold text-white group-hover:text-primary-container">#DUC-998811</td>
                        <td class="px-6 py-6">
                            <div class="flex flex-col">
                                <span class="font-bold text-white text-[15px]">Enzo Ferrari</span>
                                <span class="text-on-surface-variant text-[11px] mt-1">SĐT: 0912345678</span>
                                <span class="text-on-surface-variant text-[11px]">Email: client@ducati.it</span>
                            </div>
                        </td>
                        <td class="px-6 py-6">
                            <div class="flex flex-col">
                                <span class="font-semibold text-white">Panigale V4 R</span>
                                <span class="text-on-surface-variant text-[11px] mt-1">Màu: DUCATI RED | SL: 1</span>
                            </div>
                        </td>
                        <td class="px-6 py-6 text-xs leading-relaxed text-white">
                            <strong>Đại lý:</strong> Showroom Bà Triệu - Hà Nội<br/>
                            <strong>Ngày hẹn:</strong> 05/06/2026<br/>
                            <strong>Giờ hẹn:</strong> 09:00 sáng
                        </td>
                        <td class="px-6 py-6">
                            <div class="flex items-center gap-2">
                                <span id="status-dot-998811" class="w-2.5 h-2.5 rounded-full bg-primary-container shadow-[0_0_8px_rgba(206,19,31,0.6)]"></span>
                                <span id="status-text-998811" class="text-primary-container uppercase text-[12px] font-bold">Chờ duyệt</span>
                            </div>
                        </td>
                        <td class="px-6 py-6 text-right">
                            <form action="${pageContext.request.contextPath}/admin/manage-order" method="post" class="inline-block">
                                <input type="hidden" name="orderId" value="998811"/>
                                <select name="txtOrderStatus" onchange="updateOrderStatus(this, '998811')" class="bg-black border border-surface-variant text-on-surface text-xs font-mono-data px-4 py-2 outline-none uppercase cursor-pointer focus:ring-0">
                                    <option value="Chờ duyệt" selected>Chờ duyệt</option>
                                    <option value="Đã xác nhận">Đã xác nhận</option>
                                    <option value="Đã giao xe">Đã giao xe</option>
                                    <option value="Đã hủy">Đã hủy</option>
                                </select>
                            </form>
                        </td>
                    </tr>

                    <!-- Row 2 -->
                    <tr class="hover:bg-surface-container-low transition-colors group">
                        <td class="px-6 py-6 font-bold text-white group-hover:text-primary-container">#DUC-442200</td>
                        <td class="px-6 py-6">
                            <div class="flex flex-col">
                                <span class="font-bold text-white text-[15px]">Valentino Rossi</span>
                                <span class="text-on-surface-variant text-[11px] mt-1">SĐT: 0987654321</span>
                                <span class="text-on-surface-variant text-[11px]">Email: rossi46@motogp.it</span>
                            </div>
                        </td>
                        <td class="px-6 py-6">
                            <div class="flex flex-col">
                                <span class="font-semibold text-white">Monster SP</span>
                                <span class="text-on-surface-variant text-[11px] mt-1">Màu: STAR WHITE | SL: 1</span>
                            </div>
                        </td>
                        <td class="px-6 py-6 text-xs leading-relaxed text-white">
                            <strong>Đại lý:</strong> Showroom Phú Mỹ Hưng - Q7<br/>
                            <strong>Ngày hẹn:</strong> 28/05/2026<br/>
                            <strong>Giờ hẹn:</strong> 14:00 chiều
                        </td>
                        <td class="px-6 py-6">
                            <div class="flex items-center gap-2">
                                <span id="status-dot-442200" class="w-2.5 h-2.5 rounded-full bg-green-500 shadow-[0_0_8px_rgba(34,197,94,0.6)]"></span>
                                <span id="status-text-442200" class="text-green-500 uppercase text-[12px] font-bold">Đã xác nhận</span>
                            </div>
                        </td>
                        <td class="px-6 py-6 text-right">
                            <form action="${pageContext.request.contextPath}/admin/manage-order" method="post" class="inline-block">
                                <input type="hidden" name="orderId" value="442200"/>
                                <select name="txtOrderStatus" onchange="updateOrderStatus(this, '442200')" class="bg-black border border-surface-variant text-on-surface text-xs font-mono-data px-4 py-2 outline-none uppercase cursor-pointer focus:ring-0">
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

    </main>

    <script>
        function updateOrderStatus(selectEl, orderId) {
            const val = selectEl.value;
            const textEl = document.getElementById(`status-text-${orderId}`);
            const dotEl = document.getElementById(`status-dot-${orderId}`);
            
            // Front-end interactive visual updates on change before server submit
            if (val === 'Chờ duyệt') {
                textEl.textContent = 'Chờ duyệt';
                textEl.className = 'text-primary-container uppercase text-[12px] font-bold';
                dotEl.className = 'w-2.5 h-2.5 rounded-full bg-primary-container shadow-[0_0_8px_rgba(206,19,31,0.6)]';
            } else if (val === 'Đã xác nhận') {
                textEl.textContent = 'Đã xác nhận';
                textEl.className = 'text-green-500 uppercase text-[12px] font-bold';
                dotEl.className = 'w-2.5 h-2.5 rounded-full bg-green-500 shadow-[0_0_8px_rgba(34,197,94,0.6)]';
            } else if (val === 'Đã giao xe') {
                textEl.textContent = 'Đã giao xe';
                textEl.className = 'text-blue-500 uppercase text-[12px] font-bold';
                dotEl.className = 'w-2.5 h-2.5 rounded-full bg-blue-500 shadow-[0_0_8px_rgba(59,130,246,0.6)]';
            } else {
                textEl.textContent = 'Đã hủy';
                textEl.className = 'text-on-surface-variant uppercase text-[12px] font-bold opacity-60';
                dotEl.className = 'w-2.5 h-2.5 rounded-full bg-on-surface-variant/40';
            }
            
            // Trigger automatic background submit simulation
            console.log(`Submitting order status update for ${orderId}: ${val}`);
        }
    </script>
</body>
</html>
