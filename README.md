# Motorcycle Selling - MotoSales

Ứng dụng Java Web quản lý bán xe máy, phụ kiện, phụ tùng và đặt lịch nhận xe tại showroom. Dự án dùng JSP/Servlet, SQL Server, Tomcat/NetBeans, có đăng nhập Google OAuth, gửi mail Gmail SMTP và thanh toán VNPay sandbox.

## Tính năng chính

- Trang chủ hiển thị sản phẩm nổi bật, thương hiệu và ảnh sản phẩm từ SQL Server.
- Danh sách sản phẩm có lọc theo thương hiệu, danh mục và khoảng giá.
- Giỏ hàng theo session, badge giỏ hàng lấy từ dữ liệu thật.
- Checkout đặt lịch nhận xe tại showroom.
- Thanh toán online qua VNPay sandbox.
- Gửi mail xác nhận đơn hàng và hóa đơn thanh toán thành công.
- Đăng nhập thường, đăng ký, quên mật khẩu.
- Đăng nhập Google OAuth, hiển thị avatar và tên Google trong profile.
- Profile người dùng, lịch sử đơn, chi tiết đơn.
- Admin quản lý sản phẩm, thương hiệu, đơn hàng, người dùng.
- SQL Server schema/seed đầy đủ, không dùng mock/in-memory repository.
- Hỗ trợ đổi ngôn ngữ VI/EN cho header/footer và trang collection.

## Công nghệ

- Java Servlet/JSP
- Apache Tomcat 9
- NetBeans Ant Web Application
- SQL Server + JDBC
- JSTL
- JavaMail SMTP
- Google OAuth 2.0
- VNPay payment gateway sandbox
- ngrok để public localhost khi test callback

## Cấu trúc quan trọng

```text
database/
  schema.sql              Tạo database, bảng, user SQL Server
  seed.sql                Seed dữ liệu xe, mặt hàng, brand, voucher
  fix_encoding_data.sql   Sửa dữ liệu tiếng Việt nếu DB bị mojibake
  update_media_assets.sql Cập nhật logo hãng và ảnh sản phẩm

src/java/com/motorcycle/
  dao/                    DAO SQL Server
  filter/                 Encoding, auth, language filter
  model/                  Entity/model
  service/                Business logic, mail, payment, OAuth
  web/DispatcherServlet   Router chính

web/
  assets/                 CSS, JS, ảnh local
  common/                 Header/footer dùng chung
  admin/                  Giao diện quản trị
```

## Yêu cầu môi trường

- JDK 8 hoặc JDK tương thích với NetBeans/Tomcat hiện tại.
- Apache Tomcat 9.
- Apache NetBeans 13 hoặc tương đương.
- SQL Server.
- `sqlcmd` nếu muốn chạy script DB bằng terminal.
- ngrok nếu cần test callback public.

## Cài database SQL Server

Chạy trong thư mục project:

```powershell
sqlcmd -S localhost,49679 -E -b -i database\schema.sql
sqlcmd -S localhost,49679 -E -b -i database\seed.sql
sqlcmd -S localhost,49679 -E -b -i database\fix_encoding_data.sql
sqlcmd -S localhost,49679 -E -b -i database\update_media_assets.sql
```

Nếu server SQL của bạn không dùng port `49679`, sửa lại connection trong:

```text
src/java/com/motorcycle/dao/DatabaseConnection.java
```

Hoặc cấu hình bằng system properties/environment variables:

```text
DB_URL=jdbc:sqlserver://localhost:49679;databaseName=MotorcycleSalesDB;encrypt=true;trustServerCertificate=true
DB_USER=motorcycle_app
DB_PASSWORD=Motorcycle@123
```

Tài khoản seed:

```text
Admin:    admin@ducati.local / admin123
Customer: enzo@ferrari.it    / 123456
```

## Chạy bằng NetBeans

1. Mở NetBeans.
2. `File -> Open Project`.
3. Chọn thư mục project.
4. Gắn server Apache Tomcat 9.
5. Clean and Build.
6. Run project.

URL local thường là:

```text
http://localhost:8080/web_b_n_xe_m_y/
```

Nếu NetBeans đặt context path khác, dùng context path hiển thị trên browser.

## Cấu hình Gmail SMTP

Không hardcode mật khẩu Gmail vào source. Dùng App Password của Google.

Tomcat VM Options hoặc `setenv.bat`:

```text
-DMAIL_HOST=smtp.gmail.com
-DMAIL_PORT=587
-DMAIL_USERNAME=your-gmail@gmail.com
-DMAIL_PASSWORD=your-google-app-password
-DMAIL_FROM=your-gmail@gmail.com
```

Luồng gửi mail:

- Đăng ký tài khoản.
- Reset mật khẩu.
- Tạo đơn hàng.
- Thanh toán VNPay thành công.

## Cấu hình Google OAuth

Trong Google Cloud Console tạo OAuth Client loại `Web application`.

Authorized JavaScript origins:

```text
http://localhost:8080
```

Authorized redirect URIs:

```text
http://localhost:8080/web_b_n_xe_m_y/google-callback
```

Nếu chạy bằng ngrok:

```text
https://your-ngrok-domain.ngrok-free.dev/web_b_n_xe_m_y/google-callback
```

Tomcat VM Options hoặc `setenv.bat`:

```text
-DGOOGLE_CLIENT_ID=your_google_client_id
-DGOOGLE_CLIENT_SECRET=your_google_client_secret
```

## Cấu hình VNPay sandbox

Đăng ký/lấy credential tại:

- Sandbox đăng ký: <https://sandbox.vnpayment.vn/devreg>
- Merchant admin: <https://sandbox.vnpayment.vn/merchantv2/>
- Tài liệu tích hợp: <https://sandbox.vnpayment.vn/apis/docs/thanh-toan-pay/pay.html>

Tomcat VM Options hoặc `setenv.bat`:

```text
-DVNPAY_PAY_URL=https://sandbox.vnpayment.vn/paymentv2/vpcpay.html
-DVNPAY_TMN_CODE=your_vnpay_tmn_code
-DVNPAY_HASH_SECRET=your_vnpay_hash_secret
```

Return URL khi test local qua ngrok:

```text
https://your-ngrok-domain.ngrok-free.dev/web_b_n_xe_m_y/payment/callback
```

Lưu ý: sandbox chỉ dùng để test, không chuyển tiền thật. Muốn nhận tiền thật cần tài khoản VNPay production/live do VNPay cấp.

## Test VNPay

1. Đăng nhập.
2. Vào `Bộ sưu tập`.
3. Thêm sản phẩm vào giỏ.
4. Vào giỏ hàng và checkout.
5. Chọn lịch hẹn.
6. Bấm `THANH TOÁN QUA VNPAY`.
7. App chuyển sang VNPay sandbox.
8. Thanh toán xong quay về `/payment/callback`.
9. App lưu payment vào bảng `payments`, cập nhật đơn và gửi mail hóa đơn nếu SMTP đã cấu hình.

Thông tin thẻ test thường dùng trong sandbox:

```text
Ngân hàng: NCB
Số thẻ: 9704198526191432198
Tên chủ thẻ: NGUYEN VAN A
Ngày phát hành: 07/15
OTP: 123456
Mật khẩu: 1234
```

Ưu tiên dùng thông tin test VNPay gửi qua email nếu khác.

## Chạy ngrok

Nếu đã có ngrok:

```powershell
ngrok http 8080
```

Nếu dùng ngrok tải trong project:

```powershell
D:\SU26\PRJ\tools\ngrok\ngrok.exe http 8080
```

URL public sẽ có dạng:

```text
https://xxxx.ngrok-free.dev/web_b_n_xe_m_y/
```

Mỗi lần ngrok đổi domain, cần cập nhật lại Redirect URI Google OAuth và Return URL VNPay.

## Ghi chú bảo mật

- Không commit Gmail App Password, Google Client Secret, VNPay Hash Secret.
- Cấu hình secret bằng Tomcat VM Options, environment variables hoặc file local ngoài repo.
- `.gitignore` đã bỏ qua `build/`, `dist/`, `.env`, `nbproject/private/`.

## Các script hữu ích

Build WAR bằng Ant của NetBeans:

```powershell
& 'C:\Program Files\NetBeans-13\netbeans\extide\ant\bin\ant.bat' '-Dj2ee.server.home=D:/apache-tomcat-9.0.113' clean dist
```

Sửa dữ liệu tiếng Việt và media trên DB hiện tại:

```powershell
sqlcmd -S localhost,49679 -d MotorcycleSalesDB -U motorcycle_app -P 'Motorcycle@123' -i database\fix_encoding_data.sql -f 65001
sqlcmd -S localhost,49679 -d MotorcycleSalesDB -U motorcycle_app -P 'Motorcycle@123' -i database\update_media_assets.sql -f 65001
```

