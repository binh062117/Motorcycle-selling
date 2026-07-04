<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.appLang}">
    <c:set var="appLang" value="vi" scope="session" />
</c:if>
<fmt:setLocale value="${sessionScope.appLang}" scope="session" />
<fmt:setBundle basename="messages" />
<fmt:message key="dealers.pageTitle" var="dealersPageTitle" />
<c:set var="pageTitle" value="${dealersPageTitle}" />
<%@ include file="/common/header.jsp" %>

<main class="container-fluid px-4 max-w-container-max mx-auto py-5">
    <section class="mb-5">
        <span class="font-mono-data text-danger text-uppercase small tracking-wider"><fmt:message key="dealers.eyebrow" /></span>
        <h1 class="font-heading text-white text-uppercase display-6 fw-black mt-2 mb-3"><fmt:message key="dealers.title" /></h1>
        <p class="text-muted mb-0" style="max-width: 720px;"><fmt:message key="dealers.description" /></p>
    </section>

    <section class="row g-4 mb-5">
        <div class="col-12 col-lg-6">
            <article class="card card-ducati h-100 p-4">
                <div class="d-flex justify-content-between align-items-start gap-3 mb-4">
                    <div>
                        <span class="font-mono-data text-danger small"><fmt:message key="dealers.north" /></span>
                        <h2 class="font-heading text-white text-uppercase fs-4 mt-2"><fmt:message key="dealers.hanoi" /></h2>
                    </div>
                    <span class="material-symbols-outlined text-danger fs-2">location_on</span>
                </div>
                <p class="text-muted mb-3"><fmt:message key="dealers.hanoiAddress" /></p>
                <div class="d-flex flex-column gap-2 font-mono-data small text-muted mb-4">
                    <span>Hotline: <span class="text-danger">+84 24 6413 1111</span></span>
                    <span><fmt:message key="dealers.hours" /></span>
                    <span><fmt:message key="dealers.serviceNorth" /></span>
                </div>
                <div class="d-flex gap-2 flex-wrap mt-auto">
                    <a class="btn btn-ducati rounded-0 px-4" href="${pageContext.request.contextPath}/checkout"><fmt:message key="dealers.book" /></a>
                    <a class="btn btn-outline-ducati rounded-0 px-4" target="_blank" rel="noopener" href="https://www.google.com/maps/search/?api=1&query=110%20Ba%20Trieu%20Hai%20Ba%20Trung%20Ha%20Noi"><fmt:message key="dealers.map" /></a>
                </div>
            </article>
        </div>

        <div class="col-12 col-lg-6">
            <article class="card card-ducati h-100 p-4">
                <div class="d-flex justify-content-between align-items-start gap-3 mb-4">
                    <div>
                        <span class="font-mono-data text-danger small"><fmt:message key="dealers.south" /></span>
                        <h2 class="font-heading text-white text-uppercase fs-4 mt-2"><fmt:message key="dealers.hcm" /></h2>
                    </div>
                    <span class="material-symbols-outlined text-danger fs-2">location_on</span>
                </div>
                <p class="text-muted mb-3"><fmt:message key="dealers.hcmAddress" /></p>
                <div class="d-flex flex-column gap-2 font-mono-data small text-muted mb-4">
                    <span>Hotline: <span class="text-danger">+84 24 6413 1111</span></span>
                    <span><fmt:message key="dealers.hours" /></span>
                    <span><fmt:message key="dealers.serviceSouth" /></span>
                </div>
                <div class="d-flex gap-2 flex-wrap mt-auto">
                    <a class="btn btn-ducati rounded-0 px-4" href="${pageContext.request.contextPath}/checkout"><fmt:message key="dealers.book" /></a>
                    <a class="btn btn-outline-ducati rounded-0 px-4" target="_blank" rel="noopener" href="https://www.google.com/maps/search/?api=1&query=3%20Nguyen%20Luong%20Bang%20Quan%207%20TPHCM"><fmt:message key="dealers.map" /></a>
                </div>
            </article>
        </div>
    </section>

    <section class="card card-ducati p-4">
        <div class="row g-4 align-items-center">
            <div class="col-12 col-lg-8">
                <h2 class="font-heading text-white text-uppercase fs-4 mb-2"><fmt:message key="dealers.processTitle" /></h2>
                <p class="text-muted mb-0"><fmt:message key="dealers.processBody" /></p>
            </div>
            <div class="col-12 col-lg-4 text-lg-end">
                <a class="btn btn-outline-ducati rounded-0 px-4 py-3" href="${pageContext.request.contextPath}/products"><fmt:message key="dealers.chooseBike" /></a>
            </div>
        </div>
    </section>
</main>

<%@ include file="/common/footer.jsp" %>
