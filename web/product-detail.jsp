<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="PANIGALE V4 R - CHI TIẾT XE" />
<%@ include file="/common/header.jsp" %>

<!-- Product Detail Container -->
<main class="py-5 container-fluid px-4 max-w-container-max mx-auto">
    
    <!-- Top Part: Image Gallery & Summary Info -->
    <section class="row g-5 align-items-start mb-5">
        
        <!-- Left: Image Gallery (col-lg-7) -->
        <div class="col-12 col-lg-7">
            <!-- Large main preview image -->
            <div class="card card-ducati overflow-hidden position-relative mb-3" style="aspect-ratio: 4/3;">
                <div class="carbon-overlay"></div>
                <img id="main-product-img" alt="Panigale V4 R Main Preview" class="w-100 h-100 object-fit-cover" style="object-fit: cover;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
            </div>
            
            <!-- Thumbnails grid -->
            <div class="row g-2">
                <div class="col-3">
                    <button onclick="switchProductImg(this, 'https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67')" class="btn p-0 border border-danger w-100 ratio ratio-4x3 bg-dark overflow-hidden">
                        <img alt="Thumbnail 1" class="w-100 h-100 object-fit-cover" style="object-fit: cover;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
                    </button>
                </div>
                <div class="col-3">
                    <button onclick="switchProductImg(this, 'https://lh3.googleusercontent.com/aida-public/AB6AXuBZkm-h5rjS1cvYj6w5PtF1GzaqXm_91KXFLeIzrFx3doaVqQ2_oZA5N5eMvHhg7erOKeOfxLrOeBAbdcEHmUJJfS6brj5B3fYoY7kpEuWSCUTEcOiRHRqL_ucL2v3mwdX9BdplhsQy5RPzfllQ9S5ZJLC9c2B5yuD8jVV8_Ukc_oPmQNTkzaPbSqgYLQr_I5r64OynpfJEMmj3gnINf-sctFoEbe6Z6ONThxsWo3KA3Irdmo49osFLhM3NCxBw6J3olzU-rk_NiADH')" class="btn p-0 border border-secondary opacity-50 w-100 ratio ratio-4x3 bg-dark overflow-hidden">
                        <img alt="Thumbnail 2" class="w-100 h-100 object-fit-cover" style="object-fit: cover;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBZkm-h5rjS1cvYj6w5PtF1GzaqXm_91KXFLeIzrFx3doaVqQ2_oZA5N5eMvHhg7erOKeOfxLrOeBAbdcEHmUJJfS6brj5B3fYoY7kpEuWSCUTEcOiRHRqL_ucL2v3mwdX9BdplhsQy5RPzfllQ9S5ZJLC9c2B5yuD8jVV8_Ukc_oPmQNTkzaPbSqgYLQr_I5r64OynpfJEMmj3gnINf-sctFoEbe6Z6ONThxsWo3KA3Irdmo49osFLhM3NCxBw6J3olzU-rk_NiADH"/>
                    </button>
                </div>
                <div class="col-3">
                    <button onclick="switchProductImg(this, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCpC3CgqnhV-owW8GHdx9CgcZTmBy7rTb-_fToeUaImczQSRV3t5KQzuF1FGJyFjCfDct6gWJLRwNcYzMvE43TkDjQqhWfJlw-iM6fw0uVMqU0zcDCcIVFTw0_1Hkbajox2D8X6cqfH6KYJ2svwLXVgGfjqHHFquaBdupJk112AsQAKlpeIRVvdWSlQUZUQ5vKYUmPlyvB2U2hPkd1ywhyA7xc0wsu-8mRf93aog2qr7i_dwSGTIBWaQu5dOK7xFyP14ru0MYz1ZXfN')" class="btn p-0 border border-secondary opacity-50 w-100 ratio ratio-4x3 bg-dark overflow-hidden">
                        <img alt="Thumbnail 3" class="w-100 h-100 object-fit-cover" style="object-fit: cover;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCpC3CgqnhV-owW8GHdx9CgcZTmBy7rTb-_fToeUaImczQSRV3t5KQzuF1FGJyFjCfDct6gWJLRwNcYzMvE43TkDjQqhWfJlw-iM6fw0uVMqU0zcDCcIVFTw0_1Hkbajox2D8X6cqfH6KYJ2svwLXVgGfjqHHFquaBdupJk112AsQAKlpeIRVvdWSlQUZUQ5vKYUmPlyvB2U2hPkd1ywhyA7xc0wsu-8mRf93aog2qr7i_dwSGTIBWaQu5dOK7xFyP14ru0MYz1ZXfN"/>
                    </button>
                </div>
                <div class="col-3">
                    <button onclick="switchProductImg(this, 'https://lh3.googleusercontent.com/aida-public/AB6AXuBhBO_z4JJB-FU4Gb21XeQBuIMCqX5vLqDTRhNFVkCH3oiIG0ngT19JJ_wnoJF4iNKIw0VR5hrNAwEBe2Wwo4X2c8W2eymw2YCjDYU1kkOOKpHVlIiG6L-wZKPPISofg9eS4we4AcYGJi826INEoU-ejQkscKGRxid-ry7s1V257ECfJnyf74i33PfbFxnTGMfmUiZYhO2SNXBBwspJjzXiJcycreHnKNMqZ65LWL2UZSanvKWAf4sCT6RTGWsxf7m_GHHCJUKnwAb1')" class="btn p-0 border border-secondary opacity-50 w-100 ratio ratio-4x3 bg-dark overflow-hidden">
                        <img alt="Thumbnail 4" class="w-100 h-100 object-fit-cover" style="object-fit: cover;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBhBO_z4JJB-FU4Gb21XeQBuIMCqX5vLqDTRhNFVkCH3oiIG0ngT19JJ_wnoJF4iNKIw0VR5hrNAwEBe2Wwo4X2c8W2eymw2YCjDYU1kkOOKpHVlIiG6L-wZKPPISofg9eS4we4AcYGJi826INEoU-ejQkscKGRxid-ry7s1V257ECfJnyf74i33PfbFxnTGMfmUiZYhO2SNXBBwspJjzXiJcycreHnKNMqZ65LWL2UZSanvKWAf4sCT6RTGWsxf7m_GHHCJUKnwAb1"/>
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Right: Summary & Action Form (col-lg-5) -->
        <div class="col-12 col-lg-5">
            <div class="card card-ducati p-4 racing-stripe">
                <span class="font-mono-data text-danger text-uppercase small tracking-wider mb-2 d-block">Dòng xe: Superbike</span>
                <h1 class="font-heading fs-3 text-uppercase fw-bold text-white mb-2">PANIGALE V4 R</h1>
                
                <!-- Stock status -->
                <div class="d-flex align-items-center gap-2 mb-3">
                    <span class="badge rounded-pill bg-success-subtle text-success border border-success-subtle text-uppercase small">CÒN HÀNG TẠI SHOWROOM</span>
                </div>
                
                <!-- Pricing -->
                <div class="font-mono-data fs-4 fw-black text-danger mb-2">1.250.000.000đ</div>
                <p class="text-muted small mb-4">* Giá đã bao gồm thuế VAT, chưa bao gồm lệ phí trước bạ và đăng ký biển số.</p>
                
                <form action="${pageContext.request.contextPath}/cart.jsp" method="post" class="space-y-4 pt-4 border-top border-secondary">
                    
                    <!-- Hidden inputs for product details to Servlet -->
                    <input type="hidden" name="productId" value="1"/>
                    <input type="hidden" name="productName" value="Panigale V4 R"/>
                    <input type="hidden" name="productPrice" value="1250000000"/>
                    
                    <!-- Color swatches selection -->
                    <div class="mb-4 color-swatch-container">
                        <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">
                            Chọn màu sắc: <span class="selected-color-display text-white font-mono-data">Ducati Red</span>
                        </label>
                        <div class="d-flex gap-3">
                            <input type="hidden" name="selectedColor" id="selectedColorInput" value="Ducati Red"/>
                            
                            <button type="button" data-color-name="Ducati Red" onclick="setColorValue('Ducati Red')" class="color-swatch btn rounded-circle p-0 border border-3 border-danger" style="width: 38px; height: 38px; background-color: #ce131f;"></button>
                            <button type="button" data-color-name="Winter Test" onclick="setColorValue('Winter Test')" class="color-swatch btn rounded-circle p-0 border border-secondary opacity-50" style="width: 38px; height: 38px; background-color: #121414;"></button>
                            <button type="button" data-color-name="Star White" onclick="setColorValue('Star White')" class="color-swatch btn rounded-circle p-0 border border-transparent opacity-50" style="width: 38px; height: 38px; background-color: #ffffff;"></button>
                        </div>
                    </div>
                    
                    <!-- Quantity selection -->
                    <div class="mb-4">
                        <label class="font-heading text-muted text-uppercase tracking-wider small d-block mb-2">Số lượng đặt lịch</label>
                        <div class="d-inline-flex bg-black border border-secondary align-items-center" style="height: 44px; padding: 2px;">
                            <button type="button" class="qty-dec btn text-white px-3 py-0 h-100 border-0">-</button>
                            <input name="quantity" class="qty-input bg-transparent border-0 text-center font-mono-data text-white focus-ring-none" value="1" readonly style="width: 44px; outline: none;" type="text"/>
                            <button type="button" class="qty-inc btn text-white px-3 py-0 h-100 border-0">+</button>
                        </div>
                    </div>
                    
                    <!-- Purchase CTA Buttons -->
                    <div class="d-flex flex-column gap-3 pt-2">
                        <button type="submit" name="action" value="buyNow" class="btn btn-ducati w-100 py-3 d-flex align-items-center justify-content-center gap-2">
                            <span>ĐẶT MUA NGAY</span>
                            <span class="material-symbols-outlined fs-5">bolt</span>
                        </button>
                        <button type="button" data-bike-name="Panigale V4 R" class="btn btn-outline-ducati btn-add-to-cart w-100 py-3 d-flex align-items-center justify-content-center gap-2">
                            <span>THÊM VÀO GIỎ HÀNG</span>
                            <span class="material-symbols-outlined fs-5">shopping_cart</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Bottom Part: Tabs Section (Specs vs Description) -->
    <section class="py-5 border-top border-secondary">
        
        <!-- Tab buttons -->
        <ul class="nav nav-tabs border-secondary mb-4 gap-4" id="detailTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active font-heading text-uppercase tracking-wider bg-transparent border-0 border-bottom border-3 border-danger text-white pb-3" id="specs-tab" data-bs-toggle="tab" data-bs-target="#specs-content" type="button" role="tab" aria-controls="specs-content" aria-selected="true">Thông số kỹ thuật</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link font-heading text-uppercase tracking-wider bg-transparent border-0 border-bottom border-3 border-transparent text-secondary pb-3" id="desc-tab" data-bs-toggle="tab" data-bs-target="#desc-content" type="button" role="tab" aria-controls="desc-content" aria-selected="false">Giới thiệu chi tiết</button>
            </li>
        </ul>
        
        <!-- Tab Content -->
        <div class="tab-content pt-2" id="detailTabContent">
            <!-- Tab Content: Specs -->
            <div class="tab-pane fade show active" id="specs-content" role="tabpanel" aria-labelledby="specs-tab">
                <div class="table-responsive border border-secondary bg-black bg-opacity-50">
                    <table class="table table-hover font-mono-data text-white mb-0 align-middle">
                        <thead class="table-dark font-heading text-uppercase small" style="background-color: var(--surface-container);">
                            <tr>
                                <th class="px-4 py-3" style="width: 30%">Hạng mục thông số</th>
                                <th class="px-4 py-3">Chi tiết kỹ thuật</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-secondary">
                            <tr>
                                <td class="px-4 py-3 fw-bold text-secondary text-uppercase small">Động cơ</td>
                                <td class="px-4 py-3">Desmosedici Stradale 90° V4, 1.103 cc, làm mát bằng dung dịch</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-3 fw-bold text-secondary text-uppercase small">Công suất tối đa</td>
                                <td class="px-4 py-3 text-danger fw-semibold">215.5 mã lực @ 13.000 vòng/phút</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-3 fw-bold text-secondary text-uppercase small">Mô-men xoắn tối đa</td>
                                <td class="px-4 py-3">123.6 Nm @ 9.500 vòng/phút</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-3 fw-bold text-secondary text-uppercase small">Dung tích xi lanh</td>
                                <td class="px-4 py-3">998 cc (bản R) / 1.103 cc (bản Tiêu chuẩn)</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-3 fw-bold text-secondary text-uppercase small">Hộp số</td>
                                <td class="px-4 py-3">6 cấp với bộ hỗ trợ sang số nhanh Ducati Quick Shift (DQS) Up/Down EVO 2</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-3 fw-bold text-secondary text-uppercase small">Trọng lượng khô</td>
                                <td class="px-4 py-3">172 kg (Siêu nhẹ nhờ khung phụ magiê)</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-3 fw-bold text-secondary text-uppercase small">Hệ thống phanh</td>
                                <td class="px-4 py-3">Brembo Stylema® đĩa kép 330 mm phía trước, tích hợp Cornering ABS EVO</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-3 fw-bold text-secondary text-uppercase small">Dung tích bình xăng</td>
                                <td class="px-4 py-3">17 Lít</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- Tab Content: Description -->
            <div class="tab-pane fade" id="desc-content" role="tabpanel" aria-labelledby="desc-tab">
                <div class="row g-5 align-items-center">
                    <div class="col-12 col-md-6">
                        <h3 class="font-heading text-danger text-uppercase mb-3 fs-5">Động Cơ Desmosedici Stradale V4</h3>
                        <p class="text-secondary leading-relaxed mb-3">
                            Trái tim của chiếc Panigale V4 R là khối động cơ Desmosedici Stradale dung tích 998cc, được phát triển trực tiếp từ mẫu xe đua MotoGP huyền thoại của Ducati. 
                            Trang bị trục khuỷu quay ngược kết hợp cơ cấu phân phối khí Desmodromic độc quyền mang lại lực kéo phản hồi tức thì, âm thanh giòn giã và phấn khích chưa từng có.
                        </p>
                        <p class="text-secondary leading-relaxed">
                            Toàn bộ cánh gió khí động học bằng sợi carbon thế hệ mới cung cấp lực ép lên tới 37 kg tại tốc độ 300 km/h, giữ cho phần đầu xe luôn vững vàng và tối ưu hóa khả năng tăng tốc thoát cua.
                        </p>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="card card-ducati p-3">
                            <img alt="Ducati Engine specifications photo" class="w-100 h-auto filter-grayscale opacity-75" style="filter: grayscale(100%); opacity: 0.75;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAPX6HWD2JWbw7gF0oOOa_TxeEZ8kDR7XBA59JIg9tw9scNmaLOkSk3Zh3uG836Rn9PdYf0r-2N-bo_RVgWUTOMk6avxku3Ra4FLU1bi9y98viVVGvbvbSk7wnZCLDv2dytLqTwpTJtt2X7XwlSFTIIQ3u6cA81X_4UgxuwIPEm584CsUR73Xh7ul7ufYMOWfkODeKCSVoZH7VaS-z2xG4X501t19y4rd45HcXz0VMRppT65tranBamLBs0xKOzRgtZrplfYVRpOvIy"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </section>
</main>

<script>
    function setColorValue(val) {
        document.getElementById('selectedColorInput').value = val;
    }

    function switchProductImg(btn, src) {
        btn.parentElement.parentElement.querySelectorAll('button').forEach(b => {
            b.classList.remove('border-danger');
            b.classList.add('border-secondary', 'opacity-50');
        });
        
        btn.classList.add('border-danger');
        btn.classList.remove('border-secondary', 'opacity-50');
        document.getElementById('main-product-img').src = src;
    }
    
    document.addEventListener('DOMContentLoaded', () => {
        // Tab indicator active style toggle
        const tabs = document.querySelectorAll('#detailTab button');
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
