<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI SHOWROOM | 500 Internal Error</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
</head>
<body class="bg-dark text-white d-flex align-items-center justify-content-center min-vh-screen" style="min-height: 100vh;">
    
    <div class="card card-ducati p-5 text-center racing-stripe" style="max-width: 480px;">
        <div class="carbon-overlay"></div>
        <h1 class="font-heading display-1 fw-black text-danger mb-3" style="font-weight: 900;">500</h1>
        <h2 class="font-heading text-uppercase text-white fs-4 mb-3">LỖI HỆ THỐNG NỘI BỘ</h2>
        <p class="text-secondary small leading-relaxed mb-4">
            Đã xảy ra sự cố kỹ thuật nghiêm trọng phía máy chủ (Server Side). Đội ngũ kỹ sư Scuderia đang khắc phục.
        </p>
        
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-ducati py-3 text-uppercase">Quay lại trang chủ</a>
    </div>

</body>
</html>
