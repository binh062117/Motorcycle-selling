<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.appLang}">
    <c:set var="appLang" value="vi" scope="session" />
</c:if>
<fmt:setLocale value="${sessionScope.appLang}" scope="session" />
<fmt:setBundle basename="messages" />
<fmt:message key="price.pageTitle" var="pricePageTitle" />
<c:set var="pageTitle" value="${pricePageTitle}" />
<%@ include file="/common/header.jsp" %>

<main class="container-fluid px-4 max-w-container-max mx-auto py-5">
    <section class="mb-5">
        <div class="d-flex flex-column flex-lg-row justify-content-between gap-4 border-bottom border-secondary pb-4">
            <div>
                <span class="font-mono-data text-danger text-uppercase small tracking-wider"><fmt:message key="price.eyebrow" /></span>
                <h1 class="font-heading text-white text-uppercase display-6 fw-black mt-2 mb-3"><fmt:message key="price.title" /></h1>
                <p class="text-muted mb-0" style="max-width: 720px;"><fmt:message key="price.description" /></p>
            </div>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-ducati rounded-0 align-self-lg-end px-4 py-3"><fmt:message key="price.viewCollection" /></a>
        </div>
    </section>

    <section class="card card-ducati overflow-hidden">
        <div class="table-responsive">
            <table class="table table-dark table-hover align-middle m-0 font-mono-data">
                <thead>
                    <tr class="text-uppercase text-muted small">
                        <th class="px-4 py-3"><fmt:message key="price.product" /></th>
                        <th class="px-4 py-3"><fmt:message key="price.brand" /></th>
                        <th class="px-4 py-3"><fmt:message key="price.category" /></th>
                        <th class="px-4 py-3"><fmt:message key="price.spec" /></th>
                        <th class="px-4 py-3 text-end"><fmt:message key="price.amount" /></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td class="px-4 py-3">
                                <div class="d-flex align-items-center gap-3">
                                    <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}" style="width:72px;height:48px;object-fit:contain;background:#050608;" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/product-placeholder.svg';"/>
                                    <div>
                                        <div class="font-heading text-white text-uppercase fw-bold">${product.name}</div>
                                        <div class="text-muted small">${product.sku}</div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-4 py-3 text-muted">${product.brand.name}</td>
                            <td class="px-4 py-3 text-muted">${product.category.name}</td>
                            <td class="px-4 py-3 text-muted">${empty product.displacement ? '-' : product.displacement}</td>
                            <td class="px-4 py-3 text-end text-danger fw-bold"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>đ</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</main>

<%@ include file="/common/footer.jsp" %>
