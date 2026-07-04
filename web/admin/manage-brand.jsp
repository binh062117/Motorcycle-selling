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
    <title><fmt:message key="admin.brandsTitle"/></title>
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
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-product"><span class="material-symbols-outlined fs-5">motorcycle</span><span><fmt:message key="admin.nav.products"/></span></a>
        <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/manage-brand"><span class="material-symbols-outlined fs-5">settings_input_component</span><span><fmt:message key="admin.nav.brands"/></span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-order"><span class="material-symbols-outlined fs-5">shopping_bag</span><span><fmt:message key="admin.nav.orders"/></span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-user"><span class="material-symbols-outlined fs-5">group</span><span><fmt:message key="admin.nav.users"/></span></a>
    </nav>
</aside>
<main class="admin-main">
    <header class="d-flex justify-content-between align-items-end mb-5 flex-wrap gap-3">
        <div><h2 class="font-heading text-uppercase fw-bold m-0 fs-3"><fmt:message key="admin.brandsHeading"/></h2><p class="text-secondary mt-1"><fmt:message key="admin.brandsSubtitle"/></p></div>
        <div class="d-flex flex-wrap align-items-center gap-2">
            <%@ include file="/admin/notification-widget.jsp" %>
            <button onclick="openBrandModal('', '', '', '')" class="btn btn-ducati px-4 py-3 d-flex align-items-center gap-2"><span class="material-symbols-outlined fs-5">add_circle</span><span><fmt:message key="admin.addBrand"/></span></button>
        </div>
    </header>
    <section class="card card-ducati overflow-hidden mb-4">
        <div class="table-responsive">
            <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                <thead class="table-dark font-heading text-uppercase small"><tr><th class="px-4 py-3">Logo</th><th class="px-4 py-3"><fmt:message key="admin.brand"/></th><th class="px-4 py-3"><fmt:message key="admin.origin"/></th><th class="px-4 py-3 text-end"><fmt:message key="admin.actions"/></th></tr></thead>
                <tbody>
                    <c:forEach var="brand" items="${brands}">
                        <tr>
                            <td class="px-4 py-4">
                                <c:if test="${not empty brand.logoUrl}">
                                    <c:choose>
                                        <c:when test="${brand.logoUrl.startsWith('http://') || brand.logoUrl.startsWith('https://')}"><img src="${brand.logoUrl}" alt="${brand.name} logo" style="width:64px;height:34px;object-fit:contain;background:#fff;padding:4px;"/></c:when>
                                        <c:otherwise><img src="${pageContext.request.contextPath}/${brand.logoUrl}" alt="${brand.name} logo" style="width:64px;height:34px;object-fit:contain;background:#fff;padding:4px;"/></c:otherwise>
                                    </c:choose>
                                </c:if>
                            </td>
                            <td class="px-4 py-4 fw-bold text-white fs-6">${brand.name}</td>
                            <td class="px-4 py-4 text-uppercase text-muted">${brand.origin}</td>
                            <td class="px-4 py-4 text-end">
                                <button onclick="openBrandModal('${brand.id}', '${brand.name}', '${brand.origin}', '${brand.logoUrl}')" class="btn btn-sm btn-outline-light rounded-0 p-2"><span class="material-symbols-outlined fs-6">edit</span></button>
                                <a href="${pageContext.request.contextPath}/admin/manage-brand?action=delete&id=${brand.id}" onclick="return confirm('<fmt:message key="admin.confirmDeleteBrand"/> ${brand.name}?')" class="btn btn-sm btn-outline-danger rounded-0 p-2"><span class="material-symbols-outlined fs-6">delete</span></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</main>
<div class="modal fade" id="brandModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content card-ducati border border-secondary racing-stripe">
            <form action="${pageContext.request.contextPath}/admin/manage-brand" method="post" class="needs-validation-custom" novalidate>
                <div class="modal-header border-bottom border-secondary"><h5 class="modal-title font-heading text-white text-uppercase fw-bold fs-5"><fmt:message key="admin.brandConfig"/></h5><button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button></div>
                <div class="modal-body">
                    <input type="hidden" name="txtBrandId" id="brandIdInput" value=""/>
                    <div class="mb-3"><label class="form-label font-heading text-uppercase small text-muted"><fmt:message key="admin.brandName"/></label><input name="txtBrandName" id="brandNameInput" class="form-control bg-black border-secondary text-white rounded-0" required type="text"/></div>
                    <div class="mb-3"><label class="form-label font-heading text-uppercase small text-muted"><fmt:message key="admin.origin"/></label><input name="txtBrandOrigin" id="brandOriginInput" class="form-control bg-black border-secondary text-white rounded-0" required type="text"/></div>
                    <div class="mb-3"><label class="form-label font-heading text-uppercase small text-muted"><fmt:message key="admin.logoUrl"/></label><input name="txtBrandLogoUrl" id="brandLogoInput" class="form-control bg-black border-secondary text-white rounded-0" type="text"/></div>
                </div>
                <div class="modal-footer border-top border-secondary"><button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal"><fmt:message key="admin.cancel"/></button><button type="submit" class="btn btn-ducati rounded-0"><fmt:message key="admin.save"/></button></div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>
let brandModal;document.addEventListener('DOMContentLoaded',()=>{brandModal=new bootstrap.Modal(document.getElementById('brandModal'));});
function openBrandModal(id,name,origin,logoUrl){document.getElementById('brandIdInput').value=id;document.getElementById('brandNameInput').value=name;document.getElementById('brandOriginInput').value=origin;document.getElementById('brandLogoInput').value=logoUrl || '';brandModal.show();}
</script>
</body>
</html>
