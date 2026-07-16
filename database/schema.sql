IF DB_ID(N'MotorcycleSalesDB') IS NULL
BEGIN
    CREATE DATABASE MotorcycleSalesDB;
END;
GO

IF SUSER_ID(N'motorcycle_app') IS NULL
BEGIN
    CREATE LOGIN motorcycle_app WITH PASSWORD = 'Motorcycle@123', CHECK_POLICY = OFF;
END;
GO

USE MotorcycleSalesDB;
GO

IF USER_ID(N'motorcycle_app') IS NULL
BEGIN
    CREATE USER motorcycle_app FOR LOGIN motorcycle_app;
END;
ALTER ROLE db_owner ADD MEMBER motorcycle_app;
GO

IF OBJECT_ID(N'dbo.notifications', N'U') IS NOT NULL DROP TABLE dbo.notifications;
IF OBJECT_ID(N'dbo.reviews', N'U') IS NOT NULL DROP TABLE dbo.reviews;
IF OBJECT_ID(N'dbo.payments', N'U') IS NOT NULL DROP TABLE dbo.payments;
IF OBJECT_ID(N'dbo.order_details', N'U') IS NOT NULL DROP TABLE dbo.order_details;
IF OBJECT_ID(N'dbo.orders', N'U') IS NOT NULL DROP TABLE dbo.orders;
IF OBJECT_ID(N'dbo.vouchers', N'U') IS NOT NULL DROP TABLE dbo.vouchers;
IF OBJECT_ID(N'dbo.products', N'U') IS NOT NULL DROP TABLE dbo.products;
IF OBJECT_ID(N'dbo.categories', N'U') IS NOT NULL DROP TABLE dbo.categories;
IF OBJECT_ID(N'dbo.brands', N'U') IS NOT NULL DROP TABLE dbo.brands;
IF OBJECT_ID(N'dbo.users', N'U') IS NOT NULL DROP TABLE dbo.users;
IF OBJECT_ID(N'dbo.roles', N'U') IS NOT NULL DROP TABLE dbo.roles;
GO

CREATE TABLE dbo.roles (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_roles PRIMARY KEY,
    name NVARCHAR(50) NOT NULL CONSTRAINT uq_roles_name UNIQUE,
    created_at DATETIME2 NOT NULL CONSTRAINT df_roles_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_roles_updated_at DEFAULT SYSUTCDATETIME()
);

CREATE TABLE dbo.users (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_users PRIMARY KEY,
    first_name NVARCHAR(80) NOT NULL,
    last_name NVARCHAR(80) NOT NULL,
    email NVARCHAR(160) NOT NULL CONSTRAINT uq_users_email UNIQUE,
    phone NVARCHAR(30) NULL,
    address NVARCHAR(255) NULL,
    avatar_url NVARCHAR(500) NULL,
    password_hash NVARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    is_active BIT NOT NULL CONSTRAINT df_users_is_active DEFAULT 1,
    reset_token NVARCHAR(120) NULL,
    created_at DATETIME2 NOT NULL CONSTRAINT df_users_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_users_updated_at DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_users_roles FOREIGN KEY (role_id) REFERENCES dbo.roles(id)
);
CREATE INDEX ix_users_role ON dbo.users(role_id);

CREATE TABLE dbo.brands (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_brands PRIMARY KEY,
    name NVARCHAR(120) NOT NULL CONSTRAINT uq_brands_name UNIQUE,
    origin NVARCHAR(120) NULL,
    logo_url NVARCHAR(1000) NULL,
    created_at DATETIME2 NOT NULL CONSTRAINT df_brands_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_brands_updated_at DEFAULT SYSUTCDATETIME()
);

CREATE TABLE dbo.categories (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_categories PRIMARY KEY,
    name NVARCHAR(120) NOT NULL CONSTRAINT uq_categories_name UNIQUE,
    description NVARCHAR(500) NULL,
    created_at DATETIME2 NOT NULL CONSTRAINT df_categories_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_categories_updated_at DEFAULT SYSUTCDATETIME()
);

CREATE TABLE dbo.products (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_products PRIMARY KEY,
    name NVARCHAR(180) NOT NULL,
    sku NVARCHAR(80) NOT NULL CONSTRAINT uq_products_sku UNIQUE,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    product_type NVARCHAR(30) NOT NULL CONSTRAINT df_products_product_type DEFAULT N'MOTORCYCLE',
    price DECIMAL(18,2) NOT NULL,
    stock INT NOT NULL CONSTRAINT df_products_stock DEFAULT 0,
    displacement NVARCHAR(60) NULL,
    horsepower NVARCHAR(60) NULL,
    weight NVARCHAR(60) NULL,
    image_url NVARCHAR(1000) NULL,
    description NVARCHAR(MAX) NULL,
    is_active BIT NOT NULL CONSTRAINT df_products_is_active DEFAULT 1,
    created_at DATETIME2 NOT NULL CONSTRAINT df_products_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_products_updated_at DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_products_brands FOREIGN KEY (brand_id) REFERENCES dbo.brands(id),
    CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES dbo.categories(id),
    CONSTRAINT ck_products_type CHECK (product_type IN (N'MOTORCYCLE', N'ACCESSORY', N'PART', N'SERVICE')),
    CONSTRAINT ck_products_price CHECK (price >= 0),
    CONSTRAINT ck_products_stock CHECK (stock >= 0)
);
CREATE INDEX ix_products_brand ON dbo.products(brand_id);
CREATE INDEX ix_products_category ON dbo.products(category_id);
CREATE INDEX ix_products_active ON dbo.products(is_active);
CREATE INDEX ix_products_type ON dbo.products(product_type);

CREATE TABLE dbo.vouchers (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_vouchers PRIMARY KEY,
    code NVARCHAR(40) NOT NULL CONSTRAINT uq_vouchers_code UNIQUE,
    discount_percent DECIMAL(5,2) NOT NULL,
    is_active BIT NOT NULL CONSTRAINT df_vouchers_is_active DEFAULT 1,
    created_at DATETIME2 NOT NULL CONSTRAINT df_vouchers_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_vouchers_updated_at DEFAULT SYSUTCDATETIME(),
    CONSTRAINT ck_vouchers_discount CHECK (discount_percent >= 0 AND discount_percent <= 100)
);

CREATE TABLE dbo.orders (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_orders PRIMARY KEY,
    code NVARCHAR(60) NOT NULL CONSTRAINT uq_orders_code UNIQUE,
    customer_id INT NOT NULL,
    showroom NVARCHAR(255) NULL,
    appointment_date DATE NULL,
    appointment_time NVARCHAR(30) NULL,
    payment_method NVARCHAR(40) NULL,
    status NVARCHAR(80) NOT NULL CONSTRAINT df_orders_status DEFAULT N'Chờ duyệt',
    total DECIMAL(18,2) NOT NULL CONSTRAINT df_orders_total DEFAULT 0,
    created_at DATETIME2 NOT NULL CONSTRAINT df_orders_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_orders_updated_at DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_orders_users FOREIGN KEY (customer_id) REFERENCES dbo.users(id),
    CONSTRAINT ck_orders_total CHECK (total >= 0)
);
CREATE INDEX ix_orders_customer ON dbo.orders(customer_id);
CREATE INDEX ix_orders_status ON dbo.orders(status);

CREATE TABLE dbo.order_details (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_order_details PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    color NVARCHAR(80) NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(18,2) NOT NULL,
    created_at DATETIME2 NOT NULL CONSTRAINT df_order_details_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_order_details_updated_at DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES dbo.orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_order_details_products FOREIGN KEY (product_id) REFERENCES dbo.products(id),
    CONSTRAINT ck_order_details_quantity CHECK (quantity > 0),
    CONSTRAINT ck_order_details_price CHECK (unit_price >= 0)
);
CREATE INDEX ix_order_details_order ON dbo.order_details(order_id);

CREATE TABLE dbo.payments (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_payments PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(18,2) NOT NULL,
    provider NVARCHAR(40) NOT NULL,
    transaction_code NVARCHAR(120) NULL,
    status NVARCHAR(40) NOT NULL,
    created_at DATETIME2 NOT NULL CONSTRAINT df_payments_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_payments_updated_at DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_payments_orders FOREIGN KEY (order_id) REFERENCES dbo.orders(id),
    CONSTRAINT ck_payments_amount CHECK (amount >= 0)
);
CREATE INDEX ix_payments_order ON dbo.payments(order_id);
CREATE UNIQUE INDEX ux_payments_vnpay_transaction
    ON dbo.payments(order_id, provider, transaction_code)
    WHERE transaction_code IS NOT NULL;

CREATE TABLE dbo.reviews (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_reviews PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT NOT NULL,
    comment NVARCHAR(1000) NULL,
    created_at DATETIME2 NOT NULL CONSTRAINT df_reviews_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_reviews_updated_at DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_reviews_users FOREIGN KEY (user_id) REFERENCES dbo.users(id),
    CONSTRAINT fk_reviews_products FOREIGN KEY (product_id) REFERENCES dbo.products(id),
    CONSTRAINT ck_reviews_rating CHECK (rating BETWEEN 1 AND 5)
);
CREATE INDEX ix_reviews_product ON dbo.reviews(product_id);

CREATE TABLE dbo.notifications (
    id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_notifications PRIMARY KEY,
    user_id INT NOT NULL,
    title NVARCHAR(160) NOT NULL,
    message NVARCHAR(1000) NOT NULL,
    is_read BIT NOT NULL CONSTRAINT df_notifications_is_read DEFAULT 0,
    created_at DATETIME2 NOT NULL CONSTRAINT df_notifications_created_at DEFAULT SYSUTCDATETIME(),
    updated_at DATETIME2 NOT NULL CONSTRAINT df_notifications_updated_at DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_notifications_users FOREIGN KEY (user_id) REFERENCES dbo.users(id)
);
CREATE INDEX ix_notifications_user ON dbo.notifications(user_id);
GO
