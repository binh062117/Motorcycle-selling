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
    <title><fmt:message key="admin.dashboardTitle" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <style>
        .admin-sidebar{width:260px;background-color:var(--surface-container-lowest);border-right:1px solid var(--border-color);position:fixed;top:0;bottom:0;left:0;z-index:100;padding-top:2rem;display:flex;flex-direction:column}
        .admin-main{margin-left:260px;padding:2.5rem;background-color:var(--bg-dark);min-height:100vh}
        .sidebar-link{display:flex;align-items:center;gap:1rem;color:var(--text-muted);text-decoration:none;padding:.85rem 1.5rem;font-family:var(--font-mono);font-size:13px;text-transform:uppercase;border-left:4px solid transparent;transition:all .2s ease}
        .sidebar-link:hover{background-color:var(--surface-container-low);color:#fff}
        .sidebar-link.active{background-color:var(--primary-color);color:#fff;border-left-color:var(--text-primary)}
    </style>
</head>
<body class="bg-dark text-white">
    <aside class="admin-sidebar">
        <div class="px-4 mb-4 select-none">
            <h1 class="font-heading fs-5 fw-black text-danger tracking-tighter uppercase mb-1" style="font-weight:900;"><fmt:message key="admin.console" /></h1>
            <p class="font-mono-data text-muted uppercase" style="font-size:9px;letter-spacing:.1em;"><fmt:message key="admin.consoleSubtitle" /></p>
        </div>
        <nav class="flex-grow-1">
            <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/dashboard"><span class="material-symbols-outlined fs-5">dashboard</span><span><fmt:message key="admin.nav.dashboard" /></span></a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-product"><span class="material-symbols-outlined fs-5">motorcycle</span><span><fmt:message key="admin.nav.products" /></span></a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-brand"><span class="material-symbols-outlined fs-5">settings_input_component</span><span><fmt:message key="admin.nav.brands" /></span></a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-order"><span class="material-symbols-outlined fs-5">shopping_bag</span><span><fmt:message key="admin.nav.orders" /></span></a>
            <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-user"><span class="material-symbols-outlined fs-5">group</span><span><fmt:message key="admin.nav.users" /></span></a>
        </nav>
        <div class="p-3 mt-auto border-top border-secondary" style="border-color:var(--border-color)!important;">
            <div class="d-flex align-items-center gap-3">
                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser.avatarUrl}">
                        <img src="${sessionScope.currentUser.avatarUrl}" alt="${sessionScope.currentUser.fullName}" class="rounded-circle border border-secondary" style="width:40px;height:40px;object-fit:cover;"/>
                    </c:when>
                    <c:otherwise>
                        <div class="rounded-circle bg-secondary bg-opacity-25 d-flex align-items-center justify-content-center" style="width:40px;height:40px;"><span class="material-symbols-outlined text-white">admin_panel_settings</span></div>
                    </c:otherwise>
                </c:choose>
                <div>
                    <p class="font-heading text-white small uppercase m-0 fw-bold">${sessionScope.currentUser.fullName}</p>
                    <p class="text-muted m-0" style="font-size:9px;font-family:var(--font-mono);">${sessionScope.currentUser.role.name}</p>
                </div>
            </div>
        </div>
    </aside>

    <main class="admin-main">
        <header class="d-flex justify-content-between align-items-end mb-5 flex-wrap gap-3">
            <div>
                <h2 class="font-heading text-uppercase fw-bold m-0 fs-3"><fmt:message key="admin.dashboardHeading" /></h2>
                <p class="font-mono-data text-danger text-uppercase small m-0 mt-1"><fmt:message key="admin.liveData" /></p>
            </div>
            <div class="d-flex flex-wrap gap-2">
                <%@ include file="/admin/notification-widget.jsp" %>
                <a class="btn btn-outline-ducati rounded-0 font-mono-data text-uppercase small py-2 px-3" href="${pageContext.request.contextPath}/profile"><fmt:message key="account.profile" /></a>
                <a class="btn btn-outline-ducati rounded-0 font-mono-data text-uppercase small py-2 px-3" href="${pageContext.request.contextPath}/home"><fmt:message key="admin.website" /></a>
            </div>
        </header>

        <section class="row g-4 mb-4">
            <div class="col-12 col-md-3"><div class="card card-ducati p-4 racing-stripe"><p class="font-heading text-muted text-uppercase small mb-2"><fmt:message key="admin.products" /></p><h3 id="adminProductCount" class="font-heading fs-2 fw-black text-white m-0">${productCount}</h3></div></div>
            <div class="col-12 col-md-3"><div class="card card-ducati p-4"><p class="font-heading text-muted text-uppercase small mb-2"><fmt:message key="admin.stockUnits" /></p><h3 class="font-heading fs-2 fw-black text-white m-0">${stockTotal}</h3></div></div>
            <div class="col-12 col-md-3"><div class="card card-ducati p-4 racing-stripe"><p class="font-heading text-muted text-uppercase small mb-2"><fmt:message key="admin.pendingOrders" /></p><h3 id="adminPendingOrders" class="font-heading fs-2 fw-black text-white m-0">${pendingOrders}</h3></div></div>
            <div class="col-12 col-md-3"><div class="card card-ducati p-4"><p class="font-heading text-muted text-uppercase small mb-2"><fmt:message key="admin.totalOrders" /></p><h3 id="adminOrderCount" class="font-heading fs-2 fw-black text-white m-0">${orderCount}</h3></div></div>
        </section>

        <section class="row g-4 mb-4">
            <div class="col-12 col-lg-5">
                <div class="card card-ducati p-4 h-100">
                    <p class="font-heading text-muted text-uppercase small mb-2"><fmt:message key="admin.recordedOrderValue" /></p>
                    <h3 id="adminDashboardRevenue" class="font-heading fs-2 fw-black text-danger m-0"><fmt:formatNumber value="${dashboardRevenue}" pattern="#,##0"/>đ</h3>
                    <p class="text-muted small mt-3 mb-0"><fmt:message key="admin.recordedOrderHelp" /></p>
                    <div class="d-flex flex-wrap gap-2 mt-4">
                        <a class="btn btn-ducati rounded-0 text-uppercase small py-2 px-3" href="${pageContext.request.contextPath}/admin/manage-order"><fmt:message key="admin.manageOrders" /></a>
                        <a class="btn btn-outline-ducati rounded-0 text-uppercase small py-2 px-3" href="${pageContext.request.contextPath}/admin/manage-user"><fmt:message key="admin.manageUsers" /></a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-7">
                <div class="card card-ducati p-4 h-100">
                    <h4 class="font-heading fs-5 text-uppercase text-white m-0"><fmt:message key="admin.stockHealth" /></h4>
                    <div class="d-flex flex-column gap-3 mt-4">
                        <c:forEach var="product" items="${topProducts}">
                            <div>
                                <div class="d-flex justify-content-between font-mono-data small mb-1">
                                    <span class="text-white">${product.name}</span>
                                    <span class="text-muted"><fmt:message key="admin.stock" />: ${product.stock}</span>
                                </div>
                                <div class="progress bg-black rounded-0" style="height:7px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width:${product.stock > 50 ? 100 : product.stock * 2}%;"></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <section class="card card-ducati overflow-hidden mb-4">
            <div class="p-4 border-bottom border-secondary d-flex justify-content-between align-items-center flex-wrap gap-3" style="border-color:var(--border-color)!important;">
                <div>
                    <h4 class="font-heading fs-5 text-uppercase text-white m-0"><fmt:message key="admin.recentOrders" /></h4>
                    <p class="font-mono-data text-muted small m-0 uppercase mt-1"><fmt:message key="admin.recentOrdersHelp" /></p>
                </div>
                <a href="${pageContext.request.contextPath}/admin/manage-order" class="btn btn-outline-ducati rounded-0 py-2 px-3 text-uppercase small"><fmt:message key="admin.viewAll" /></a>
            </div>
            <div class="table-responsive">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small">
                        <tr><th class="px-4 py-3"><fmt:message key="admin.code" /></th><th class="px-4 py-3"><fmt:message key="admin.customer" /></th><th class="px-4 py-3"><fmt:message key="admin.appointment" /></th><th class="px-4 py-3"><fmt:message key="admin.payment" /></th><th class="px-4 py-3"><fmt:message key="admin.status" /></th><th class="px-4 py-3 text-end"><fmt:message key="admin.total" /></th></tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${recentOrders}">
                            <tr data-order-id="${order.id}">
                                <td class="px-4 py-4 text-danger fw-bold">#${order.code}</td>
                                <td class="px-4 py-4"><strong>${order.customer.fullName}</strong><br/><span class="text-muted small">${order.customer.email}</span></td>
                                <td class="px-4 py-4 small">${order.appointmentDate}<br/><span class="text-muted">${order.appointmentTime}</span></td>
                                <td class="px-4 py-4 text-muted">${order.paymentMethod}</td>
                                <td class="px-4 py-4"><span class="badge ${order.status == 'Đã xác nhận' || order.status == 'Đã giao xe' ? 'bg-success' : order.status == 'Đã hủy' ? 'bg-secondary' : 'bg-danger'} rounded-0 text-uppercase js-order-status">${order.status}</span></td>
                                <td class="px-4 py-4 text-end fw-bold text-danger"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>đ</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty recentOrders}">
                            <tr><td colspan="6" class="px-4 py-5 text-center text-muted"><fmt:message key="admin.noOrders" /></td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </section>

        <section class="card card-ducati overflow-hidden">
            <div class="p-4 border-bottom border-secondary" style="border-color:var(--border-color)!important;">
                <h4 class="font-heading fs-5 text-uppercase text-white m-0"><fmt:message key="admin.inventorySnapshot" /></h4>
                <p class="font-mono-data text-muted small m-0 uppercase mt-1"><fmt:message key="admin.inventorySnapshotHelp" /></p>
            </div>
            <div class="table-responsive">
                <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                    <thead class="table-dark font-heading text-uppercase small">
                        <tr><th class="px-4 py-3">SKU</th><th class="px-4 py-3"><fmt:message key="admin.product" /></th><th class="px-4 py-3"><fmt:message key="admin.brand" /></th><th class="px-4 py-3"><fmt:message key="admin.booked" /></th><th class="px-4 py-3 text-end"><fmt:message key="admin.stock" /></th></tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${topProducts}">
                            <tr>
                                <td class="px-4 py-4 text-danger fw-bold">${product.sku}</td>
                                <td class="px-4 py-4 text-white fw-bold">${product.name}</td>
                                <td class="px-4 py-4 text-muted">${product.brand.name}</td>
                                <td class="px-4 py-4">${bookedByProduct[product.id]}</td>
                                <td class="px-4 py-4 text-end fw-bold">${product.stock}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    <script>
        const adminMessages = {
            orderCreated: '<fmt:message key="admin.liveOrderCreated" />',
            statusUpdated: '<fmt:message key="admin.liveStatusUpdated" />'
        };

        function adminToast(message) {
            let container = document.getElementById('adminLiveToastContainer');
            if (!container) {
                container = document.createElement('div');
                container.id = 'adminLiveToastContainer';
                container.className = 'toast-container position-fixed top-0 end-0 p-3';
                container.style.zIndex = '2000';
                document.body.appendChild(container);
            }
            const id = 'adminToast' + Date.now();
            container.insertAdjacentHTML('beforeend', '<div id="' + id + '" class="toast text-white bg-danger border-0" role="alert"><div class="d-flex"><div class="toast-body font-mono-data">' + message + '</div><button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button></div></div>');
            const toastEl = document.getElementById(id);
            const toast = new bootstrap.Toast(toastEl, { delay: 5000 });
            toast.show();
            toastEl.addEventListener('hidden.bs.toast', () => toastEl.remove());
        }

        function formatVnd(value) {
            const number = Number(value || 0);
            return new Intl.NumberFormat('vi-VN').format(number) + 'đ';
        }

        function statusClass(status) {
            if (status === 'Đã xác nhận' || status === 'Đã giao xe') return 'bg-success';
            if (status === 'Đã hủy') return 'bg-secondary';
            return 'bg-danger';
        }

        function applyAdminLiveEvent(event) {
            if (event.stats) {
                const orderCount = document.getElementById('adminOrderCount');
                const pendingOrders = document.getElementById('adminPendingOrders');
                const revenue = document.getElementById('adminDashboardRevenue');
                if (orderCount) orderCount.textContent = event.stats.orderCount;
                if (pendingOrders) pendingOrders.textContent = event.stats.pendingOrders;
                if (revenue) revenue.textContent = formatVnd(event.stats.dashboardRevenue);
            }
            if (event.order) {
                const row = document.querySelector('[data-order-id="' + event.order.id + '"]');
                const badge = row ? row.querySelector('.js-order-status') : null;
                if (badge) {
                    badge.textContent = event.order.status;
                    badge.className = 'badge rounded-0 text-uppercase js-order-status ' + statusClass(event.order.status);
                }
            }
            if (event.type === 'ORDER_CREATED') {
                adminToast(adminMessages.orderCreated + ' #' + event.order.code + ' - ' + event.order.customer);
            } else if (event.type === 'ORDER_STATUS_UPDATED') {
                adminToast(adminMessages.statusUpdated + ' #' + event.order.code + ': ' + event.order.status);
            }
        }

        function connectAdminSocket() {
            if (!window.WebSocket) return;
            const protocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
            const socket = new WebSocket(protocol + window.location.host + '${pageContext.request.contextPath}/ws/admin');
            socket.onmessage = (message) => {
                try {
                    applyAdminLiveEvent(JSON.parse(message.data));
                } catch (error) {
                    console.error('Invalid admin realtime event', error);
                }
            };
            socket.onclose = () => window.setTimeout(connectAdminSocket, 5000);
        }

        connectAdminSocket();
    </script>
</body>
</html>
