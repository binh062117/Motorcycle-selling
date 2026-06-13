<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="DUCATI CORSE | Showroom Xe Máy Cao Cấp" />
<%@ include file="/common/header.jsp" %>

<!-- Main Page Container -->
<main class="bg-dark text-white">
    
    <!-- Hero Slider Section (Bootstrap Carousel) -->
    <section id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="7000">
        <!-- Indicators -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        </div>
        
        <div class="carousel-inner position-relative" style="height: 680px;">
            <!-- Carbon fiber texture background overlay -->
            <div class="carbon-overlay"></div>
            
            <!-- Slide 1 -->
            <div class="carousel-item active h-100">
                <img alt="Panigale V4 S" class="d-block w-100 h-100 object-fit-cover filter-grayscale opacity-50" style="object-fit: cover; filter: grayscale(80%);" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCUu357nv5EVVSOh6p8Vu91OeVbPImBJeklq4G47urA4WnCaLo5V8YEXuQN4zGwbmT1OqO8y9PFauKkBBsnJEykwgjn1Sj57XUv6EPIdcK-2K4GKTx2iELIKnyI2OvfRr1CRjWMsrQcNnni1eFUmkZygS4NWe0gSgT23wJwqFPJYbZcqaXtwiLnCLMLLe_SVh4PNB_0MyNjeItNrLhehMd8bHwuqC1xkdp4t94T416DHP5EF4wd0bv-Rk8rLOXNsZ-KcQmuIE35NfNM"/>
                <div class="absolute-center-caption carousel-caption d-flex align-items-center text-start h-100 start-0 top-0 bottom-0 ps-5" style="left: 0; right: 0;">
                    <div class="container px-4">
                        <div class="col-12 col-lg-8 bg-black bg-opacity-50 p-5 border-start border-danger border-4" style="border-radius: 0;">
                            <span class="font-mono-data text-danger tracking-widest text-uppercase mb-2 d-block" style="letter-spacing: 0.25em; font-size:12px;">Performance Engineered</span>
                            <h1 class="font-heading display-4 fw-black text-white mb-3 text-uppercase leading-tight" style="font-weight: 900;">Đỉnh Cao<br/><span class="text-danger">Tốc Độ Ý</span>.</h1>
                            <p class="text-secondary mb-4 fs-5">
                                Khám phá những mẫu xe phân khối lớn huyền thoại. Được chế tác cơ khí chính xác đỉnh cao để thống trị mọi cung đường đua và đường phố.
                            </p>
                            <div class="d-flex flex-wrap gap-3">
                                <a href="${pageContext.request.contextPath}/products.jsp" class="btn btn-ducati px-4 py-3 d-flex align-items-center gap-2">
                                    <span>Khám phá ngay</span>
                                    <span class="material-symbols-outlined fs-6">arrow_forward</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/checkout.jsp" class="btn btn-outline-ducati px-4 py-3">
                                    Đặt lịch lái thử
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="carousel-item h-100">
                <img alt="Multistrada V4" class="d-block w-100 h-100 object-fit-cover filter-grayscale opacity-50" style="object-fit: cover; filter: grayscale(80%);" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBSeEUrcu8HVI4NLKl7VEYn6lqlBCBqXduCmgs2MpOdWJsvsfn6K4nHVXDD2Zh8vDF-76pRBd2uDfT9L_Cg9gx_29E-8HiCP6iEJ9oW9W8mXS_Nzn-LdfZfsXSMsF6_BIpoNhRpXfLLvHSATBYzHe7Gc1vgN9pe7LeGdYI7V2mmDEjjD-BrUJecaFtBuB8PzedDFmR_84y66RPLwzz5KkmuB2ahe3sPEodzmqE7Be77L_F5wmvyIi9CLLWehZBLLG1uyX2gazco5m2e"/>
                <div class="absolute-center-caption carousel-caption d-flex align-items-center text-start h-100 start-0 top-0 bottom-0 ps-5" style="left: 0; right: 0;">
                    <div class="container px-4">
                        <div class="col-12 col-lg-8 bg-black bg-opacity-50 p-5 border-start border-danger border-4" style="border-radius: 0;">
                            <span class="font-mono-data text-danger tracking-widest text-uppercase mb-2 d-block" style="letter-spacing: 0.25em; font-size:12px;">Adventure Unlocked</span>
                            <h1 class="font-heading display-4 fw-black text-white mb-3 text-uppercase leading-tight" style="font-weight: 900;">Chinh Phục<br/><span class="text-danger">Mọi Địa Hình</span>.</h1>
                            <p class="text-secondary mb-4 fs-5">
                                Dòng xe phượt cao cấp Multistrada mang đến sức mạnh việt dã và trải nghiệm êm ái trên những chặng đường xa nhất.
                            </p>
                            <div class="d-flex flex-wrap gap-3">
                                <a href="${pageContext.request.contextPath}/products.jsp?category=Multistrada" class="btn btn-ducati px-4 py-3 d-flex align-items-center gap-2">
                                    <span>Xem chi tiết dòng xe</span>
                                    <span class="material-symbols-outlined fs-6">arrow_forward</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/checkout.jsp" class="btn btn-outline-ducati px-4 py-3">
                                    Đặt mua trước
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Controls -->
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon p-3 border border-secondary bg-dark" aria-hidden="true" style="border-radius: 0;"></span>
            <span class="visually-hidden">Trước</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon p-3 border border-secondary bg-dark" aria-hidden="true" style="border-radius: 0;"></span>
            <span class="visually-hidden">Kế tiếp</span>
        </button>
    </section>

    <!-- Quick Brand Filters Section -->
    <section class="py-5 container-fluid px-4 max-w-container-max mx-auto">
        <div class="mb-4 text-center text-md-start">
            <h2 class="font-heading text-uppercase tracking-wider fs-4">Tìm xe theo hãng</h2>
            <p class="font-mono-data text-muted text-uppercase small m-0">Lọc nhanh cấu hình theo thương hiệu lớn</p>
        </div>
        
        <!-- Grid of brand badges -->
        <div class="row g-3">
            <!-- Brand Card 1 -->
            <div class="col-6 col-md-3 col-lg-2">
                <a href="${pageContext.request.contextPath}/products.jsp?brand=Honda" class="card card-ducati h-100 p-4 flex-column align-items-center justify-content-center text-center text-decoration-none group racing-stripe">
                    <span class="font-heading fw-bold fs-5 text-white transition-colors group-hover-danger">HONDA</span>
                    <span class="font-mono-data text-muted small mt-2" style="font-size: 10px;">Nhật Bản</span>
                </a>
            </div>
            <!-- Brand Card 2 -->
            <div class="col-6 col-md-3 col-lg-2">
                <a href="${pageContext.request.contextPath}/products.jsp?brand=Yamaha" class="card card-ducati h-100 p-4 flex-column align-items-center justify-content-center text-center text-decoration-none group racing-stripe">
                    <span class="font-heading fw-bold fs-5 text-white">YAMAHA</span>
                    <span class="font-mono-data text-muted small mt-2" style="font-size: 10px;">Nhật Bản</span>
                </a>
            </div>
            <!-- Brand Card 3 -->
            <div class="col-6 col-md-3 col-lg-2">
                <a href="${pageContext.request.contextPath}/products.jsp?brand=Suzuki" class="card card-ducati h-100 p-4 flex-column align-items-center justify-content-center text-center text-decoration-none group racing-stripe">
                    <span class="font-heading fw-bold fs-5 text-white">SUZUKI</span>
                    <span class="font-mono-data text-muted small mt-2" style="font-size: 10px;">Nhật Bản</span>
                </a>
            </div>
            <!-- Brand Card 4 -->
            <div class="col-6 col-md-3 col-lg-2">
                <a href="${pageContext.request.contextPath}/products.jsp?brand=Piaggio" class="card card-ducati h-100 p-4 flex-column align-items-center justify-content-center text-center text-decoration-none group racing-stripe">
                    <span class="font-heading fw-bold fs-5 text-white">PIAGGIO</span>
                    <span class="font-mono-data text-muted small mt-2" style="font-size: 10px;">Ý</span>
                </a>
            </div>
            <!-- Brand Card 5 -->
            <div class="col-12 col-md-3 col-lg-4">
                <a href="${pageContext.request.contextPath}/products.jsp?brand=Kawasaki" class="card card-ducati h-100 p-4 flex-column align-items-center justify-content-center text-center text-decoration-none group racing-stripe">
                    <span class="font-heading fw-bold fs-5 text-white">KAWASAKI</span>
                    <span class="font-mono-data text-muted small mt-2" style="font-size: 10px;">Nhật Bản</span>
                </a>
            </div>
        </div>
    </section>

    <!-- Featured Products Card Grid -->
    <section class="py-5 bg-black bg-opacity-25 border-top border-bottom border-secondary" style="border-color: var(--border-color) !important;">
        <div class="container-fluid px-4 max-w-container-max mx-auto">
            <div class="mb-5 d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3">
                <div>
                    <h2 class="font-heading text-uppercase tracking-tighter fs-3 m-0">SẢN PHẨM NỔI BẬT</h2>
                    <div class="bg-danger mt-2" style="width: 64px; height: 4px;"></div>
                </div>
                <a href="${pageContext.request.contextPath}/products.jsp" class="font-heading text-secondary text-uppercase text-decoration-none border-bottom border-secondary pb-1 small hover-text-white transition-colors">
                    Xem tất cả xe máy
                </a>
            </div>

            <!-- Card Grid: Bootstrap Row & Col -->
            <div class="row g-4">
                
                <!-- Product Card 1 -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="card card-ducati h-100 overflow-hidden position-relative group">
                        <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                            <img alt="Panigale V4 R" class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
                            <div class="bike-card-gradient"></div>
                            <div class="position-absolute bottom-0 start-0 end-0 p-4">
                                <div class="font-heading text-danger text-uppercase tracking-wider small mb-1">Superbike</div>
                                <h3 class="font-heading fs-5 text-uppercase leading-tight mb-2 text-white">Panigale V4 R</h3>
                                <div class="d-flex justify-content-between align-items-end mt-3">
                                    <div>
                                        <div class="font-mono-data text-muted small" style="font-size: 11px;">998 CC | ABS</div>
                                        <div class="font-mono-data text-white fw-bold mt-1" style="font-size: 16px;">1.250.000.000đ</div>
                                    </div>
                                    <div class="d-flex flex-column gap-2">
                                        <a href="${pageContext.request.contextPath}/product-detail.jsp" class="btn btn-ducati py-1 px-3" style="font-size: 10px;">Chi tiết</a>
                                        <button data-bike-name="Panigale V4 R" class="btn btn-secondary btn-add-to-cart py-1 px-2 border-0 rounded-0" style="font-size: 10px; font-family: var(--font-heading); text-transform: uppercase;">Thêm giỏ</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 2 -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="card card-ducati h-100 overflow-hidden position-relative group">
                        <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                            <img alt="Streetfighter V4 SP2" class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAdKorEA5p1QaRZfD9I48o79FNOC7NyiKtFTK8QD43Xo-Ra6Dz2jw-CHFFLuvoVm5bI_t_vlOFiVAs3kp7sRtfYgdv6ElZqsbRgkPeSJffTMxIy1mzoeLAlMiJ_kHyTg7rimhxUeJktaVfSuac8eQS288HTBRiy1MI8rj9cbBRMawtNZnTix0r4X-DUMMRL8P_gu3nkU_6QyvOWcFy5UyUX0r-k044QU0y1Ijdf5TUhlEWiFJwjomAnK2DSAzo4KSP_J1TlKLSSTIwB"/>
                            <div class="bike-card-gradient"></div>
                            <div class="position-absolute bottom-0 start-0 end-0 p-4">
                                <div class="font-heading text-danger text-uppercase tracking-wider small mb-1">Streetfighter</div>
                                <h3 class="font-heading fs-5 text-uppercase leading-tight mb-2 text-white">Streetfighter V4 SP2</h3>
                                <div class="d-flex justify-content-between align-items-end mt-3">
                                    <div>
                                        <div class="font-mono-data text-muted small" style="font-size: 11px;">1103 CC | ABS</div>
                                        <div class="font-mono-data text-white fw-bold mt-1" style="font-size: 16px;">980.000.000đ</div>
                                    </div>
                                    <div class="d-flex flex-column gap-2">
                                        <a href="${pageContext.request.contextPath}/product-detail.jsp" class="btn btn-ducati py-1 px-3" style="font-size: 10px;">Chi tiết</a>
                                        <button data-bike-name="Streetfighter V4 SP2" class="btn btn-secondary btn-add-to-cart py-1 px-2 border-0 rounded-0" style="font-size: 10px; font-family: var(--font-heading); text-transform: uppercase;">Thêm giỏ</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 3 -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="card card-ducati h-100 overflow-hidden position-relative group">
                        <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                            <img alt="Monster SP" class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4"/>
                            <div class="bike-card-gradient"></div>
                            <div class="position-absolute bottom-0 start-0 end-0 p-4">
                                <div class="font-heading text-danger text-uppercase tracking-wider small mb-1">Monster</div>
                                <h3 class="font-heading fs-5 text-uppercase leading-tight mb-2 text-white">Monster SP</h3>
                                <div class="d-flex justify-content-between align-items-end mt-3">
                                    <div>
                                        <div class="font-mono-data text-muted small" style="font-size: 11px;">937 CC | DTC</div>
                                        <div class="font-mono-data text-white fw-bold mt-1" style="font-size: 16px;">455.000.000đ</div>
                                    </div>
                                    <div class="d-flex flex-column gap-2">
                                        <a href="${pageContext.request.contextPath}/product-detail.jsp" class="btn btn-ducati py-1 px-3" style="font-size: 10px;">Chi tiết</a>
                                        <button data-bike-name="Monster SP" class="btn btn-secondary btn-add-to-cart py-1 px-2 border-0 rounded-0" style="font-size: 10px; font-family: var(--font-heading); text-transform: uppercase;">Thêm giỏ</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 4 -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="card card-ducati h-100 overflow-hidden position-relative group">
                        <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                            <img alt="DesertX Discovery" class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCBXWGA3Q6A06Fdqg9k14jbsUfBP6Man3goQ1exH_nI-_FVJo1bOLlK5VLe20yFR7mGUrI6udKwF7qwDXo4I-O3ER6C0kCwC7a8c15cenbmUH_XcQ2BLMVRVM3KpQghrWFtTS7D76GS4FE0yFFaC0DnR49cD1XlvZfbnSMkFuE7tv98VZIMc5IQP1ZW_dIkso8lU9vbT3YkRehoQqo6OeXL3QHVrduBq6-tcwe__PhbF687tVRrgP9F9vu-fvvA3PedOi3remkBKknn"/>
                            <div class="bike-card-gradient"></div>
                            <div class="position-absolute bottom-0 start-0 end-0 p-4">
                                <div class="font-heading text-danger text-uppercase tracking-wider small mb-1">DesertX</div>
                                <h3 class="font-heading fs-5 text-uppercase leading-tight mb-2 text-white">DesertX Discovery</h3>
                                <div class="d-flex justify-content-between align-items-end mt-3">
                                    <div>
                                        <div class="font-mono-data text-muted small" style="font-size: 11px;">937 CC | Offroad</div>
                                        <div class="font-mono-data text-white fw-bold mt-1" style="font-size: 16px;">689.000.000đ</div>
                                    </div>
                                    <div class="d-flex flex-column gap-2">
                                        <a href="${pageContext.request.contextPath}/product-detail.jsp" class="btn btn-ducati py-1 px-3" style="font-size: 10px;">Chi tiết</a>
                                        <button data-bike-name="DesertX Discovery" class="btn btn-secondary btn-add-to-cart py-1 px-2 border-0 rounded-0" style="font-size: 10px; font-family: var(--font-heading); text-transform: uppercase;">Thêm giỏ</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</main>

<%@ include file="/common/footer.jsp" %>
