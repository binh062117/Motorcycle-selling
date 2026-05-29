<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Đăng Nhập Hệ Thống</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    
    <!-- Google Fonts: Montserrat (Headings), Inter (Body) & JetBrains Mono (Technical Spec Data) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    
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
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-background text-on-surface font-body-md overflow-hidden">
    
    <!-- Auth Main Layout Container -->
    <main class="relative min-h-screen flex items-center justify-center lg:justify-end lg:pr-margin-desktop overflow-hidden">
        
        <!-- Background Image Parallax -->
        <div class="absolute inset-0 z-0">
            <img id="auth-bg" alt="Ducati Hangar Background" class="w-full h-full object-cover grayscale opacity-30 mix-blend-luminosity scale-105 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBp5bJAIuQDbybt5lbxyZZ-4hrq02OIe2qAYVgIChQVPVZ-PRrhjm8lhyqpmAldwWHeRt2L09P_iCO6RW4hDfy-vMKoLFYnkr4VghoNIx5svJh5c3CUggsepB0yseQmzuJcnawgN3Oh4CllfJT8n2urfj6myNgsYgsur7W92McL-rIoWxZdEpXfPV5qQT7EGQooSwjNHE2gaG6V55scEVaEf5cEE8YDC3hxss9x8NONHeqGCXd1vAsbfDyCTRz_szpgOp3d8qzxgAy_"/>
            <div class="absolute inset-0 bg-gradient-to-r from-background via-transparent to-background opacity-90 lg:opacity-60"></div>
            <div class="absolute inset-0 bg-gradient-to-t from-background via-transparent to-transparent"></div>
            <div class="carbon-overlay"></div>
        </div>
        
        <!-- Left Branding Content (Desktop Only) -->
        <div class="hidden lg:flex flex-col absolute left-margin-desktop top-1/2 -translate-y-1/2 z-10 max-w-2xl pointer-events-none">
            <div class="mb-unit">
                <span class="bg-primary-container text-white px-3 py-1 font-label-md text-label-md tracking-widest uppercase font-bold">Showroom Identity</span>
            </div>
            <h1 class="font-display-lg text-display-lg text-white mb-6 leading-tight uppercase font-extrabold">Enter the<br/><span class="text-primary-container">Racing</span> Lab.</h1>
            <p class="font-body-lg text-body-lg text-on-surface-variant max-w-lg">
                Đăng nhập tài khoản điều hành và quản lý lịch trình lái thử, xem bảng thông số kỹ thuật xe máy phân khối lớn tinh xảo của Borgo Panigale.
            </p>
        </div>
        
        <!-- Center/Right Auth Card Form -->
        <section class="relative z-20 w-full max-w-[460px] px-margin-mobile lg:px-0 animate-fade-in">
            <div class="glass-panel p-8 md:p-12 shadow-2xl relative overflow-hidden">
                
                <!-- Left Racing Red Stripe accent -->
                <div class="absolute top-0 left-0 w-1.5 h-full bg-primary-container"></div>
                
                <!-- Top Brand Logo -->
                <div class="flex flex-col items-center mb-8 lg:items-start select-none">
                    <span class="font-headline-sm text-headline-sm font-extrabold text-primary-container tracking-tighter uppercase leading-none mb-2">DUCATI CORSE</span>
                    <div class="h-1 w-12 bg-primary-container"></div>
                </div>
                
                <!-- Custom Form switching tabs -->
                <div class="flex gap-8 mb-8 border-b border-surface-variant">
                    <a class="pb-4 font-label-md text-label-md uppercase tracking-wider text-primary-container border-b-2 border-primary-container font-bold" href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
                    <a class="pb-4 font-label-md text-label-md uppercase tracking-wider text-on-surface-variant hover:text-on-surface" href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
                </div>
                
                <!-- JSP Backend Error Display Placeholder -->
                <!-- <%-- <c:if test="${not empty errorMessage}"> --%>
                     <div class="bg-red-900/30 border border-red-500 text-red-200 px-4 py-3 mb-6 font-mono-data text-xs uppercase">
                         ${errorMessage}
                     </div>
                <%-- </c:if> --%> -->
                
                <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-6">
                    <div class="space-y-2">
                        <label class="font-label-md text-label-md text-on-surface-variant uppercase tracking-widest block">Tài khoản Email / Race ID</label>
                        <input name="txtEmail" class="w-full bg-surface-container-lowest border border-surface-variant px-4 py-3 text-on-surface font-mono-data focus:outline-none transition-all placeholder:text-surface-variant" placeholder="name@ducaticorse.com" required type="email"/>
                    </div>
                    <div class="space-y-2">
                        <div class="flex justify-between items-center">
                            <label class="font-label-md text-label-md text-on-surface-variant uppercase tracking-widest block">Mật khẩu bảo mật</label>
                            <a class="font-label-md text-label-md text-primary-container hover:underline transition-all" href="#">Quên mật khẩu?</a>
                        </div>
                        <input name="txtPassword" class="w-full bg-surface-container-lowest border border-surface-variant px-4 py-3 text-on-surface font-mono-data focus:outline-none transition-all placeholder:text-surface-variant" placeholder="••••••••" required type="password"/>
                    </div>
                    <div class="flex items-center gap-3">
                        <input name="remember" class="w-4 h-4 rounded-sm border-surface-variant bg-surface-container-lowest text-primary-container focus:ring-0" id="remember" type="checkbox"/>
                        <label class="font-body-sm text-body-sm text-on-surface-variant" for="remember">Duy trì đăng nhập thiết bị này</label>
                    </div>
                    <button class="w-full bg-primary-container text-white font-label-md text-label-md uppercase tracking-[0.2em] py-4 hover:brightness-110 active:scale-[0.98] transition-all flex items-center justify-center gap-2 font-bold" type="submit">
                        <span>ĐĂNG NHẬP</span>
                        <span class="material-symbols-outlined text-[18px]">bolt</span>
                    </button>
                </form>
                
                <div class="mt-8 text-center">
                    <p class="font-body-sm text-body-sm text-on-surface-variant mb-4">
                        Quay lại <a class="text-on-surface underline font-bold" href="${pageContext.request.contextPath}/index.jsp">Trang Chủ chính</a>.
                    </p>
                </div>
            </div>
        </section>
        
    </main>

    <script>
        // Simple subtle parallax movements
        document.addEventListener('mousemove', (e) => {
            const moveX = (e.clientX - window.innerWidth / 2) * 0.004;
            const moveY = (e.clientY - window.innerHeight / 2) * 0.004;
            const bg = document.getElementById('auth-bg');
            if (bg) {
                bg.style.transform = `scale(1.05) translate(${moveX}px, ${moveY}px)`;
            }
        });
    </script>
</body>
</html>
