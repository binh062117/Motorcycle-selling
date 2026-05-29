<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jsp" %>

<main class="pt-32 pb-24 px-margin-mobile md:px-margin-desktop max-w-container-max mx-auto">
    <form action="${pageContext.request.contextPath}/order-history.jsp" method="post" class="grid grid-cols-1 lg:grid-cols-12 gap-gutter items-start">
        
        <!-- Left Column: Booking Form (col-span-8) -->
        <div class="lg:col-span-8 space-y-10">
            <header class="space-y-4">
                <h1 class="font-headline-lg text-headline-sm md:text-headline-lg text-on-surface tracking-tight uppercase">Đăng Ký Nhận Xe & Lên Lịch Hẹn</h1>
                <p class="font-body-lg text-body-lg text-on-surface-variant max-w-2xl">
                    Hoàn tất thông số đăng ký nhận xe phân khối lớn và thiết lập lịch hẹn lái thử hoặc tư vấn chuyên môn trực tiếp tại showroom.
                </p>
            </header>
            
            <!-- Progress Tracker -->
            <div class="flex items-center gap-4 w-full">
                <div class="flex-1 flex flex-col gap-2">
                    <div class="h-1 bg-primary-container rounded-full"></div>
                    <span class="font-label-md text-label-md text-primary-container uppercase">Bước 1: Chọn Showroom</span>
                </div>
                <div class="flex-1 flex flex-col gap-2">
                    <div class="h-1 bg-surface-container-highest rounded-full transition-colors duration-500" id="step-bar-2"></div>
                    <span class="font-label-md text-label-md text-on-surface-variant uppercase" id="step-lbl-2">Bước 2: Lên lịch hẹn</span>
                </div>
                <div class="flex-1 flex flex-col gap-2">
                    <div class="h-1 bg-surface-container-highest rounded-full transition-colors duration-500" id="step-bar-3"></div>
                    <span class="font-label-md text-label-md text-on-surface-variant uppercase" id="step-lbl-3">Bước 3: Xác nhận</span>
                </div>
            </div>
            
            <!-- Form Sections -->
            <div class="space-y-12">
                
                <!-- Step 1: Dealership Selection -->
                <section class="space-y-6" id="step-1">
                    <div class="flex items-center gap-4">
                        <span class="font-mono-data text-mono-data text-primary-container px-3 py-1 border border-primary-container">01</span>
                        <h2 class="font-headline-sm text-headline-sm uppercase">Lựa chọn đại lý nhận xe</h2>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- Showroom Option 1 -->
                        <div onclick="selectShowroom('Showroom Hà Nội')" class="showroom-card bg-surface-container border-2 border-primary-container p-6 relative cursor-pointer group transition-all">
                            <div class="absolute top-4 right-4 text-primary-container" id="check-icon-1">
                                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                            </div>
                            <h3 class="font-headline-sm text-headline-sm text-on-surface mb-2">Showroom Bà Triệu - Hà Nội</h3>
                            <p class="font-body-sm text-body-sm text-on-surface-variant mb-4">Số 110 Bà Triệu, Hai Bà Trưng, Hà Nội</p>
                            <div class="flex items-center gap-2 text-primary-container font-mono-data text-mono-data">
                                <span class="material-symbols-outlined text-[18px]">distance</span>
                                <span>Tổng kho đại lý miền Bắc</span>
                            </div>
                        </div>

                        <!-- Showroom Option 2 -->
                        <div onclick="selectShowroom('Showroom TP.HCM')" class="showroom-card bg-surface-container border border-surface-variant p-6 cursor-pointer group hover:border-primary-container transition-all">
                            <div class="absolute top-4 right-4 text-primary-container hidden" id="check-icon-2">
                                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                            </div>
                            <h3 class="font-headline-sm text-headline-sm text-on-surface mb-2">Showroom Phú Mỹ Hưng - Q7</h3>
                            <p class="font-body-sm text-body-sm text-on-surface-variant mb-4">Số 3 Nguyễn Lương Bằng, Quận 7, TP.HCM</p>
                            <div class="flex items-center gap-2 text-on-surface-variant font-mono-data text-mono-data group-hover:text-white transition-colors">
                                <span class="material-symbols-outlined text-[18px]">distance</span>
                                <span>Tổng kho đại lý miền Nam</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Hidden input to store chosen Showroom for MVC submit -->
                    <input type="hidden" id="selectedShowroomInput" name="txtShowroom" value="Showroom Hà Nội"/>
                </section>
                
                <!-- Step 2: Temporal Window (Date & Time) -->
                <section class="space-y-6 transition-all duration-500 opacity-40 grayscale pointer-events-none" id="step-2">
                    <div class="flex items-center gap-4">
                        <span class="font-mono-data text-mono-data text-on-surface-variant px-3 py-1 border border-surface-variant" id="num-badge-2">02</span>
                        <h2 class="font-headline-sm text-headline-sm uppercase">Thiết lập thời gian nhận xe / tư vấn</h2>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 bg-surface-container p-6 border border-surface-variant">
                        
                        <!-- Mini Calendar selection widget -->
                        <div class="space-y-4">
                            <label class="font-label-md text-label-md text-on-surface-variant uppercase block">Chọn Ngày Nhận Xe</label>
                            <input name="txtAppointmentDate" id="appointment-date" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface font-mono-data focus:outline-none transition-all uppercase placeholder:text-surface-variant" type="date" required/>
                        </div>
                        
                        <!-- Time select -->
                        <div class="space-y-4">
                            <label class="font-label-md text-label-md text-on-surface-variant uppercase block">Chọn Khung Giờ</label>
                            <select name="txtAppointmentTime" class="w-full bg-black border border-surface-variant text-on-surface font-mono-data text-mono-data px-4 py-3 outline-none uppercase">
                                <option value="09:00">09:00 sáng (Tư vấn kỹ thuật)</option>
                                <option value="11:00">11:00 trưa (Lái thử V4 S)</option>
                                <option value="14:00">14:00 chiều (Xác nhận bàn giao)</option>
                                <option value="16:00">16:00 chiều (Lên spec xe)</option>
                            </select>
                        </div>
                    </div>
                </section>
                
                <!-- Step 3: Customer Personal Info & Requisition -->
                <section class="space-y-6 transition-all duration-500 opacity-40 grayscale pointer-events-none" id="step-3">
                    <div class="flex items-center gap-4">
                        <span class="font-mono-data text-mono-data text-on-surface-variant px-3 py-1 border border-surface-variant" id="num-badge-3">03</span>
                        <h2 class="font-headline-sm text-headline-sm uppercase">Thông tin liên hệ & Đăng ký</h2>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-gutter">
                        <div class="space-y-2">
                            <label class="font-label-md text-label-md text-on-surface-variant uppercase">Họ và tên khách hàng</label>
                            <input name="txtFullName" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:border-white focus:ring-0 focus:outline-none transition-all placeholder:text-surface-variant uppercase font-mono-data" placeholder="ENZO FERRARI" required type="text"/>
                        </div>
                        <div class="space-y-2">
                            <label class="font-label-md text-label-md text-on-surface-variant uppercase">Số điện thoại liên hệ</label>
                            <input name="txtPhone" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:border-white focus:ring-0 focus:outline-none transition-all placeholder:text-surface-variant font-mono-data" placeholder="0912345678" required type="tel"/>
                        </div>
                        <div class="space-y-2 md:col-span-2">
                            <label class="font-label-md text-label-md text-on-surface-variant uppercase">Địa chỉ Email</label>
                            <input name="txtEmail" class="w-full bg-black border border-surface-variant px-4 py-3 text-on-surface focus:border-white focus:ring-0 focus:outline-none transition-all placeholder:text-surface-variant font-mono-data uppercase" placeholder="client@ducati-corse.vn" required type="email"/>
                        </div>
                    </div>
                    
                    <!-- Payment Methods selection -->
                    <div class="space-y-3 pt-4">
                        <label class="font-label-md text-label-md text-on-surface-variant uppercase tracking-widest block">Phương thức thanh toán</label>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <label class="flex items-center bg-surface-container border border-surface-variant p-4 cursor-pointer hover:border-primary-container">
                                <input name="txtPaymentMethod" value="Tiền mặt" checked class="form-radio text-primary-container focus:ring-0 bg-transparent border-surface-variant w-4 h-4" type="radio"/>
                                <span class="ml-3 font-mono-data text-[12px] uppercase">Tiền mặt tại showroom</span>
                            </label>
                            <label class="flex items-center bg-surface-container border border-surface-variant p-4 cursor-pointer hover:border-primary-container">
                                <input name="txtPaymentMethod" value="Chuyển khoản" class="form-radio text-primary-container focus:ring-0 bg-transparent border-surface-variant w-4 h-4" type="radio"/>
                                <span class="ml-3 font-mono-data text-[12px] uppercase">Chuyển khoản ngân hàng</span>
                            </label>
                            <label class="flex items-center bg-surface-container border border-surface-variant p-4 cursor-pointer hover:border-primary-container">
                                <input name="txtPaymentMethod" value="Trả góp" class="form-radio text-primary-container focus:ring-0 bg-transparent border-surface-variant w-4 h-4" type="radio"/>
                                <span class="ml-3 font-mono-data text-[12px] uppercase">Trả góp qua thẻ tín dụng</span>
                            </label>
                        </div>
                    </div>
                </section>
                
                <!-- Action navigation -->
                <div class="pt-8 border-t border-surface-variant flex justify-between items-center">
                    <a href="${pageContext.request.contextPath}/cart.jsp" class="font-label-md text-label-md text-on-surface-variant uppercase tracking-widest hover:text-white transition-colors">Quay lại giỏ hàng</a>
                    <button type="submit" class="bg-primary-container text-white font-headline-sm text-label-md px-10 py-4 uppercase tracking-tighter hover:brightness-110 active:scale-95 transition-all">
                        XÁC NHẬN ĐƠN ĐẶT LỊCH
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Right Column: Summary Card (col-span-4) -->
        <aside class="lg:col-span-4 lg:sticky lg:top-32 bg-surface-container-lowest border border-surface-variant p-8 space-y-8">
            <div class="relative group overflow-hidden">
                <img alt="Ducati Panigale V4 S Side Preview" class="w-full grayscale group-hover:grayscale-0 transition-all duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCk4c6ns1k0MQ5OTgENkasnm5N4Ffg4Suheh1kZ9xowSOyjm801UvWBMd0Tu6A7Ii3g70ESIn5aZ64m1VqYKXGiuQe3QslyjxXSxO9VbbWRrpCkiPSGJQnE1Eb_FT-vxr5zB5BuaRlRZ5-86-RtJag2Bh1YaMcEXeCS0_xyYHperS3X8VloIRi-ZE9ME2U0c63rzamnB_XYzO7rWLJlTZf8KdZEiBI7q-IDwZAqYMKLiImWSoHJs9ehh--Dkqjex1M02Lknix4pq7cm"/>
                <div class="absolute bottom-4 left-4">
                    <div class="bg-primary-container px-3 py-1 font-mono-data text-mono-data text-white text-[10px] uppercase font-bold tracking-widest">Panigale V4 R SPEC</div>
                </div>
            </div>
            
            <div class="space-y-4">
                <h3 class="font-headline-md text-headline-sm md:text-headline-md uppercase tracking-tighter text-white">Panigale V4 R</h3>
                <div class="grid grid-cols-2 gap-4 border-t border-b border-surface-variant py-4 font-mono-data">
                    <div class="space-y-1">
                        <p class="font-label-md text-label-md text-on-surface-variant uppercase text-[10px]">Động cơ</p>
                        <p class="text-white text-sm font-semibold">998 CC V4</p>
                    </div>
                    <div class="space-y-1">
                        <p class="font-label-md text-label-md text-on-surface-variant uppercase text-[10px]">Công suất</p>
                        <p class="text-white text-sm font-semibold">218 CV (Mã lực)</p>
                    </div>
                </div>
            </div>
            
            <!-- Specs performance metrics progress bar -->
            <div class="space-y-6 pt-2">
                <h4 class="font-label-md text-label-md text-on-surface-variant uppercase tracking-widest">Thông số tải lực</h4>
                <div class="space-y-4">
                    <div class="space-y-2">
                        <div class="flex justify-between font-mono-data text-[12px] uppercase">
                            <span>Lực nén khí động học</span>
                            <span>92%</span>
                        </div>
                        <div class="h-1.5 bg-black w-full overflow-hidden">
                            <div class="h-full bg-primary-container" style="width: 92%;"></div>
                        </div>
                    </div>
                    <div class="space-y-2">
                        <div class="flex justify-between font-mono-data text-[12px] uppercase">
                            <span>Tỉ số lực kéo</span>
                            <span>Tối ưu cực đại</span>
                        </div>
                        <div class="h-1.5 bg-black w-full overflow-hidden">
                            <div class="h-full bg-primary-container" style="width: 100%;"></div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="bg-surface-container p-4 border-l-2 border-primary-container">
                <p class="font-body-sm text-body-sm text-on-surface-variant italic leading-relaxed">
                    "Tinh hoa cơ khí trên đường đua, chế tác tinh xảo dành cho những tay lái thực thụ. Đăng ký thông tin và xác nhận để đặt chỗ của bạn ngay."
                </p>
            </div>
        </aside>
        
    </form>
</main>

<script>
    // Showroom card selection toggler
    function selectShowroom(showroomName) {
        const cards = document.querySelectorAll('.showroom-card');
        cards.forEach((card, idx) => {
            card.classList.remove('border-2', 'border-primary-container');
            card.classList.add('border', 'border-surface-variant');
            
            const check = document.getElementById(`check-icon-${idx + 1}`);
            if (check) check.classList.add('hidden');
        });
        
        // Mark selected active
        const clickedCard = event.currentTarget;
        clickedCard.classList.add('border-2', 'border-primary-container');
        clickedCard.classList.remove('border', 'border-surface-variant');
        
        const cardIndex = Array.from(cards).indexOf(clickedCard) + 1;
        const check = document.getElementById(`check-icon-${cardIndex}`);
        if (check) check.classList.remove('hidden');

        // Update hidden input form
        document.getElementById('selectedShowroomInput').value = showroomName;

        // Automatically unlock Step 2
        unlockStep2();
    }

    function unlockStep2() {
        const step2 = document.getElementById('step-2');
        step2.classList.remove('opacity-40', 'grayscale', 'pointer-events-none');
        
        document.getElementById('step-bar-2').classList.replace('bg-surface-container-highest', 'bg-primary-container');
        document.getElementById('step-lbl-2').classList.add('text-primary-container');
        document.getElementById('step-lbl-2').classList.remove('text-on-surface-variant');
        document.getElementById('num-badge-2').classList.replace('text-on-surface-variant', 'text-primary-container');
        document.getElementById('num-badge-2').classList.replace('border-surface-variant', 'border-primary-container');
    }

    // Temporal Window date change unlocks Step 3
    document.getElementById('appointment-date').addEventListener('change', () => {
        const step3 = document.getElementById('step-3');
        step3.classList.remove('opacity-40', 'grayscale', 'pointer-events-none');
        
        document.getElementById('step-bar-3').classList.replace('bg-surface-container-highest', 'bg-primary-container');
        document.getElementById('step-lbl-3').classList.add('text-primary-container');
        document.getElementById('step-lbl-3').classList.remove('text-on-surface-variant');
        document.getElementById('num-badge-3').classList.replace('text-on-surface-variant', 'text-primary-container');
        document.getElementById('num-badge-3').classList.replace('border-surface-variant', 'border-primary-container');
    });
</script>

<%@ include file="/common/footer.jsp" %>
