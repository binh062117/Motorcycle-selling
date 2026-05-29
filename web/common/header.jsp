<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Showroom Xe Máy Cao Cấp</title>
    
    <!-- Tailwind CSS with Forms & Container Queries plugins -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    
    <!-- Google Fonts: Montserrat (Headings), Inter (Body) & JetBrains Mono (Technical Spec Data) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    
    <!-- Google Material Symbols Outlined -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    
    <!-- SweetAlert2 CDN for modern notifications -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <!-- Link to custom stylesheets -->
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
                        "primary-container": "#ce131f", /* Ducati Red primary */
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
                        "mono-data": ["JetBrains Mono", "monospace"],
                        "headline-lg-mobile": ["Montserrat", "sans-serif"],
                        "body-sm": ["Inter", "sans-serif"],
                        "body-lg": ["Inter", "sans-serif"],
                        "label-md": ["Inter", "sans-serif"],
                        "body-md": ["Inter", "sans-serif"],
                        "headline-sm": ["Montserrat", "sans-serif"],
                        "display-lg": ["Montserrat", "sans-serif"],
                        "headline-lg": ["Montserrat", "sans-serif"],
                        "headline-md": ["Montserrat", "sans-serif"]
                    },
                    "fontSize": {
                        "mono-data": ["14px", {"lineHeight": "20px", "letterSpacing": "0.02em", "fontWeight": "500"}],
                        "headline-lg-mobile": ["32px", {"lineHeight": "40px", "letterSpacing": "-0.02em", "fontWeight": "700"}],
                        "body-sm": ["14px", {"lineHeight": "20px", "fontWeight": "400"}],
                        "body-lg": ["18px", {"lineHeight": "28px", "fontWeight": "400"}],
                        "label-md": ["12px", {"lineHeight": "16px", "letterSpacing": "0.05em", "fontWeight": "600"}],
                        "body-md": ["16px", {"lineHeight": "24px", "fontWeight": "400"}],
                        "headline-sm": ["24px", {"lineHeight": "32px", "fontWeight": "600"}],
                        "display-lg": ["72px", {"lineHeight": "80px", "letterSpacing": "-0.04em", "fontWeight": "800"}],
                        "headline-lg": ["48px", {"lineHeight": "56px", "letterSpacing": "-0.02em", "fontWeight": "700"}],
                        "headline-md": ["32px", {"lineHeight": "40px", "fontWeight": "600"}]
                    }
                }
            }
        }
    </script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        body {
            background-color: #121414;
            color: #e2e2e2;
            -webkit-font-smoothing: antialiased;
        }
    </style>
</head>
<body class="bg-background text-on-background font-body-md overflow-x-hidden">

    <!-- Sticky Navigation Navbar -->
    <nav class="fixed top-0 w-full z-50 bg-background/90 backdrop-blur-md border-b border-surface-variant h-20 transition-all duration-300">
        <div class="flex justify-between items-center px-margin-mobile md:px-margin-desktop h-full max-w-container-max mx-auto">
            
            <!-- Brand Logo (Left) -->
            <a href="${pageContext.request.contextPath}/index.jsp" class="flex flex-col items-start select-none">
                <span class="font-headline-md text-headline-sm md:text-headline-md font-extrabold text-primary-container tracking-tighter uppercase leading-none">DUCATI</span>
                <span class="font-mono-data text-[10px] tracking-[0.3em] uppercase text-on-surface-variant leading-none mt-1">Borgo Panigale</span>
            </a>
            
            <!-- Navigation Links (Center-Left) -->
            <div class="hidden md:flex gap-8 items-center">
                <a class="font-label-md text-label-md uppercase tracking-wider text-on-surface hover:text-primary-container transition-colors" href="${pageContext.request.contextPath}/index.jsp">Trang Chủ</a>
                <a class="font-label-md text-label-md uppercase tracking-wider text-on-surface hover:text-primary-container transition-colors" href="${pageContext.request.contextPath}/products.jsp">Bộ Sưu Tập</a>
                <a class="font-label-md text-label-md uppercase tracking-wider text-on-surface hover:text-primary-container transition-colors" href="${pageContext.request.contextPath}/order-history.jsp">Lịch Sử Đặt Xe</a>
            </div>
            
            <!-- Search & Actions (Right) -->
            <div class="flex gap-4 md:gap-6 items-center">
                
                <!-- Sticky Search Bar -->
                <form action="${pageContext.request.contextPath}/products.jsp" method="get" class="relative hidden lg:block">
                    <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">search</span>
                    <input name="searchQuery" class="bg-surface-container-lowest border border-surface-variant py-2 pl-10 pr-4 text-label-md font-mono-data text-on-surface focus:border-primary-container focus:ring-0 w-64 transition-all uppercase placeholder:text-surface-variant" placeholder="TÌM DÒNG XE..." type="text"/>
                </form>
                
                <!-- Action Icons -->
                <!-- Shopping Cart Icon -->
                <a href="${pageContext.request.contextPath}/cart.jsp" class="relative flex items-center justify-center p-2 text-on-surface hover:text-primary-container transition-transform active:scale-90">
                    <span class="material-symbols-outlined text-[24px]">shopping_cart</span>
                    <!-- Cart Badge Float -->
                    <span class="cart-badge absolute -top-1 -right-1 bg-primary-container text-white text-[10px] font-bold font-mono-data w-4 h-4 rounded-full flex items-center justify-center transition-all duration-300">2</span>
                </a>
                
                <!-- User Account Icon / Login Button -->
                <a href="${pageContext.request.contextPath}/login.jsp" class="flex items-center justify-center p-2 text-on-surface hover:text-primary-container transition-transform active:scale-90" title="Tài khoản / Đăng nhập">
                    <span class="material-symbols-outlined text-[24px]">person</span>
                </a>
                
                <!-- Responsive Menu Toggle -->
                <button class="md:hidden flex items-center justify-center p-2 text-on-surface hover:text-primary-container transition-transform" onclick="toggleMobileMenu()">
                    <span class="material-symbols-outlined text-[26px]">menu</span>
                </button>
            </div>
        </div>
        
        <!-- Mobile Dropdown Navigation -->
        <div id="mobile-menu" class="hidden md:hidden absolute top-20 left-0 w-full bg-surface-container border-b border-surface-variant py-4 px-6 flex flex-col gap-4 animate-fade-in">
            <a class="font-label-md text-label-md uppercase tracking-wider text-on-surface hover:text-primary-container py-2" href="${pageContext.request.contextPath}/index.jsp">Trang Chủ</a>
            <a class="font-label-md text-label-md uppercase tracking-wider text-on-surface hover:text-primary-container py-2" href="${pageContext.request.contextPath}/products.jsp">Bộ Sưu Tập</a>
            <a class="font-label-md text-label-md uppercase tracking-wider text-on-surface hover:text-primary-container py-2" href="${pageContext.request.contextPath}/order-history.jsp">Lịch Sử Đặt Xe</a>
            <div class="h-[1px] bg-surface-variant my-2"></div>
            <form action="${pageContext.request.contextPath}/products.jsp" method="get" class="relative">
                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">search</span>
                <input name="searchQuery" class="w-full bg-surface-container-lowest border border-surface-variant py-3 pl-10 pr-4 text-label-md font-mono-data text-on-surface focus:border-primary-container focus:ring-0 transition-all uppercase placeholder:text-surface-variant" placeholder="TÌM DÒNG XE..." type="text"/>
            </form>
        </div>
    </nav>
    
    <script>
        function toggleMobileMenu() {
            const menu = document.getElementById('mobile-menu');
            menu.classList.toggle('hidden');
        }
    </script>
