<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Đặt Lại Mật Khẩu</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
</head>
<body class="bg-dark text-white overflow-hidden">
    
    <main class="position-relative min-vh-screen d-flex align-items-center justify-content-center justify-content-lg-end pe-lg-5 overflow-hidden" style="min-height: 100vh;">
        <div class="position-absolute inset-0 z-0 w-100 h-100">
            <img id="auth-bg" alt="Ducati Background" class="w-100 h-100 object-fit-cover opacity-25" style="object-fit: cover; filter: grayscale(100%);" src="${pageContext.request.contextPath}/assets/img/auth-bg.svg"/>
            <div class="position-absolute inset-0 bg-gradient-to-r" style="background: linear-gradient(to right, var(--bg-dark) 0%, transparent 100%);"></div>
            <div class="carbon-overlay"></div>
        </div>
        
        <section class="position-relative z-2 w-100 px-3" style="max-width: 460px;">
            <div class="glass-panel p-4 p-md-5 shadow-lg position-relative overflow-hidden racing-stripe">
                <div class="d-flex flex-column align-items-center align-items-lg-start mb-4 select-none">
                    <span class="font-heading fs-4 fw-black text-danger tracking-tighter uppercase leading-none m-0" style="font-weight: 900;">ĐẶT LẠI MẬT KHẨU</span>
                    <div class="bg-danger mt-2" style="width: 48px; height: 3px;"></div>
                </div>
                
                <p class="text-secondary small mb-4">Nhập mật khẩu mới của bạn và xác nhận lại.</p>
                
                <form action="${pageContext.request.contextPath}/reset-password" method="post" class="needs-validation-custom d-flex flex-column gap-3" novalidate>
                    <input type="hidden" name="token" value="${param.token}"/>
                    
                    <div class="form-group">
                        <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Mật khẩu mới</label>
                        <input name="txtPassword" id="password" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" placeholder="••••••••" required type="password" minlength="6"/>
                    </div>
                    <div class="form-group">
                        <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Xác nhận mật khẩu mới</label>
                        <input id="confirmPassword" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" placeholder="••••••••" required type="password"/>
                    </div>
                    
                    <button class="btn btn-ducati w-100 py-3 mt-2 d-flex align-items-center justify-content-center gap-2" type="submit">
                        <span>XÁC NHẬN ĐỔI MẬT KHẨU</span>
                        <span class="material-symbols-outlined fs-5">lock_reset</span>
                    </button>
                </form>
            </div>
        </section>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/validation.js"></script>
</body>
</html>
