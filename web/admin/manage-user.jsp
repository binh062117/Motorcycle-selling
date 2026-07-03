<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>DUCATI CORSE | Quản Lý Tài Khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <style>
        .admin-sidebar{width:260px;background-color:var(--surface-container-lowest);border-right:1px solid var(--border-color);position:fixed;top:0;bottom:0;left:0;z-index:100;padding-top:2rem;display:flex;flex-direction:column}
        .admin-main{margin-left:260px;padding:2.5rem;background-color:var(--bg-dark);min-height:100vh}
        .sidebar-link{display:flex;align-items:center;gap:1rem;color:var(--text-muted);text-decoration:none;padding:.85rem 1.5rem;font-family:var(--font-mono);font-size:13px;text-transform:uppercase;border-left:4px solid transparent}
        .sidebar-link:hover{background-color:var(--surface-container-low);color:#fff}.sidebar-link.active{background-color:var(--primary-color);color:#fff;border-left-color:var(--text-primary)}
    </style>
</head>
<body class="bg-dark text-white">
<aside class="admin-sidebar">
    <div class="px-4 mb-4"><h1 class="font-heading fs-5 fw-black text-danger uppercase mb-1">QUẢN TRỊ VIÊN</h1><p class="font-mono-data text-muted uppercase" style="font-size:9px">Hệ thống vận hành chính</p></div>
    <nav class="flex-grow-1">
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/dashboard"><span class="material-symbols-outlined fs-5">dashboard</span><span>TỔNG QUAN</span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-product"><span class="material-symbols-outlined fs-5">motorcycle</span><span>QUẢN LÝ XE</span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-brand"><span class="material-symbols-outlined fs-5">settings_input_component</span><span>HÃNG XE</span></a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/manage-order"><span class="material-symbols-outlined fs-5">shopping_bag</span><span>ĐƠN ĐẶT LỊCH</span></a>
        <a class="sidebar-link active" href="${pageContext.request.contextPath}/admin/manage-user"><span class="material-symbols-outlined fs-5">group</span><span>NGƯỜI DÙNG</span></a>
    </nav>
</aside>
<main class="admin-main">
    <header class="mb-5">
        <h2 class="font-heading text-uppercase fw-bold m-0 fs-3">Quản Lý Phân Quyền Người Dùng</h2>
        <p class="text-secondary mt-1">Dữ liệu tài khoản lấy trực tiếp từ SQL Server.</p>
    </header>
    <section class="card card-ducati overflow-hidden mb-4">
        <div class="table-responsive">
            <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                <thead class="table-dark font-heading text-uppercase small">
                    <tr><th class="px-4 py-3">Mã</th><th class="px-4 py-3">Họ tên</th><th class="px-4 py-3">Email</th><th class="px-4 py-3">SĐT</th><th class="px-4 py-3">Vai trò</th><th class="px-4 py-3 text-end">Thay đổi</th></tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td class="px-4 py-4 fw-bold">#ACC-${user.id}</td>
                            <td class="px-4 py-4 fw-bold">${user.fullName}</td>
                            <td class="px-4 py-4 text-lowercase text-muted">${user.email}</td>
                            <td class="px-4 py-4">${user.phone}</td>
                            <td class="px-4 py-4"><span class="badge ${user.admin ? 'bg-danger' : 'bg-secondary'} rounded-0 uppercase py-2 px-3">${user.role.name}</span></td>
                            <td class="px-4 py-4 text-end">
                                <form action="${pageContext.request.contextPath}/admin/manage-user" method="post" class="d-inline-block">
                                    <input type="hidden" name="accountId" value="${user.id}"/>
                                    <select name="txtRole" onchange="this.form.submit()" class="form-select form-select-sm bg-black border-secondary text-white font-mono-data rounded-0 text-uppercase">
                                        <option value="Customer" ${user.role.name == 'Customer' ? 'selected' : ''}>Customer</option>
                                        <option value="Admin" ${user.role.name == 'Admin' ? 'selected' : ''}>Admin</option>
                                    </select>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
