# MotoSales Motorcycle Selling

MotoSales is a Java Web application for selling motorcycles, accessories, spare parts, and showroom appointment bookings. It is built with JSP/Servlet, SQL Server, Apache Tomcat, and NetBeans Ant, with real database-backed flows for catalog, cart, checkout, VNPay payment, Google OAuth login, and Gmail invoice emails.

## Highlights

| Area | Features |
| --- | --- |
| Customer storefront | Home page, brand browsing, product collection, product detail, cart, checkout |
| Authentication | Email/password login, registration, password reset, Google OAuth 2.0 login with avatar |
| Orders | Showroom appointment booking, order history, order detail, admin status update |
| Payment | VNPay sandbox payment redirect, checksum verification, payment callback recording |
| Email | Gmail SMTP registration/reset/order confirmation/payment invoice emails |
| Admin | Manage products, brands, orders, and users from SQL Server |
| Data | Full SQL Server schema and seed data, no mock/in-memory repositories |
| UI | Local product artwork, brand logos, VNPay payment panel, VI/EN language switch |

## Tech Stack

- Java Servlet/JSP
- Apache Tomcat 9
- Apache NetBeans Ant Web Application
- SQL Server + Microsoft JDBC Driver
- JSTL
- JavaMail SMTP
- Google OAuth 2.0
- VNPay sandbox payment gateway
- ngrok for public callback testing

## Project Structure

```text
database/
  schema.sql                 Creates database, tables, constraints, indexes, SQL user
  seed.sql                   Seeds roles, users, brands, categories, products, vouchers
  fix_encoding_data.sql      Fixes Vietnamese text if SQL data was imported with bad encoding
  update_media_assets.sql    Adds brand logo URLs and local product image paths

src/java/com/motorcycle/
  dao/                       SQL Server DAO layer
  filter/                    Encoding, authentication, authorization, language filters
  model/                     Domain models
  service/                   Business logic, mail, payment, OAuth, catalog, cart
  web/DispatcherServlet.java Main request router

web/
  assets/                    CSS, JS, local SVG assets
  common/                    Shared header and footer
  admin/                     Admin JSP views
  WEB-INF/web.xml            Servlet/filter mappings
```

## Prerequisites

- JDK 8 or a JDK compatible with your NetBeans/Tomcat setup
- Apache Tomcat 9
- Apache NetBeans 13 or newer
- SQL Server
- `sqlcmd` for running database scripts from the terminal
- ngrok for Google OAuth and VNPay callback testing over a public URL

## Quick Start

1. Clone the repository.
2. Run the SQL Server scripts in `database/`.
3. Open the project in NetBeans.
4. Attach Apache Tomcat 9.
5. Configure runtime secrets through Tomcat VM Options or environment variables.
6. Clean and Build.
7. Run the project.

Default local URL:

```text
http://localhost:8080/web_b_n_xe_m_y/
```

If NetBeans deploys with a different context path, use the path shown in the browser.

## Database Setup

From the project root:

```powershell
sqlcmd -S localhost,49679 -E -b -i database\schema.sql
sqlcmd -S localhost,49679 -E -b -i database\seed.sql
sqlcmd -S localhost,49679 -E -b -i database\fix_encoding_data.sql
sqlcmd -S localhost,49679 -E -b -i database\update_media_assets.sql
```

If your SQL Server does not use `localhost,49679`, either edit:

```text
src/java/com/motorcycle/dao/DatabaseConnection.java
```

or provide runtime configuration:

```text
DB_URL=jdbc:sqlserver://localhost:49679;databaseName=MotorcycleSalesDB;encrypt=true;trustServerCertificate=true
DB_USER=motorcycle_app
DB_PASSWORD=Motorcycle@123
```

Seeded accounts:

```text
Admin:    admin@ducati.local / admin123
Customer: enzo@ferrari.it    / 123456
```

Seed data includes:

- 11 brands
- 11 categories
- 21 products covering motorcycles, accessories, parts, and service packages
- 3 vouchers

## Runtime Configuration

The application reads configuration from Java system properties first, then environment variables.

### SQL Server

```text
-DDB_URL=jdbc:sqlserver://localhost:49679;databaseName=MotorcycleSalesDB;encrypt=true;trustServerCertificate=true
-DDB_USER=motorcycle_app
-DDB_PASSWORD=Motorcycle@123
```

### Gmail SMTP

Use a Google App Password, not your normal Gmail password.

```text
-DMAIL_HOST=smtp.gmail.com
-DMAIL_PORT=587
-DMAIL_USERNAME=your-gmail@gmail.com
-DMAIL_PASSWORD=your-google-app-password
-DMAIL_FROM=your-gmail@gmail.com
```

Emails are sent for:

- Account registration
- Password reset
- Order confirmation
- Successful VNPay payment invoice

### Google OAuth

Create an OAuth Client in Google Cloud Console with application type `Web application`.

Authorized JavaScript origins:

```text
http://localhost:8080
```

Authorized redirect URI for local development:

```text
http://localhost:8080/web_b_n_xe_m_y/google-callback
```

Authorized redirect URI for ngrok:

```text
https://your-ngrok-domain.ngrok-free.dev/web_b_n_xe_m_y/google-callback
```

Runtime options:

```text
-DGOOGLE_CLIENT_ID=your_google_client_id
-DGOOGLE_CLIENT_SECRET=your_google_client_secret
```

### VNPay Sandbox

Useful VNPay links:

- Sandbox registration: <https://sandbox.vnpayment.vn/devreg>
- Merchant admin: <https://sandbox.vnpayment.vn/merchantv2/>
- Integration guide: <https://sandbox.vnpayment.vn/apis/docs/thanh-toan-pay/pay.html>

Runtime options:

```text
-DVNPAY_PAY_URL=https://sandbox.vnpayment.vn/paymentv2/vpcpay.html
-DVNPAY_TMN_CODE=your_vnpay_tmn_code
-DVNPAY_HASH_SECRET=your_vnpay_hash_secret
```

Return URL when testing through ngrok:

```text
https://your-ngrok-domain.ngrok-free.dev/web_b_n_xe_m_y/payment/callback
```

Sandbox payments do not move real money. Production payments require production credentials and a signed merchant agreement with VNPay.

## Tomcat `setenv.bat` Example

Create or edit:

```text
D:\apache-tomcat-9.0.113\bin\setenv.bat
```

Example:

```bat
@echo off
set "CATALINA_OPTS=%CATALINA_OPTS% -DDB_URL=jdbc:sqlserver://localhost:49679;databaseName=MotorcycleSalesDB;encrypt=true;trustServerCertificate=true"
set "CATALINA_OPTS=%CATALINA_OPTS% -DDB_USER=motorcycle_app"
set "CATALINA_OPTS=%CATALINA_OPTS% -DDB_PASSWORD=Motorcycle@123"

set "CATALINA_OPTS=%CATALINA_OPTS% -DMAIL_HOST=smtp.gmail.com"
set "CATALINA_OPTS=%CATALINA_OPTS% -DMAIL_PORT=587"
set "CATALINA_OPTS=%CATALINA_OPTS% -DMAIL_USERNAME=your-gmail@gmail.com"
set "CATALINA_OPTS=%CATALINA_OPTS% -DMAIL_PASSWORD=your-google-app-password"
set "CATALINA_OPTS=%CATALINA_OPTS% -DMAIL_FROM=your-gmail@gmail.com"

set "CATALINA_OPTS=%CATALINA_OPTS% -DGOOGLE_CLIENT_ID=your-google-client-id"
set "CATALINA_OPTS=%CATALINA_OPTS% -DGOOGLE_CLIENT_SECRET=your-google-client-secret"

set "CATALINA_OPTS=%CATALINA_OPTS% -DVNPAY_PAY_URL=https://sandbox.vnpayment.vn/paymentv2/vpcpay.html"
set "CATALINA_OPTS=%CATALINA_OPTS% -DVNPAY_TMN_CODE=your-vnpay-tmn-code"
set "CATALINA_OPTS=%CATALINA_OPTS% -DVNPAY_HASH_SECRET=your-vnpay-hash-secret"
```

Restart Tomcat after editing this file.

## VNPay Test Flow

1. Sign in.
2. Open the product collection.
3. Add a product to the cart.
4. Open the cart and proceed to checkout.
5. Choose showroom and appointment time.
6. Click `THANH TOÁN QUA VNPAY`.
7. The app redirects to VNPay sandbox.
8. Complete the sandbox payment.
9. VNPay redirects back to `/payment/callback`.
10. The app records the payment, updates the order, and sends the invoice email if SMTP is configured.

Common VNPay sandbox card:

```text
Bank: NCB
Card number: 9704198526191432198
Cardholder: NGUYEN VAN A
Issue date: 07/15
OTP: 123456
Password: 1234
```

Prefer the test data sent by VNPay if your sandbox email contains different values.

## ngrok

Start a tunnel to Tomcat:

```powershell
ngrok http 8080
```

If using the downloaded binary:

```powershell
D:\SU26\PRJ\tools\ngrok\ngrok.exe http 8080
```

Public app URL:

```text
https://xxxx.ngrok-free.dev/web_b_n_xe_m_y/
```

Whenever the ngrok domain changes, update:

- Google OAuth redirect URI
- VNPay return URL

## Build Command

```powershell
& 'C:\Program Files\NetBeans-13\netbeans\extide\ant\bin\ant.bat' '-Dj2ee.server.home=D:/apache-tomcat-9.0.113' clean dist
```

The WAR is generated in:

```text
dist/web_b_n_xe_m_y.war
```

## Troubleshooting

### Vietnamese text looks corrupted

Run:

```powershell
sqlcmd -S localhost,49679 -d MotorcycleSalesDB -U motorcycle_app -P 'Motorcycle@123' -i database\fix_encoding_data.sql -f 65001
```

Also make sure JSP files use UTF-8:

```jsp
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
```

### Product images or brand logos are missing

Run:

```powershell
sqlcmd -S localhost,49679 -d MotorcycleSalesDB -U motorcycle_app -P 'Motorcycle@123' -i database\update_media_assets.sql -f 65001
```

### VNPay says the checksum is invalid

Check that:

- `VNPAY_TMN_CODE` matches the VNPay merchant account.
- `VNPAY_HASH_SECRET` is exactly the sandbox secret.
- The Return URL matches the public ngrok domain.
- Tomcat was restarted after changing configuration.

### Google login redirects back without logging in

Check that:

- `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` are configured.
- The redirect URI in Google Cloud exactly matches the app URL.
- If using ngrok, the current ngrok domain is registered in Google Cloud.

## Security Notes

- Do not commit Gmail App Passwords, Google Client Secrets, VNPay Hash Secrets, or ngrok auth tokens.
- Keep secrets in Tomcat VM Options, OS environment variables, or local files outside the repository.
- `.gitignore` excludes build output, `dist/`, `.env`, and `nbproject/private/`.

## Repository Status

The application is intended to be fully database-backed. Legacy in-memory/mock repositories were removed so runtime data comes from SQL Server.

