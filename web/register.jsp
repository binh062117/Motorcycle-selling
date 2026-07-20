<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.appLang}">
    <c:set var="appLang" value="vi" scope="session" />
</c:if>
<fmt:setLocale value="${sessionScope.appLang}" scope="session" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="${sessionScope.appLang}">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title><fmt:message key="register.pageTitle" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
</head>
<body class="bg-dark text-white overflow-auto">
    <main class="position-relative min-vh-screen d-flex align-items-start justify-content-center justify-content-lg-end pe-lg-5 py-4 py-lg-5" style="min-height: 100vh;">
        <div class="position-absolute inset-0 z-0 w-100 h-100">
            <img id="auth-bg" alt="Ducati Hangar Background" class="w-100 h-100 object-fit-cover opacity-25" style="object-fit: cover; filter: grayscale(100%); transition: transform 0.7s;" src="${pageContext.request.contextPath}/assets/img/auth-bg.svg"/>
            <div class="position-absolute inset-0 bg-gradient-to-r" style="background: linear-gradient(to right, var(--bg-dark) 0%, transparent 100%);"></div>
            <div class="carbon-overlay"></div>
        </div>

        <div class="position-absolute start-0 top-50 translate-middle-y z-1 d-none d-lg-flex flex-column max-w-2xl px-5 pointer-events-none">
            <div class="mb-2">
                <span class="bg-danger text-white px-3 py-1 font-heading text-uppercase small fw-bold"><fmt:message key="register.heroEyebrow" /></span>
            </div>
            <h1 class="font-heading display-3 text-white mb-4 text-uppercase fw-black" style="font-weight: 900;"><fmt:message key="register.heroTitle" /></h1>
            <p class="text-secondary fs-5" style="max-width: 500px;"><fmt:message key="register.heroBody" /></p>
        </div>

        <section class="position-relative z-2 w-100 px-3" style="max-width: 460px;">
            <div class="glass-panel p-4 p-md-5 shadow-lg position-relative overflow-hidden racing-stripe">
                <div class="d-flex flex-column align-items-center align-items-lg-start mb-4 select-none">
                    <span class="font-heading fs-4 fw-black text-danger tracking-tighter uppercase leading-none m-0" style="font-weight: 900;">DUCATI SHOWROOM</span>
                    <div class="bg-danger mt-2" style="width: 48px; height: 3px;"></div>
                </div>

                <div class="d-flex gap-4 mb-4 border-bottom border-secondary">
                    <a class="pb-3 font-heading text-uppercase tracking-wider small text-secondary hover-text-white text-decoration-none" href="${pageContext.request.contextPath}/login.jsp"><fmt:message key="account.login" /></a>
                    <a class="pb-3 font-heading text-uppercase tracking-wider small text-danger border-bottom border-3 border-danger fw-bold text-decoration-none" href="${pageContext.request.contextPath}/register.jsp"><fmt:message key="register.tab" /></a>
                </div>

                <c:if test="${not empty errorMessage}">
                     <div class="alert alert-danger rounded-0 font-mono-data text-xs text-uppercase py-2" role="alert">
                         ${errorMessage}
                     </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation-custom d-flex flex-column gap-3" novalidate>
                    <div class="row g-2">
                        <div class="col-6">
                            <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.lastName" /></label>
                            <input name="txtLastName" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" placeholder="FERRARI" required type="text"/>
                        </div>
                        <div class="col-6">
                            <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.firstName" /></label>
                            <input name="txtFirstName" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" placeholder="ENZO" required type="text"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.phone" /></label>
                        <input name="txtPhone" class="form-control bg-black border-secondary text-white font-mono-data rounded-0 validate-phone" placeholder="0912345678" required type="tel"/>
                    </div>
                    <div class="form-group">
                        <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.email" /></label>
                        <input name="txtEmail" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" placeholder="enzo@ferrari.it" required type="email"/>
                    </div>
                    <div class="form-group">
                        <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.password" /></label>
                        <input name="txtPassword" id="password" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" placeholder="********" required type="password" minlength="6"/>
                    </div>
                    <div class="form-group">
                        <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.confirmPassword" /></label>
                        <input id="confirmPassword" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" placeholder="********" required type="password"/>
                    </div>

                    <button class="btn btn-ducati w-100 py-3 mt-2 d-flex align-items-center justify-content-center gap-2" type="submit">
                        <span><fmt:message key="register.submit" /></span>
                        <span class="material-symbols-outlined fs-5">verified_user</span>
                    </button>
                </form>

                <div class="mt-3 text-center">
                    <p class="text-secondary small m-0">
                        <fmt:message key="register.backPrefix" /> <a class="text-white underline fw-bold text-decoration-none border-bottom border-white pb-1" href="${pageContext.request.contextPath}/index.jsp"><fmt:message key="register.backHome" /></a>.
                    </p>
                </div>
            </div>
        </section>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/validation.js?v=20260713"></script>
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
