<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="BỘ SƯU TẬP XE MÁY - DUCATI" />
<%@ include file="/common/header.jsp" %>

<!-- Main Catalog Content -->
<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    <div class="row g-4">
        
        <!-- Left Sidebar: Filters (col-lg-3) -->
        <aside class="col-12 col-lg-3">
            <form action="${pageContext.request.contextPath}/products.jsp" method="get" class="d-flex flex-column gap-4 sticky-lg-top" style="top: 100px; z-index: 5;">
                
                <!-- Category Filter Panel -->
                <div class="card card-ducati p-4 racing-stripe">
                    <h2 class="font-heading text-uppercase tracking-wider fs-6 text-danger mb-4 fw-bold">Thương hiệu</h2>
                    <div class="d-flex flex-column gap-3">
                        <div class="form-check">
                            <input name="brand" value="Honda" id="brandHonda" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="checkbox"/>
                            <label class="form-check-label font-mono-data text-white text-uppercase" for="brandHonda">Honda</label>
                        </div>
                        <div class="form-check">
                            <input name="brand" value="Yamaha" id="brandYamaha" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="checkbox"/>
                            <label class="form-check-label font-mono-data text-white text-uppercase" for="brandYamaha">Yamaha</label>
                        </div>
                        <div class="form-check">
                            <input name="brand" value="Suzuki" id="brandSuzuki" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="checkbox"/>
                            <label class="form-check-label font-mono-data text-white text-uppercase" for="brandSuzuki">Suzuki</label>
                        </div>
                        <div class="form-check">
                            <input name="brand" value="Piaggio" id="brandPiaggio" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="checkbox"/>
                            <label class="form-check-label font-mono-data text-white text-uppercase" for="brandPiaggio">Piaggio</label>
                        </div>
                        <div class="form-check">
                            <input name="brand" value="Kawasaki" id="brandKawasaki" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="checkbox"/>
                            <label class="form-check-label font-mono-data text-white text-uppercase" for="brandKawasaki">Kawasaki</label>
                        </div>
                    </div>
                </div>

                <!-- Vehicle Type Filter Panel -->
                <div class="card card-ducati p-4">
                    <h2 class="font-heading text-uppercase tracking-wider fs-6 text-danger mb-4 fw-bold">Dòng xe</h2>
                    <div class="d-flex flex-column gap-3">
                        <div class="form-check">
                            <input name="category" value="Superbike" id="catSuperbike" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="checkbox"/>
                            <label class="form-check-label font-mono-data text-white text-uppercase" for="catSuperbike">Superbike (Sport)</label>
                        </div>
                        <div class="form-check">
                            <input name="category" value="Streetfighter" id="catStreetfighter" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="checkbox"/>
                            <label class="form-check-label font-mono-data text-white text-uppercase" for="catStreetfighter">Streetfighter (Naked)</label>
                        </div>
                        <div class="form-check">
                            <input name="category" value="Multistrada" id="catMultistrada" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="checkbox"/>
                            <label class="form-check-label font-mono-data text-white text-uppercase" for="catMultistrada">Multistrada (Touring)</label>
                        </div>
                        <div class="form-check">
                            <input name="category" value="DesertX" id="catDesertX" class="form-check-input bg-transparent border-secondary text-danger rounded-0" type="checkbox"/>
                            <label class="form-check-label font-mono-data text-white text-uppercase" for="catDesertX">DesertX (Adventure)</label>
                        </div>
                    </div>
                </div>

                <!-- Price Filter Dropdown -->
                <div class="card card-ducati p-4">
                    <h2 class="font-heading text-uppercase tracking-wider fs-6 text-danger mb-3 fw-bold">Khoảng giá</h2>
                    <select name="priceFilter" class="form-select bg-black border-secondary text-white font-mono-data text-uppercase rounded-0">
                        <option value="">Tất cả mức giá</option>
                        <option value="under_300">Dưới 300 triệu</option>
                        <option value="300_500">Từ 300 - 500 triệu</option>
                        <option value="over_500">Trên 500 triệu</option>
                    </select>
                </div>

                <!-- Submit Filters Button -->
                <button type="submit" class="btn btn-ducati w-100 py-3 d-flex align-items-center justify-content-center gap-2">
                    <span>Áp dụng lọc</span>
                    <span class="material-symbols-outlined fs-5">tune</span>
                </button>
            </form>
        </aside>

        <!-- Right Area: Product Catalog List (col-lg-9) -->
        <section class="col-12 col-lg-9">
            <header class="mb-4 d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3">
                <div>
                    <h1 class="font-heading text-uppercase tracking-tighter fs-3 m-0">BỘ SƯU TẬP XE MÁY</h1>
                    <p class="font-mono-data text-muted text-uppercase small m-0 mt-1">Hiển thị 4 dòng xe có sẵn</p>
                </div>
                
                <!-- Sorting controls -->
                <div class="d-flex align-items-center gap-3 w-100 w-md-auto">
                    <span class="font-heading text-muted text-uppercase small whitespace-nowrap">Sắp xếp:</span>
                    <select class="form-select bg-black border-secondary text-white font-mono-data text-uppercase rounded-0" style="width: auto; min-width: 200px;">
                        <option>Giá từ cao đến thấp</option>
                        <option>Giá từ thấp đến cao</option>
                        <option>Động cơ phân khối lớn</option>
                    </select>
                </div>
            </header>

            <!-- Product Cards Grid -->
            <div class="row g-4">
                
                <!-- Card 1 -->
                <div class="col-12 col-md-6 col-xl-4">
                    <div class="card card-ducati h-100 overflow-hidden position-relative group">
                        <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                            <img class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
                            <div class="bike-card-gradient"></div>
                            <div class="position-absolute bottom-0 start-0 end-0 p-4">
                                <div class="font-heading text-danger text-uppercase tracking-wider small mb-1">Superbike</div>
                                <h3 class="font-heading fs-5 text-uppercase leading-tight mb-2 text-white">Panigale V4 R</h3>
                                <div class="d-flex justify-content-between align-items-end mt-3">
                                    <div>
                                        <div class="font-mono-data text-muted small" style="font-size: 11px;">998 CC</div>
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

                <!-- Card 2 -->
                <div class="col-12 col-md-6 col-xl-4">
                    <div class="card card-ducati h-100 overflow-hidden position-relative group">
                        <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                            <img class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAdKorEA5p1QaRZfD9I48o79FNOC7NyiKtFTK8QD43Xo-Ra6Dz2jw-CHFFLuvoVm5bI_t_vlOFiVAs3kp7sRtfYgdv6ElZqsbRgkPeSJffTMxIy1mzoeLAlMiJ_kHyTg7rimhxUeJktaVfSuac8eQS288HTBRiy1MI8rj9cbBRMawtNZnTix0r4X-DUMMRL8P_gu3nkU_6QyvOWcFy5UyUX0r-k044QU0y1Ijdf5TUhlEWiFJwjomAnK2DSAzo4KSP_J1TlKLSSTIwB"/>
                            <div class="bike-card-gradient"></div>
                            <div class="position-absolute bottom-0 start-0 end-0 p-4">
                                <div class="font-heading text-danger text-uppercase tracking-wider small mb-1">Streetfighter</div>
                                <h3 class="font-heading fs-5 text-uppercase leading-tight mb-2 text-white">Streetfighter V4 SP2</h3>
                                <div class="d-flex justify-content-between align-items-end mt-3">
                                    <div>
                                        <div class="font-mono-data text-muted small" style="font-size: 11px;">1103 CC</div>
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

                <!-- Card 3 -->
                <div class="col-12 col-md-6 col-xl-4">
                    <div class="card card-ducati h-100 overflow-hidden position-relative group">
                        <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                            <img class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCBXWGA3Q6A06Fdqg9k14jbsUfBP6Man3goQ1exH_nI-_FVJo1bOLlK5VLe20yFR7mGUrI6udKwF7qwDXo4I-O3ER6C0kCwC7a8c15cenbmUH_XcQ2BLMVRVM3KpQghrWFtTS7D76GS4FE0yFFaC0DnR49cD1XlvZfbnSMkFuE7tv98VZIMc5IQP1ZW_dIkso8lU9vbT3YkRehoQqo6OeXL3QHVrduBq6-tcwe__PhbF687tVRrgP9F9vu-fvvA3PedOi3remkBKknn"/>
                            <div class="bike-card-gradient"></div>
                            <div class="position-absolute bottom-0 start-0 end-0 p-4">
                                <div class="font-heading text-danger text-uppercase tracking-wider small mb-1">DesertX</div>
                                <h3 class="font-heading fs-5 text-uppercase leading-tight mb-2 text-white">DesertX Discovery</h3>
                                <div class="d-flex justify-content-between align-items-end mt-3">
                                    <div>
                                        <div class="font-mono-data text-muted small" style="font-size: 11px;">937 CC</div>
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

                <!-- Card 4 -->
                <div class="col-12 col-md-6 col-xl-4">
                    <div class="card card-ducati h-100 overflow-hidden position-relative group">
                        <div style="aspect-ratio: 4/5; overflow: hidden; position: relative;">
                            <img class="w-100 h-100 object-fit-cover transition-all" style="object-fit: cover; filter: grayscale(20%); transition: transform 0.7s;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4"/>
                            <div class="bike-card-gradient"></div>
                            <div class="position-absolute bottom-0 start-0 end-0 p-4">
                                <div class="font-heading text-danger text-uppercase tracking-wider small mb-1">Monster</div>
                                <h3 class="font-heading fs-5 text-uppercase leading-tight mb-2 text-white">Monster SP</h3>
                                <div class="d-flex justify-content-between align-items-end mt-3">
                                    <div>
                                        <div class="font-mono-data text-muted small" style="font-size: 11px;">937 CC</div>
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

            </div>

            <!-- Pagination Controls -->
            <div class="mt-5 d-flex justify-content-center">
                <nav aria-label="Catalog Page navigation">
                    <ul class="pagination gap-2">
                        <li class="page-item">
                            <a class="page-link d-flex align-items-center justify-content-center" href="#" aria-label="Previous">
                                <span class="material-symbols-outlined">chevron_left</span>
                            </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link d-flex align-items-center justify-content-center" href="#" aria-label="Next">
                                <span class="material-symbols-outlined">chevron_right</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </section>
    </div>
</main>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        // Highlight active brand text
        const checkBoxes = document.querySelectorAll('.form-check-input');
        checkBoxes.forEach(cb => {
            cb.addEventListener('change', () => {
                const label = cb.parentElement.querySelector('.form-check-label');
                if (cb.checked) {
                    label.classList.add('text-danger', 'fw-bold');
                } else {
                    label.classList.remove('text-danger', 'fw-bold');
                }
            });
        });
    });
</script>

<%@ include file="/common/footer.jsp" %>
