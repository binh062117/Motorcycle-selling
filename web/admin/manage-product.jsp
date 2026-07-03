<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Kho Xe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <style>.admin-sidebar{width:260px;background-color:var(--surface-container-lowest);border-right:1px solid var(--border-color);position:fixed;top:0;bottom:0;left:0;padding-top:2rem;display:flex;flex-direction:column}.admin-main{margin-left:260px;padding:2.5rem;background-color:var(--bg-dark);min-height:100vh}.sidebar-link{display:flex;align-items:center;gap:1rem;color:var(--text-muted);text-decoration:none;padding:.85rem 1.5rem;font-family:var(--font-mono);font-size:13px;text-transform:uppercase;border-left:4px solid transparent}.sidebar-link.active{background-color:var(--primary-color);color:#fff;border-left-color:var(--text-primary)}</style>
</head>
<body class="bg-dark text-white">
<aside class="admin-sidebar">
    <div class="px-4 mb-4"><h1 class="font-heading fs-5 fw-black text-danger uppercase mb-1">QUẢN TRỊ VIÊN</h1><p class="font-mono-data text-muted uppercase" style="font-size:9px">Hệ thống vận hành chính</p></div>
    <nav class="flex-grow-1">
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/dashboard"><span class="material-symbols-outlined fs-5">dashboard</span><span>TỔNG QUAN</span></a>
        <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/manage-product"><span class="material-symbols-outlined fs-5">motorcycle</span><span>QUẢN LÝ XE</span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-brand"><span class="material-symbols-outlined fs-5">settings_input_component</span><span>HÃNG XE</span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-order"><span class="material-symbols-outlined fs-5">shopping_bag</span><span>ĐƠN ĐẶT LỊCH</span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-user"><span class="material-symbols-outlined fs-5">group</span><span>NGƯỜI DÙNG</span></a>
    </nav>
</aside>
<main class="admin-main">
    <header class="d-flex justify-content-between align-items-end mb-5 flex-wrap gap-3">
        <div><h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Quản Lý Kho Xe & Mặt Hàng</h2><p class="text-secondary mt-1">Dữ liệu lấy từ bảng products.</p></div>
        <button onclick="openProductModal()" class="btn btn-ducati px-4 py-3 d-flex align-items-center gap-2"><span class="material-symbols-outlined fs-5">add_circle</span><span>Thêm sản phẩm</span></button>
    </header>
    <div class="table-responsive border border-secondary bg-black bg-opacity-50">
        <table class="table table-hover font-mono-data text-white mb-0 align-middle">
            <thead class="table-dark font-heading text-uppercase small"><tr><th class="px-4 py-3">Ảnh</th><th class="px-4 py-3">Tên & SKU</th><th class="px-4 py-3">Phân loại</th><th class="px-4 py-3">Giá</th><th class="px-4 py-3">Kho</th><th class="px-4 py-3 text-end">Hành động</th></tr></thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td class="px-4 py-3"><div class="bg-dark border border-secondary overflow-hidden" style="width:80px;height:56px;"><img class="w-100 h-100 object-fit-cover" style="object-fit:cover" src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/product-placeholder.svg';"/></div></td>
                        <td class="px-4 py-3"><span class="font-heading fs-6 fw-bold text-white uppercase">${product.name}</span><br/><span class="text-muted small uppercase">SKU: ${product.sku}</span></td>
                        <td class="px-4 py-3"><span class="badge bg-secondary rounded-0 uppercase">${product.category.name}</span><br/><span class="text-muted small">${product.brand.name}</span></td>
                        <td class="px-4 py-3 fw-bold text-danger"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>đ</td>
                        <td class="px-4 py-3"><span class="${product.stock > 0 ? 'text-success' : 'text-danger'} small uppercase">Còn ${product.stock}</span></td>
                        <td class="px-4 py-3 text-end">
                            <button onclick="openProductModal('${product.id}','${product.name}','${product.sku}','${product.brand.id}','${product.category.id}','${product.price}','${product.stock}','${product.displacement}','${product.horsepower}','${product.weight}')" class="btn btn-outline-secondary p-2 rounded-0 border-0 hover-text-white"><span class="material-symbols-outlined fs-5">edit</span></button>
                            <a href="${pageContext.request.contextPath}/admin/manage-product?action=delete&id=${product.id}" onclick="return confirm('Xóa ${product.name}?')" class="btn btn-outline-secondary p-2 rounded-0 border-0 text-danger hover-text-danger"><span class="material-symbols-outlined fs-5">delete</span></a>
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
                <div class="modal-header"><h3 class="font-heading fs-5 text-uppercase text-white fw-bold">Cấu hình sản phẩm</h3><button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button></div>
                <div class="modal-body d-flex flex-column gap-4">
                    <input type="hidden" name="txtProductId" id="form-id" value=""/>
                    <div class="row g-3 font-mono-data">
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small">Tên</label><input name="txtProductName" id="form-name" class="form-control bg-black border-secondary text-white rounded-0" required/></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small">SKU</label><input name="txtSku" id="form-sku" class="form-control bg-black border-secondary text-white rounded-0" required/></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small">Hãng</label><select name="txtBrandId" id="form-brand" class="form-select bg-black border-secondary text-white rounded-0"><c:forEach var="brand" items="${brands}"><option value="${brand.id}">${brand.name}</option></c:forEach></select></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small">Danh mục</label><select name="txtCategoryId" id="form-category" class="form-select bg-black border-secondary text-white rounded-0"><c:forEach var="category" items="${categories}"><option value="${category.id}">${category.name}</option></c:forEach></select></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small">Giá</label><input name="txtPrice" id="form-price" type="number" class="form-control bg-black border-secondary text-white rounded-0" required/></div>
                        <div class="col-md-6"><label class="font-heading text-muted text-uppercase small">Tồn kho</label><input name="txtStock" id="form-stock" type="number" class="form-control bg-black border-secondary text-white rounded-0" required/></div>
                        <div class="col-md-4"><label class="font-heading text-muted text-uppercase small">Dung tích</label><input name="txtDisplacement" id="form-disp" class="form-control bg-black border-secondary text-white rounded-0"/></div>
                        <div class="col-md-4"><label class="font-heading text-muted text-uppercase small">Công suất</label><input name="txtHorsepower" id="form-hp" class="form-control bg-black border-secondary text-white rounded-0"/></div>
                        <div class="col-md-4"><label class="font-heading text-muted text-uppercase small">Trọng lượng</label><input name="txtWeight" id="form-weight" class="form-control bg-black border-secondary text-white rounded-0"/></div>
                    </div>
                </div>
                <div class="modal-footer"><button type="button" class="btn btn-outline-ducati border-secondary py-2" data-bs-dismiss="modal">Hủy</button><button type="submit" class="btn btn-ducati py-2">Lưu</button></div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
let productModal;document.addEventListener('DOMContentLoaded',()=>{productModal=new bootstrap.Modal(document.getElementById('product-modal'));});
function openProductModal(id='',name='',sku='',brandId='',categoryId='',price='',stock='',disp='',hp='',weight=''){document.getElementById('form-id').value=id;document.getElementById('form-name').value=name;document.getElementById('form-sku').value=sku;document.getElementById('form-price').value=price;document.getElementById('form-stock').value=stock;document.getElementById('form-disp').value=disp;document.getElementById('form-hp').value=hp;document.getElementById('form-weight').value=weight;if(brandId)document.getElementById('form-brand').value=brandId;if(categoryId)document.getElementById('form-category').value=categoryId;productModal.show();}
</script>
</body>
</html>
