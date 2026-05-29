<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    
    <!-- Footer Section -->
    <footer class="w-full py-16 bg-background border-t border-surface-variant z-10 relative">
        <div class="max-w-container-max mx-auto px-margin-mobile md:px-margin-desktop grid grid-cols-1 md:grid-cols-4 gap-gutter">
            
            <!-- Column 1: Brand Info -->
            <div class="col-span-1 md:col-span-2 space-y-6">
                <div class="flex flex-col items-start">
                    <span class="font-headline-sm text-headline-sm font-extrabold text-primary-container tracking-tighter uppercase leading-none">DUCATI CORSE</span>
                    <span class="font-mono-data text-[10px] tracking-[0.3em] uppercase text-on-surface-variant leading-none mt-1">Borgo Panigale — Italy</span>
                </div>
                <p class="font-body-sm text-body-sm text-on-surface-variant max-w-sm">
                    Một công ty con trực thuộc tập đoàn Audi AG. Linh hồn của những đường đua danh tiếng, đam mê bất tận trên mọi hành trình dài. Trải nghiệm huyền thoại tốc độ Ý đích thực.
                </p>
                <div class="flex gap-4">
                    <a class="w-10 h-10 border border-surface-variant flex items-center justify-center text-on-surface-variant hover:text-primary-container hover:border-primary-container transition-colors" href="#">
                        <span class="material-symbols-outlined text-[20px]">language</span>
                    </a>
                    <a class="w-10 h-10 border border-surface-variant flex items-center justify-center text-on-surface-variant hover:text-primary-container hover:border-primary-container transition-colors" href="#">
                        <span class="material-symbols-outlined text-[20px]">share</span>
                    </a>
                    <a class="w-10 h-10 border border-surface-variant flex items-center justify-center text-on-surface-variant hover:text-primary-container hover:border-primary-container transition-colors" href="#">
                        <span class="material-symbols-outlined text-[20px]">mail</span>
                    </a>
                </div>
            </div>
            
            <!-- Column 2: Quick Links -->
            <div class="flex flex-col gap-4">
                <span class="font-label-md text-label-md text-primary-container uppercase tracking-widest">Hãng Xe & Showroom</span>
                <a class="font-body-sm text-body-sm text-on-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/products.jsp">Bộ Sưu Tập Xe</a>
                <a class="font-body-sm text-body-sm text-on-surface-variant hover:text-on-surface transition-colors" href="#">Bảng Giá Niêm Yết</a>
                <a class="font-body-sm text-body-sm text-on-surface-variant hover:text-on-surface transition-colors" href="#">Hệ Thống Đại Lý</a>
                <a class="font-body-sm text-body-sm text-on-surface-variant hover:text-on-surface transition-colors" href="#">Lịch Trình Lái Thử</a>
            </div>
            
            <!-- Column 3: Contact & Legal -->
            <div class="flex flex-col gap-4">
                <span class="font-label-md text-label-md text-primary-container uppercase tracking-widest">Trụ Sở Liên Hệ</span>
                <p class="font-body-sm text-body-sm text-on-surface-variant leading-relaxed">
                    Showroom Hà Nội: Số 110 Bà Triệu, Hai Bà Trưng, Hà Nội<br/>
                    Showroom TP.HCM: Số 3 Nguyễn Lương Bằng, Quận 7, TP.HCM
                </p>
                <p class="font-mono-data text-mono-data text-primary-container font-semibold mt-2">+84 24 6413 1111</p>
            </div>
        </div>
        
        <!-- Bottom Footer -->
        <div class="max-w-container-max mx-auto px-margin-mobile md:px-margin-desktop mt-16 pt-8 border-t border-surface-variant/30 flex flex-col md:flex-row justify-between items-center gap-4">
            <span class="font-body-sm text-body-sm text-on-surface-variant opacity-60 uppercase tracking-wider">
                © 2026 DUCATI MOTOR HOLDING S.P.A. ALL RIGHTS RESERVED.
            </span>
            <div class="flex gap-6">
                <span class="font-mono-data text-[10px] text-on-surface-variant">MST: 05113870967</span>
                <span class="font-mono-data text-[10px] text-on-surface-variant">Giấy phép ĐKKD số: 102/GP-UBND</span>
            </div>
        </div>
    </footer>

    <!-- Main scripts load -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
