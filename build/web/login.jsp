<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Đăng Nhập Hệ Thống</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!-- Google Fonts: Montserrat (Headings), Inter (Body) & JetBrains Mono (Technical Spec Data) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    
    <!-- Google Material Symbols Outlined -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
</head>
<body class="bg-dark text-white overflow-hidden">
    
    <!-- Auth Main Layout Container -->
    <main class="position-relative min-vh-screen d-flex align-items-center justify-content-center justify-content-lg-end pe-lg-5 overflow-hidden" style="min-height: 100vh;">
        
        <!-- Background Image Parallax -->
        <div class="position-absolute inset-0 z-0 w-100 h-100">
            <img id="auth-bg" alt="Ducati Hangar Background" class="w-100 h-100 object-fit-cover opacity-25" style="object-fit: cover; filter: grayscale(100%); transition: transform 0.7s;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBp5bJAIuQDbybt5lbxyZZ-4hrq02OIe2qAYVgIChQVPVZ-PRrhjm8lhyqpmAldwWHeRt2L09P_iCO6RW4hDfy-vMKoLFYnkr4VghoNIx5svJh5c3CUggsepB0yseQmzuJcnawgN3Oh4CllfJT8n2urfj6myNgsYgsur7W92McL-rIoWxZdEpXfPV5qQT7EGQooSwjNHE2gaG6V55scEVaEf5cEE8YDC3hxss9x8NONHeqGCXd1vAsbfDyCTRz_szpgOp3d8qzxgAy_"/>
            <div class="position-absolute inset-0 bg-gradient-to-r" style="background: linear-gradient(to right, var(--bg-dark) 0%, transparent 100%);"></div>
            <div class="carbon-overlay"></div>
        </div>
        
        <!-- Left Branding Content (Desktop Only) -->
        <div class="position-absolute start-0 top-50 translate-middle-y z-1 d-none d-lg-flex flex-column max-w-2xl px-5 pointer-events-none">
            <div class="mb-2">
                <span class="bg-danger text-white px-3 py-1 font-heading text-uppercase small fw-bold">Showroom Identity</span>
            </div>
            <h1 class="font-heading display-3 text-white mb-4 text-uppercase fw-black" style="font-weight: 900;">Enter the<br/><span class="text-danger">Racing</span> Lab.</h1>
            <p class="text-secondary fs-5" style="max-width: 500px;">
                Đăng nhập tài khoản điều hành và quản lý lịch trình lái thử, xem bảng thông số kỹ thuật xe máy phân khối lớn tinh xảo của Borgo Panigale.
            </p>
        </div>
        
        <!-- Center/Right Auth Card Form -->
        <section class="position-relative z-2 w-100 px-3" style="max-width: 460px;">
            <div class="glass-panel p-4 p-md-5 shadow-lg position-relative overflow-hidden racing-stripe">
                
                <!-- Top Brand Logo -->
                <div class="d-flex flex-column align-items-center align-items-lg-start mb-4 select-none">
                    <span class="font-heading fs-4 fw-black text-danger tracking-tighter uppercase leading-none m-0" style="font-weight: 900;">DUCATI CORSE</span>
                    <div class="bg-danger mt-2" style="width: 48px; height: 3px;"></div>
                </div>
                
                <!-- Custom Form switching tabs -->
                <div class="d-flex gap-4 mb-4 border-bottom border-secondary">
                    <a class="pb-3 font-heading text-uppercase tracking-wider small text-danger border-bottom border-3 border-danger fw-bold text-decoration-none" href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
                    <a class="pb-3 font-heading text-uppercase tracking-wider small text-secondary hover-text-white text-decoration-none" href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
                </div>
                
                <!-- JSP Backend Error Display Placeholder -->
                <c:if test="${not empty errorMessage}">
                     <div class="alert alert-danger rounded-0 font-mono-data text-xs text-uppercase py-2" role="alert">
                         ${errorMessage}
                     </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/login" method="post" class="needs-validation-custom d-flex flex-column gap-3" novalidate>
                    <div class="form-group">
                        <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Tài khoản Email / Race ID</label>
                        <input name="txtEmail" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" placeholder="name@ducaticorse.com" required type="email"/>
                    </div>
                    <div class="form-group">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <label class="font-heading text-muted text-uppercase tracking-wider small d-block m-0">Mật khẩu bảo mật</label>
                            <a class="font-heading text-danger small text-decoration-none" href="${pageContext.request.contextPath}/forgot-password.jsp">Quên mật khẩu?</a>
                        </div>
                        <input name="txtPassword" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" placeholder="••••••••" required type="password" minlength="6"/>
                    </div>
                    <div class="form-check d-flex align-items-center gap-2">
                        <input name="remember" class="form-check-input text-danger bg-transparent border-secondary" id="remember" type="checkbox"/>
                        <label class="form-check-label text-muted small" for="remember">Duy trì đăng nhập thiết bị này</label>
                    </div>
                    
                    <button class="btn btn-ducati w-100 py-3 mt-2 d-flex align-items-center justify-content-center gap-2" type="submit">
                        <span>ĐĂNG NHẬP</span>
                        <span class="material-symbols-outlined fs-5">bolt</span>
                    </button>

                    <!-- Google login option as required by prompt -->
                    <a href="${pageContext.request.contextPath}/google-login" class="btn btn-outline-ducati w-100 py-3 d-flex align-items-center justify-content-center gap-2" style="font-size:12px;">
                        <img src="https://lh3.googleusercontent.com/COxitBE1U5pssR47urGIwHUDtbW6nmJ5LJ6jiWi-W7ev1kSpb37t5FEo9cXM81J4d14" alt="Google logo" style="width: 16px; height: 16px;"/>
                        <span>ĐĂNG NHẬP BẰNG GOOGLE</span>
                    </a>
                </form>
                
                <div class="mt-4 text-center">
                    <p class="text-secondary small m-0">
                        Quay lại <a class="text-white underline fw-bold text-decoration-none border-bottom border-white pb-1" href="${pageContext.request.contextPath}/index.jsp">Trang Chủ chính</a>.
                    </p>
                </div>
            </div>
        </section>
        
    </main>

    <!-- Bootstrap 5 Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/validation.js"></script>
    <script>
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
