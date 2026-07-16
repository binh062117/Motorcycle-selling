<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.appLang}"><c:set var="appLang" value="vi" scope="session"/></c:if>
<fmt:setLocale value="${sessionScope.appLang}" scope="session"/>
<fmt:setBundle basename="messages"/>
<!DOCTYPE html>
<html lang="${sessionScope.appLang}">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title><fmt:message key="admin.productsTitle"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <style>.admin-sidebar{width:260px;background-color:var(--surface-container-lowest);border-right:1px solid var(--border-color);position:fixed;top:0;bottom:0;left:0;padding-top:2rem;display:flex;flex-direction:column}.admin-main{margin-left:260px;padding:2.5rem;background-color:var(--bg-dark);min-height:100vh}.sidebar-link{display:flex;align-items:center;gap:1rem;color:var(--text-muted);text-decoration:none;padding:.85rem 1.5rem;font-family:var(--font-mono);font-size:13px;text-transform:uppercase;border-left:4px solid transparent}.sidebar-link.active{background-color:var(--primary-color);color:#fff;border-left-color:var(--text-primary)}</style>
</head>
<body class="bg-dark text-white">
<aside class="admin-sidebar">
    <div class="px-4 mb-4"><h1 class="font-heading fs-5 fw-black text-danger uppercase mb-1"><fmt:message key="admin.console"/></h1><p class="font-mono-data text-muted uppercase" style="font-size:9px"><fmt:message key="admin.consoleSubtitle"/></p></div>
    <nav class="flex-grow-1">
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/dashboard"><span class="material-symbols-outlined fs-5">dashboard</span><span><fmt:message key="admin.nav.dashboard"/></span></a>
        <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/manage-product"><span class="material-symbols-outlined fs-5">motorcycle</span><span><fmt:message key="admin.nav.products"/></span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-brand"><span class="material-symbols-outlined fs-5">settings_input_component</span><span><fmt:message key="admin.nav.brands"/></span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-order"><span class="material-symbols-outlined fs-5">shopping_bag</span><span><fmt:message key="admin.nav.orders"/></span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-user"><span class="material-symbols-outlined fs-5">group</span><span><fmt:message key="admin.nav.users"/></span></a>
    </nav>
</aside>
<main class="admin-main">
    <header class="d-flex justify-content-between align-items-end mb-5 flex-wrap gap-3">
        <div><h2 class="font-heading text-uppercase fw-bold m-0 fs-3"><fmt:message key="admin.productsHeading"/></h2><p class="text-secondary mt-1"><fmt:message key="admin.productsSubtitle"/></p></div>
        <div class="d-flex flex-wrap align-items-center gap-2">
            <%@ include file="/admin/notification-widget.jsp" %>
            <button onclick="openProductModal()" class="btn btn-ducati px-4 py-3 d-flex align-items-center gap-2"><span class="material-symbols-outlined fs-5">add_circle</span><span><fmt:message key="admin.addProduct"/></span></button>
        </div>
    </header>
    <div class="table-responsive border border-secondary bg-black bg-opacity-50">
        <table class="table table-hover font-mono-data text-white mb-0 align-middle">
            <thead class="table-dark font-heading text-uppercase small"><tr><th class="px-4 py-3"><fmt:message key="admin.image"/></th><th class="px-4 py-3"><fmt:message key="admin.nameSku"/></th><th class="px-4 py-3"><fmt:message key="admin.category"/></th><th class="px-4 py-3"><fmt:message key="admin.price"/></th><th class="px-4 py-3"><fmt:message key="admin.stock"/></th><th class="px-4 py-3 text-end"><fmt:message key="admin.actions"/></th></tr></thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td class="px-4 py-3"><div class="bg-dark border border-secondary overflow-hidden" style="width:80px;height:56px;"><img class="w-100 h-100 object-fit-cover" style="object-fit:cover" src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/product-placeholder.svg';"/></div></td>
                        <td class="px-4 py-3"><span class="font-heading fs-6 fw-bold text-white uppercase">${product.name}</span><br/><span class="text-muted small uppercase">SKU: ${product.sku}</span></td>
                        <td class="px-4 py-3"><span class="badge bg-secondary rounded-0 uppercase">${product.category.name}</span><br/><span class="text-muted small">${product.brand.name}</span></td>
                        <td class="px-4 py-3 fw-bold text-danger"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>đ</td>
                        <td class="px-4 py-3"><span class="${product.stock > 0 ? 'text-success' : 'text-danger'} small uppercase"><fmt:message key="admin.inStock"/> ${product.stock}</span></td>
                        <td class="px-4 py-3 text-end">
                            <button onclick="openProductModal('${product.id}','${product.name}','${product.sku}','${product.brand.id}','${product.category.id}','${product.price}','${product.stock}','${product.displacement}','${product.horsepower}','${product.weight}')" class="btn btn-outline-secondary p-2 rounded-0 border-0 hover-text-white"><span class="material-symbols-outlined fs-5">edit</span></button>
                            <a href="${pageContext.request.contextPath}/admin/manage-product?action=delete&id=${product.id}" onclick="return confirm('<fmt:message key="admin.confirmDeleteProduct"/> ${product.name}?')" class="btn btn-outline-secondary p-2 rounded-0 border-0 text-danger hover-text-danger"><span class="material-symbols-outlined fs-5">delete</span></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>
<div class="modal fade" id="product-modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content card-ducati border-secondary racing-stripe">
            <form action="${pageContext.request.contextPath}/admin/manage-product" method="post" class="needs-validation-custom" novalidate>
                <div class="modal-header"><h3 class="font-heading fs-5 text-uppercase text-white fw-bold"><fmt:message key="admin.productConfig"/></h3><button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button></div>
                <div class="modal-body d-flex flex-column gap-4">
                    <input type="hidden" name="txtProductId" id="form-id" value=""/>
                    <div class="row g-3 font-mono-data">
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small"><fmt:message key="admin.name"/></label><input name="txtProductName" id="form-name" class="form-control bg-black border-secondary text-white rounded-0" required/></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small">SKU</label><input name="txtSku" id="form-sku" class="form-control bg-black border-secondary text-white rounded-0" required/></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small"><fmt:message key="admin.brand"/></label><select name="txtBrandId" id="form-brand" class="form-select bg-black border-secondary text-white rounded-0"><c:forEach var="brand" items="${brands}"><option value="${brand.id}">${brand.name}</option></c:forEach></select></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small"><fmt:message key="admin.category"/></label><select name="txtCategoryId" id="form-category" class="form-select bg-black border-secondary text-white rounded-0"><c:forEach var="category" items="${categories}"><option value="${category.id}">${category.name}</option></c:forEach></select></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small"><fmt:message key="admin.price"/></label><input name="txtPrice" id="form-price" type="number" class="form-control bg-black border-secondary text-white rounded-0" required/></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small"><fmt:message key="admin.stock"/></label><input name="txtStock" id="form-stock" type="number" class="form-control bg-black border-secondary text-white rounded-0" required/></div>
                        <div class="col-md-4"><label class="font-heading text-muted text-uppercase small"><fmt:message key="productDetail.engine"/></label><input name="txtDisplacement" id="form-disp" class="form-control bg-black border-secondary text-white rounded-0"/></div>
                        <div class="col-md-4"><label class="font-heading text-muted text-uppercase small"><fmt:message key="productDetail.power"/></label><input name="txtHorsepower" id="form-hp" class="form-control bg-black border-secondary text-white rounded-0"/></div>
                        <div class="col-md-4"><label class="font-heading text-muted text-uppercase small"><fmt:message key="admin.weight"/></label><input name="txtWeight" id="form-weight" class="form-control bg-black border-secondary text-white rounded-0"/></div>
                    </div>
                </div>
                <div class="modal-footer"><button type="button" class="btn btn-outline-ducati border-secondary py-2" data-bs-dismiss="modal"><fmt:message key="admin.cancel"/></button><button type="submit" class="btn btn-ducati py-2"><fmt:message key="admin.save"/></button></div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js?v=20260713"></script>
<script>
let productModal;document.addEventListener('DOMContentLoaded',()=>{productModal=new bootstrap.Modal(document.getElementById('product-modal'));});
function openProductModal(id='',name='',sku='',brandId='',categoryId='',price='',stock='',disp='',hp='',weight=''){document.getElementById('form-id').value=id;document.getElementById('form-name').value=name;document.getElementById('form-sku').value=sku;document.getElementById('form-price').value=price;document.getElementById('form-stock').value=stock;document.getElementById('form-disp').value=disp;document.getElementById('form-hp').value=hp;document.getElementById('form-weight').value=weight;if(brandId)document.getElementById('form-brand').value=brandId;if(categoryId)document.getElementById('form-category').value=categoryId;productModal.show();}
</script>
</body>
</html>
