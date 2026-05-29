<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Hệ Thống Quản Trị</title>
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

    <!-- Left Sidebar Administration Panel Navigation -->
    <aside class="fixed left-0 top-0 h-full w-64 bg-surface-container-lowest border-r border-surface-variant z-50 flex flex-col py-8">
        <div class="px-6 mb-10 select-none">
            <h1 class="font-headline-sm text-headline-sm font-black text-primary-container tracking-tighter uppercase">QUẢN TRỊ VIÊN</h1>
            <p class="font-mono-data text-mono-data uppercase text-on-surface-variant text-[10px]">Hệ thống vận hành chính</p>
        </div>
        <nav class="flex-1 space-y-1">
            <!-- Active State: Dashboard -->
            <a class="flex items-center gap-4 bg-primary-container text-white border-l-4 border-primary px-6 py-3 transition-colors font-mono-data text-mono-data uppercase" href="${pageContext.request.contextPath}/admin/dashboard.jsp">
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
            <!-- Profile headshot preview -->
            <div class="mt-8 flex items-center gap-3 pt-6 border-t border-surface-variant">
                <div class="w-10 h-10 rounded-full bg-surface-variant flex items-center justify-center overflow-hidden">
                    <img alt="Admin Profile" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuB6tW6MHhZVy1ux7y__g4OV3-P-eyQwgTV2Tz60fAEWIJXh2ozkPlPHokZrJdQBgjZqnNtTdDUqe0UNuMzQRuQWZrGkfoBO02I-ujF8m8K5ToHl4oahxYuaBpWv83eI9_5qlHcbXiaRv3sLXADJh9THS7l_bgLGhaJ9jePovnNGDVJ17FBRfbgdn22hd2N2CVJCGUrJVy0vENo47gbqCJouK5pWsPcQpKH_8gfVsudSmsTguOg8bqKUFSoNKFTy-k-TDHTxcNXfR0AP"/>
                </div>
                <div>
                    <p class="font-label-md text-label-md text-on-surface uppercase">Kỹ sư Enzo</p>
                    <p class="font-body-sm text-[10px] text-on-surface-variant uppercase">Quản trị cấp cao</p>
                </div>
            </div>
        </div>
    </aside>

    <!-- Main Content Canvas Layout -->
    <main class="ml-64 min-h-screen px-margin-desktop py-12 bg-background">
        
        <!-- Header -->
        <header class="mb-12 flex justify-between items-end">
            <div>
                <h2 class="font-headline-lg text-headline-sm md:text-headline-lg tracking-tight uppercase">Bảng điều khiển quản trị</h2>
                <p class="font-mono-data text-mono-data uppercase text-primary-container mt-1">GIÁM SÁT HOẠT ĐỘNG THỜI GIAN THỰC</p>
            </div>
            <div class="flex gap-4">
                <div class="bg-surface-container border border-surface-variant px-4 py-2 flex items-center gap-3 font-mono-data text-mono-data">
                    <span class="material-symbols-outlined text-primary-container text-sm">calendar_today</span>
                    <span>Q2 FY2026</span>
                </div>
                <button class="bg-[#c6c6c6] text-black px-6 py-2 font-mono-data text-mono-data uppercase hover:brightness-110 active:scale-95 transition-all">Xuất báo cáo</button>
            </div>
        </header>

        <!-- Bento Grid Statistics -->
        <section class="grid grid-cols-1 md:grid-cols-3 gap-gutter mb-gutter">
            <!-- Stat 1 -->
            <div class="bg-surface-container border-l-4 border-primary-container p-6 relative overflow-hidden group">
                <div class="relative z-10">
                    <p class="font-label-md text-label-md uppercase text-on-surface-variant mb-2">Tổng sản phẩm kho xe máy</p>
                    <h3 class="font-display-lg text-headline-lg font-bold">1,284</h3>
                    <div class="mt-4 flex items-center gap-2 text-primary-container">
                        <span class="material-symbols-outlined text-sm">trending_up</span>
                        <span class="font-mono-data text-mono-data">+12% so với tháng trước</span>
                    </div>
                </div>
                <div class="absolute -right-4 -bottom-4 opacity-5 group-hover:opacity-10 transition-opacity">
                    <span class="material-symbols-outlined text-9xl">motorcycle</span>
                </div>
            </div>
            <!-- Stat 2 -->
            <div class="bg-surface-container border-l-4 border-[#c6c6c6] p-6 relative overflow-hidden group">
                <div class="relative z-10">
                    <p class="font-label-md text-label-md uppercase text-on-surface-variant mb-2">Số lịch hẹn chờ duyệt</p>
                    <h3 class="font-display-lg text-headline-lg font-bold">42</h3>
                    <div class="mt-4 flex items-center gap-2 text-on-surface-variant">
                        <span class="material-symbols-outlined text-sm">schedule</span>
                        <span class="font-mono-data text-mono-data">Thời gian xử lý trung bình: 3.2 ngày</span>
                    </div>
                </div>
                <div class="absolute -right-4 -bottom-4 opacity-5 group-hover:opacity-10 transition-opacity">
                    <span class="material-symbols-outlined text-9xl">shopping_bag</span>
                </div>
            </div>
            <!-- Stat 3 -->
            <div class="bg-surface-container border-l-4 border-primary-container p-6 relative overflow-hidden group">
                <div class="relative z-10">
                    <p class="font-label-md text-label-md uppercase text-on-surface-variant mb-2">Đăng ký lái thử tuần này</p>
                    <h3 class="font-display-lg text-headline-lg font-bold">156</h3>
                    <div class="mt-4 flex items-center gap-2 text-primary-container">
                        <span class="material-symbols-outlined text-sm">person_add</span>
                        <span class="font-mono-data text-mono-data">Tăng 24% tỉ lệ chuyển đổi</span>
                    </div>
                </div>
                <div class="absolute -right-4 -bottom-4 opacity-5 group-hover:opacity-10 transition-opacity">
                    <span class="material-symbols-outlined text-9xl">group</span>
                </div>
            </div>
        </section>

        <!-- Charts Bento -->
        <section class="grid grid-cols-1 lg:grid-cols-3 gap-gutter mb-gutter">
            <!-- Columns Chart -->
            <div class="lg:col-span-2 bg-surface-container p-8 border border-surface-variant flex flex-col h-[500px]">
                <div class="flex justify-between items-center mb-8">
                    <div>
                        <h4 class="font-headline-sm text-headline-sm uppercase tracking-tighter text-white">Doanh thu dự kiến</h4>
                        <p class="font-mono-data text-mono-data text-on-surface-variant">DOANH SỐ ĐẶT CỌC (VNĐ)</p>
                    </div>
                    <div class="flex gap-2 items-center">
                        <span class="w-3 h-3 bg-primary-container block"></span>
                        <span class="font-label-md text-label-md uppercase text-on-surface">Tháng này</span>
                        <span class="w-3 h-3 bg-[#c6c6c6] opacity-30 block ml-4"></span>
                        <span class="font-label-md text-label-md uppercase text-on-surface-variant">Tháng trước</span>
                    </div>
                </div>
                <div class="flex-1 relative chart-grid border-l border-b border-surface-variant/50 flex items-end justify-around px-4 pb-2">
                    <div class="w-12 bg-primary-container/20 border-t-2 border-primary-container h-[40%] transition-all hover:brightness-125 relative group">
                        <div class="absolute -top-8 left-1/2 -translate-x-1/2 opacity-0 group-hover:opacity-100 font-mono-data text-xs bg-primary-container text-white px-1">2.4T</div>
                    </div>
                    <div class="w-12 bg-primary-container/20 border-t-2 border-primary-container h-[55%] transition-all hover:brightness-125 relative group">
                        <div class="absolute -top-8 left-1/2 -translate-x-1/2 opacity-0 group-hover:opacity-100 font-mono-data text-xs bg-primary-container text-white px-1">3.1T</div>
                    </div>
                    <div class="w-12 bg-primary-container border-t-2 border-primary-container h-[85%] transition-all hover:brightness-125 relative group">
                        <div class="absolute -top-8 left-1/2 -translate-x-1/2 opacity-0 group-hover:opacity-100 font-mono-data text-xs bg-primary-container text-white px-1">4.8T</div>
                    </div>
                    <div class="w-12 bg-primary-container/20 border-t-2 border-primary-container h-[60%] transition-all hover:brightness-125 relative group">
                        <div class="absolute -top-8 left-1/2 -translate-x-1/2 opacity-0 group-hover:opacity-100 font-mono-data text-xs bg-primary-container text-white px-1">3.4T</div>
                    </div>
                    <div class="w-12 bg-primary-container border-t-2 border-primary-container h-[92%] transition-all hover:brightness-125 relative group">
                        <div class="absolute -top-8 left-1/2 -translate-x-1/2 opacity-0 group-hover:opacity-100 font-mono-data text-xs bg-primary-container text-white px-1">5.2T</div>
                    </div>
                </div>
                <div class="flex justify-around mt-4 font-mono-data text-mono-data text-on-surface-variant opacity-50">
                    <span>T12</span><span>T1</span><span>T2</span><span>T3</span><span>T4</span>
                </div>
            </div>

            <!-- Pie Chart Appointments -->
            <div class="bg-surface-container p-8 border border-surface-variant flex flex-col h-[500px]">
                <h4 class="font-headline-sm text-headline-sm uppercase tracking-tighter mb-1 text-white">Loại hình đặt lịch</h4>
                <p class="font-mono-data text-mono-data text-on-surface-variant mb-12">PHÂN BỔ THEO HẠNG MỤC YÊU CẦU</p>
                <div class="flex-1 flex items-center justify-center relative">
                    <div class="w-56 h-56 rounded-full border-[16px] border-surface-container-highest relative flex items-center justify-center">
                        <div class="absolute inset-0 rounded-full border-[16px] border-primary-container" style="clip-path: polygon(50% 50%, 50% 0%, 100% 0%, 100% 100%, 0% 100%, 0% 50%);"></div>
                        <div class="text-center select-none">
                            <span class="font-headline-md text-headline-sm md:text-headline-md block leading-none text-white">840</span>
                            <span class="font-mono-data text-[10px] uppercase opacity-50">Yêu cầu</span>
                        </div>
                    </div>
                </div>
                <div class="space-y-4 mt-8">
                    <div class="flex justify-between items-center text-xs">
                        <div class="flex items-center gap-3">
                            <span class="w-3 h-3 bg-primary-container rounded-full"></span>
                            <span class="font-mono-data text-mono-data uppercase">Đặt mua trực tiếp</span>
                        </div>
                        <span class="font-mono-data font-bold">62%</span>
                    </div>
                    <div class="flex justify-between items-center text-xs">
                        <div class="flex items-center gap-3">
                            <span class="w-3 h-3 bg-[#c6c6c6] rounded-full"></span>
                            <span class="font-mono-data text-mono-data uppercase">Lên lịch hẹn lái thử</span>
                        </div>
                        <span class="font-mono-data font-bold">28%</span>
                    </div>
                    <div class="flex justify-between items-center text-xs">
                        <div class="flex items-center gap-3">
                            <span class="w-3 h-3 bg-surface-container-highest rounded-full"></span>
                            <span class="font-mono-data text-mono-data uppercase">Tư vấn spec kỹ thuật</span>
                        </div>
                        <span class="font-mono-data font-bold">10%</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- Top Selling SKU table -->
        <section class="bg-surface-container border border-surface-variant overflow-hidden mb-8">
            <div class="p-8 border-b border-surface-variant">
                <h4 class="font-headline-sm text-headline-sm uppercase tracking-tighter text-white">Mẫu xe bán chạy trong tháng</h4>
                <p class="font-mono-data text-mono-data text-on-surface-variant">THỐNG KÊ CHI TIẾT TỪNG MÃ XE (SKU)</p>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full text-left">
                    <thead class="bg-surface-container font-label-md text-label-md uppercase text-on-surface-variant border-b border-surface-variant">
                        <tr>
                            <th class="px-8 py-4">Mã dòng xe</th>
                            <th class="px-8 py-4">Số lượng đặt cọc</th>
                            <th class="px-8 py-4">Mức tồn kho</th>
                            <th class="px-8 py-4">Tăng trưởng</th>
                            <th class="px-8 py-4 text-right">Biên lợi nhuận</th>
                        </tr>
                    </thead>
                    <tbody class="font-mono-data text-mono-data divide-y divide-surface-variant/30">
                        <tr class="hover:bg-surface-container-highest transition-colors cursor-pointer group">
                            <td class="px-8 py-5 font-bold text-white group-hover:text-primary-container">PANIGALE V4 R</td>
                            <td class="px-8 py-5">142 xe</td>
                            <td class="px-8 py-5">
                                <div class="flex items-center gap-2">
                                    <div class="w-16 h-1.5 bg-background border border-surface-variant">
                                        <div class="h-full bg-primary-container" style="width: 15%"></div>
                                    </div>
                                    <span class="text-[10px] text-primary-container font-bold">NGUY CƠ CHÁY HÀNG</span>
                                </div>
                            </td>
                            <td class="px-8 py-5 text-primary-container">+24%</td>
                            <td class="px-8 py-5 text-right font-bold text-white">18.4%</td>
                        </tr>
                        <tr class="hover:bg-surface-container-highest transition-colors cursor-pointer group">
                            <td class="px-8 py-5 font-bold text-white group-hover:text-primary-container">STREETFIGHTER V4 SP2</td>
                            <td class="px-8 py-5">89 xe</td>
                            <td class="px-8 py-5">
                                <div class="flex items-center gap-2">
                                    <div class="w-16 h-1.5 bg-background border border-surface-variant">
                                        <div class="h-full bg-green-500" style="width: 65%"></div>
                                    </div>
                                    <span class="text-[10px] text-green-500 font-bold">ỔN ĐỊNH</span>
                                </div>
                            </td>
                            <td class="px-8 py-5 text-on-surface-variant">0%</td>
                            <td class="px-8 py-5 text-right font-bold text-white">21.2%</td>
                        </tr>
                        <tr class="hover:bg-surface-container-highest transition-colors cursor-pointer group">
                            <td class="px-8 py-5 font-bold text-white group-hover:text-primary-container">MONSTER SP</td>
                            <td class="px-8 py-5">214 xe</td>
                            <td class="px-8 py-5">
                                <div class="flex items-center gap-2">
                                    <div class="w-16 h-1.5 bg-background border border-surface-variant">
                                        <div class="h-full bg-green-500" style="width: 40%"></div>
                                    </div>
                                    <span class="text-[10px] text-green-500 font-bold">ỔN ĐỊNH</span>
                                </div>
                            </td>
                            <td class="px-8 py-5 text-primary-container">+15%</td>
                            <td class="px-8 py-5 text-right font-bold text-white">16.8%</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

    </main>
    
    <script>
        // Simple subtle animation on render
        window.addEventListener('load', () => {
            const stats = document.querySelectorAll('section > div');
            stats.forEach((card, idx) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(15px)';
                card.style.transition = 'all 0.5s cubic-bezier(0.16, 1, 0.3, 1)';
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, 100 * idx);
            });
        });
    </script>
</body>
</html>
