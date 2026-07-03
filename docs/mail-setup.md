# JavaMail / Gmail SMTP setup

Project đã có `javax.mail-1.6.2.jar` trong `web/WEB-INF/lib` và NetBeans classpath.

## Biến cấu hình

`MailService` đọc cấu hình từ system properties hoặc environment variables:

```text
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=your-gmail@gmail.com
MAIL_PASSWORD=your-google-app-password
MAIL_FROM=your-gmail@gmail.com
```

Với Gmail, không dùng mật khẩu Gmail thường. Vào Google Account:

1. Bật 2-Step Verification.
2. Tạo App Password.
3. Dùng App Password cho `MAIL_PASSWORD`.

## Chạy trong NetBeans

Vào Project Properties -> Run -> VM Options, thêm:

```text
-DMAIL_HOST=smtp.gmail.com -DMAIL_PORT=587 -DMAIL_USERNAME=your-gmail@gmail.com -DMAIL_PASSWORD=your-app-password -DMAIL_FROM=your-gmail@gmail.com
```

Khi đăng ký, reset mật khẩu hoặc đặt hàng thành công, hệ thống sẽ gọi JavaMail để gửi email.

