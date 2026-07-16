import {chromium} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';

const base = process.env.DEMO_BASE_URL || 'https://maximum-abide-radial.ngrok-free.dev/web_b_n_xe_m_y';
const out = path.resolve('artifacts/audit');
await fs.mkdir(out, {recursive: true});
const browser = await chromium.launch({headless: true, executablePath: 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'});

const publicRoutes = ['/', '/products', '/price-list', '/dealers', '/product-detail?id=1', '/login', '/register'];
const customerRoutes = ['/home', '/products', '/cart', '/checkout', '/order-history', '/profile'];
const adminRoutes = ['/admin/dashboard', '/admin/manage-product', '/admin/manage-brand', '/admin/manage-order', '/admin/manage-user', '/profile'];
const results = [];

async function createContext(viewport) {
  const context = await browser.newContext({viewport});
  await context.route('**/*', async (route) => {
    const request = route.request();
    const headers = {...request.headers()};
    if (new URL(request.url()).hostname.endsWith('ngrok-free.dev')) {
      headers['ngrok-skip-browser-warning'] = 'true';
    }
    await route.continue({headers});
  });
  return context;
}

async function login(page, email, password) {
  await page.goto(`${base}/login`, {waitUntil: 'domcontentloaded'});
  await page.locator('[name="txtEmail"]').fill(email);
  await page.locator('[name="txtPassword"]').fill(password);
  await Promise.all([page.waitForLoadState('domcontentloaded'), page.locator('form[action$="/login"] button[type="submit"]').click()]);
}

async function inspect(page, role, route, viewport) {
  const errors = [];
  const failed = [];
  let screenshotError = '';
  const onConsole = (msg) => { if (msg.type() === 'error') errors.push(msg.text()); };
  const onFailed = (req) => failed.push(`${req.method()} ${req.url()} :: ${req.failure()?.errorText}`);
  page.on('console', onConsole);
  page.on('requestfailed', onFailed);
  const response = await page.goto(`${base}${route}`, {waitUntil: 'networkidle', timeout: 30000}).catch(() => null);
  const data = await page.evaluate(() => ({
    title: document.title,
    brokenImages: [...document.images].filter((img) => !img.complete || img.naturalWidth === 0).map((img) => img.currentSrc || img.src),
    overflow: document.documentElement.scrollWidth - document.documentElement.clientWidth,
    viewport: {width: document.documentElement.clientWidth, height: innerHeight},
    text: document.body.innerText.slice(0, 200),
  }));
  const safe = route.replace(/[^a-z0-9]+/gi, '-').replace(/^-|-$/g, '') || 'home';
  if (['/', '/products', '/product-detail?id=1', '/checkout', '/profile', '/admin/dashboard', '/admin/manage-user'].includes(route)) {
    try {
      await page.screenshot({path: path.join(out, `${role}-${viewport}-${safe}.png`), fullPage: false});
    } catch (error) {
      screenshotError = error.message;
    }
  }
  results.push({role, route, viewport, status: response?.status() || 0, url: page.url(), ...data, consoleErrors: errors, requestFailures: failed, screenshotError});
  page.off('console', onConsole);
  page.off('requestfailed', onFailed);
}

for (const [viewportName, viewport] of Object.entries({desktop: {width: 1440, height: 900}, mobile: {width: 390, height: 844}})) {
  const guest = await createContext(viewport);
  const guestPage = await guest.newPage();
  for (const route of publicRoutes) await inspect(guestPage, 'guest', route, viewportName);
  await guest.close();

  const customer = await createContext(viewport);
  const customerPage = await customer.newPage();
  await login(customerPage, 'enzo@ferrari.it', '123456');
  for (const route of customerRoutes) await inspect(customerPage, 'customer', route, viewportName);
  await inspect(customerPage, 'customer', '/admin/dashboard', viewportName);
  await customer.close();

  const admin = await createContext(viewport);
  const adminPage = await admin.newPage();
  await login(adminPage, 'admin@ducati.local', 'admin123');
  for (const route of adminRoutes) await inspect(adminPage, 'admin', route, viewportName);
  await admin.close();
}

await browser.close();
await fs.writeFile(path.join(out, 'results.json'), JSON.stringify(results, null, 2));
const summary = results.map((r) => ({role: r.role, route: r.route, viewport: r.viewport, status: r.status, broken: r.brokenImages.length, overflow: r.overflow, console: r.consoleErrors.length, failed: r.requestFailures.length, finalUrl: r.url}));
console.table(summary);
if (results.some((r) => r.brokenImages.length || r.overflow > 1 || r.consoleErrors.length || r.requestFailures.length || r.status >= 500)) process.exitCode = 2;
