<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="${product.name} - CHI TIẾT" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <c:if test="${empty product}">
        <div class="card card-ducati p-5 text-center">
            <h1 class="font-heading text-uppercase fs-3">Không tìm thấy sản phẩm</h1>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-ducati mt-3">Quay lại bộ sưu tập</a>
        </div>
    </c:if>

    <c:if test="${not empty product}">
        <section class="row g-5 align-items-start mb-5">
            <div class="col-12 col-lg-7">
                <div class="card card-ducati overflow-hidden position-relative mb-3" style="aspect-ratio: 4/3;">
                    <div class="carbon-overlay"></div>
                    <img id="main-product-img" alt="${product.name}" class="w-100 h-100 object-fit-cover" style="object-fit: cover;" src="${pageContext.request.contextPath}/${product.imageUrl}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/product-placeholder.svg';"/>
                </div>
            </div>

            <div class="col-12 col-lg-5">
                <div class="ps-lg-4">
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <span class="badge bg-danger rounded-0 font-mono-data">${product.category.name}</span>
                        <span class="text-muted font-mono-data small text-uppercase">SKU: ${product.sku}</span>
                    </div>
                    <h1 class="font-heading display-5 text-uppercase fw-black mb-3">${product.name}</h1>
                    <p class="text-secondary">${empty product.description ? 'Sản phẩm đang được cập nhật mô tả chi tiết.' : product.description}</p>
                    <div class="font-mono-data text-danger fs-3 fw-bold mb-4"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>đ</div>

                    <div class="row g-3 mb-4">
                        <div class="col-4">
                            <div class="card card-ducati p-3 h-100">
                                <span class="text-muted small text-uppercase">Động cơ</span>
                                <strong class="text-white">${empty product.displacement ? '-' : product.displacement}</strong>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card card-ducati p-3 h-100">
                                <span class="text-muted small text-uppercase">Công suất</span>
                                <strong class="text-white">${empty product.horsepower ? '-' : product.horsepower}</strong>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card card-ducati p-3 h-100">
                                <span class="text-muted small text-uppercase">Kho</span>
                                <strong class="text-white">${product.stock}</strong>
                            </div>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/cart" method="post" class="pt-4 border-top border-secondary">
                        <input type="hidden" name="productId" value="${product.id}"/>
                        <div class="mb-3">
                            <label class="font-heading text-muted text-uppercase small d-block mb-2">Màu sắc</label>
                            <select name="selectedColor" class="form-select bg-black border-secondary text-white rounded-0">
                                <option value="Tiêu chuẩn">Tiêu chuẩn</option>
                                <option value="Ducati Red">Ducati Red</option>
                                <option value="Star White">Star White</option>
                                <option value="Black">Black</option>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label class="font-heading text-muted text-uppercase small d-block mb-2">Số lượng</label>
                            <input name="quantity" class="form-control bg-black border-secondary text-white rounded-0" value="1" min="1" max="${product.stock}" type="number"/>
                        </div>
                        <button type="submit" class="btn btn-ducati w-100 py-3 d-flex align-items-center justify-content-center gap-2">
                            <span class="material-symbols-outlined fs-5">shopping_cart</span>
                            <span>Thêm vào giỏ hàng</span>
                        </button>
                    </form>
                </div>
            </div>
        </section>
    </c:if>
</main>

<%@ include file="/common/footer.jsp" %>
