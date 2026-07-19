<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="ĐĂNG KÝ NHẬN XE & LÊN LỊCH HẸN" />
<%@ include file="/common/header.jsp" %>

<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <form action="${pageContext.request.contextPath}/checkout" method="post" class="row g-4 needs-validation-custom" novalidate>
        
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
                            <div onclick="selectShowroom(this, 'Showroom Hà Nội', 1)" class="showroom-card card card-ducati p-4 position-relative cursor-pointer">
                                <div class="position-absolute top-0 end-0 p-3 text-danger d-none" id="check-icon-1">
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
                                <div class="d-flex align-items-center gap-2 text-danger font-mono-data small">
                                    <span class="material-symbols-outlined fs-6">distance</span>
                                    <span>Tổng kho đại lý miền Nam</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Hidden input to store chosen Showroom for MVC submit -->
                    <input type="hidden" id="selectedShowroomInput" name="txtShowroom" value=""/>
                    <div id="showroomFeedback" class="text-danger font-mono-data small mt-3 d-none">Vui lòng chọn showroom nhận xe trước khi tiếp tục.</div>
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
                                <div class="position-relative">
                                    <input name="txtAppointmentDate" id="appointment-date" class="form-control bg-black border-secondary text-white font-mono-data uppercase rounded-0 pe-5" type="date" required/>
                                    <button type="button" class="btn btn-link text-danger p-0 position-absolute top-50 end-0 translate-middle-y me-3 appointment-date-trigger" aria-label="Mở lịch chọn ngày">
                                        <span class="material-symbols-outlined fs-5">calendar_month</span>
                                    </button>
                                </div>
                            </div>
                            
                            <!-- Time select -->
                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Chọn Khung Giờ Tư Vấn</label>
                                <select name="txtAppointmentTime" class="form-select bg-black border-secondary text-white font-mono-data text-uppercase rounded-0">
                                    <option value="09:00">09:00</option>
                                    <option value="11:00">11:00</option>
                                    <option value="14:00">14:00</option>
                                    <option value="16:00">16:00</option>
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
                                <input name="txtFullName" class="form-control bg-black border-secondary text-white rounded-0 uppercase font-mono-data" placeholder="ENZO FERRARI" value="${sessionScope.currentUser.fullName}" required type="text"/>
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Số điện thoại liên hệ</label>
                                <input name="txtPhone" class="form-control bg-black border-secondary text-white rounded-0 font-mono-data validate-phone" placeholder="0912345678" value="${sessionScope.currentUser.phone}" required type="tel"/>
                            </div>
                            <div class="col-12">
                                <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Địa chỉ Email</label>
                                <input name="txtEmail" class="form-control bg-black border-secondary text-white rounded-0 font-mono-data" placeholder="client@ducati-showroom.vn" value="${sessionScope.currentUser.email}" required type="email"/>
                            </div>
                        </div>
                        
                        <!-- Payment Methods selection -->
                        <div class="pt-2 border-top border-secondary">
                            <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-3">Phương thức thanh toán</label>
                            <input name="txtPaymentMethod" id="payVnpay" value="VNPay" type="hidden"/>
                            <div class="card card-ducati p-4 rounded-0 m-0 border border-danger">
                                <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between gap-3">
                                    <div class="d-flex align-items-center gap-3">
                                        <img src="${pageContext.request.contextPath}/assets/img/vnpay-logo.svg" alt="VNPay" style="width: 116px; height: 40px; object-fit: contain; background:#fff; padding:4px;"/>
                                        <div>
                                            <div class="font-heading text-white text-uppercase fw-bold">Thanh toán online qua VNPay</div>
                                            <div class="text-muted small">Sau khi xác nhận đơn, hệ thống chuyển sang cổng VNPay để thanh toán thật.</div>
                                        </div>
                                    </div>
                                    <span class="badge bg-danger rounded-0 font-mono-data text-uppercase px-3 py-2">Đang chọn</span>
                                </div>
                                <div class="row g-2 mt-4 font-mono-data small text-uppercase">
                                    <div class="col-12 col-md-4">
                                        <div class="border border-secondary p-3 h-100 d-flex align-items-center gap-2">
                                            <span class="material-symbols-outlined text-danger">account_balance</span>
                                            <span>Ngân hàng nội địa</span>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <div class="border border-secondary p-3 h-100 d-flex align-items-center gap-2">
                                            <span class="material-symbols-outlined text-danger">qr_code_2</span>
                                            <span>Quét mã QR VNPay</span>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <div class="border border-secondary p-3 h-100 d-flex align-items-center gap-2">
                                            <span class="material-symbols-outlined text-danger">wallet</span>
                                            <span>Ví điện tử / Mobile banking</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                <!-- Action navigation -->
                <div class="pt-4 border-top border-secondary d-flex justify-content-between align-items-center mb-5">
                    <a href="${pageContext.request.contextPath}/cart" class="font-heading text-secondary text-uppercase text-decoration-none border-bottom border-secondary pb-1 small hover-text-white transition-colors">Quay lại giỏ hàng</a>
                    <button type="submit" class="btn btn-ducati px-5 py-3 fs-6">
                        THANH TOÁN QUA VNPAY
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Right Column: Summary Card (col-lg-4) -->
        <aside class="col-12 col-lg-4 sticky-lg-top" style="top: 100px; z-index: 5;">
            <div class="card card-ducati overflow-hidden">
                <div class="position-relative">
                    <c:set var="firstItem" value="${cartItems[0]}"/>
                    <c:choose>
                        <c:when test="${not empty firstItem}">
                            <img alt="${firstItem.product.name}" class="w-100 bike-product-img" src="${pageContext.request.contextPath}/${firstItem.product.imageUrl}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/product-placeholder.svg';"/>
                        </c:when>
                        <c:otherwise>
                            <div class="d-flex align-items-center justify-content-center bg-black text-muted" style="min-height:180px;">
                                <span class="material-symbols-outlined display-4" aria-hidden="true">shopping_cart</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="position-absolute bottom-0 start-0 p-3">
                        <span class="badge bg-danger font-mono-data text-uppercase py-2 px-3 small rounded-0 fw-bold">${empty firstItem ? 'ĐƠN HÀNG' : firstItem.product.category.name}</span>
                    </div>
                </div>
                
                <div class="p-4">
                    <h3 class="font-heading text-uppercase fs-5 text-white mb-3">Tóm tắt đơn hàng</h3>
                    <div class="row g-2 border-top border-bottom border-secondary py-3 mb-4 font-mono-data">
                        <div class="col-6">
                            <span class="text-muted small uppercase text-[10px] d-block mb-1">Động cơ</span>
                            <span class="text-white small fw-bold">${empty firstItem ? '-' : firstItem.product.displacement}</span>
                        </div>
                        <div class="col-6">
                            <span class="text-muted small uppercase text-[10px] d-block mb-1">Công suất</span>
                            <span class="text-white small fw-bold">${empty firstItem ? '-' : firstItem.product.horsepower}</span>
                        </div>
                    </div>
                    
                    <div class="mb-4 font-mono-data">
                        <span class="font-heading text-muted text-uppercase tracking-wider small d-block mb-3">Sản phẩm</span>
                        <c:forEach var="item" items="${cartItems}">
                            <div class="d-flex justify-content-between border-bottom border-secondary py-2">
                                <span class="text-white small">${item.product.name} x ${item.quantity}</span>
                                <span class="text-danger small"><fmt:formatNumber value="${item.lineTotal}" pattern="#,##0"/>đ</span>
                            </div>
                        </c:forEach>
                        <div class="d-flex justify-content-between pt-3 fw-bold">
                            <span>Tổng</span>
                            <span class="text-danger"><fmt:formatNumber value="${cartSubtotal}" pattern="#,##0"/>đ</span>
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
        const showroomFeedback = document.getElementById('showroomFeedback');
        if (showroomFeedback) showroomFeedback.classList.add('d-none');

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
        const checkoutForm = document.querySelector('form.needs-validation-custom');
        const showroomInput = document.getElementById('selectedShowroomInput');
        const showroomFeedback = document.getElementById('showroomFeedback');

        if (checkoutForm && showroomInput) {
            checkoutForm.addEventListener('submit', (event) => {
                if (!showroomInput.value.trim()) {
                    event.preventDefault();
                    event.stopPropagation();
                    if (showroomFeedback) showroomFeedback.classList.remove('d-none');
                    const step1 = document.getElementById('step-1');
                    if (step1) step1.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }, true);
        }

        const dateInput = document.getElementById('appointment-date');
        if (dateInput) {
            const openDatePicker = () => {
                if (typeof dateInput.showPicker === 'function') {
                    dateInput.showPicker();
                } else {
                    dateInput.focus();
                    dateInput.click();
                }
            };

            dateInput.addEventListener('keydown', (event) => event.preventDefault());
            dateInput.addEventListener('paste', (event) => event.preventDefault());
            dateInput.addEventListener('click', openDatePicker);

            const dateTrigger = document.querySelector('.appointment-date-trigger');
            if (dateTrigger) {
                dateTrigger.addEventListener('click', openDatePicker);
            }

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
