<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.appLang}"><c:set var="appLang" value="vi" scope="session"/></c:if>
<fmt:setLocale value="${sessionScope.appLang}" scope="session"/>
<fmt:setBundle basename="messages"/>
<fmt:message key="notifications.title" var="notificationTitle"/>
<fmt:message key="notifications.empty" var="notificationEmpty"/>
<fmt:message key="notifications.aria" var="notificationAria"/>
<div class="dropdown notification-center"
     data-notifications-url="${pageContext.request.contextPath}/notifications"
     data-notifications-read-url="${pageContext.request.contextPath}/notifications/read"
     data-notification-empty="${notificationEmpty}">
    <button class="notification-toggle position-relative d-flex align-items-center justify-content-center p-2 text-white border border-secondary"
            type="button"
            id="notificationDropdown"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            aria-label="${notificationAria}">
        <span class="material-symbols-outlined fs-5">notifications</span>
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
