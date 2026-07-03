USE MotorcycleSalesDB;
GO

SET IDENTITY_INSERT dbo.roles ON;
INSERT INTO dbo.roles (id, name)
VALUES (1, N'Admin'), (2, N'Customer');
SET IDENTITY_INSERT dbo.roles OFF;

SET IDENTITY_INSERT dbo.users ON;
INSERT INTO dbo.users (id, first_name, last_name, email, phone, address, password_hash, role_id, is_active)
VALUES
    (1, N'Admin', N'Ducati', N'admin@ducati.local', N'0900000000', N'FPT University', N'240be518fabd2724f6a3e456ca58e6048541fdf83340c3ebd313a9016c7f9d77', 1, 1),
    (2, N'Enzo', N'Ferrari', N'enzo@ferrari.it', N'0912345678', N'Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 2, 1);
SET IDENTITY_INSERT dbo.users OFF;

SET IDENTITY_INSERT dbo.brands ON;
INSERT INTO dbo.brands (id, name, origin)
VALUES
    (1, N'Ducati', N'Ý'),
    (2, N'Honda', N'Nhật Bản'),
    (3, N'Yamaha', N'Nhật Bản');
SET IDENTITY_INSERT dbo.brands OFF;

SET IDENTITY_INSERT dbo.categories ON;
INSERT INTO dbo.categories (id, name, description)
VALUES
    (1, N'Superbike', N'Sport performance motorcycles'),
    (2, N'Streetfighter', N'Naked high-performance motorcycles'),
    (3, N'DesertX', N'Adventure motorcycles'),
    (4, N'Monster', N'Urban naked motorcycles');
SET IDENTITY_INSERT dbo.categories OFF;

SET IDENTITY_INSERT dbo.products ON;
INSERT INTO dbo.products (id, name, sku, brand_id, category_id, price, stock, displacement, horsepower, weight, image_url, description, is_active)
VALUES
    (1, N'Panigale V4 R', N'DUC-PV4R-2026', 1, 1, 1250000000, 12, N'998 cc', N'218 cv', N'175 kg', N'https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67', N'Ducati flagship superbike.', 1),
    (2, N'Streetfighter V4 SP2', N'DUC-SFV4-2026', 1, 2, 980000000, 8, N'1103 cc', N'208 cv', NULL, NULL, N'Naked high-performance Ducati.', 1),
    (3, N'DesertX Discovery', N'DUC-DX-2026', 1, 3, 689000000, 10, N'937 cc', NULL, NULL, NULL, N'Adventure touring motorcycle.', 1),
    (4, N'Monster SP', N'DUC-MON-2026', 1, 4, 455000000, 15, N'937 cc', NULL, NULL, NULL, N'Urban naked motorcycle.', 1),
    (5, N'CBR1000RR-R', N'HON-CBR-2026', 2, 1, 950000000, 7, NULL, NULL, NULL, NULL, N'Honda superbike.', 1),
    (6, N'YZF-R1M', N'YAM-R1M-2026', 3, 1, 860000000, 5, NULL, NULL, NULL, NULL, N'Yamaha flagship sportbike.', 1);
SET IDENTITY_INSERT dbo.products OFF;

SET IDENTITY_INSERT dbo.vouchers ON;
INSERT INTO dbo.vouchers (id, code, discount_percent, is_active)
VALUES (1, N'DUCATI10', 10, 1);
SET IDENTITY_INSERT dbo.vouchers OFF;
GO
