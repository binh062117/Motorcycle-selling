<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.appLang}">
    <c:set var="appLang" value="vi" scope="session" />
</c:if>
<fmt:setLocale value="${sessionScope.appLang}" scope="session" />
<fmt:setBundle basename="messages" />
<fmt:message key="orders.pageTitle" var="ordersPageTitle" />
<c:set var="pageTitle" value="${ordersPageTitle}" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <header class="mb-4 d-flex justify-content-between align-items-end flex-wrap gap-3">
        <div>
            <h1 class="font-heading text-uppercase tracking-tighter fs-3 m-0"><fmt:message key="orders.heading" /></h1>
            <div class="bg-danger mt-2" style="width: 64px; height: 4px;"></div>
        </div>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-ducati py-2 px-3 small"><fmt:message key="orders.newBooking" /></a>
    </header>

    <div class="table-responsive border border-secondary bg-black bg-opacity-50 mb-4">
        <table class="table table-hover font-mono-data text-white mb-0 align-middle">
            <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                <tr>
                    <th class="px-4 py-3"><fmt:message key="orders.code" /></th>
                    <th class="px-4 py-3"><fmt:message key="orders.product" /></th>
                    <th class="px-4 py-3">Showroom</th>
                    <th class="px-4 py-3"><fmt:message key="orders.appointmentTime" /></th>
                    <th class="px-4 py-3"><fmt:message key="orders.payment" /></th>
                    <th class="px-4 py-3"><fmt:message key="orders.total" /></th>
                    <th class="px-4 py-3"><fmt:message key="orders.status" /></th>
                    <th class="px-4 py-3 text-end"><fmt:message key="orders.detail" /></th>
                </tr>
            </thead>
            <tbody class="divide-y divide-secondary">
                <c:forEach var="order" items="${orders}">
                    <c:choose>
                        <c:when test="${order.status == 'Đã xác nhận'}">
                            <c:set var="statusClass" value="text-success" />
                            <c:set var="statusDot" value="bg-success" />
                            <fmt:message key="orders.status.confirmed" var="statusLabel" />
                        </c:when>
                        <c:when test="${order.status == 'Đã hủy'}">
                            <c:set var="statusClass" value="text-muted" />
                            <c:set var="statusDot" value="bg-secondary" />
                            <fmt:message key="orders.status.cancelled" var="statusLabel" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="statusClass" value="text-danger" />
                            <c:set var="statusDot" value="bg-danger" />
                            <fmt:message key="orders.status.pending" var="statusLabel" />
                        </c:otherwise>
                    </c:choose>
                    <tr>
                        <td class="px-4 py-4 fw-bold text-danger">#${order.code}</td>
                        <td class="px-4 py-4">
                            <c:forEach var="detail" items="${order.details}">
                                <div class="d-flex flex-column mb-2">
                                    <span class="font-heading fs-6 fw-bold text-white uppercase">${detail.product.name}</span>
                                    <c:choose>
                                        <c:when test="${detail.color == 'Standard' || detail.color == 'Tiêu chuẩn'}">
                                            <fmt:message key="productDetail.standard" var="colorLabel" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="colorLabel" value="${detail.color}" />
                                        </c:otherwise>
                                    </c:choose>
                                    <span class="text-muted small uppercase" style="font-size:10px;"><fmt:message key="productDetail.color" />: ${colorLabel} | <fmt:message key="orders.qty" />: ${detail.quantity}</span>
                                </div>
                            </c:forEach>
                        </td>
                        <td class="px-4 py-4 text-muted small">${order.showroom}</td>
                        <td class="px-4 py-4 small">
                            <div class="d-flex flex-column">
                                <span>${order.appointmentDate}</span>
                                <span class="text-muted small" style="font-size:10px;">${order.appointmentTime}</span>
                            </div>
                        </td>
                        <td class="px-4 py-4 text-uppercase small text-muted">${order.paymentMethod}</td>
                        <td class="px-4 py-4 fw-bold text-danger"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>đ</td>
                        <td class="px-4 py-4">
                            <div class="d-flex align-items-center gap-2">
                                <span class="d-inline-block rounded-circle ${statusDot}" style="width: 8px; height: 8px;"></span>
                                <span class="${statusClass} text-uppercase small fw-bold">${statusLabel}</span>
                            </div>
                        </td>
                        <td class="px-4 py-4 text-end">
                            <a href="${pageContext.request.contextPath}/order-detail?id=${order.id}" class="btn btn-outline-secondary py-1 px-3 rounded-0 small text-uppercase font-heading" style="font-size:11px;"><fmt:message key="orders.viewSlip" /></a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty orders}">
                    <tr>
                        <td colspan="8" class="px-4 py-5 text-center text-muted"><fmt:message key="orders.empty" /></td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</main>

<%@ include file="/common/footer.jsp" %>
