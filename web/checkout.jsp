<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="ĐĂNG KÝ NHẬN XE & LÊN LỊCH HẸN" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <form action="${pageContext.request.contextPath}/order-history.jsp" method="post" class="row g-4 needs-validation-custom" novalidate>
        
        <!-- Left Column: Booking Form (col-lg-8) -->
        <div class="col-12 col-lg-8">
            <header class="mb-4">
                <h1 class="font-heading text-uppercase tracking-tight fs-3 mb-2">Đăng Ký Nhận Xe & Lên Lịch Hẹn</h1>
                <p class="text-secondary small max-w-2xl mb-0">
                    Hoàn tất thông số đăng ký nhận xe phân khối lớn và thiết lập lịch hẹn lái thử hoặc tư vấn chuyên môn trực tiếp tại showroom.
                </p>
            </header>
            
            <!-- Progress Tracker -->
            <div class="row g-3 mb-5">
                <div class="col-4">
                    <div class="bg-danger rounded" style="height: 4px;"></div>
                    <span class="font-heading text-danger text-uppercase small tracking-wider d-block mt-2">Bước 1: Showroom</span>
                </div>
                <div class="col-4">
                    <div id="step-bar-2" class="bg-secondary rounded bg-opacity-25" style="height: 4px;"></div>
                    <span id="step-lbl-2" class="font-heading text-muted text-uppercase small tracking-wider d-block mt-2">Bước 2: Lịch hẹn</span>
                </div>
                <div class="col-4">
                    <div id="step-bar-3" class="bg-secondary rounded bg-opacity-25" style="height: 4px;"></div>
                    <span id="step-lbl-3" class="font-heading text-muted text-uppercase small tracking-wider d-block mt-2">Bước 3: Xác nhận</span>
                </div>
            </div>
            
            <!-- Form Sections -->
            <div class="d-flex flex-column gap-5">
                
                <!-- Step 1: Dealership Selection -->
                <section id="step-1">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <span class="font-mono-data text-danger px-3 py-1 border border-danger">01</span>
                        <h2 class="font-heading text-uppercase fs-5 m-0">Lựa chọn đại lý nhận xe</h2>
                    </div>
                    
                    <div class="row g-3">
                        <!-- Showroom Option 1 -->
                        <div class="col-12 col-md-6">
                            <div onclick="selectShowroom(this, 'Showroom Hà Nội', 1)" class="showroom-card card card-ducati p-4 position-relative cursor-pointer border border-3 border-danger">
                                <div class="position-absolute top-0 end-0 p-3 text-danger" id="check-icon-1">
                                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                                </div>
                                <h3 class="font-heading fs-6 text-white mb-2">Showroom Bà Triệu - Hà Nội</h3>
                                <p class="text-muted small mb-3">Số 110 Bà Triệu, Hai Bà Trưng, Hà Nội</p>
                                <div class="d-flex align-items-center gap-2 text-danger font-mono-data small">
                                    <span class="material-symbols-outlined fs-6">distance</span>
                                    <span>Tổng kho đại lý miền Bắc</span>
                                </div>
                            </div>
                        </div>

                        <!-- Showroom Option 2 -->
                        <div class="col-12 col-md-6">
                            <div onclick="selectShowroom(this, 'Showroom TP.HCM', 2)" class="showroom-card card card-ducati p-4 position-relative cursor-pointer">
                                <div class="position-absolute top-0 end-0 p-3 text-danger d-none" id="check-icon-2">
                                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                                </div>
                                <h3 class="font-heading fs-6 text-white mb-2">Showroom Phú Mỹ Hưng - Q7</h3>
                                <p class="text-muted small mb-3">Số 3 Nguyễn Lương Bằng, Quận 7, TP.HCM</p>
                                <div class="d-flex align-items-center gap-2 text-muted font-mono-data small">
                                    <span class="material-symbols-outlined fs-6">distance</span>
                                    <span>Tổng kho đại lý miền Nam</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Hidden input to store chosen Showroom for MVC submit -->
                    <input type="hidden" id="selectedShowroomInput" name="txtShowroom" value="Showroom Hà Nội"/>
                </section>
                
                <!-- Step 2: Temporal Window (Date & Time) -->
                <section id="step-2" class="opacity-25 pointer-events-none transition-all duration-300">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <span id="num-badge-2" class="font-mono-data text-muted px-3 py-1 border border-secondary">02</span>
                        <h2 class="font-heading text-uppercase fs-5 m-0">Thiết lập thời gian nhận xe / tư vấn</h2>
                    </div>
                    
                    <div class="card card-ducati p-4">
                        <div class="row g-3">
                            <!-- Mini Calendar selection widget -->
                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Chọn Ngày Nhận Xe</label>
                                <input name="txtAppointmentDate" id="appointment-date" class="form-control bg-black border-secondary text-white font-mono-data uppercase rounded-0" type="date" required/>
                            </div>
                            
                            <!-- Time select -->
                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Chọn Khung Giờ</label>
                                <select name="txtAppointmentTime" class="form-select bg-black border-secondary text-white font-mono-data text-uppercase rounded-0">
                                    <option value="09:00">09:00 sáng (Tư vấn kỹ thuật)</option>
                                    <option value="11:00">11:00 trưa (Lái thử V4 S)</option>
                                    <option value="14:00">14:00 chiều (Xác nhận bàn giao)</option>
                                    <option value="16:00">16:00 chiều (Lên spec xe)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </section>
                
                <!-- Step 3: Customer Personal Info & Requisition -->
                <section id="step-3" class="opacity-25 pointer-events-none transition-all duration-300">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <span id="num-badge-3" class="font-mono-data text-muted px-3 py-1 border border-secondary">03</span>
                        <h2 class="font-heading text-uppercase fs-5 m-0">Thông tin liên hệ & Đăng ký</h2>
                    </div>
                    
                    <div class="card card-ducati p-4">
                        <div class="row g-3 mb-4">
                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Họ và tên khách hàng</label>
                                <input name="txtFullName" class="form-control bg-black border-secondary text-white rounded-0 uppercase font-mono-data" placeholder="ENZO FERRARI" required type="text"/>
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Số điện thoại liên hệ</label>
                                <input name="txtPhone" class="form-control bg-black border-secondary text-white rounded-0 font-mono-data validate-phone" placeholder="0912345678" required type="tel"/>
                            </div>
                            <div class="col-12">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Địa chỉ Email</label>
                                <input name="txtEmail" class="form-control bg-black border-secondary text-white rounded-0 font-mono-data" placeholder="client@ducati-corse.vn" required type="email"/>
                            </div>
                        </div>
                        
                        <!-- Payment Methods selection -->
                        <div class="pt-2 border-top border-secondary">
                            <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-3">Phương thức thanh toán</label>
                            <div class="row g-3">
                                <div class="col-12 col-md-4">
                                    <div class="form-check card card-ducati p-3 rounded-0 m-0">
                                        <input name="txtPaymentMethod" id="payCash" value="Tiền mặt" checked class="form-check-input text-danger bg-transparent border-secondary" type="radio"/>
                                        <label class="form-check-label font-mono-data text-white small text-uppercase ms-2" for="payCash">Tiền mặt tại showroom</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-check card card-ducati p-3 rounded-0 m-0">
                                        <input name="txtPaymentMethod" id="payTransfer" value="Chuyển khoản" class="form-check-input text-danger bg-transparent border-secondary" type="radio"/>
                                        <label class="form-check-label font-mono-data text-white small text-uppercase ms-2" for="payTransfer">Chuyển khoản ngân hàng</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-check card card-ducati p-3 rounded-0 m-0">
                                        <input name="txtPaymentMethod" id="payInstallment" value="Trả góp" class="form-check-input text-danger bg-transparent border-secondary" type="radio"/>
                                        <label class="form-check-label font-mono-data text-white small text-uppercase ms-2" for="payInstallment">Trả góp thẻ tín dụng</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                <!-- Action navigation -->
                <div class="pt-4 border-top border-secondary d-flex justify-content-between align-items-center mb-5">
                    <a href="${pageContext.request.contextPath}/cart.jsp" class="font-heading text-secondary text-uppercase text-decoration-none border-bottom border-secondary pb-1 small hover-text-white transition-colors">Quay lại giỏ hàng</a>
                    <button type="submit" class="btn btn-ducati px-5 py-3 fs-6">
                        XÁC NHẬN ĐƠN ĐẶT LỊCH
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Right Column: Summary Card (col-lg-4) -->
        <aside class="col-12 col-lg-4 sticky-lg-top" style="top: 100px; z-index: 5;">
            <div class="card card-ducati overflow-hidden">
                <div class="position-relative">
                    <img alt="Ducati Panigale V4 S Side Preview" class="w-100 filter-grayscale" style="filter: grayscale(100%);" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCk4c6ns1k0MQ5OTgENkasnm5N4Ffg4Suheh1kZ9xowSOyjm801UvWBMd0Tu6A7Ii3g70ESIn5aZ64m1VqYKXGiuQe3QslyjxXSxO9VbbWRrpCkiPSGJQnE1Eb_FT-vxr5zB5BuaRlRZ5-86-RtJag2Bh1YaMcEXeCS0_xyYHperS3X8VloIRi-ZE9ME2U0c63rzamnB_XYzO7rWLJlTZf8KdZEiBI7q-IDwZAqYMKLiImWSoHJs9ehh--Dkqjex1M02Lknix4pq7cm"/>
                    <div class="position-absolute bottom-0 start-0 p-3">
                        <span class="badge bg-danger font-mono-data text-uppercase py-2 px-3 small rounded-0 fw-bold">Panigale V4 R SPEC</span>
                    </div>
                </div>
                
                <div class="p-4">
                    <h3 class="font-heading text-uppercase fs-5 text-white mb-3">Panigale V4 R</h3>
                    <div class="row g-2 border-top border-bottom border-secondary py-3 mb-4 font-mono-data">
                        <div class="col-6">
                            <span class="text-muted small uppercase text-[10px] d-block mb-1">Động cơ</span>
                            <span class="text-white small fw-bold">998 CC V4</span>
                        </div>
                        <div class="col-6">
                            <span class="text-muted small uppercase text-[10px] d-block mb-1">Công suất</span>
                            <span class="text-white small fw-bold">218 CV</span>
                        </div>
                    </div>
                    
                    <!-- Specs performance metrics progress bar -->
                    <div class="mb-4">
                        <span class="font-heading text-muted text-uppercase tracking-wider small d-block mb-3">Thông số tải lực</span>
                        <div class="d-flex flex-column gap-3">
                            <div>
                                <div class="d-flex justify-content-between font-mono-data text-uppercase" style="font-size:11px;">
                                    <span>Lực nén khí động học</span>
                                    <span>92%</span>
                                </div>
                                <div class="progress bg-black rounded-0 mt-1" style="height: 6px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 92%" aria-valuenow="92" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div>
                                <div class="d-flex justify-content-between font-mono-data text-uppercase" style="font-size:11px;">
                                    <span>Tỉ số lực kéo</span>
                                    <span>Tối ưu cực đại</span>
                                </div>
                                <div class="progress bg-black rounded-0 mt-1" style="height: 6px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-black bg-opacity-50 p-3 border-start border-danger border-2">
                        <p class="text-secondary small italic leading-relaxed m-0">
                            "Tinh hoa cơ khí trên đường đua, chế tác tinh xảo dành cho những tay lái thực thụ. Đăng ký thông tin và xác nhận để đặt chỗ của bạn ngay."
                        </p>
                    </div>
                </div>
            </div>
        </aside>
        
    </form>
</main>

<script>
    // Showroom card selection toggler
    function selectShowroom(cardEl, showroomName, index) {
        const cards = document.querySelectorAll('.showroom-card');
        cards.forEach((card) => {
            card.classList.remove('border-danger', 'border-3');
            const check = card.querySelector('.position-absolute');
            if (check) check.classList.add('d-none');
        });
        
        // Mark selected active
        cardEl.classList.add('border-danger', 'border-3');
        const check = cardEl.querySelector('.position-absolute');
        if (check) check.classList.remove('d-none');

        // Update hidden input form
        document.getElementById('selectedShowroomInput').value = showroomName;

        // Automatically unlock Step 2
        unlockStep2();
    }

    function unlockStep2() {
        const step2 = document.getElementById('step-2');
        step2.classList.remove('opacity-25', 'pointer-events-none');
        
        const bar2 = document.getElementById('step-bar-2');
        const lbl2 = document.getElementById('step-lbl-2');
        const badge2 = document.getElementById('num-badge-2');
        
        if (bar2) bar2.classList.replace('bg-secondary', 'bg-danger');
        if (lbl2) {
            lbl2.classList.add('text-danger');
            lbl2.classList.remove('text-muted');
        }
        if (badge2) {
            badge2.classList.replace('text-muted', 'text-danger');
            badge2.classList.replace('border-secondary', 'border-danger');
        }
    }

    // Temporal Window date change unlocks Step 3
    document.addEventListener('DOMContentLoaded', () => {
        const dateInput = document.getElementById('appointment-date');
        if (dateInput) {
            dateInput.addEventListener('change', () => {
                const step3 = document.getElementById('step-3');
                step3.classList.remove('opacity-25', 'pointer-events-none');
                
                const bar3 = document.getElementById('step-bar-3');
                const lbl3 = document.getElementById('step-lbl-3');
                const badge3 = document.getElementById('num-badge-3');
                
                if (bar3) bar3.classList.replace('bg-secondary', 'bg-danger');
                if (lbl3) {
                    lbl3.classList.add('text-danger');
                    lbl3.classList.remove('text-muted');
                }
                if (badge3) {
                    badge3.classList.replace('text-muted', 'text-danger');
                    badge3.classList.replace('border-secondary', 'border-danger');
                }
            });
        }
    });
</script>

<%@ include file="/common/footer.jsp" %>
