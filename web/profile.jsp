<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.appLang}">
    <c:set var="appLang" value="vi" scope="session" />
</c:if>
<fmt:setLocale value="${sessionScope.appLang}" scope="session" />
<fmt:setBundle basename="messages" />
<fmt:message key="profile.pageTitle" var="profilePageTitle" />
<c:set var="pageTitle" value="${profilePageTitle}" />
<%@ include file="/common/header.jsp" %>
<c:set var="passwordTabActive" value="${param.tab == 'password'}" />
<c:set var="profileMessageType" value="${empty sessionScope.profileMessageType ? 'danger' : sessionScope.profileMessageType}" />

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <div class="row g-4">
        <div class="col-12 col-lg-4">
            <div class="card card-ducati p-4 text-center racing-stripe">
                <div class="mx-auto rounded-circle bg-secondary bg-opacity-25 d-flex align-items-center justify-content-center mb-3" style="width: 96px; height: 96px;">
                    <c:choose>
                        <c:when test="${not empty sessionScope.currentUser.avatarUrl}">
                            <img src="${sessionScope.currentUser.avatarUrl}" alt="${sessionScope.currentUser.fullName}" class="rounded-circle" style="width:96px;height:96px;object-fit:cover;" referrerpolicy="no-referrer"/>
                        </c:when>
                        <c:otherwise>
                            <span class="material-symbols-outlined display-3 text-danger">person</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <h3 class="font-heading fs-5 text-white mb-1 uppercase">${sessionScope.currentUser.fullName}</h3>
                <span class="font-mono-data text-muted small uppercase" style="font-size:10px;"><fmt:message key="profile.memberId" />: #DUC-${sessionScope.currentUser.id}</span>

                <hr class="bg-secondary my-3">

                <div class="d-flex flex-column gap-2 text-start font-mono-data small text-muted">
                    <div class="d-flex justify-content-between gap-3">
                        <span><fmt:message key="profile.bookings" />:</span>
                        <a href="${pageContext.request.contextPath}/order-history" class="text-white fw-bold text-decoration-none"><fmt:message key="profile.viewHistory" /></a>
                    </div>
                    <div class="d-flex justify-content-between gap-3">
                        <span><fmt:message key="profile.memberRole" />:</span>
                        <span class="text-danger fw-bold">${sessionScope.currentUser.role.name}</span>
                    </div>
                    <div class="d-flex justify-content-between gap-3">
                        <span><fmt:message key="profile.joinedFrom" />:</span>
                        <span class="text-white">${sessionScope.currentUser.createdAt.toLocalDate()}</span>
                    </div>
                </div>
            </div>

            <c:if test="${sessionScope.currentUser.admin}">
                <div class="card card-ducati p-4 mt-4 racing-stripe">
                    <div class="d-flex align-items-center justify-content-between gap-3 mb-3">
                        <div>
                            <h4 class="font-heading text-uppercase fs-6 text-white m-0"><fmt:message key="profile.adminDashboard" /></h4>
                            <p class="font-mono-data text-muted small m-0 mt-1"><fmt:message key="profile.adminDashboardBody" /></p>
                        </div>
                        <span class="material-symbols-outlined text-danger fs-3">admin_panel_settings</span>
                    </div>
                    <div class="row g-2 font-mono-data small mb-3">
                        <div class="col-6">
                            <div class="border border-secondary p-2 h-100">
                                <span class="text-muted d-block"><fmt:message key="profile.adminRevenue" /></span>
                                <strong class="text-danger"><fmt:formatNumber value="${empty adminDashboardRevenue ? 0 : adminDashboardRevenue}" pattern="#,##0"/>đ</strong>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="border border-secondary p-2 h-100">
                                <span class="text-muted d-block"><fmt:message key="profile.adminOrders" /></span>
                                <strong class="text-white">${empty adminOrderCount ? 0 : adminOrderCount}</strong>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="border border-secondary p-2 h-100">
                                <span class="text-muted d-block"><fmt:message key="profile.adminPending" /></span>
                                <strong class="text-white">${empty adminPendingOrders ? 0 : adminPendingOrders}</strong>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="border border-secondary p-2 h-100">
                                <span class="text-muted d-block"><fmt:message key="profile.adminProducts" /></span>
                                <strong class="text-white">${empty adminProductCount ? 0 : adminProductCount}</strong>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-ducati py-2 text-uppercase"><fmt:message key="profile.openAdminDashboard" /></a>
                        <a href="${pageContext.request.contextPath}/admin/manage-order" class="btn btn-outline-ducati py-2 text-uppercase"><fmt:message key="profile.manageOrders" /></a>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="col-12 col-lg-8">
            <div class="card card-ducati p-4">
                <ul class="nav nav-tabs border-secondary mb-4 gap-3" id="profileTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${passwordTabActive ? '' : 'active'} font-heading text-uppercase tracking-wider bg-transparent border-0 border-bottom border-3 ${passwordTabActive ? 'border-transparent text-secondary' : 'border-danger text-white'} pb-3" id="info-tab" data-bs-toggle="tab" data-bs-target="#info-pane" type="button" role="tab" aria-controls="info-pane" aria-selected="${passwordTabActive ? 'false' : 'true'}"><fmt:message key="profile.personalInfo" /></button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${passwordTabActive ? 'active' : ''} font-heading text-uppercase tracking-wider bg-transparent border-0 border-bottom border-3 ${passwordTabActive ? 'border-danger text-white' : 'border-transparent text-secondary'} pb-3" id="pwd-tab" data-bs-toggle="tab" data-bs-target="#pwd-pane" type="button" role="tab" aria-controls="pwd-pane" aria-selected="${passwordTabActive ? 'true' : 'false'}"><fmt:message key="profile.changePassword" /></button>
                    </li>
                </ul>

                <div class="tab-content" id="profileTabContent">
                    <div class="tab-pane fade ${passwordTabActive ? '' : 'show active'}" id="info-pane" role="tabpanel" aria-labelledby="info-tab">
                        <form action="${pageContext.request.contextPath}/profile/update" method="post" class="needs-validation-custom d-flex flex-column gap-3" novalidate>
                            <div class="row g-2">
                                <div class="col-6">
                                    <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.lastName" /></label>
                                    <input name="txtLastName" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" value="${sessionScope.currentUser.lastName}" required type="text"/>
                                </div>
                                <div class="col-6">
                                    <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.firstName" /></label>
                                    <input name="txtFirstName" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" value="${sessionScope.currentUser.firstName}" required type="text"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.phone" /></label>
                                <input name="txtPhone" class="form-control bg-black border-secondary text-white font-mono-data rounded-0 validate-phone" value="${sessionScope.currentUser.phone}" required type="tel"/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="register.email" /></label>
                                <input name="txtEmail" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" value="${sessionScope.currentUser.email}" required type="email" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="profile.contactAddress" /></label>
                                <textarea name="txtAddress" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" rows="3">${sessionScope.currentUser.address}</textarea>
                            </div>

                            <button type="submit" class="btn btn-ducati px-4 py-2 mt-2 align-self-start"><fmt:message key="profile.updateInfo" /></button>
                        </form>
                    </div>

                    <div class="tab-pane fade ${passwordTabActive ? 'show active' : ''}" id="pwd-pane" role="tabpanel" aria-labelledby="pwd-tab">
                        <c:if test="${not empty sessionScope.profileMessage}">
                            <div class="alert alert-${profileMessageType} rounded-0 font-mono-data text-xs text-uppercase py-2" role="alert">
                                ${sessionScope.profileMessage}
                            </div>
                        </c:if>
                        <form action="${pageContext.request.contextPath}/profile/change-password" method="post" class="needs-validation-custom d-flex flex-column gap-3" novalidate>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Email xác minh</label>
                                <input name="txtVerifyEmail" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" required type="email"/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Số điện thoại xác minh</label>
                                <input name="txtVerifyPhone" class="form-control bg-black border-secondary text-white font-mono-data rounded-0 validate-phone" required type="tel"/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="profile.currentPassword" /></label>
                                <input name="txtOldPassword" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" required type="password"/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="profile.newPassword" /></label>
                                <input name="txtNewPassword" id="password" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" required type="password" minlength="6"/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1"><fmt:message key="profile.confirmNewPassword" /></label>
                                <input name="txtConfirmNewPassword" id="confirmPassword" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" required type="password" minlength="6"/>
                            </div>

                            <button type="submit" class="btn btn-ducati px-4 py-2 mt-2 align-self-start"><fmt:message key="profile.confirmPasswordChange" /></button>
                        </form>
                        <c:remove var="profileMessage" scope="session" />
                        <c:remove var="profileMessageType" scope="session" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const tabs = document.querySelectorAll('#profileTab button');
        tabs.forEach(tab => {
            tab.addEventListener('shown.bs.tab', (e) => {
                tabs.forEach(t => {
                    t.classList.remove('border-danger');
                    t.classList.add('border-transparent');
                    t.classList.replace('text-white', 'text-secondary');
                });
                e.target.classList.replace('text-secondary', 'text-white');
                e.target.classList.remove('border-transparent');
                e.target.classList.add('border-danger');
            });
        });
    });
</script>

<%@ include file="/common/footer.jsp" %>
