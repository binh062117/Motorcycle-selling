<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.appLang}">
    <c:set var="appLang" value="vi" scope="session" />
</c:if>
<fmt:setLocale value="${sessionScope.appLang}" scope="session" />
<fmt:setBundle basename="messages" />
<fmt:message key="app.title" var="defaultTitle" />
<fmt:message key="nav.search" var="searchPlaceholder" />
<fmt:message key="common.loading" var="loadingLabel" />
<fmt:message key="common.cart" var="cartLabel" />
<fmt:message key="notifications.title" var="notificationTitle" />
<fmt:message key="notifications.empty" var="notificationEmpty" />
<fmt:message key="notifications.aria" var="notificationAria" />
<c:set var="languageSwitchUri" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:if test="${empty languageSwitchUri}">
    <c:set var="languageSwitchUri" value="${pageContext.request.requestURI}" />
</c:if>
<c:set var="headerCartCount" value="${empty cartItemCount ? 0 : cartItemCount}" />
<c:if test="${headerCartCount == 0 && not empty sessionScope.cartItems}">
    <c:forEach var="cartItem" items="${sessionScope.cartItems}">
        <c:set var="headerCartCount" value="${headerCartCount + cartItem.quantity}" />
    </c:forEach>
</c:if>
<!DOCTYPE html>
<html lang="${sessionScope.appLang}">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>${pageTitle != null ? pageTitle : defaultTitle}</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!-- Google Fonts: Montserrat (Headings), Inter (Body) & JetBrains Mono (Technical Spec Data) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    
    <!-- Google Material Symbols Outlined -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    
    <!-- Link to custom stylesheets -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
    </style>
</head>
<body class="bg-dark text-white">

    <!-- Loading overlay (AJAX state) -->
    <div id="loading-overlay" class="d-none">
        <div class="spinner-border text-danger" style="width: 3rem; height: 3rem;" role="status">
            <span class="visually-hidden">${loadingLabel}</span>
        </div>
    </div>

    <!-- Sticky Navigation Navbar -->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark border-b border-secondary sticky-top py-3" style="min-height: 80px; border-bottom: 1px solid var(--border-color) !important;">
        <div class="container-fluid px-4 max-w-container-max">
            <!-- Brand Logo (Left) -->
            <a href="${pageContext.request.contextPath}/home" class="navbar-brand d-flex flex-column align-items-start select-none py-0">
                <span class="font-heading fs-4 fw-black text-danger tracking-tighter uppercase leading-none m-0" style="font-weight:900;">DUCATI</span>
                <span class="font-mono-data text-[10px] text-muted uppercase leading-none mt-1" style="font-size:10px; letter-spacing: 0.3em;">Borgo Panigale</span>
            </a>
            
            <!-- Responsive Menu Toggle -->
            <button class="navbar-toggler border-0 p-2 text-white" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbarCollapse" aria-controls="mainNavbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="material-symbols-outlined fs-2">menu</span>
            </button>
            
            <!-- Navigation Links & Actions -->
            <div class="collapse navbar-collapse justify-content-between" id="mainNavbarCollapse">
                <ul class="navbar-nav mx-auto mb-2 mb-md-0 gap-3 text-center">
                    <li class="nav-item">
                        <a class="nav-link font-heading text-uppercase text-white tracking-wider px-3" href="${pageContext.request.contextPath}/home"><fmt:message key="nav.home" /></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-heading text-uppercase text-white tracking-wider px-3" href="${pageContext.request.contextPath}/products"><fmt:message key="nav.products" /></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-heading text-uppercase text-white tracking-wider px-3" href="${pageContext.request.contextPath}/order-history"><fmt:message key="nav.orders" /></a>
                    </li>
                </ul>
                
                <!-- Search & Actions (Right) -->
                <div class="d-flex align-items-center justify-content-center gap-3">
                    
                    <!-- Search Bar -->
                    <form action="${pageContext.request.contextPath}/products" method="get" class="position-relative d-none d-lg-block">
                        <span class="material-symbols-outlined position-absolute top-50 start-0 translate-middle-y ms-3 text-muted" style="font-size: 20px;">search</span>
                        <input name="searchQuery" class="form-control debounce-search bg-black border-secondary py-2 ps-5 pe-4 text-white uppercase placeholder-secondary" style="border-radius: 0; width: 240px; font-size:12px; font-family: var(--font-mono);" data-search-url="${pageContext.request.contextPath}/products" placeholder="${searchPlaceholder}" type="text"/>
                    </form>
                    
                    <!-- Action Icons -->
                    <!-- Shopping Cart Icon -->
                    <a href="${pageContext.request.contextPath}/cart" class="cart-nav-link position-relative d-flex align-items-center justify-content-center p-2 text-white text-decoration-none" aria-label="${cartLabel}">
                        <span class="material-symbols-outlined fs-4">shopping_cart</span>
                        <c:if test="${headerCartCount > 0}">
                            <span class="cart-badge badge rounded-pill bg-danger">${headerCartCount}</span>
                        </c:if>
                    </a>

                    <c:if test="${not empty sessionScope.currentUser}">
                        <div class="dropdown notification-center"
                             data-notifications-url="${pageContext.request.contextPath}/notifications"
                             data-notifications-read-url="${pageContext.request.contextPath}/notifications/read"
                             data-notification-empty="${notificationEmpty}">
                            <button class="notification-toggle position-relative d-flex align-items-center justify-content-center p-2 text-white"
                                    type="button"
                                    id="notificationDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    aria-label="${notificationAria}">
                                <span class="material-symbols-outlined fs-4">notifications</span>
                                <span id="notificationBadge" class="cart-badge badge rounded-pill bg-danger d-none">0</span>
                            </button>
                            <div class="dropdown-menu dropdown-menu-end notification-menu bg-dark border-secondary text-white mt-2" aria-labelledby="notificationDropdown">
                                <div class="notification-menu-header border-bottom border-secondary px-3 py-2">
                                    <span class="font-heading text-uppercase text-danger fw-bold small">${notificationTitle}</span>
                                </div>
                                <div id="notificationList" class="notification-list">
                                    <div class="notification-empty px-3 py-4 text-muted font-mono-data small">${notificationEmpty}</div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <div class="language-switch border border-secondary font-mono-data">
                        <a class="text-decoration-none js-lang-switch ${sessionScope.appLang == 'vi' ? 'text-danger fw-bold' : 'text-muted'}" href="${languageSwitchUri}?lang=vi" data-lang="vi"><fmt:message key="language.vi" /></a>
                        <span class="text-secondary">|</span>
                        <a class="text-decoration-none js-lang-switch ${sessionScope.appLang == 'en' ? 'text-danger fw-bold' : 'text-muted'}" href="${languageSwitchUri}?lang=en" data-lang="en"><fmt:message key="language.en" /></a>
                    </div>
                    
                    <!-- User Account Icon / Login Dropdown -->
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center justify-content-center p-2 text-white text-decoration-none" id="userMenuDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <c:choose>
                                <c:when test="${not empty sessionScope.currentUser.avatarUrl}">
                                    <img src="${sessionScope.currentUser.avatarUrl}" alt="${sessionScope.currentUser.fullName}" class="rounded-circle border border-secondary" style="width:28px;height:28px;object-fit:cover;" referrerpolicy="no-referrer"/>
                                </c:when>
                                <c:otherwise>
                                    <span class="material-symbols-outlined fs-4">person</span>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end bg-dark border-secondary rounded-0 text-white font-mono-data text-xs mt-2" aria-labelledby="userMenuDropdown" style="border: 1px solid var(--border-color) !important;">
                            <c:choose>
                                <c:when test="${not empty sessionScope.currentUser}">
                                    <li class="px-3 py-2 border-bottom border-secondary">
                                        <div class="d-flex align-items-center gap-2">
                                            <c:if test="${not empty sessionScope.currentUser.avatarUrl}">
                                                <img src="${sessionScope.currentUser.avatarUrl}" alt="${sessionScope.currentUser.fullName}" class="rounded-circle border border-secondary" style="width:34px;height:34px;object-fit:cover;" referrerpolicy="no-referrer"/>
                                            </c:if>
                                            <div>
                                                <div class="text-white fw-bold text-uppercase">${sessionScope.currentUser.fullName}</div>
                                                <div class="text-muted text-lowercase" style="font-size: 11px;">${sessionScope.currentUser.email}</div>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a class="dropdown-item text-white hover:bg-secondary py-2" href="${pageContext.request.contextPath}/profile"><fmt:message key="account.profile" /></a></li>
                                    <li><a class="dropdown-item text-white hover:bg-secondary py-2" href="${pageContext.request.contextPath}/order-history"><fmt:message key="account.orders" /></a></li>
                                    <c:if test="${sessionScope.currentUser.admin}">
                                        <li><a class="dropdown-item text-white hover:bg-secondary py-2" href="${pageContext.request.contextPath}/admin/dashboard"><fmt:message key="account.admin" /></a></li>
                                    </c:if>
                                    <li><hr class="dropdown-divider bg-secondary"></li>
                                    <li><a class="dropdown-item text-danger hover:bg-secondary py-2" href="${pageContext.request.contextPath}/logout"><fmt:message key="account.logout" /></a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a class="dropdown-item text-danger hover:bg-secondary py-2" href="${pageContext.request.contextPath}/login.jsp"><fmt:message key="account.login" /></a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
