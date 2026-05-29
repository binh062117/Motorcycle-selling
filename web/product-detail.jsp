<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jsp" %>

<!-- Product Detail Container -->
<main class="pt-24 max-w-container-max mx-auto px-margin-mobile md:px-margin-desktop">
    
    <!-- Top Part: Image Gallery & Summary Info -->
    <section class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start mb-16">
        
        <!-- Left: Image Gallery (col-span-7) -->
        <div class="lg:col-span-7 space-y-6">
            <!-- Large main preview image -->
            <div class="aspect-[4/3] bg-surface-container overflow-hidden border border-surface-variant relative">
                <div class="carbon-overlay"></div>
                <img id="main-product-img" alt="Panigale V4 R Main Preview" class="w-full h-full object-cover transition-all duration-500" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
            </div>
            
            <!-- Thumbnails grid -->
            <div class="grid grid-cols-4 gap-4">
                <button onclick="switchProductImg(this, 'https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67')" class="aspect-[4/3] border-2 border-primary-container bg-surface-container overflow-hidden opacity-100 transition-all duration-300">
                    <img alt="Thumbnail 1" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67"/>
                </button>
                <button onclick="switchProductImg(this, 'https://lh3.googleusercontent.com/aida-public/AB6AXuBZkm-h5rjS1cvYj6w5PtF1GzaqXm_91KXFLeIzrFx3doaVqQ2_oZA5N5eMvHhg7erOKeOfxLrOeBAbdcEHmUJJfS6brj5B3fYoY7kpEuWSCUTEcOiRHRqL_ucL2v3mwdX9BdplhsQy5RPzfllQ9S5ZJLC9c2B5yuD8jVV8_Ukc_oPmQNTkzaPbSqgYLQr_I5r64OynpfJEMmj3gnINf-sctFoEbe6Z6ONThxsWo3KA3Irdmo49osFLhM3NCxBw6J3olzU-rk_NiADH')" class="aspect-[4/3] border border-surface-variant bg-surface-container overflow-hidden opacity-60 hover:opacity-100 transition-all duration-300">
                    <img alt="Thumbnail 2" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBZkm-h5rjS1cvYj6w5PtF1GzaqXm_91KXFLeIzrFx3doaVqQ2_oZA5N5eMvHhg7erOKeOfxLrOeBAbdcEHmUJJfS6brj5B3fYoY7kpEuWSCUTEcOiRHRqL_ucL2v3mwdX9BdplhsQy5RPzfllQ9S5ZJLC9c2B5yuD8jVV8_Ukc_oPmQNTkzaPbSqgYLQr_I5r64OynpfJEMmj3gnINf-sctFoEbe6Z6ONThxsWo3KA3Irdmo49osFLhM3NCxBw6J3olzU-rk_NiADH"/>
                </button>
                <button onclick="switchProductImg(this, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCpC3CgqnhV-owW8GHdx9CgcZTmBy7rTb-_fToeUaImczQSRV3t5KQzuF1FGJyFjCfDct6gWJLRwNcYzMvE43TkDjQqhWfJlw-iM6fw0uVMqU0zcDCcIVFTw0_1Hkbajox2D8X6cqfH6KYJ2svwLXVgGfjqHHFquaBdupJk112AsQAKlpeIRVvdWSlQUZUQ5vKYUmPlyvB2U2hPkd1ywhyA7xc0wsu-8mRf93aog2qr7i_dwSGTIBWaQu5dOK7xFyP14ru0MYz1ZXfN')" class="aspect-[4/3] border border-surface-variant bg-surface-container overflow-hidden opacity-60 hover:opacity-100 transition-all duration-300">
                    <img alt="Thumbnail 3" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCpC3CgqnhV-owW8GHdx9CgcZTmBy7rTb-_fToeUaImczQSRV3t5KQzuF1FGJyFjCfDct6gWJLRwNcYzMvE43TkDjQqhWfJlw-iM6fw0uVMqU0zcDCcIVFTw0_1Hkbajox2D8X6cqfH6KYJ2svwLXVgGfjqHHFquaBdupJk112AsQAKlpeIRVvdWSlQUZUQ5vKYUmPlyvB2U2hPkd1ywhyA7xc0wsu-8mRf93aog2qr7i_dwSGTIBWaQu5dOK7xFyP14ru0MYz1ZXfN"/>
                </button>
                <button onclick="switchProductImg(this, 'https://lh3.googleusercontent.com/aida-public/AB6AXuBhBO_z4JJB-FU4Gb21XeQBuIMCqX5vLqDTRhNFVkCH3oiIG0ngT19JJ_wnoJF4iNKIw0VR5hrNAwEBe2Wwo4X2c8W2eymw2YCjDYU1kkOOKpHVlIiG6L-wZKPPISofg9eS4we4AcYGJi826INEoU-ejQkscKGRxid-ry7s1V257ECfJnyf74i33PfbFxnTGMfmUiZYhO2SNXBBwspJjzXiJcycreHnKNMqZ65LWL2UZSanvKWAf4sCT6RTGWsxf7m_GHHCJUKnwAb1')" class="aspect-[4/3] border border-surface-variant bg-surface-container overflow-hidden opacity-60 hover:opacity-100 transition-all duration-300">
                    <img alt="Thumbnail 4" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBhBO_z4JJB-FU4Gb21XeQBuIMCqX5vLqDTRhNFVkCH3oiIG0ngT19JJ_wnoJF4iNKIw0VR5hrNAwEBe2Wwo4X2c8W2eymw2YCjDYU1kkOOKpHVlIiG6L-wZKPPISofg9eS4we4AcYGJi826INEoU-ejQkscKGRxid-ry7s1V257ECfJnyf74i33PfbFxnTGMfmUiZYhO2SNXBBwspJjzXiJcycreHnKNMqZ65LWL2UZSanvKWAf4sCT6RTGWsxf7m_GHHCJUKnwAb1"/>
                </button>
            </div>
        </div>
        
        <!-- Right: Summary & Action Form (col-span-5) -->
        <div class="lg:col-span-5 space-y-8 bg-surface-container-lowest p-8 border border-surface-variant relative overflow-hidden racing-stripe">
            <div>
                <span class="font-mono-data text-mono-data text-primary-container tracking-[0.2em] uppercase mb-2 block">Dòng xe: Superbike</span>
                <h1 class="font-headline-md text-headline-sm md:text-headline-md font-bold uppercase tracking-tight text-white mb-3">PANIGALE V4 R</h1>
                
                <!-- Stock status -->
                <div class="flex items-center gap-2 mb-4">
                    <span class="w-2.5 h-2.5 rounded-full bg-green-500"></span>
                    <span class="font-mono-data text-[12px] text-green-500 uppercase tracking-widest">CÒN HÀNG TẠI SHOWROOM</span>
                </div>
                
                <!-- Pricing -->
                <div class="font-mono-data text-headline-sm font-extrabold text-primary-container">1.250.000.000đ</div>
                <div class="text-[12px] text-on-surface-variant font-body-sm mt-1">* Giá đã bao gồm thuế VAT, chưa bao gồm lệ phí trước bạ và đăng ký biển số.</div>
            </div>
            
            <form action="${pageContext.request.contextPath}/cart.jsp" method="post" class="space-y-6 pt-6 border-t border-surface-variant">
                
                <!-- Hidden inputs for product details to Servlet -->
                <input type="hidden" name="productId" value="1"/>
                <input type="hidden" name="productName" value="Panigale V4 R"/>
                <input type="hidden" name="productPrice" value="1250000000"/>
                
                <!-- Color swatches selection -->
                <div class="space-y-3 color-swatch-container">
                    <label class="font-label-md text-label-md text-on-surface-variant uppercase tracking-widest block">
                        Chọn màu sắc: <span class="selected-color-display text-white font-mono-data">Ducati Red</span>
                    </label>
                    <div class="flex gap-4">
                        <input type="hidden" name="selectedColor" id="selectedColorInput" value="Ducati Red"/>
                        
                        <button type="button" data-color-name="Ducati Red" onclick="setColorValue('Ducati Red')" class="color-swatch w-10 h-10 rounded-full bg-[#ce131f] border border-transparent ring-2 ring-primary-container transition-all"></button>
                        <button type="button" data-color-name="Winter Test" onclick="setColorValue('Winter Test')" class="color-swatch w-10 h-10 rounded-full bg-[#121414] border border-surface-variant opacity-50 hover:opacity-100 transition-all"></button>
                        <button type="button" data-color-name="Star White" onclick="setColorValue('Star White')" class="color-swatch w-10 h-10 rounded-full bg-[#ffffff] border border-transparent opacity-50 hover:opacity-100 transition-all"></button>
                    </div>
                </div>
                
                <!-- Quantity selection -->
                <div class="space-y-3">
                    <label class="font-label-md text-label-md text-on-surface-variant uppercase tracking-widest block">Số lượng đặt lịch</label>
                    <div class="flex items-center bg-black border border-surface-variant w-32 h-12">
                        <button type="button" class="qty-dec w-10 h-full flex items-center justify-center text-on-surface hover:text-primary-container transition-colors">-</button>
                        <input name="quantity" class="qty-input w-12 h-full bg-transparent border-none text-center font-mono-data text-on-surface focus:ring-0 focus:outline-none" value="1" readonly type="text"/>
                        <button type="button" class="qty-inc w-10 h-full flex items-center justify-center text-on-surface hover:text-primary-container transition-colors">+</button>
                    </div>
                </div>
                
                <!-- Purchase CTA Buttons -->
                <div class="flex flex-col gap-4 pt-4">
                    <button type="submit" name="action" value="buyNow" class="w-full bg-primary-container text-white py-4 font-headline-sm text-label-md uppercase tracking-widest hover:brightness-110 active:scale-[0.99] transition-all flex items-center justify-center gap-2">
                        <span>ĐẶT MUA NGAY</span>
                        <span class="material-symbols-outlined text-[20px]">bolt</span>
                    </button>
                    <button type="button" data-bike-name="Panigale V4 R" class="btn-add-to-cart w-full border border-on-surface-variant text-on-surface py-4 font-label-md text-label-md uppercase tracking-widest hover:bg-surface-container transition-colors flex items-center justify-center gap-2">
                        <span>THÊM VÀO GIỎ HÀNG</span>
                        <span class="material-symbols-outlined text-[18px]">shopping_cart</span>
                    </button>
                </div>
            </form>
        </div>
    </section>

    <!-- Bottom Part: Tabs Section (Specs vs Description) -->
    <section class="py-16 border-t border-surface-variant">
        
        <!-- Tab buttons -->
        <div class="flex gap-8 mb-10 border-b border-surface-variant">
            <button onclick="switchProductTab('specs')" class="tab-btn pb-4 font-label-md text-label-md uppercase tracking-wider transition-all duration-300 text-primary-container border-b-2 border-primary-container" id="tab-btn-specs">
                Thông số kỹ thuật
            </button>
            <button onclick="switchProductTab('desc')" class="tab-btn pb-4 font-label-md text-label-md uppercase tracking-wider transition-all duration-300 text-on-surface-variant hover:text-on-surface" id="tab-btn-desc">
                Giới thiệu chi tiết
            </button>
        </div>
        
        <!-- Tab Content: Specs -->
        <div class="tab-content" id="tab-content-specs">
            <div class="bg-surface-container-lowest border border-surface-variant overflow-hidden">
                <table class="w-full text-left font-mono-data text-mono-data">
                    <thead class="bg-surface-container font-label-md text-label-md uppercase text-on-surface-variant border-b border-surface-variant">
                        <tr>
                            <th class="px-8 py-4 w-1/3">Hạng mục thông số</th>
                            <th class="px-8 py-4">Chi tiết kỹ thuật</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-surface-variant/30">
                        <tr class="hover:bg-surface-container-low transition-colors">
                            <td class="px-8 py-4 font-bold uppercase text-on-surface-variant">Động cơ</td>
                            <td class="px-8 py-4">Desmosedici Stradale 90° V4, 1.103 cc, làm mát bằng dung dịch</td>
                        </tr>
                        <tr class="hover:bg-surface-container-low transition-colors">
                            <td class="px-8 py-4 font-bold uppercase text-on-surface-variant">Công suất tối đa</td>
                            <td class="px-8 py-4 text-primary-container font-semibold">215.5 mã lực @ 13.000 vòng/phút</td>
                        </tr>
                        <tr class="hover:bg-surface-container-low transition-colors">
                            <td class="px-8 py-4 font-bold uppercase text-on-surface-variant">Mô-men xoắn tối đa</td>
                            <td class="px-8 py-4">123.6 Nm @ 9.500 vòng/phút</td>
                        </tr>
                        <tr class="hover:bg-surface-container-low transition-colors">
                            <td class="px-8 py-4 font-bold uppercase text-on-surface-variant">Dung tích xi lanh</td>
                            <td class="px-8 py-4">998 cc (bản R) / 1.103 cc (bản Tiêu chuẩn)</td>
                        </tr>
                        <tr class="hover:bg-surface-container-low transition-colors">
                            <td class="px-8 py-4 font-bold uppercase text-on-surface-variant">Hộp số</td>
                            <td class="px-8 py-4">6 cấp với bộ hỗ trợ sang số nhanh Ducati Quick Shift (DQS) Up/Down EVO 2</td>
                        </tr>
                        <tr class="hover:bg-surface-container-low transition-colors">
                            <td class="px-8 py-4 font-bold uppercase text-on-surface-variant">Trọng lượng khô</td>
                            <td class="px-8 py-4">172 kg (Siêu nhẹ nhờ khung phụ magiê)</td>
                        </tr>
                        <tr class="hover:bg-surface-container-low transition-colors">
                            <td class="px-8 py-4 font-bold uppercase text-on-surface-variant">Hệ thống phanh</td>
                            <td class="px-8 py-4">Brembo Stylema® đĩa kép 330 mm phía trước, tích hợp Cornering ABS EVO</td>
                        </tr>
                        <tr class="hover:bg-surface-container-low transition-colors">
                            <td class="px-8 py-4 font-bold uppercase text-on-surface-variant">Dung tích bình xăng</td>
                            <td class="px-8 py-4">17 Lít</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Tab Content: Description -->
        <div class="tab-content hidden" id="tab-content-desc">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
                <div class="space-y-6">
                    <h3 class="font-headline-sm text-headline-sm uppercase text-primary-container">Động Cơ Desmosedici Stradale V4</h3>
                    <p class="font-body-md text-on-surface-variant leading-relaxed">
                        Trái tim của chiếc Panigale V4 R là khối động cơ Desmosedici Stradale dung tích 998cc, được phát triển trực tiếp từ mẫu xe đua MotoGP huyền thoại của Ducati. 
                        Trang bị trục khuỷu quay ngược kết hợp cơ cấu phân phối khí Desmodromic độc quyền mang lại lực kéo phản hồi tức thì, âm thanh giòn giã và phấn khích chưa từng có.
                    </p>
                    <p class="font-body-md text-on-surface-variant leading-relaxed">
                        Toàn bộ cánh gió khí động học bằng sợi carbon thế hệ mới cung cấp lực ép lên tới 37 kg tại tốc độ 300 km/h, giữ cho phần đầu xe luôn vững vàng và tối ưu hóa khả năng tăng tốc thoát cua.
                    </p>
                </div>
                <div class="border border-surface-variant p-4 bg-surface-container-low overflow-hidden">
                    <img alt="Ducati Engine specifications photo" class="w-full h-auto object-cover grayscale opacity-80 hover:grayscale-0 transition-all duration-500" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAPX6HWD2JWbw7gF0oOOa_TxeEZ8kDR7XBA59JIg9tw9scNmaLOkSk3Zh3uG836Rn9PdYf0r-2N-bo_RVgWUTOMk6avxku3Ra4FLU1bi9y98viVVGvbvbSk7wnZCLDv2dytLqTwpTJtt2X7XwlSFTIIQ3u6cA81X_4UgxuwIPEm584CsUR73Xh7ul7ufYMOWfkODeKCSVoZH7VaS-z2xG4X501t19y4rd45HcXz0VMRppT65tranBamLBs0xKOzRgtZrplfYVRpOvIy"/>
                </div>
            </div>
        </div>
        
    </section>
    
</main>

<script>
    // Toggle color value in input
    function setColorValue(val) {
        document.getElementById('selectedColorInput').value = val;
    }

    // Toggle photo thumbnails
    function switchProductImg(btn, src) {
        // Reset borders
        btn.parentElement.querySelectorAll('button').forEach(b => {
            b.classList.remove('border-primary-container', 'border-2', 'opacity-100');
            b.classList.add('border-surface-variant', 'opacity-60');
        });
        
        // Select active
        btn.classList.add('border-primary-container', 'border-2', 'opacity-100');
        btn.classList.remove('border-surface-variant', 'opacity-60');
        
        // Change image
        document.getElementById('main-product-img').src = src;
    }

    // Switch specifications vs description tabs
    function switchProductTab(tab) {
        const btnSpecs = document.getElementById('tab-btn-specs');
        const btnDesc = document.getElementById('tab-btn-desc');
        const contentSpecs = document.getElementById('tab-content-specs');
        const contentDesc = document.getElementById('tab-content-desc');

        if (tab === 'specs') {
            btnSpecs.classList.add('text-primary-container', 'border-b-2', 'border-primary-container');
            btnSpecs.classList.remove('text-on-surface-variant');
            btnDesc.classList.remove('text-primary-container', 'border-b-2', 'border-primary-container');
            btnDesc.classList.add('text-on-surface-variant');

            contentSpecs.classList.remove('hidden');
            contentDesc.classList.add('hidden');
        } else {
            btnDesc.classList.add('text-primary-container', 'border-b-2', 'border-primary-container');
            btnDesc.classList.remove('text-on-surface-variant');
            btnSpecs.classList.remove('text-primary-container', 'border-b-2', 'border-primary-container');
            btnSpecs.classList.add('text-on-surface-variant');

            contentDesc.classList.remove('hidden');
            contentSpecs.classList.add('hidden');
        }
    }
</script>

<%@ include file="/common/footer.jsp" %>
