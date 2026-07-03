<div align="center">

![Java](https://img.shields.io/badge/Java_Core-17-orange?style=flat-square)
![Servlet](https://img.shields.io/badge/Servlet-4.0-yellow?style=flat-square)
![JSP](https://img.shields.io/badge/JSP%20%2B%20JSTL-MVC-blue?style=flat-square)
![SQL Server](https://img.shields.io/badge/SQL%20Server-2022-red?style=flat-square)
![Tomcat](https://img.shields.io/badge/Apache%20Tomcat-9.x-lightgrey?style=flat-square)
![NetBeans](https://img.shields.io/badge/NetBeans-13-blue?style=flat-square)
![VNPay](https://img.shields.io/badge/VNPay-Sandbox-008fe5?style=flat-square)
![Google OAuth](https://img.shields.io/badge/Google%20OAuth-2.0-green?style=flat-square)

# MotoSales Commerce Platform

### Java MVC motorcycle commerce system with SQL Server, VNPay payments, Google OAuth login, and Gmail invoice automation

![Status](https://img.shields.io/badge/status-completed-brightgreen?style=flat-square)
![Database](https://img.shields.io/badge/database-real%20SQL%20Server-orange?style=flat-square)
![Payment](https://img.shields.io/badge/payment-VNPay%20sandbox-005baa?style=flat-square)
![Auth](https://img.shields.io/badge/auth-Google%20OAuth-34a853?style=flat-square)
![Mail](https://img.shields.io/badge/mail-Gmail%20SMTP-red?style=flat-square)

</div>

---

## Giới Thiệu Dự Án

**MotoSales Commerce Platform** là hệ thống Java Web MVC dành cho showroom xe máy, hỗ trợ bán xe, phụ kiện, phụ tùng và dịch vụ bảo dưỡng. Hệ thống cho phép khách hàng duyệt danh mục sản phẩm, lọc theo thương hiệu/danh mục/khoảng giá, xem chi tiết, thêm vào giỏ hàng, đặt lịch nhận xe tại showroom và thanh toán online qua **VNPay sandbox**.

Dự án được triển khai theo mô hình **MVC** với **Java Servlet, JSP, JSTL, Service Layer và DAO**, sử dụng **SQL Server** làm hệ quản trị cơ sở dữ liệu chính. Các luồng đăng nhập Google OAuth, gửi mail Gmail SMTP và thanh toán VNPay được cấu hình qua environment/runtime properties, không hardcode secret trong source code.

---

## Mục Tiêu Hệ Thống

- Xây dựng nền tảng Java Web MVC cho showroom xe máy với kiến trúc dễ bảo trì.
- Tách rõ **Frontend JSP/static assets** và **Backend Servlet/DAO/Service/Model**.
- Lưu trữ dữ liệu bằng **SQL Server** với schema đầy đủ cho users, brands, products, orders, payments.
- Cung cấp luồng khách hàng đầy đủ: xem sản phẩm, lọc sản phẩm, thêm giỏ hàng, checkout, đặt lịch showroom.
- Tích hợp **Google OAuth 2.0** để đăng nhập bằng Gmail và hiển thị avatar tài khoản.
- Tích hợp **Gmail SMTP** để gửi email xác nhận đơn hàng và hóa đơn thanh toán.
- Tích hợp **VNPay sandbox** để xử lý thanh toán online.
- Cung cấp khu vực admin để quản lý sản phẩm, thương hiệu, đơn hàng và người dùng.
- Cung cấp tài liệu triển khai rõ ràng để có thể clone, cấu hình và chạy lại dự án.

---

## Phạm Vi Chức Năng

### Khách Hàng

- Đăng ký, đăng nhập, đăng xuất.
- Đăng nhập bằng Google OAuth.
- Xem trang chủ với sản phẩm nổi bật và thương hiệu.
- Xem danh sách sản phẩm và mặt hàng.
- Lọc sản phẩm theo thương hiệu, danh mục và khoảng giá.
- Xem chi tiết sản phẩm.
- Thêm sản phẩm vào giỏ hàng.
- Xem giỏ hàng, tổng tiền và số lượng thật theo session.
- Đặt lịch nhận xe/tư vấn tại showroom.
- Thanh toán online qua VNPay sandbox.
- Nhận email xác nhận đơn hàng.
- Nhận email hóa đơn sau khi thanh toán thành công.
- Xem lịch sử đơn hàng và chi tiết đơn.
- Cập nhật hồ sơ cá nhân.

### Quản Trị Viên

- Xem dashboard tổng quan lấy dữ liệu từ SQL Server.
- Quản lý sản phẩm và mặt hàng.
- Quản lý thương hiệu và logo thương hiệu.
- Quản lý đơn đặt lịch, cập nhật trạng thái đơn.
- Quản lý người dùng và phân quyền.

### Tích Hợp Ngoài

- **Google OAuth 2.0**: đăng nhập bằng Gmail, tự tạo hoặc cập nhật user theo email.
- **Gmail SMTP**: gửi email HTML UTF-8, tránh lỗi font tiếng Việt.
- **VNPay Sandbox**: tạo URL thanh toán, ký checksum, nhận callback và ghi payment.
- **ngrok**: public localhost để test Google callback và VNPay return URL.

---

## Công Nghệ Sử Dụng

| Nhóm | Công nghệ |
| --- | --- |
| Backend | Java Servlet, Java Service Layer, DAO Pattern |
| Frontend | JSP, JSTL, HTML, CSS, JavaScript |
| Server | Apache Tomcat 9 |
| IDE | Apache NetBeans 13 |
| Database | SQL Server, Microsoft JDBC Driver |
| Auth | Session Auth, Google OAuth 2.0 |
| Mail | JavaMail, Gmail SMTP |
| Payment | VNPay Sandbox |
| Dev Tunnel | ngrok |

---

## Kiến Trúc Dự Án

```text
Motorcycle-selling/
├── database/
│   ├── schema.sql
│   ├── seed.sql
│   ├── fix_encoding_data.sql
│   └── update_media_assets.sql
│
├── src/java/com/motorcycle/
│   ├── dao/
│   ├── filter/
│   ├── model/
│   ├── service/
│   ├── util/
│   └── web/
│       └── DispatcherServlet.java
│
├── src/java/
│   ├── messages_vi.properties
│   └── messages_en.properties
│
├── web/
│   ├── admin/
│   ├── assets/
│   ├── common/
│   ├── WEB-INF/
│   ├── home.jsp
│   ├── products.jsp
│   ├── checkout.jsp
│   └── profile.jsp
│
├── build.xml
└── README.md
```

---

## Database

Database chính: **MotorcycleSalesDB**

Các bảng chính:

- `roles`
- `users`
- `brands`
- `categories`
- `products`
- `orders`
- `order_details`
- `payments`
- `vouchers`
- `reviews`
- `notifications`

Chạy script tạo database:

```powershell
sqlcmd -S localhost,49679 -E -b -i database\schema.sql
sqlcmd -S localhost,49679 -E -b -i database\seed.sql
sqlcmd -S localhost,49679 -E -b -i database\fix_encoding_data.sql
sqlcmd -S localhost,49679 -E -b -i database\update_media_assets.sql
```

Tài khoản mẫu:

```text
Admin:    admin@ducati.local / admin123
Customer: enzo@ferrari.it    / 123456
```

---

## Cấu Hình Môi Trường

Ứng dụng đọc cấu hình từ **Java system properties** hoặc **environment variables**.

### SQL Server

```text
DB_URL=jdbc:sqlserver://localhost:49679;databaseName=MotorcycleSalesDB;encrypt=true;trustServerCertificate=true
DB_USER=motorcycle_app
DB_PASSWORD=Motorcycle@123
```

### Gmail SMTP

```text
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=your-gmail@gmail.com
MAIL_PASSWORD=your-google-app-password
MAIL_FROM=your-gmail@gmail.com
```

### Google OAuth

```text
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
```

Redirect URI local:

```text
http://localhost:8080/web_b_n_xe_m_y/google-callback
```

Redirect URI khi dùng ngrok:

```text
https://your-ngrok-domain.ngrok-free.dev/web_b_n_xe_m_y/google-callback
```

### VNPay Sandbox

```text
VNPAY_PAY_URL=https://sandbox.vnpayment.vn/paymentv2/vpcpay.html
VNPAY_TMN_CODE=your_vnpay_tmn_code
VNPAY_HASH_SECRET=your_vnpay_hash_secret
```

Return URL khi dùng ngrok:

```text
https://your-ngrok-domain.ngrok-free.dev/web_b_n_xe_m_y/payment/callback
```

> Không commit Gmail App Password, Google Client Secret, VNPay Hash Secret hoặc ngrok token lên GitHub.

---

## Chạy Dự Án Bằng NetBeans

1. Mở **Apache NetBeans**.
2. Chọn `File -> Open Project`.
3. Chọn thư mục `Motorcycle-selling`.
4. Gắn server **Apache Tomcat 9**.
5. Cấu hình VM Options hoặc Tomcat `setenv.bat`.
6. Chọn `Clean and Build`.
7. Chọn `Run`.

URL local mặc định:

```text
http://localhost:8080/web_b_n_xe_m_y/
```

Nếu NetBeans deploy với context path khác, dùng context path đang hiển thị trên trình duyệt.

---

## Luồng Thanh Toán VNPay

1. Người dùng đăng nhập.
2. Thêm sản phẩm vào giỏ hàng.
3. Vào checkout.
4. Chọn showroom và lịch hẹn.
5. Bấm `THANH TOÁN QUA VNPAY`.
6. Hệ thống tạo URL thanh toán VNPay có checksum.
7. Người dùng thanh toán trên VNPay sandbox.
8. VNPay redirect về `/payment/callback`.
9. Hệ thống xác thực checksum callback.
10. Ghi payment vào bảng `payments`.
11. Cập nhật trạng thái đơn.
12. Gửi email hóa đơn nếu SMTP đã cấu hình.

Thẻ test VNPay sandbox thường dùng:

```text
Bank: NCB
Card number: 9704198526191432198
Cardholder: NGUYEN VAN A
Issue date: 07/15
OTP: 123456
Password: 1234
```

---

## Chạy ngrok

```powershell
ngrok http 8080
```

Hoặc nếu dùng binary tải trong máy:

```powershell
D:\SU26\PRJ\tools\ngrok\ngrok.exe http 8080
```

Public URL:

```text
https://xxxx.ngrok-free.dev/web_b_n_xe_m_y/
```

Khi ngrok đổi domain, cần cập nhật lại:

- Google OAuth Redirect URI
- VNPay Return URL

---

## Build WAR

```powershell
& 'C:\Program Files\NetBeans-13\netbeans\extide\ant\bin\ant.bat' '-Dj2ee.server.home=D:/apache-tomcat-9.0.113' clean dist
```

File WAR sau khi build:

```text
dist/web_b_n_xe_m_y.war
```

---

## Ghi Chú Bảo Mật

- Không lưu secret thật trong source code.
- Không commit file `.env`, `setenv.bat` chứa secret hoặc `nbproject/private`.
- Dùng biến môi trường hoặc Tomcat VM Options cho các khóa tích hợp.
- `.gitignore` đã loại trừ `build/`, `dist/`, `.env`, `nbproject/private/`.

---

## Trạng Thái

| Hạng mục | Trạng thái |
| --- | --- |
| SQL Server database | Hoàn thành |
| Product catalog | Hoàn thành |
| Cart/session checkout | Hoàn thành |
| Google OAuth | Hoàn thành |
| Gmail SMTP email | Hoàn thành |
| VNPay sandbox payment | Hoàn thành |
| Admin dashboard | Hoàn thành |
| README/setup guide | Hoàn thành |
