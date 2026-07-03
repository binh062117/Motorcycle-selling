<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.appLang}">
    <c:set var="appLang" value="vi" scope="session" />
</c:if>
<fmt:setLocale value="${sessionScope.appLang}" scope="session" />
<fmt:setBundle basename="messages" />
<fmt:message key="products.pageTitle" var="productsPageTitle" />
<c:set var="pageTitle" value="${productsPageTitle}" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <div class="row g-4">
        <aside class="col-12 col-lg-3">
            <form action="${pageContext.request.contextPath}/products" method="get" class="d-flex flex-column gap-4 sticky-lg-top" style="top: 100px; z-index: 5;">
                <div class="card card-ducati p-4 racing-stripe">
                    <h2 class="font-heading text-uppercase tracking-wider fs-6 text-danger mb-4 fw-bold"><fmt:message key="products.brand" /></h2>
                    <div class="d-flex flex-column gap-3">
                        <c:forEach var="brand" items="${brands}">
                            <div class="form-check">
                                <input name="brand" value="${brand.name}" id="brand${brand.id}" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="radio" ${param.brand == brand.name ? 'checked' : ''}/>
                                <label class="form-check-label font-mono-data text-white text-uppercase d-inline-flex align-items-center gap-2" for="brand${brand.id}">
                                    <c:if test="${not empty brand.logoUrl}">
                                        <img src="${brand.logoUrl}" alt="${brand.name} logo" style="width:26px;height:18px;object-fit:contain;background:#fff;padding:2px;" onerror="this.classList.add('d-none');"/>
                                    </c:if>
                                    <span>${brand.name}</span>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="card card-ducati p-4">
                    <h2 class="font-heading text-uppercase tracking-wider fs-6 text-danger mb-4 fw-bold"><fmt:message key="products.category" /></h2>
                    <div class="d-flex flex-column gap-3">
                        <c:forEach var="category" items="${categories}">
                            <div class="form-check">
                                <input name="category" value="${category.name}" id="cat${category.id}" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="radio" ${param.category == category.name ? 'checked' : ''}/>
                                <label class="form-check-label font-mono-data text-white text-uppercase" for="cat${category.id}">${category.name}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="card card-ducati p-4">
                    <h2 class="font-heading text-uppercase tracking-wider fs-6 text-danger mb-3 fw-bold"><fmt:message key="products.price" /></h2>
                    <select name="priceFilter" class="form-select bg-black border-secondary text-white font-mono-data text-uppercase rounded-0">
                        <option value=""><fmt:message key="products.allPrices" /></option>
                        <option value="under_300" ${param.priceFilter == 'under_300' ? 'selected' : ''}><fmt:message key="products.under300" /></option>
                        <option value="300_500" ${param.priceFilter == '300_500' ? 'selected' : ''}><fmt:message key="products.300to500" /></option>
                        <option value="over_500" ${param.priceFilter == 'over_500' ? 'selected' : ''}><fmt:message key="products.over500" /></option>
                    </select>
                </div>

                <button type="submit" class="btn btn-ducati w-100 py-3 d-flex align-items-center justify-content-center gap-2">
                    <span><fmt:message key="products.apply" /></span>
                    <span class="material-symbols-outlined fs-5">tune</span>
                </button>
                <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-ducati w-100 py-2"><fmt:message key="products.clear" /></a>
            </form>
        </aside>

        <section class="col-12 col-lg-9">
            <header class="mb-4 d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3">
                <div>
                    <h1 class="font-heading text-uppercase tracking-tighter fs-3 m-0"><fmt:message key="products.title" /></h1>
                    <p class="font-mono-data text-muted text-uppercase small m-0 mt-1"><fmt:message key="products.showing" /> ${products.size()} <fmt:message key="products.fromDb" /></p>
                </div>
            </header>

            <div class="row g-4">
                <c:forEach var="product" items="${products}">
                    <div class="col-12 col-md-6 col-xl-4">
                        <div class="card card-ducati h-100 overflow-hidden position-relative group">
                            <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                                <img class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/product-placeholder.svg';"/>
                                <div class="bike-card-gradient"></div>
                                <div class="position-absolute bottom-0 start-0 end-0 p-4">
                                    <div class="font-heading text-danger text-uppercase tracking-wider small mb-1">${product.category.name}</div>
                                    <h3 class="font-heading fs-5 text-uppercase leading-tight mb-2 text-white">${product.name}</h3>
                                    <div class="d-flex justify-content-between align-items-end mt-3">
                                        <div>
                                            <div class="font-mono-data text-muted small" style="font-size: 11px;">${empty product.displacement ? product.sku : product.displacement}</div>
                                            <div class="font-mono-data text-white fw-bold mt-1" style="font-size: 16px;"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>đ</div>
                                        </div>
                                        <div class="d-flex flex-column gap-2">
                                            <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" class="btn btn-ducati py-1 px-3" style="font-size: 10px;"><fmt:message key="products.detail" /></a>
                                            <form action="${pageContext.request.contextPath}/cart" method="post" class="m-0">
                                                <input type="hidden" name="productId" value="${product.id}"/>
                                                <input type="hidden" name="selectedColor" value="Tiêu chuẩn"/>
                                                <input type="hidden" name="quantity" value="1"/>
                                                <button type="submit" class="btn btn-secondary py-1 px-2 border-0 rounded-0" style="font-size: 10px; font-family: var(--font-heading); text-transform: uppercase;"><fmt:message key="products.addCart" /></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty products}">
                    <div class="col-12">
                        <div class="card card-ducati p-5 text-center">
                            <h2 class="font-heading text-uppercase text-white fs-4"><fmt:message key="products.emptyTitle" /></h2>
                            <p class="text-secondary mb-0"><fmt:message key="products.emptyBody" /></p>
                        </div>
                    </div>
                </c:if>
            </div>
        </section>
    </div>
</main>

<%@ include file="/common/footer.jsp" %>
