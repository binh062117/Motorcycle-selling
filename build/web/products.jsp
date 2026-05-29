<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jsp" %>

<!-- Main Catalog Content -->
<main class="pt-28 pb-16 max-w-container-max mx-auto px-margin-mobile md:px-margin-desktop flex flex-col lg:flex-row gap-gutter">
    
    <!-- Left Sidebar: Filters -->
    <aside class="w-full lg:w-72 shrink-0 h-fit lg:sticky lg:top-28">
        <form action="${pageContext.request.contextPath}/products.jsp" method="get" class="space-y-6">
            
            <!-- Category Filter Panel -->
            <div class="bg-surface-container-lowest p-6 border border-surface-variant relative overflow-hidden racing-stripe">
                <h2 class="font-label-md text-label-md uppercase tracking-widest text-primary-container mb-6 font-bold">Thương hiệu</h2>
                <div class="space-y-4">
                    <label class="flex items-center group cursor-pointer">
                        <input name="brand" value="Honda" class="form-checkbox bg-transparent border-surface-variant text-primary-container focus:ring-0 focus:ring-offset-0 rounded-none w-4 h-4" type="checkbox"/>
                        <span class="ml-3 font-mono-data text-mono-data uppercase group-hover:text-primary-container transition-colors">Honda</span>
                    </label>
                    <label class="flex items-center group cursor-pointer">
                        <input name="brand" value="Yamaha" class="form-checkbox bg-transparent border-surface-variant text-primary-container focus:ring-0 focus:ring-offset-0 rounded-none w-4 h-4" type="checkbox"/>
                        <span class="ml-3 font-mono-data text-mono-data uppercase group-hover:text-primary-container transition-colors">Yamaha</span>
                    </label>
                    <label class="flex items-center group cursor-pointer">
                        <input name="brand" value="Suzuki" class="form-checkbox bg-transparent border-surface-variant text-primary-container focus:ring-0 focus:ring-offset-0 rounded-none w-4 h-4" type="checkbox"/>
                        <span class="ml-3 font-mono-data text-mono-data uppercase group-hover:text-primary-container transition-colors">Suzuki</span>
                    </label>
                    <label class="flex items-center group cursor-pointer">
                        <input name="brand" value="Piaggio" class="form-checkbox bg-transparent border-surface-variant text-primary-container focus:ring-0 focus:ring-offset-0 rounded-none w-4 h-4" type="checkbox"/>
                        <span class="ml-3 font-mono-data text-mono-data uppercase group-hover:text-primary-container transition-colors">Piaggio</span>
                    </label>
                    <label class="flex items-center group cursor-pointer">
                        <input name="brand" value="Kawasaki" class="form-checkbox bg-transparent border-surface-variant text-primary-container focus:ring-0 focus:ring-offset-0 rounded-none w-4 h-4" type="checkbox"/>
                        <span class="ml-3 font-mono-data text-mono-data uppercase group-hover:text-primary-container transition-colors">Kawasaki</span>
                    </label>
                </div>
            </div>

            <!-- Vehicle Type Filter Panel -->
            <div class="bg-surface-container-lowest p-6 border border-surface-variant relative overflow-hidden">
                <h2 class="font-label-md text-label-md uppercase tracking-widest text-primary-container mb-6 font-bold">Dòng xe</h2>
                <div class="space-y-4">
                    <label class="flex items-center group cursor-pointer">
                        <input name="category" value="Superbike" class="form-checkbox bg-transparent border-surface-variant text-primary-container focus:ring-0 focus:ring-offset-0 rounded-none w-4 h-4" type="checkbox"/>
                        <span class="ml-3 font-mono-data text-mono-data uppercase group-hover:text-primary-container transition-colors">Superbike (Sport)</span>
                    </label>
                    <label class="flex items-center group cursor-pointer">
                        <input name="category" value="Streetfighter" class="form-checkbox bg-transparent border-surface-variant text-primary-container focus:ring-0 focus:ring-offset-0 rounded-none w-4 h-4" type="checkbox"/>
                        <span class="ml-3 font-mono-data text-mono-data uppercase group-hover:text-primary-container transition-colors">Streetfighter (Naked)</span>
                    </label>
                    <label class="flex items-center group cursor-pointer">
                        <input name="category" value="Multistrada" class="form-checkbox bg-transparent border-surface-variant text-primary-container focus:ring-0 focus:ring-offset-0 rounded-none w-4 h-4" type="checkbox"/>
                        <span class="ml-3 font-mono-data text-mono-data uppercase group-hover:text-primary-container transition-colors">Multistrada (Touring)</span>
                    </label>
                    <label class="flex items-center group cursor-pointer">
                        <input name="category" value="DesertX" class="form-checkbox bg-transparent border-surface-variant text-primary-container focus:ring-0 focus:ring-offset-0 rounded-none w-4 h-4" type="checkbox"/>
                        <span class="ml-3 font-mono-data text-mono-data uppercase group-hover:text-primary-container transition-colors">DesertX (Adventure)</span>
                    </label>
                </div>
            </div>

            <!-- Price Filter Dropdown -->
            <div class="bg-surface-container-lowest p-6 border border-surface-variant">
                <h2 class="font-label-md text-label-md uppercase tracking-widest text-primary-container mb-4 font-bold">Khoảng giá</h2>
                <select name="priceFilter" class="w-full bg-black border border-surface-variant text-on-surface font-mono-data text-mono-data px-4 py-3 outline-none uppercase">
                    <option value="">Tất cả mức giá</option>
                    <option value="under_300">Dưới 300 triệu</option>
                    <option value="300_500">Từ 300 - 500 triệu</option>
                    <option value="over_500">Trên 500 triệu</option>
                </select>
            </div>

            <!-- Submit Filters Button -->
            <button type="submit" class="w-full bg-primary-container text-white py-4 font-label-md text-label-md uppercase tracking-widest hover:brightness-110 transition-all flex items-center justify-center gap-2">
                <span>Áp dụng lọc</span>
                <span class="material-symbols-outlined text-[18px]">tune</span>
            </button>
        </form>
    </aside>

    <!-- Right Area: Product Catalog List -->
    <section class="flex-1">
        <header class="mb-10 flex flex-col md:flex-row justify-between items-start md:items-end gap-4">
            <div>
                <h1 class="font-headline-lg text-headline-sm md:text-headline-lg uppercase tracking-tighter">BỘ SƯU TẬP XE MÁY</h1>
                <p class="font-mono-data text-mono-data text-on-surface-variant uppercase mt-2">Hiển thị 4 dòng xe có sẵn</p>
            </div>
            
            <!-- Sorting controls -->
            <div class="flex items-center gap-4 w-full md:w-auto">
                <span class="font-label-md text-label-md uppercase text-on-surface-variant whitespace-nowrap">Sắp xếp:</span>
                <select class="bg-surface-container-lowest border border-surface-variant px-4 py-2 text-label-md uppercase tracking-wider focus:border-primary-container focus:ring-0 w-full md:w-48 text-on-surface font-mono-data">
                    <option>Giá từ cao đến thấp</option>
                    <option>Giá từ thấp đến cao</option>
                    <option>Động cơ phân khối lớn</option>
                </select>
            </div>
        </header>

        <!-- Product Cards Grid: 3 columns on desktop, 1 on mobile -->
        <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-8">
            
            <!-- BẮT ĐẦU VÒNG LẶP MẪU BẰNG JSTL (Backend developer sẽ lặp phần này) -->
            <!-- <%-- <c:forEach var="product" items="${productList}"> --%> -->
            
            <!-- Card 1 -->
            <div class="group relative bg-surface-container-low border border-surface-variant overflow-hidden hover:border-primary-container transition-all duration-300">
                <div class="aspect-[4/5] relative overflow-hidden">
                    <img class="w-full h-full object-cover grayscale-[0.2] group-hover:scale-110 group-hover:grayscale-0 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
                    <div class="absolute inset-0 bike-card-gradient"></div>
                    <div class="absolute bottom-6 left-6 right-6">
                        <div class="font-label-md text-label-md text-primary-container uppercase tracking-[0.2em] mb-1">Superbike</div>
                        <h3 class="font-headline-sm text-[20px] uppercase leading-tight mb-2">Panigale V4 R</h3>
                        <div class="flex justify-between items-end mt-4">
                            <div>
                                <div class="font-mono-data text-mono-data text-on-surface-variant">998 CC</div>
                                <div class="font-mono-data text-body-lg font-bold mt-1 text-white">1.250.000.000đ</div>
                            </div>
                            <div class="flex flex-col gap-2">
                                <a href="${pageContext.request.contextPath}/product-detail.jsp" class="bg-primary-container text-white px-6 py-3 font-label-md text-[10px] uppercase tracking-widest text-center hover:bg-white hover:text-black transition-all">Chi tiết</a>
                                <button data-bike-name="Panigale V4 R" class="btn-add-to-cart bg-surface-container-highest text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-primary-container transition-all">Thêm giỏ</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="group relative bg-surface-container-low border border-surface-variant overflow-hidden hover:border-primary-container transition-all duration-300">
                <div class="aspect-[4/5] relative overflow-hidden">
                    <img class="w-full h-full object-cover grayscale-[0.2] group-hover:scale-110 group-hover:grayscale-0 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAdKorEA5p1QaRZfD9I48o79FNOC7NyiKtFTK8QD43Xo-Ra6Dz2jw-CHFFLuvoVm5bI_t_vlOFiVAs3kp7sRtfYgdv6ElZqsbRgkPeSJffTMxIy1mzoeLAlMiJ_kHyTg7rimhxUeJktaVfSuac8eQS288HTBRiy1MI8rj9cbBRMawtNZnTix0r4X-DUMMRL8P_gu3nkU_6QyvOWcFy5UyUX0r-k044QU0y1Ijdf5TUhlEWiFJwjomAnK2DSAzo4KSP_J1TlKLSSTIwB"/>
                    <div class="absolute inset-0 bike-card-gradient"></div>
                    <div class="absolute bottom-6 left-6 right-6">
                        <div class="font-label-md text-label-md text-primary-container uppercase tracking-[0.2em] mb-1">Streetfighter</div>
                        <h3 class="font-headline-sm text-[20px] uppercase leading-tight mb-2">Streetfighter V4 SP2</h3>
                        <div class="flex justify-between items-end mt-4">
                            <div>
                                <div class="font-mono-data text-mono-data text-on-surface-variant">1103 CC</div>
                                <div class="font-mono-data text-body-lg font-bold mt-1 text-white">980.000.000đ</div>
                            </div>
                            <div class="flex flex-col gap-2">
                                <a href="${pageContext.request.contextPath}/product-detail.jsp" class="bg-primary-container text-white px-6 py-3 font-label-md text-[10px] uppercase tracking-widest text-center hover:bg-white hover:text-black transition-all">Chi tiết</a>
                                <button data-bike-name="Streetfighter V4 SP2" class="btn-add-to-cart bg-surface-container-highest text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-primary-container transition-all">Thêm giỏ</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="group relative bg-surface-container-low border border-surface-variant overflow-hidden hover:border-primary-container transition-all duration-300">
                <div class="aspect-[4/5] relative overflow-hidden">
                    <img class="w-full h-full object-cover grayscale-[0.2] group-hover:scale-110 group-hover:grayscale-0 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCBXWGA3Q6A06Fdqg9k14jbsUfBP6Man3goQ1exH_nI-_FVJo1bOLlK5VLe20yFR7mGUrI6udKwF7qwDXo4I-O3ER6C0kCwC7a8c15cenbmUH_XcQ2BLMVRVM3KpQghrWFtTS7D76GS4FE0yFFaC0DnR49cD1XlvZfbnSMkFuE7tv98VZIMc5IQP1ZW_dIkso8lU9vbT3YkRehoQqo6OeXL3QHVrduBq6-tcwe__PhbF687tVRrgP9F9vu-fvvA3PedOi3remkBKknn"/>
                    <div class="absolute inset-0 bike-card-gradient"></div>
                    <div class="absolute bottom-6 left-6 right-6">
                        <div class="font-label-md text-label-md text-primary-container uppercase tracking-[0.2em] mb-1">DesertX</div>
                        <h3 class="font-headline-sm text-[20px] uppercase leading-tight mb-2">DesertX Discovery</h3>
                        <div class="flex justify-between items-end mt-4">
                            <div>
                                <div class="font-mono-data text-mono-data text-on-surface-variant">937 CC</div>
                                <div class="font-mono-data text-body-lg font-bold mt-1 text-white">689.000.000đ</div>
                            </div>
                            <div class="flex flex-col gap-2">
                                <a href="${pageContext.request.contextPath}/product-detail.jsp" class="bg-primary-container text-white px-6 py-3 font-label-md text-[10px] uppercase tracking-widest text-center hover:bg-white hover:text-black transition-all">Chi tiết</a>
                                <button data-bike-name="DesertX Discovery" class="btn-add-to-cart bg-surface-container-highest text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-primary-container transition-all">Thêm giỏ</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="group relative bg-surface-container-low border border-surface-variant overflow-hidden hover:border-primary-container transition-all duration-300">
                <div class="aspect-[4/5] relative overflow-hidden">
                    <img class="w-full h-full object-cover grayscale-[0.2] group-hover:scale-110 group-hover:grayscale-0 transition-transform duration-700" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4"/>
                    <div class="absolute inset-0 bike-card-gradient"></div>
                    <div class="absolute bottom-6 left-6 right-6">
                        <div class="font-label-md text-label-md text-primary-container uppercase tracking-[0.2em] mb-1">Monster</div>
                        <h3 class="font-headline-sm text-[20px] uppercase leading-tight mb-2">Monster SP</h3>
                        <div class="flex justify-between items-end mt-4">
                            <div>
                                <div class="font-mono-data text-mono-data text-on-surface-variant">937 CC</div>
                                <div class="font-mono-data text-body-lg font-bold mt-1 text-white">455.000.000đ</div>
                            </div>
                            <div class="flex flex-col gap-2">
                                <a href="${pageContext.request.contextPath}/product-detail.jsp" class="bg-primary-container text-white px-6 py-3 font-label-md text-[10px] uppercase tracking-widest text-center hover:bg-white hover:text-black transition-all">Chi tiết</a>
                                <button data-bike-name="Monster SP" class="btn-add-to-cart bg-surface-container-highest text-white px-4 py-2 text-[10px] font-bold uppercase tracking-widest text-center hover:bg-primary-container transition-all">Thêm giỏ</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- <%-- </c:forEach> --%> -->
            <!-- KẾT THÚC VÒNG LẶP MẪU -->

        </div>

        <!-- Pagination Controls -->
        <div class="mt-16 flex justify-center">
            <nav class="flex gap-2">
                <button class="w-12 h-12 border border-surface-variant flex items-center justify-center text-on-surface-variant hover:bg-surface-variant transition-colors">
                    <span class="material-symbols-outlined">chevron_left</span>
                </button>
                <button class="w-12 h-12 bg-primary-container text-white font-mono-data font-bold flex items-center justify-center">1</button>
                <button class="w-12 h-12 border border-surface-variant flex items-center justify-center text-on-surface-variant hover:bg-surface-variant transition-colors font-mono-data">2</button>
                <button class="w-12 h-12 border border-surface-variant flex items-center justify-center text-on-surface-variant hover:bg-surface-variant transition-colors font-mono-data">3</button>
                <button class="w-12 h-12 border border-surface-variant flex items-center justify-center text-on-surface-variant hover:bg-surface-variant transition-colors">
                    <span class="material-symbols-outlined">chevron_right</span>
                </button>
            </nav>
        </div>
    </section>

</main>

<script>
    // Frontend dynamic coloring for selected brand checkboxes
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(cb => {
        cb.addEventListener('change', () => {
            const span = cb.nextElementSibling;
            if (cb.checked) {
                span.classList.add('text-primary-container', 'font-semibold');
            } else {
                span.classList.remove('text-primary-container', 'font-semibold');
            }
        });
    });
</script>

<%@ include file="/common/footer.jsp" %>
