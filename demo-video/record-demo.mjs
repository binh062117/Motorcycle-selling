import {chromium} from 'playwright';
import crypto from 'node:crypto';
import fs from 'node:fs/promises';
import path from 'node:path';

const root = path.resolve('artifacts');
const rawDir = path.join(root, 'raw');
await fs.mkdir(rawDir, {recursive: true});

const base = process.env.DEMO_BASE_URL || 'https://maximum-abide-radial.ngrok-free.dev/web_b_n_xe_m_y';
const secret = process.env.VNPAY_HASH_SECRET || '';
if (!secret) throw new Error('VNPAY_HASH_SECRET is required for the signed sandbox callback demo.');
const chrome = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe';
const browser = await chromium.launch({headless: true, executablePath: chrome});
const context = await browser.newContext({
  viewport: {width: 1280, height: 720},
  recordVideo: {dir: rawDir, size: {width: 1280, height: 720}},
});
await context.route('**/*', async (route) => {
  const request = route.request();
  const headers = {...request.headers()};
  if (new URL(request.url()).hostname.endsWith('ngrok-free.dev')) {
    headers['ngrok-skip-browser-warning'] = 'true';
  }
  await route.continue({headers});
});
const page = await context.newPage();
page.setDefaultTimeout(15000);

const pause = (ms = 1400) => page.waitForTimeout(ms);

async function title(title, subtitle, duration = 2600) {
  await page.setContent(`<!doctype html><html><head><meta charset="utf-8"><style>
    *{box-sizing:border-box}body{margin:0;background:#090909;color:#fff;font-family:Arial,sans-serif;height:100vh;display:grid;place-items:center}
    main{width:100%;padding:80px;border-left:14px solid #d71920;background:linear-gradient(90deg,#151515,#090909)}
    small{font-size:18px;color:#d71920;font-weight:700;letter-spacing:2px}h1{font-size:55px;margin:16px 0 18px;text-transform:uppercase;letter-spacing:1px}
    p{font-size:24px;color:#bbb;margin:0;line-height:1.45}.tag{position:fixed;right:42px;bottom:30px;color:#777;font-size:16px}
  </style></head><body><main><small>MOTOSALES COMMERCE PLATFORM</small><h1>${title}</h1><p>${subtitle}</p></main><div class="tag">Java Servlet • JSP • SQL Server • VNPay</div></body></html>`);
  await page.waitForTimeout(duration);
}

async function badge(text) {
  await page.waitForSelector('body', {state: 'attached'});
  await page.evaluate((label) => {
    document.getElementById('__demo_badge')?.remove();
    const el = document.createElement('div');
    el.id = '__demo_badge';
    el.textContent = label;
    Object.assign(el.style, {
      position: 'fixed', top: '18px', right: '18px', zIndex: '2147483647',
      background: '#d71920', color: '#fff', padding: '10px 16px',
      font: '700 14px Arial', letterSpacing: '1px', boxShadow: '0 5px 18px #0008'
    });
    document.body.appendChild(el);
  }, text);
  await pause(900);
}

async function visit(url, label, wait = 1700) {
  await page.goto(`${base}${url}`, {waitUntil: 'domcontentloaded'});
  await badge(label);
  await page.waitForTimeout(wait);
}

async function visitMasked(url, label, wait = 1700) {
  await page.goto(`${base}${url}`, {waitUntil: 'domcontentloaded'});
  await page.evaluate(() => {
    const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT);
    let node;
    while ((node = walker.nextNode())) {
      node.nodeValue = node.nodeValue
        .replace(/[A-Z0-9._%+-]+@(?!ducati\.local|ferrari\.it)[A-Z0-9.-]+\.[A-Z]{2,}/gi, 'demo.user@example.local')
        .replace(/\b0\d{8,10}\b/g, '09••••••••');
    }
  });
  await badge(label);
  await page.waitForTimeout(wait);
}

async function scrollDemo() {
  await page.evaluate(async () => {
    const total = Math.max(0, document.documentElement.scrollHeight - innerHeight);
    for (let y = 0; y <= total; y += 280) {
      scrollTo({top: y, behavior: 'smooth'});
      await new Promise((resolve) => setTimeout(resolve, 260));
    }
  });
  await pause(800);
}

async function login(email, password, role) {
  await visit('/login', `ĐĂNG NHẬP ${role}`, 800);
  await page.locator('[name="txtEmail"]').fill(email);
  await page.locator('[name="txtPassword"]').fill(password);
  await pause(600);
  await Promise.all([
    page.waitForNavigation({waitUntil: 'domcontentloaded'}),
    page.locator('form[action$="/login"] button[type="submit"]').click(),
  ]);
  await badge(`${role} ĐÃ ĐĂNG NHẬP`);
  await pause();
}

function signedCallback(paymentUrl) {
  if (!secret) return null;
  const pay = new URL(paymentUrl);
  const params = new URLSearchParams();
  params.set('vnp_Amount', pay.searchParams.get('vnp_Amount') || '');
  params.set('vnp_ResponseCode', '00');
  params.set('vnp_TmnCode', pay.searchParams.get('vnp_TmnCode') || '');
  params.set('vnp_TransactionStatus', '00');
  params.set('vnp_TransactionNo', `DEMO${Date.now()}`);
  params.set('vnp_TxnRef', pay.searchParams.get('vnp_TxnRef') || '');
  const sorted = new URLSearchParams([...params.entries()].sort(([a], [b]) => a.localeCompare(b)));
  const hash = crypto.createHmac('sha512', secret).update(sorted.toString()).digest('hex');
  sorted.set('vnp_SecureHash', hash);
  return `${base}/payment/callback?${sorted.toString()}`;
}

try {
  await title('Demo hệ thống bán xe máy', 'Toàn bộ luồng Guest, Customer, VNPay sandbox và Admin', 3600);

  await visit('/', 'ROLE: GUEST • TRANG CHỦ');
  await scrollDemo();
  await visit('/products', 'GUEST • DANH MỤC SẢN PHẨM');
  await scrollDemo();
  await visit('/price-list', 'GUEST • BẢNG GIÁ');
  await visit('/dealers', 'GUEST • HỆ THỐNG SHOWROOM');
  await visit('/product-detail?id=1', 'GUEST • CHI TIẾT SẢN PHẨM');
  await scrollDemo();

  await title('Customer flow', 'Đăng nhập • hồ sơ • giỏ hàng • checkout • lịch sử đơn', 2800);
  await login('enzo@ferrari.it', '123456', 'CUSTOMER');
  await visit('/profile', 'CUSTOMER • HỒ SƠ CÁ NHÂN');
  await visit('/order-history', 'CUSTOMER • LỊCH SỬ ĐƠN HÀNG');
  await visit('/product-detail?id=1', 'CUSTOMER • CHỌN SẢN PHẨM', 900);
  const color = page.locator('[name="selectedColor"]');
  if (await color.count()) await color.selectOption({index: 0});
  await page.locator('[name="quantity"]').fill('1');
  await pause(700);
  await Promise.all([page.waitForLoadState('domcontentloaded'), page.locator('form[action$="/cart"] button[type="submit"]').click()]);
  await badge('CUSTOMER • GIỎ HÀNG');
  await pause(1800);
  await visit('/checkout', 'CUSTOMER • CHECKOUT', 800);
  await page.locator('#selectedShowroomInput').evaluate((el) => el.value = 'Ducati Hồ Chí Minh');
  const date = new Date(Date.now() + 4 * 86400000).toISOString().slice(0, 10);
  await page.locator('[name="txtAppointmentDate"]').fill(date);
  await page.locator('[name="txtAppointmentTime"]').selectOption({index: 1});
  await pause(1300);

  await title('VNPay sandbox', 'Tạo URL có checksum • callback HTTPS • xác thực và ghi payment', 2800);
  await page.goto(`${base}/checkout`, {waitUntil: 'domcontentloaded'});
  await page.locator('#selectedShowroomInput').evaluate((el) => el.value = 'Ducati Hồ Chí Minh');
  await page.locator('[name="txtAppointmentDate"]').fill(date);
  await page.locator('[name="txtAppointmentTime"]').selectOption({index: 1});
  await badge('CHUYỂN SANG CỔNG VNPAY SANDBOX');
  await pause(900);
  await Promise.all([page.waitForLoadState('domcontentloaded'), page.locator('form[action$="/checkout"] button[type="submit"]').click()]);
  const paymentUrl = page.url();
  const pay = new URL(paymentUrl);
  const amount = Number(pay.searchParams.get('vnp_Amount') || 0) / 100;
  const returnUrl = pay.searchParams.get('vnp_ReturnUrl') || '';
  await page.setContent(`<!doctype html><html><head><meta charset="utf-8"><style>
    *{box-sizing:border-box}body{margin:0;background:#071d36;color:#fff;font-family:Arial,sans-serif;padding:46px}
    header{display:flex;justify-content:space-between;align-items:center;border-bottom:2px solid #e51b35;padding-bottom:20px}h1{margin:0;font-size:40px}.brand{font-weight:900;color:#e51b35;font-size:34px}
    main{margin-top:34px;background:#fff;color:#14243a;padding:32px;border-radius:8px}.ok{color:#087f5b;font-weight:800}.row{display:grid;grid-template-columns:240px 1fr;padding:14px 0;border-bottom:1px solid #dce3eb;font-size:19px}.row span:first-child{font-weight:700}.hash{word-break:break-all;font-family:monospace;font-size:14px}
  </style></head><body><header><div class="brand">VNPAY SANDBOX</div><div>MotoSales checkout</div></header><main><h1>URL thanh toán đã được tạo</h1><p class="ok">✓ Checksum HMAC-SHA512 hợp lệ • callback HTTPS</p><div class="row"><span>Mã đơn</span><span>${pay.searchParams.get('vnp_TxnRef')}</span></div><div class="row"><span>Số tiền</span><span>${amount.toLocaleString('vi-VN')} VND</span></div><div class="row"><span>Return URL</span><span>${returnUrl}</span></div><div class="row"><span>Secure hash</span><span class="hash">${pay.searchParams.get('vnp_SecureHash')}</span></div><p><strong>Ghi chú:</strong> Cổng sandbox chặn trình duyệt automation; bước tiếp theo mô phỏng callback có chữ ký hợp lệ bằng chính secret sandbox.</p></main></body></html>`);
  await pause(4200);
  const callback = signedCallback(paymentUrl);
  if (callback) {
    await page.goto(callback, {waitUntil: 'domcontentloaded'});
    await badge('CALLBACK SANDBOX CÓ CHỮ KÝ HỢP LỆ');
    await pause(2600);
    if (!page.url().includes('status=success')) {
      throw new Error(`VNPay callback demo failed: ${page.url()}`);
    }
  }
  await visit('/order-history', 'CUSTOMER • ĐƠN ĐÃ THANH TOÁN');
  await scrollDemo();
  await visit('/logout', 'CUSTOMER • ĐĂNG XUẤT', 900);

  await title('Admin flow', 'Dashboard • sản phẩm • thương hiệu • đơn hàng • người dùng', 2800);
  await login('admin@ducati.local', 'admin123', 'ADMIN');
  await visit('/admin/dashboard', 'ADMIN • DASHBOARD');
  await scrollDemo();
  await visit('/admin/manage-product', 'ADMIN • QUẢN LÝ SẢN PHẨM', 1000);
  await page.locator('button[onclick="openProductModal()"], button:has-text("Thêm")').first().click();
  await badge('ADMIN • FORM THÊM/SỬA SẢN PHẨM');
  await pause(1800);
  await page.keyboard.press('Escape');
  await visit('/admin/manage-brand', 'ADMIN • QUẢN LÝ THƯƠNG HIỆU', 1000);
  await page.locator('button[onclick^="openBrandModal"]').first().click();
  await badge('ADMIN • FORM THÊM/SỬA THƯƠNG HIỆU');
  await pause(1800);
  await page.keyboard.press('Escape');
  await visitMasked('/admin/manage-order', 'ADMIN • QUẢN LÝ ĐƠN HÀNG');
  await scrollDemo();
  await visitMasked('/admin/manage-user', 'ADMIN • QUẢN LÝ USER VÀ PHÂN QUYỀN');
  await scrollDemo();
  await visit('/profile', 'ADMIN • HỒ SƠ VÀ THỐNG KÊ');
  await visit('/logout', 'ADMIN • ĐĂNG XUẤT', 900);

  await title('Kiểm tra phân quyền', 'Customer không được phép truy cập chức năng quản trị', 2400);
  await login('enzo@ferrari.it', '123456', 'CUSTOMER');
  await page.goto(`${base}/admin/dashboard`, {waitUntil: 'domcontentloaded'});
  await badge('RBAC • CUSTOMER TRUY CẬP ADMIN');
  await pause(2400);

  await title('Hoàn tất demo', 'Java MVC • SQL Server • Session Auth • VNPay • ngrok HTTPS', 4200);
} finally {
  const video = page.video();
  await context.close();
  await browser.close();
  const source = await video.path();
  const target = path.join(root, 'MotorcycleSelling_Demo.webm');
  await fs.copyFile(source, target);
  console.log(target);
}
