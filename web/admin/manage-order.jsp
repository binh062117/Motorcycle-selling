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
    <title><fmt:message key="admin.ordersTitle" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <style>.admin-sidebar{width:260px;background-color:var(--surface-container-lowest);border-right:1px solid var(--border-color);position:fixed;top:0;bottom:0;left:0;padding-top:2rem;display:flex;flex-direction:column}.admin-main{margin-left:260px;padding:2.5rem;background-color:var(--bg-dark);min-height:100vh}.sidebar-link{display:flex;align-items:center;gap:1rem;color:var(--text-muted);text-decoration:none;padding:.85rem 1.5rem;font-family:var(--font-mono);font-size:13px;text-transform:uppercase;border-left:4px solid transparent}.sidebar-link.active{background-color:var(--primary-color);color:#fff;border-left-color:var(--text-primary)}</style>
</head>
<body class="bg-dark text-white">
<aside class="admin-sidebar">
    <div class="px-4 mb-4"><h1 class="font-heading fs-5 fw-black text-danger uppercase mb-1"><fmt:message key="admin.console" /></h1><p class="font-mono-data text-muted uppercase" style="font-size:9px"><fmt:message key="admin.consoleSubtitle" /></p></div>
    <nav class="flex-grow-1">
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/dashboard"><span class="material-symbols-outlined fs-5">dashboard</span><span><fmt:message key="admin.nav.dashboard" /></span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-product"><span class="material-symbols-outlined fs-5">motorcycle</span><span><fmt:message key="admin.nav.products" /></span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-brand"><span class="material-symbols-outlined fs-5">settings_input_component</span><span><fmt:message key="admin.nav.brands" /></span></a>
        <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/manage-order"><span class="material-symbols-outlined fs-5">shopping_bag</span><span><fmt:message key="admin.nav.orders" /></span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-user"><span class="material-symbols-outlined fs-5">group</span><span><fmt:message key="admin.nav.users" /></span></a>
    </nav>
</aside>
<main class="admin-main">
    <header class="mb-5 d-flex justify-content-between align-items-end flex-wrap gap-3">
        <div>
            <h2 class="font-heading text-uppercase fw-bold m-0 fs-3"><fmt:message key="admin.ordersHeading" /></h2>
            <p class="text-secondary mt-1"><fmt:message key="admin.ordersSubtitle" /></p>
        </div>
        <div class="d-flex flex-wrap align-items-center gap-2">
            <%@ include file="/admin/notification-widget.jsp" %>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline-ducati rounded-0 py-2 px-3 text-uppercase small"><fmt:message key="admin.nav.dashboard" /></a>
        </div>
    </header>
    <section class="card card-ducati overflow-hidden mb-4">
        <div class="table-responsive">
            <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                <thead class="table-dark font-heading text-uppercase small">
                    <tr><th class="px-4 py-3"><fmt:message key="admin.code" /></th><th class="px-4 py-3"><fmt:message key="admin.customer" /></th><th class="px-4 py-3"><fmt:message key="admin.orderProducts" /></th><th class="px-4 py-3"><fmt:message key="admin.appointment" /></th><th class="px-4 py-3"><fmt:message key="admin.total" /></th><th class="px-4 py-3 text-end"><fmt:message key="admin.status" /></th></tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr data-order-id="${order.id}">
                            <td class="px-4 py-4 fw-bold text-danger">#${order.code}</td>
                            <td class="px-4 py-4"><strong>${order.customer.fullName}</strong><br/><span class="text-muted small">${order.customer.phone}</span><br/><span class="text-muted small">${order.customer.email}</span></td>
                            <td class="px-4 py-4"><c:forEach var="d" items="${order.details}"><div>${d.product.name} <span class="text-muted">x${d.quantity}</span></div></c:forEach></td>
                            <td class="px-4 py-4 small"><strong><fmt:message key="admin.showroom" />:</strong> ${order.showroom}<br/><strong><fmt:message key="admin.date" />:</strong> ${order.appointmentDate}<br/><strong><fmt:message key="admin.time" />:</strong> ${order.appointmentTime}</td>
                            <td class="px-4 py-4 fw-bold text-danger"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>đ</td>
                            <td class="px-4 py-4 text-end">
                                <form action="${pageContext.request.contextPath}/admin/manage-order" method="post" class="d-inline-block">
                                    <input type="hidden" name="orderId" value="${order.id}"/>
                                    <select name="txtOrderStatus" onchange="this.form.submit()" class="form-select form-select-sm bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase js-order-status-select">
                                        <option value="Chờ duyệt" ${order.status == 'Chờ duyệt' ? 'selected' : ''}><fmt:message key="admin.status.pending" /></option>
                                        <option value="Đã xác nhận" ${order.status == 'Đã xác nhận' ? 'selected' : ''}><fmt:message key="admin.status.confirmed" /></option>
                                        <option value="Đã giao xe" ${order.status == 'Đã giao xe' ? 'selected' : ''}><fmt:message key="admin.status.delivered" /></option>
                                        <option value="Đã hủy" ${order.status == 'Đã hủy' ? 'selected' : ''}><fmt:message key="admin.status.cancelled" /></option>
                                    </select>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty orders}"><tr><td colspan="6" class="px-4 py-5 text-center text-muted"><fmt:message key="admin.noOrders" /></td></tr></c:if>
                </tbody>
            </table>
        </div>
    </section>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js?v=20260713"></script>
<script>
    function connectAdminOrderSocket() {
        if (!window.WebSocket) return;
        const protocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
        const socket = new WebSocket(protocol + window.location.host + '${pageContext.request.contextPath}/ws/admin');
        socket.onmessage = (message) => {
            try {
                const event = JSON.parse(message.data);
                if (event.type !== 'ORDER_STATUS_UPDATED' || !event.order) return;
                const row = document.querySelector('[data-order-id="' + event.order.id + '"]');
                if (!row) return;
                const select = row.querySelector('.js-order-status-select');
                if (select) select.value = event.order.status;
            } catch (error) {
                console.error('Invalid admin order realtime event', error);
            }
        };
        socket.onclose = () => window.setTimeout(connectAdminOrderSocket, 5000);
    }
    connectAdminOrderSocket();
</script>
</body>
</html>
