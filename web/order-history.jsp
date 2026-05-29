<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jsp" %>

<main class="pt-28 pb-24 px-margin-mobile md:px-margin-desktop max-w-container-max mx-auto">
    
    <!-- Title Header -->
    <header class="mb-10 text-left flex justify-between items-end flex-wrap gap-4">
        <div>
            <h1 class="font-headline-lg text-headline-sm md:text-headline-lg uppercase tracking-tighter text-white">Lịch Sử Lịch Hẹn Đặt Xe</h1>
            <div class="w-16 h-1 bg-primary-container mt-2"></div>
        </div>
        <a href="${pageContext.request.contextPath}/products.jsp" class="px-6 py-3 border border-surface-variant hover:bg-surface-container hover:text-white transition-colors uppercase font-label-md text-label-md">
            Đăng ký lịch hẹn mới
        </a>
    </header>

    <!-- Search / Filter bar for history list -->
    <section class="bg-surface-container-low border border-surface-variant p-6 mb-8 flex flex-col md:flex-row gap-gutter items-center">
        <div class="relative flex-1 w-full">
            <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-on-surface-variant">search</span>
            <input class="w-full bg-black border border-surface-variant pl-12 pr-4 py-3 outline-none text-on-surface font-mono-data text-mono-data uppercase focus:border-primary-container focus:ring-0" placeholder="TÌM MÃ ĐƠN HÀNG, TÊN XE HOẶC ĐẠI LÝ..." type="text"/>
        </div>
        <div class="flex gap-4 w-full md:w-auto">
            <select class="bg-black border border-surface-variant text-on-surface font-mono-data text-mono-data px-4 py-3 outline-none uppercase min-w-[160px]">
                <option>Tất cả trạng thái</option>
                <option>Chờ duyệt</option>
                <option>Đã xác nhận</option>
                <option>Đã giao xe</option>
                <option>Đã hủy</option>
            </select>
        </div>
    </section>

    <!-- History Orders Table -->
    <div class="bg-surface-container-lowest border border-surface-variant overflow-hidden">
        <table class="w-full text-left border-collapse font-mono-data text-mono-data">
            <thead>
                <tr class="bg-surface-container font-label-md text-label-md uppercase text-on-surface-variant border-b border-surface-variant">
                    <th class="px-6 py-4 font-semibold">Mã lịch hẹn</th>
                    <th class="px-6 py-4 font-semibold">Mẫu xe đăng ký</th>
                    <th class="px-6 py-4 font-semibold">Operational Hub (Đại lý)</th>
                    <th class="px-6 py-4 font-semibold">Thời gian hẹn</th>
                    <th class="px-6 py-4 font-semibold">Hình thức</th>
                    <th class="px-6 py-4 font-semibold">Trạng thái</th>
                    <th class="px-6 py-4 font-semibold text-right">Chi tiết</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-surface-variant/30">
                
                <!-- Row 1 -->
                <tr class="hover:bg-surface-container-low transition-colors group">
                    <td class="px-6 py-6 font-bold text-white group-hover:text-primary-container transition-colors">#DUC-998811</td>
                    <td class="px-6 py-6">
                        <div class="flex flex-col">
                            <span class="font-headline-sm text-[16px] text-white tracking-tight">Panigale V4 R</span>
                            <span class="text-[10px] text-on-surface-variant uppercase">Màu: DUCATI RED | SL: 1</span>
                        </div>
                    </td>
                    <td class="px-6 py-6">Showroom Bà Triệu - Hà Nội</td>
                    <td class="px-6 py-6">
                        <div class="flex flex-col">
                            <span>05/06/2026</span>
                            <span class="text-[10px] text-on-surface-variant">09:00 sáng</span>
                        </div>
                    </td>
                    <td class="px-6 py-6 uppercase">Trả góp thẻ</td>
                    <td class="px-6 py-6">
                        <div class="flex items-center gap-2">
                            <span class="w-2 h-2 rounded-full bg-primary-container shadow-[0_0_8px_rgba(206,19,31,0.6)]"></span>
                            <span class="text-primary-container uppercase text-[12px] font-bold">Chờ duyệt</span>
                        </div>
                    </td>
                    <td class="px-6 py-6 text-right">
                        <button class="px-4 py-2 bg-surface-container border border-surface-variant text-[11px] font-bold uppercase tracking-wider hover:bg-primary-container hover:text-white transition-colors">Xem phiếu</button>
                    </td>
                </tr>

                <!-- Row 2 -->
                <tr class="hover:bg-surface-container-low transition-colors group">
                    <td class="px-6 py-6 font-bold text-white group-hover:text-primary-container transition-colors">#DUC-442200</td>
                    <td class="px-6 py-6">
                        <div class="flex flex-col">
                            <span class="font-headline-sm text-[16px] text-white tracking-tight">Monster SP</span>
                            <span class="text-[10px] text-on-surface-variant uppercase">Màu: STAR WHITE | SL: 1</span>
                        </div>
                    </td>
                    <td class="px-6 py-6">Showroom Phú Mỹ Hưng - Q7</td>
                    <td class="px-6 py-6">
                        <div class="flex flex-col">
                            <span>28/05/2026</span>
                            <span class="text-[10px] text-on-surface-variant">14:00 chiều</span>
                        </div>
                    </td>
                    <td class="px-6 py-6 uppercase">Chuyển khoản</td>
                    <td class="px-6 py-6">
                        <div class="flex items-center gap-2">
                            <span class="w-2 h-2 rounded-full bg-green-500 shadow-[0_0_8px_rgba(34,197,94,0.6)]"></span>
                            <span class="text-green-500 uppercase text-[12px] font-bold">Đã xác nhận</span>
                        </div>
                    </td>
                    <td class="px-6 py-6 text-right">
                        <button class="px-4 py-2 bg-surface-container border border-surface-variant text-[11px] font-bold uppercase tracking-wider hover:bg-primary-container hover:text-white transition-colors">Xem phiếu</button>
                    </td>
                </tr>

                <!-- Row 3 -->
                <tr class="hover:bg-surface-container-low transition-colors group opacity-60">
                    <td class="px-6 py-6 font-bold text-white group-hover:text-primary-container transition-colors">#DUC-110022</td>
                    <td class="px-6 py-6">
                        <div class="flex flex-col">
                            <span class="font-headline-sm text-[16px] text-white tracking-tight">Streetfighter V4 SP2</span>
                            <span class="text-[10px] text-on-surface-variant uppercase">Màu: WINTER TEST | SL: 1</span>
                        </div>
                    </td>
                    <td class="px-6 py-6">Showroom Bà Triệu - Hà Nội</td>
                    <td class="px-6 py-6">
                        <div class="flex flex-col">
                            <span>15/04/2026</span>
                            <span class="text-[10px] text-on-surface-variant">10:00 sáng</span>
                        </div>
                    </td>
                    <td class="px-6 py-6 uppercase">Tiền mặt</td>
                    <td class="px-6 py-6">
                        <div class="flex items-center gap-2">
                            <span class="w-2 h-2 rounded-full bg-[#e2e2e2]/40"></span>
                            <span class="text-on-surface-variant uppercase text-[12px] font-bold">Đã hủy</span>
                        </div>
                    </td>
                    <td class="px-6 py-6 text-right">
                        <button class="px-4 py-2 bg-surface-container border border-surface-variant text-[11px] font-bold uppercase tracking-wider hover:bg-primary-container hover:text-white transition-colors">Xem phiếu</button>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <!-- Alert / System info note -->
    <div class="mt-8 bg-surface-container-low border-l-4 border-primary-container p-6 relative overflow-hidden">
        <div class="carbon-overlay"></div>
        <p class="font-body-md text-on-surface leading-relaxed">
            <strong>* LƯU Ý BẢO MẬT:</strong> Khi đến nhận xe hoặc lái thử trực tiếp tại showroom, quý khách vui lòng mang theo **Căn cước công dân (hoặc Hộ chiếu)** và **Bằng lái xe phân khối lớn (A2)** hợp lệ để làm thủ tục xác minh vận hành.
        </p>
    </div>

</main>

<%@ include file="/common/footer.jsp" %>
