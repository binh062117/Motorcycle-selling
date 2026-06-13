<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="HỒ SƠ CÁ NHÂN - DUCATI" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <div class="row g-4">
        
        <!-- Left: Profile Sidebar Summary (col-lg-4) -->
        <div class="col-12 col-lg-4">
            <div class="card card-ducati p-4 text-center racing-stripe">
                <div class="mx-auto rounded-circle bg-secondary bg-opacity-25 d-flex align-items-center justify-content-center mb-3" style="width: 96px; height: 96px;">
                    <span class="material-symbols-outlined display-3 text-danger">person</span>
                </div>
                <h3 class="font-heading fs-5 text-white mb-1 uppercase">ENZO FERRARI</h3>
                <span class="font-mono-data text-muted small uppercase" style="font-size:10px;">ID THÀNH VIÊN: #DUC-00042</span>
                
                <hr class="bg-secondary my-3">
                
                <div class="d-flex flex-column gap-2 text-start font-mono-data small text-muted">
                    <div class="d-flex justify-content-between">
                        <span>Lịch hẹn đã đặt:</span>
                        <span class="text-white fw-bold">3 đơn</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span>Hạng thành viên:</span>
                        <span class="text-danger fw-bold">Rider Gold</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span>Tham gia từ:</span>
                        <span class="text-white">Q1 2026</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Right: Detail tabs and fields (col-lg-8) -->
        <div class="col-12 col-lg-8">
            <div class="card card-ducati p-4">
                <ul class="nav nav-tabs border-secondary mb-4 gap-3" id="profileTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active font-heading text-uppercase tracking-wider bg-transparent border-0 border-bottom border-3 border-danger text-white pb-3" id="info-tab" data-bs-toggle="tab" data-bs-target="#info-pane" type="button" role="tab" aria-controls="info-pane" aria-selected="true">Thông tin cá nhân</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link font-heading text-uppercase tracking-wider bg-transparent border-0 border-bottom border-3 border-transparent text-secondary pb-3" id="pwd-tab" data-bs-toggle="tab" data-bs-target="#pwd-pane" type="button" role="tab" aria-controls="pwd-pane" aria-selected="false">Đổi mật khẩu</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="profileTabContent">
                    <!-- Info Edit Pane -->
                    <div class="tab-pane fade show active" id="info-pane" role="tabpanel" aria-labelledby="info-tab">
                        <form action="${pageContext.request.contextPath}/profile/update" method="post" class="needs-validation-custom d-flex flex-column gap-3" novalidate>
                            <div class="row g-2">
                                <div class="col-6">
                                    <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Tên họ</label>
                                    <input name="txtLastName" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" value="FERRARI" required type="text"/>
                                </div>
                                <div class="col-6">
                                    <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Tên gọi</label>
                                    <input name="txtFirstName" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" value="ENZO" required type="text"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Số điện thoại</label>
                                <input name="txtPhone" class="form-control bg-black border-secondary text-white font-mono-data rounded-0 validate-phone" value="0912345678" required type="tel"/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Địa chỉ Email</label>
                                <input name="txtEmail" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" value="enzo@ferrari.it" required type="email" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Địa chỉ liên hệ</label>
                                <textarea name="txtAddress" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" rows="3">Số 3 Nguyễn Lương Bằng, Quận 7, TP.HCM</textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-ducati px-4 py-2 mt-2 align-self-start">CẬP NHẬT THÔNG TIN</button>
                        </form>
                    </div>
                    
                    <!-- Password Update Pane -->
                    <div class="tab-pane fade" id="pwd-pane" role="tabpanel" aria-labelledby="pwd-tab">
                        <form action="${pageContext.request.contextPath}/profile/change-password" method="post" class="needs-validation-custom d-flex flex-column gap-3" novalidate>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Mật khẩu hiện tại</label>
                                <input name="txtOldPassword" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" required type="password"/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Mật khẩu mới</label>
                                <input name="txtNewPassword" id="password" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" required type="password" minlength="6"/>
                            </div>
                            <div class="form-group">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-1">Xác nhận mật khẩu mới</label>
                                <input id="confirmPassword" class="form-control bg-black border-secondary text-white font-mono-data rounded-0" required type="password"/>
                            </div>
                            
                            <button type="submit" class="btn btn-ducati px-4 py-2 mt-2 align-self-start">XÁC NHẬN ĐỔI MẬT KHẨU</button>
                        </form>
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
