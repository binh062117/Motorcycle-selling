<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jsp" %>

<!-- Main Page Container -->
<main class="pt-20">
    
    <!-- Hero Slider Section -->
    <section class="relative h-[680px] w-full overflow-hidden flex items-center">
        <!-- Carbon fiber texture background -->
        <div class="carbon-overlay"></div>
        
        <!-- Slide 1 -->
        <div class="hero-slide absolute inset-0 transition-opacity duration-1000 ease-in-out z-0 opacity-100" id="slide-1">
            <img alt="Panigale V4 S" class="w-full h-full object-cover grayscale opacity-50 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCUu357nv5EVVSOh6p8Vu91OeVbPImBJeklq4G47urA4WnCaLo5V8YEXuQN4zGwbmT1OqO8y9PFauKkBBsnJEykwgjn1Sj57XUv6EPIdcK-2K4GKTx2iELIKnyI2OvfRr1CRjWMsrQcNnni1eFUmkZygS4NWe0gSgT23wJwqFPJYbZcqaXtwiLnCLMLLe_SVh4PNB_0MyNjeItNrLhehMd8bHwuqC1xkdp4t94T416DHP5EF4wd0bv-Rk8rLOXNsZ-KcQmuIE35NfNM"/>
            <div class="absolute inset-0 bg-gradient-to-r from-background via-transparent to-background"></div>
            <div class="absolute inset-0 bg-gradient-to-t from-background via-transparent to-transparent"></div>
        </div>

        <!-- Slide 2 -->
        <div class="hero-slide absolute inset-0 transition-opacity duration-1000 ease-in-out z-0 opacity-0" id="slide-2">
            <img alt="Multistrada V4" class="w-full h-full object-cover grayscale opacity-50" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBSeEUrcu8HVI4NLKl7VEYn6lqlBCBqXduCmgs2MpOdWJsvsfn6K4nHVXDD2Zh8vDF-76pRBd2uDfT9L_Cg9gx_29E-8HiCP6iEJ9oW9W8mXS_Nzn-LdfZfsXSMsF6_BIpoNhRpXfLLvHSATBYzHe7Gc1vgN9pe7LeGdYI7V2mmDEjjD-BrUJecaFtBuB8PzedDFmR_84y66RPLwzz5KkmuB2ahe3sPEodzmqE7Be77L_F5wmvyIi9CLLWehZBLLG1uyX2gazco5m2e"/>
            <div class="absolute inset-0 bg-gradient-to-r from-background via-transparent to-background"></div>
            <div class="absolute inset-0 bg-gradient-to-t from-background via-transparent to-transparent"></div>
        </div>

        <!-- Hero Content Overlay -->
        <div class="relative z-10 max-w-container-max mx-auto px-margin-mobile md:px-margin-desktop w-full text-left">
            <div class="max-w-2xl bg-black/40 backdrop-blur-sm p-8 border-l-4 border-primary-container rounded">
                <span class="font-mono-data text-mono-data text-primary-container tracking-[0.25em] uppercase mb-3 block">Performance Engineered</span>
                <h1 class="font-display-lg text-headline-lg-mobile md:text-display-lg text-white mb-6 uppercase leading-tight font-extrabold">Đỉnh Cao<br/><span class="text-primary-container">Tốc Độ Ý</span>.</h1>
                <p class="font-body-lg text-body-lg text-on-surface-variant mb-10 max-w-lg">
                    Khám phá những mẫu xe phân khối lớn huyền thoại. Được chế tác cơ khí chính xác đỉnh cao để thống trị mọi cung đường đua và đường phố.
                </p>
                <div class="flex flex-wrap gap-4">
                    <a href="${pageContext.request.contextPath}/products.jsp" class="px-8 py-4 bg-primary-container text-white font-label-md text-label-md uppercase tracking-widest active:scale-95 transition-transform flex items-center gap-2">
                        <span>Khám phá ngay</span>
                        <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/checkout.jsp" class="px-8 py-4 border border-on-surface-variant text-on-surface font-label-md text-label-md uppercase tracking-widest hover:bg-surface-container transition-colors">
                        Đặt lịch lái thử
                    </a>
                </div>
            </div>
        </div>

        <!-- Slider Controls -->
        <div class="absolute bottom-10 right-margin-desktop z-20 flex gap-4">
            <button onclick="prevSlide()" class="w-12 h-12 border border-surface-variant bg-background/80 hover:bg-primary-container hover:text-white transition-colors flex items-center justify-center">
                <span class="material-symbols-outlined">chevron_left</span>
            </button>
            <button onclick="nextSlide()" class="w-12 h-12 border border-surface-variant bg-background/80 hover:bg-primary-container hover:text-white transition-colors flex items-center justify-center">
                <span class="material-symbols-outlined">chevron_right</span>
            </button>
        </div>
    </section>

    <!-- Quick Brand Filters Section -->
    <section class="py-16 max-w-container-max mx-auto px-margin-mobile md:px-margin-desktop">
        <div class="mb-10 text-center md:text-left">
            <h2 class="font-headline-sm text-headline-sm uppercase tracking-widest text-on-surface">Tìm xe theo hãng</h2>
            <p class="font-mono-data text-mono-data text-on-surface-variant uppercase mt-1">Lọc nhanh cấu hình theo thương hiệu lớn</p>
        </div>
        
        <!-- Grid of brand badges -->
        <div class="grid grid-cols-2 md:grid-cols-5 gap-6">
            <!-- Brand Card 1 -->
            <a href="${pageContext.request.contextPath}/products.jsp?brand=Honda" class="bg-surface-container border border-surface-variant p-8 flex flex-col items-center justify-center hover:border-primary-container transition-all group relative overflow-hidden">
                <div class="absolute top-0 left-0 w-1 h-full bg-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
                <span class="font-headline-sm font-bold text-on-surface group-hover:text-primary-container transition-colors">HONDA</span>
                <span class="font-mono-data text-[10px] text-on-surface-variant uppercase mt-2 group-hover:text-white transition-colors">Nhật Bản</span>
            </a>
            <!-- Brand Card 2 -->
            <a href="${pageContext.request.contextPath}/products.jsp?brand=Yamaha" class="bg-surface-container border border-surface-variant p-8 flex flex-col items-center justify-center hover:border-primary-container transition-all group relative overflow-hidden">
                <div class="absolute top-0 left-0 w-1 h-full bg-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
                <span class="font-headline-sm font-bold text-on-surface group-hover:text-primary-container transition-colors">YAMAHA</span>
                <span class="font-mono-data text-[10px] text-on-surface-variant uppercase mt-2 group-hover:text-white transition-colors">Nhật Bản</span>
            </a>
            <!-- Brand Card 3 -->
            <a href="${pageContext.request.contextPath}/products.jsp?brand=Suzuki" class="bg-surface-container border border-surface-variant p-8 flex flex-col items-center justify-center hover:border-primary-container transition-all group relative overflow-hidden">
                <div class="absolute top-0 left-0 w-1 h-full bg-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
                <span class="font-headline-sm font-bold text-on-surface group-hover:text-primary-container transition-colors">SUZUKI</span>
                <span class="font-mono-data text-[10px] text-on-surface-variant uppercase mt-2 group-hover:text-white transition-colors">Nhật Bản</span>
            </a>
            <!-- Brand Card 4 -->
            <a href="${pageContext.request.contextPath}/products.jsp?brand=Piaggio" class="bg-surface-container border border-surface-variant p-8 flex flex-col items-center justify-center hover:border-primary-container transition-all group relative overflow-hidden">
                <div class="absolute top-0 left-0 w-1 h-full bg-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
                <span class="font-headline-sm font-bold text-on-surface group-hover:text-primary-container transition-colors">PIAGGIO</span>
                <span class="font-mono-data text-[10px] text-on-surface-variant uppercase mt-2 group-hover:text-white transition-colors">Ý</span>
            </a>
            <!-- Brand Card 5 -->
            <a href="${pageContext.request.contextPath}/products.jsp?brand=Kawasaki" class="bg-surface-container border border-surface-variant p-8 flex flex-col items-center justify-center hover:border-primary-container transition-all group col-span-2 md:col-span-1 relative overflow-hidden">
                <div class="absolute top-0 left-0 w-1 h-full bg-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
                <span class="font-headline-sm font-bold text-on-surface group-hover:text-primary-container transition-colors">KAWASAKI</span>
                <span class="font-mono-data text-[10px] text-on-surface-variant uppercase mt-2 group-hover:text-white transition-colors">Nhật Bản</span>
            </a>
        </div>
    </section>

    <!-- Featured Products Card Grid -->
    <section class="py-16 bg-surface-container-low/30 border-t border-b border-surface-variant">
        <div class="max-w-container-max mx-auto px-margin-mobile md:px-margin-desktop">
            <div class="mb-12 flex flex-col md:flex-row justify-between items-end gap-4">
                <div>
                    <h2 class="font-headline-lg text-headline-sm md:text-headline-lg uppercase tracking-tighter">SẢN PHẨM NỔI BẬT</h2>
                    <div class="w-16 h-1 bg-primary-container mt-2"></div>
                </div>
                <a href="${pageContext.request.contextPath}/products.jsp" class="font-label-md text-label-md text-on-surface-variant uppercase border-b border-on-surface-variant pb-1 hover:text-primary-container transition-colors">
                    Xem tất cả xe máy
                </a>
            </div>

            <!-- Card Grid: 4 columns on desktop, 1 on mobile -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                
                <!-- Product Card 1 -->
                <div class="group relative bg-surface-container-low border border-surface-variant overflow-hidden hover:border-primary-container transition-all duration-300">
                    <div class="aspect-[4/5] relative overflow-hidden">
                        <img alt="Panigale V4 R" class="w-full h-full object-cover grayscale-[0.2] group-hover:scale-110 group-hover:grayscale-0 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
                        <div class="absolute inset-0 bike-card-gradient"></div>
                        <div class="absolute bottom-6 left-6 right-6">
                            <div class="font-label-md text-label-md text-primary-container uppercase tracking-[0.2em] mb-1">Superbike</div>
                            <h3 class="font-headline-sm text-[20px] uppercase leading-tight mb-2">Panigale V4 R</h3>
                            <div class="flex justify-between items-end mt-4">
                                <div>
                                    <div class="font-mono-data text-[12px] text-on-surface-variant">998 CC | ABS</div>
                                    <div class="font-mono-data text-body-lg font-bold text-white mt-1">1.250.000.000đ</div>
                                </div>
                                <div class="flex flex-col gap-2">
                                    <a href="${pageContext.request.contextPath}/product-detail.jsp" class="bg-primary-container text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-white hover:text-black transition-all">Xem chi tiết</a>
                                    <button data-bike-name="Panigale V4 R" class="btn-add-to-cart bg-surface-container-highest text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-primary-container transition-all">Thêm giỏ</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 2 -->
                <div class="group relative bg-surface-container-low border border-surface-variant overflow-hidden hover:border-primary-container transition-all duration-300">
                    <div class="aspect-[4/5] relative overflow-hidden">
                        <img alt="Streetfighter V4 SP2" class="w-full h-full object-cover grayscale-[0.2] group-hover:scale-110 group-hover:grayscale-0 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAdKorEA5p1QaRZfD9I48o79FNOC7NyiKtFTK8QD43Xo-Ra6Dz2jw-CHFFLuvoVm5bI_t_vlOFiVAs3kp7sRtfYgdv6ElZqsbRgkPeSJffTMxIy1mzoeLAlMiJ_kHyTg7rimhxUeJktaVfSuac8eQS288HTBRiy1MI8rj9cbBRMawtNZnTix0r4X-DUMMRL8P_gu3nkU_6QyvOWcFy5UyUX0r-k044QU0y1Ijdf5TUhlEWiFJwjomAnK2DSAzo4KSP_J1TlKLSSTIwB"/>
                        <div class="absolute inset-0 bike-card-gradient"></div>
                        <div class="absolute bottom-6 left-6 right-6">
                            <div class="font-label-md text-label-md text-primary-container uppercase tracking-[0.2em] mb-1">Streetfighter</div>
                            <h3 class="font-headline-sm text-[20px] uppercase leading-tight mb-2">Streetfighter V4 SP2</h3>
                            <div class="flex justify-between items-end mt-4">
                                <div>
                                    <div class="font-mono-data text-[12px] text-on-surface-variant">1103 CC | ABS</div>
                                    <div class="font-mono-data text-body-lg font-bold text-white mt-1">980.000.000đ</div>
                                </div>
                                <div class="flex flex-col gap-2">
                                    <a href="${pageContext.request.contextPath}/product-detail.jsp" class="bg-primary-container text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-white hover:text-black transition-all">Xem chi tiết</a>
                                    <button data-bike-name="Streetfighter V4 SP2" class="btn-add-to-cart bg-surface-container-highest text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-primary-container transition-all">Thêm giỏ</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 3 -->
                <div class="group relative bg-surface-container-low border border-surface-variant overflow-hidden hover:border-primary-container transition-all duration-300">
                    <div class="aspect-[4/5] relative overflow-hidden">
                        <img alt="Monster SP" class="w-full h-full object-cover grayscale-[0.2] group-hover:scale-110 group-hover:grayscale-0 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4"/>
                        <div class="absolute inset-0 bike-card-gradient"></div>
                        <div class="absolute bottom-6 left-6 right-6">
                            <div class="font-label-md text-label-md text-primary-container uppercase tracking-[0.2em] mb-1">Monster</div>
                            <h3 class="font-headline-sm text-[20px] uppercase leading-tight mb-2">Monster SP</h3>
                            <div class="flex justify-between items-end mt-4">
                                <div>
                                    <div class="font-mono-data text-[12px] text-on-surface-variant">937 CC | DTC</div>
                                    <div class="font-mono-data text-body-lg font-bold text-white mt-1">455.000.000đ</div>
                                </div>
                                <div class="flex flex-col gap-2">
                                    <a href="${pageContext.request.contextPath}/product-detail.jsp" class="bg-primary-container text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-white hover:text-black transition-all">Xem chi tiết</a>
                                    <button data-bike-name="Monster SP" class="btn-add-to-cart bg-surface-container-highest text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-primary-container transition-all">Thêm giỏ</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 4 -->
                <div class="group relative bg-surface-container-low border border-surface-variant overflow-hidden hover:border-primary-container transition-all duration-300">
                    <div class="aspect-[4/5] relative overflow-hidden">
                        <img alt="DesertX Discovery" class="w-full h-full object-cover grayscale-[0.2] group-hover:scale-110 group-hover:grayscale-0 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCBXWGA3Q6A06Fdqg9k14jbsUfBP6Man3goQ1exH_nI-_FVJo1bOLlK5VLe20yFR7mGUrI6udKwF7qwDXo4I-O3ER6C0kCwC7a8c15cenbmUH_XcQ2BLMVRVM3KpQghrWFtTS7D76GS4FE0yFFaC0DnR49cD1XlvZfbnSMkFuE7tv98VZIMc5IQP1ZW_dIkso8lU9vbT3YkRehoQqo6OeXL3QHVrduBq6-tcwe__PhbF687tVRrgP9F9vu-fvvA3PedOi3remkBKknn"/>
                        <div class="absolute inset-0 bike-card-gradient"></div>
                        <div class="absolute bottom-6 left-6 right-6">
                            <div class="font-label-md text-label-md text-primary-container uppercase tracking-[0.2em] mb-1">DesertX</div>
                            <h3 class="font-headline-sm text-[20px] uppercase leading-tight mb-2">DesertX Discovery</h3>
                            <div class="flex justify-between items-end mt-4">
                                <div>
                                    <div class="font-mono-data text-[12px] text-on-surface-variant">937 CC | Offroad</div>
                                    <div class="font-mono-data text-body-lg font-bold text-white mt-1">689.000.000đ</div>
                                </div>
                                <div class="flex flex-col gap-2">
                                    <a href="${pageContext.request.contextPath}/product-detail.jsp" class="bg-primary-container text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-white hover:text-black transition-all">Xem chi tiết</a>
                                    <button data-bike-name="DesertX Discovery" class="btn-add-to-cart bg-surface-container-highest text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-primary-container transition-all">Thêm giỏ</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</main>

<script>
    let activeSlideIdx = 1;
    const totalSlides = 2;

    function showSlide(index) {
        // Hide all slides
        document.querySelectorAll('.hero-slide').forEach(slide => {
            slide.classList.replace('opacity-100', 'opacity-0');
            slide.classList.remove('z-10');
            slide.classList.add('z-0');
        });
        
        // Show target slide
        const target = document.getElementById(`slide-${index}`);
        if (target) {
            target.classList.replace('opacity-0', 'opacity-100');
            target.classList.remove('z-0');
            target.classList.add('z-10');
        }
    }

    function nextSlide() {
        activeSlideIdx = activeSlideIdx + 1;
        if (activeSlideIdx > totalSlides) {
            activeSlideIdx = 1;
        }
        showSlide(activeSlideIdx);
    }

    function prevSlide() {
        activeSlideIdx = activeSlideIdx - 1;
        if (activeSlideIdx < 1) {
            activeSlideIdx = totalSlides;
        }
        showSlide(activeSlideIdx);
    }

    // Auto rotate slides
    setInterval(nextSlide, 7000);
</script>

<%@ include file="/common/footer.jsp" %>
