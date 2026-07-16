# Project Context & AI Onboarding Guide: MotoSales Commerce Platform

This document provides a comprehensive overview of the **MotoSales Commerce Platform** codebase. It is designed to help any incoming AI agent or developer quickly understand the business domain, architecture, directory layout, database schema, routing mechanics, external integrations, and patterns used throughout this project.

---

## 1. Project Overview & Business Domain

**MotoSales Commerce Platform** is a Java Web MVC application designed for a motorcycle showroom. It supports:
- **E-commerce capabilities** for motorcycles, accessories, parts, and maintenance services.
- **Product catalog management** with filtering by brand, category, and price range.
- **Cart & Session Checkout** for placing orders.
- **Showroom Scheduling** (booking a time to receive/inspect a motorcycle).
- **Online Payment** integrated with VNPay Sandbox.
- **Authentication** via standard credentials or Google OAuth 2.0.
- **Gmail Automation** for sending HTML order confirmations and invoices.
- **Admin Dashboard** for managing products, brands, orders, and users.

---

## 2. Technical Stack

| Component | Technology / Library | Details |
|---|---|---|
| **Language & Backend** | Java 17, Servlet 4.0 | Strict MVC structure with Service and DAO layers. |
| **Frontend** | JSP, JSTL | Semantic HTML, Vanilla CSS, JS, Bootstrap 5, FontAwesome 6, SwiperJS, SweetAlert2. |
| **Server** | Apache Tomcat 9 | Running on local context path `/web_b_n_xe_m_y/` or `/`. |
| **IDE** | Apache NetBeans 13 | Built using Ant (`build.xml`). |
| **Database** | SQL Server 2022 | Microsoft JDBC Driver. |
| **Integrations** | Google OAuth 2.0, Gmail SMTP, VNPay Sandbox, ngrok | External integrations configured via Environment/System Properties. |

---

## 3. Repository Architecture & Directory Structure

```text
Motorcycle-selling/
├── database/                    # Database initialization scripts
│   ├── schema.sql               # Database schema definition (tables, constraints, triggers)
│   ├── seed.sql                 # Mock data for testing (products, users, brands)
│   ├── fix_encoding_data.sql    # Fixes UTF-8 encoding issues for SQL Server entries
│   └── update_media_assets.sql  # Updates links for mock product images
│
├── src/java/                    # Backend source code
│   └── com/motorcycle/
│       ├── dao/                 # Data Access Objects (direct JDBC queries)
│       │   ├── DatabaseConnection.java  # Establishes connection using System properties
│       │   ├── ProductDao.java
│       │   ├── UserDao.java
│       │   └── ... (Other entity DAOs)
│       ├── filter/              # Servlet filters (Authentication, CharacterEncoding)
│       ├── model/               # Model POJOs (Plain Old Java Objects mapping DB tables)
│       │   ├── BaseEntity.java  # Base model class (id, createdAt, updatedAt)
│       │   └── ... (Product, User, Order, etc.)
│       ├── service/             # Business Logic Layer (mediates between Controller and DAO)
│       │   ├── AuthService.java
│       │   ├── MailService.java
│       │   ├── PaymentService.java
│       │   └── ...
│       ├── util/                # Utilities (Request parsing, hashing, validators)
│       ├── web/
│       │   └── DispatcherServlet.java  # The centralized Front Controller mapping routes
│       └── websocket/           # Optional real-time features
│
├── web/                         # Frontend JSP & Static Assets (Tomcat Document Root)
│   ├── admin/                   # Admin portal views (dashboard.jsp, manage-product.jsp, etc.)
│   ├── assets/                  # CSS styles, JS scripts, and local images
│   ├── common/                  # Reusable JSP fragments (header.jsp, footer.jsp)
│   ├── WEB-INF/                 # Protected web resources, web.xml configurations
│   ├── index.jsp                # Storefront Home Page
│   ├── products.jsp             # Catalog listing and filtering sidebar
│   ├── product-detail.jsp       # Detail view of individual products
│   ├── cart.jsp                 # Shopping cart listing
│   ├── checkout.jsp             # Ordering form & showroom schedule picker
│   └── login.jsp / register.jsp # User access management
│
├── build.xml                    # Apache Ant build script
└── README.md                    # Installation & run manual
```

---

## 4. Database Schema Overview

The database **MotorcycleSalesDB** consists of the following key tables:

- `roles`: System authorization roles (e.g., `ADMIN`, `CUSTOMER`).
- `users`: User profiles containing credentials, OAuth IDs, active statuses, and linked roles.
- `brands`: Motorcycle brands/manufacturers (Ducati, Honda, Yamaha, etc.) including logo image paths.
- `categories`: Catalog categories (Xe tay ga, Xe côn tay, Phụ kiện, etc.).
- `products`: Product listings with descriptions, prices, stock levels, displacements (cc), engine type, image references, and brand/category relationships.
- `orders`: Purchase orders tracking selected showrooms, scheduled times, vouchers used, status (`PENDING`, `CONFIRMED`, `SHIPPED`, `CANCELLED`), and client references.
- `order_details`: Line items in each order recording the specific product quantities, unit prices, and selected colors.
- `payments`: Records payments matching VNPay txn refs, amounts, timestamps, payment statuses, and orders.
- `vouchers`: Discount codes applied during checkout.
- `reviews`: Customer ratings and feedback left on products.
- `notifications`: Alerts shown to users on status updates.

---

## 5. Architectural & Coding Conventions

### A. MVC Flow & Front Controller
The system utilizes a single, centralized controller: [DispatcherServlet.java](file:///c:/NetBeansProjects/web%20b%C3%A1n%20xe%20m%C3%A1y/src/java/com/motorcycle/web/DispatcherServlet.java).
- **Routing Protocol**: It reads `request.getServletPath()` and maps exact routes to helper methods within the class (e.g., `/home` to `home()`, `/products` to `products()`, `/admin/dashboard` to `adminDashboard()`).
- **Data Validation & Extraction**: Request parsing and safe parameter handling are abstracted in [RequestUtil.java](file:///c:/NetBeansProjects/web%20b%C3%A1n%20xe%20m%C3%A1y/src/java/com/motorcycle/util/RequestUtil.java).
- **Service Layer**: The DispatcherServlet does **not** call DAOs directly. All actions pass through the corresponding classes in the `service` package.

### B. Environment & Configuration Configuration
Do **not** hardcode configurations. The database context loader [DatabaseConnection.java](file:///c:/NetBeansProjects/web%20b%C3%A1n%20xe%20m%C3%A1y/src/java/com/motorcycle/dao/DatabaseConnection.java) and services read properties from environment variables or Java system parameters:
- `DB_URL`, `DB_USER`, `DB_PASSWORD` (SQL Server Connection details)
- `MAIL_HOST`, `MAIL_PORT`, `MAIL_USERNAME`, `MAIL_PASSWORD`, `MAIL_FROM` (SMTP connection credentials)
- `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET` (OAuth 2.0 Web Client Credentials)
- `VNPAY_PAY_URL`, `VNPAY_TMN_CODE`, `VNPAY_HASH_SECRET` (Sandbox merchant keys)

### C. Frontend Conventions & Dynamic Pages
- **Context Path Binding**: Paths to resources, pages, or routes must start with the Context Path to prevent broken URLs:
  ```jsp
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <a href="${pageContext.request.contextPath}/home">Home</a>
  ```
- **Inputs & Forms**: Forms must specify `method="POST"` or `method="GET"` correctly and every editable input field must contain a descriptive `name` matching the parameters in the controllers.
- **Templating**: [header.jsp](file:///c:/NetBeansProjects/web%20b%C3%A1n%20xe%20m%C3%A1y/web/common/header.jsp) and [footer.jsp](file:///c:/NetBeansProjects/web%20b%C3%A1n%20xe%20m%C3%A1y/web/common/footer.jsp) are dynamically included using `<jsp:include page="/common/header.jsp" />`.

### D. Security & Session Handling
- Active users are stored in the session under the key `"currentUser"`.
- Filters map to secure URL patterns (e.g. `/admin/*`) to verify whether the logged-in user is authorized.

---

## 6. Guide for Incoming AIs: How to Implement Changes

When working on this project, please follow these guidelines:
1. **Adding/Editing Routes**: Edit [DispatcherServlet.java](file:///c:/NetBeansProjects/web%20b%C3%A1n%20xe%20m%C3%A1y/src/java/com/motorcycle/web/DispatcherServlet.java) to add a route handler, create appropriate methods in the `service` package, and direct the response using either `forward(request, response, "/view.jsp")` or `response.sendRedirect(...)`.
2. **Database Queries**: Write parameterized queries using `PreparedStatement` in the `dao` package. Always close connections, statements, and result sets appropriately or utilize try-with-resources.
3. **Data Encoding**: Always set UTF-8 encoding. The character encoding filters and headers are strictly set up to handle Vietnamese text.
4. **Style Consistency**: Rely on Bootstrap 5 classes coupled with [style.css](file:///c:/NetBeansProjects/web%20b%C3%A1n%20xe%20m%C3%A1y/web/assets/css/style.css) modifications for frontend visual updates. Ensure layout changes look modern, sport-themed, responsive, and visually appealing.
