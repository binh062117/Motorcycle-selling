<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="DUCATI CORSE | Showroom Xe Máy Cao Cấp" />
<%@ include file="/common/header.jsp" %>

<main class="bg-dark text-white">
    <section id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="7000">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        </div>
        <div class="carousel-inner position-relative" style="height: 680px;">
            <div class="carbon-overlay"></div>
            <c:forEach var="product" items="${featuredProducts}" varStatus="st">
                <div class="carousel-item ${st.first ? 'active' : ''} h-100">
                    <img alt="${product.name}" class="d-block w-100 h-100 object-fit-cover filter-grayscale opacity-50" style="object-fit: cover; filter: grayscale(80%);" src="${pageContext.request.contextPath}/${product.imageUrl}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/product-placeholder.svg';"/>
                    <div class="absolute-center-caption carousel-caption d-flex align-items-center text-start h-100 start-0 top-0 bottom-0 ps-5" style="left: 0; right: 0;">
                        <div class="container px-4">
                            <div class="col-12 col-lg-8 bg-black bg-opacity-50 p-5 border-start border-danger border-4" style="border-radius: 0;">
                                <span class="font-mono-data text-danger tracking-widest text-uppercase mb-2 d-block" style="letter-spacing: 0.25em; font-size:12px;">${product.category.name}</span>
                                <h1 class="font-heading display-4 fw-black text-white mb-3 text-uppercase leading-tight" style="font-weight: 900;">${product.name}<br/><span class="text-danger"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>đ</span></h1>
                                <p class="text-secondary mb-4 fs-5">${empty product.description ? 'Khám phá xe và mặt hàng mới nhất trong hệ thống MotoSales.' : product.description}</p>
                                <div class="d-flex flex-wrap gap-3">
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" class="btn btn-ducati px-4 py-3 d-flex align-items-center gap-2">
                                        <span>Khám phá ngay</span>
                                        <span class="material-symbols-outlined fs-6">arrow_forward</span>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-ducati px-4 py-3">Xem bộ sưu tập</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon p-3 border border-secondary bg-dark" aria-hidden="true" style="border-radius: 0;"></span>
            <span class="visually-hidden">Trước</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon p-3 border border-secondary bg-dark" aria-hidden="true" style="border-radius: 0;"></span>
            <span class="visually-hidden">Kế tiếp</span>
        </button>
    </section>

    <section class="py-5 container-fluid px-4 max-w-container-max mx-auto">
        <div class="mb-4 text-center text-md-start">
            <h2 class="font-heading text-uppercase tracking-wider fs-4">Tìm xe theo hãng</h2>
            <p class="font-mono-data text-muted text-uppercase small m-0">Dữ liệu hãng lấy từ SQL Server</p>
        </div>
        <div class="row g-3">
            <c:forEach var="brand" items="${brands}">
                <div class="col-6 col-md-3 col-lg-2">
                    <a href="${pageContext.request.contextPath}/products?brand=${brand.name}" class="card card-ducati h-100 p-4 flex-column align-items-center justify-content-center text-center text-decoration-none group racing-stripe">
                        <c:if test="${not empty brand.logoUrl}">
                            <img src="${brand.logoUrl}" alt="${brand.name} logo" class="mb-3" style="height:38px;max-width:120px;object-fit:contain;filter:brightness(1.2);" onerror="this.classList.add('d-none');"/>
                        </c:if>
                        <span class="font-heading fw-bold fs-5 text-white transition-colors group-hover-danger">${brand.name}</span>
                        <span class="font-mono-data text-muted small mt-2" style="font-size: 10px;">${brand.origin}</span>
                    </a>
                </div>
            </c:forEach>
        </div>
    </section>

    <section class="py-5 bg-black bg-opacity-25 border-top border-bottom border-secondary" style="border-color: var(--border-color) !important;">
        <div class="container-fluid px-4 max-w-container-max mx-auto">
            <div class="mb-5 d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3">
                <div>
                    <h2 class="font-heading text-uppercase tracking-tighter fs-3 m-0">SẢN PHẨM NỔI BẬT</h2>
                    <div class="bg-danger mt-2" style="width: 64px; height: 4px;"></div>
                </div>
                <a href="${pageContext.request.contextPath}/products" class="font-heading text-secondary text-uppercase text-decoration-none border-bottom border-secondary pb-1 small hover-text-white transition-colors">Xem tất cả</a>
            </div>
            <div class="row g-4">
                <c:forEach var="product" items="${featuredProducts}">
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="card card-ducati h-100 overflow-hidden position-relative group">
                            <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                                <img alt="${product.name}" class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="${pageContext.request.contextPath}/${product.imageUrl}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/product-placeholder.svg';"/>
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
                                            <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" class="btn btn-ducati py-1 px-3" style="font-size: 10px;">Chi tiết</a>
                                            <form action="${pageContext.request.contextPath}/cart" method="post" class="m-0">
                                                <input type="hidden" name="productId" value="${product.id}"/>
                                                <input type="hidden" name="selectedColor" value="Tiêu chuẩn"/>
                                                <input type="hidden" name="quantity" value="1"/>
                                                <button type="submit" class="btn btn-secondary py-1 px-2 border-0 rounded-0" style="font-size: 10px; font-family: var(--font-heading); text-transform: uppercase;">Thêm giỏ</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</main>

<%@ include file="/common/footer.jsp" %>
