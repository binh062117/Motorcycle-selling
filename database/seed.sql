USE MotorcycleSalesDB;
GO

SET IDENTITY_INSERT dbo.roles ON;
INSERT INTO dbo.roles (id, name)
VALUES (1, N'Admin'), (2, N'Customer');
SET IDENTITY_INSERT dbo.roles OFF;

SET IDENTITY_INSERT dbo.users ON;
INSERT INTO dbo.users (id, first_name, last_name, email, phone, address, password_hash, role_id, is_active)
VALUES
    (1, N'Admin', N'Ducati', N'admin@ducati.local', N'0900000000', N'FPT University', N'240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 1, 1),
    (2, N'Enzo', N'Ferrari', N'enzo@ferrari.it', N'0912345678', N'Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 2, 1);
SET IDENTITY_INSERT dbo.users OFF;

SET IDENTITY_INSERT dbo.brands ON;
INSERT INTO dbo.brands (id, name, origin, logo_url)
VALUES
    (1, N'Ducati', N'Ý', N'https://cdn.simpleicons.org/ducati/EA1D25'),
    (2, N'Honda', N'Nhật Bản', N'https://cdn.simpleicons.org/honda/EA1D25'),
    (3, N'Yamaha', N'Nhật Bản', N'https://cdn.simpleicons.org/yamaha/EA1D25'),
    (4, N'Suzuki', N'Nhật Bản', N'https://cdn.simpleicons.org/suzuki/EA1D25'),
    (5, N'Piaggio', N'Ý', N'https://cdn.simpleicons.org/piaggio/EA1D25'),
    (6, N'Kawasaki', N'Nhật Bản', N'https://cdn.simpleicons.org/kawasaki/EA1D25'),
    (7, N'AGV', N'Ý', N'https://cdn.simpleicons.org/agv/EA1D25'),
    (8, N'Shoei', N'Nhật Bản', N'https://cdn.simpleicons.org/shoei/EA1D25'),
    (9, N'Motul', N'Pháp', N'https://cdn.simpleicons.org/motul/EA1D25'),
    (10, N'Brembo', N'Ý', N'https://cdn.simpleicons.org/brembo/EA1D25'),
    (11, N'Michelin', N'Pháp', N'https://cdn.simpleicons.org/michelin/EA1D25');
SET IDENTITY_INSERT dbo.brands OFF;

SET IDENTITY_INSERT dbo.categories ON;
INSERT INTO dbo.categories (id, name, description)
VALUES
    (1, N'Superbike', N'Sport performance motorcycles'),
    (2, N'Streetfighter', N'Naked high-performance motorcycles'),
    (3, N'DesertX', N'Adventure motorcycles'),
    (4, N'Monster', N'Urban naked motorcycles'),
    (5, N'Scooter', N'Automatic scooters for city riding'),
    (6, N'Underbone', N'Underbone and clutch city motorcycles'),
    (7, N'Helmet', N'Riding helmets and protection gear'),
    (8, N'Lubricant', N'Engine oil and maintenance fluids'),
    (9, N'Brake Part', N'Brake pads and brake components'),
    (10, N'Tire', N'Motorcycle tires'),
    (11, N'Service Package', N'Workshop maintenance service packages');
SET IDENTITY_INSERT dbo.categories OFF;

SET IDENTITY_INSERT dbo.products ON;
INSERT INTO dbo.products (id, name, sku, brand_id, category_id, product_type, price, stock, displacement, horsepower, weight, image_url, description, is_active)
VALUES
    (1, N'Panigale V4 R', N'DUC-PV4R-2026', 1, 1, N'MOTORCYCLE', 1250000000, 12, N'998 cc', N'218 cv', N'175 kg', N'https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67', N'Ducati flagship superbike.', 1),
    (2, N'Streetfighter V4 SP2', N'DUC-SFV4-2026', 1, 2, N'MOTORCYCLE', 980000000, 8, N'1103 cc', N'208 cv', NULL, NULL, N'Naked high-performance Ducati.', 1),
    (3, N'DesertX Discovery', N'DUC-DX-2026', 1, 3, N'MOTORCYCLE', 689000000, 10, N'937 cc', NULL, NULL, NULL, N'Adventure touring motorcycle.', 1),
    (4, N'Monster SP', N'DUC-MON-2026', 1, 4, N'MOTORCYCLE', 455000000, 15, N'937 cc', NULL, NULL, NULL, N'Urban naked motorcycle.', 1),
    (5, N'CBR1000RR-R Fireblade SP', N'HON-CBR-2026', 2, 1, N'MOTORCYCLE', 950000000, 7, N'1000 cc', N'214 hp', N'201 kg', NULL, N'Honda superbike with track-ready electronics.', 1),
    (6, N'YZF-R1M', N'YAM-R1M-2026', 3, 1, N'MOTORCYCLE', 860000000, 5, N'998 cc', N'200 hp', N'202 kg', NULL, N'Yamaha flagship sportbike.', 1),
    (7, N'Winner X 150', N'HON-WINNERX-2026', 2, 6, N'MOTORCYCLE', 46000000, 30, N'150 cc', N'15.4 hp', N'122 kg', NULL, N'Underbone clutch motorcycle for daily city riding.', 1),
    (8, N'Air Blade 160', N'HON-AB160-2026', 2, 5, N'MOTORCYCLE', 57000000, 24, N'160 cc', NULL, N'114 kg', NULL, N'Premium urban scooter with practical storage.', 1),
    (9, N'Exciter 155 VVA', N'YAM-EX155-2026', 3, 6, N'MOTORCYCLE', 52000000, 18, N'155 cc', NULL, N'121 kg', NULL, N'Sport underbone motorcycle with VVA engine.', 1),
    (10, N'Grande Hybrid', N'YAM-GRANDE-2026', 3, 5, N'MOTORCYCLE', 50000000, 14, N'125 cc', NULL, N'101 kg', NULL, N'Hybrid city scooter.', 1),
    (11, N'Raider R150', N'SUZ-RAIDER-2026', 4, 6, N'MOTORCYCLE', 51000000, 12, N'150 cc', NULL, N'109 kg', NULL, N'Compact sport underbone motorcycle.', 1),
    (12, N'Vespa Sprint S 150', N'PIO-SPRINTS-2026', 5, 5, N'MOTORCYCLE', 92000000, 9, N'150 cc', NULL, N'130 kg', NULL, N'Italian premium scooter.', 1),
    (13, N'Ninja ZX-10R', N'KAW-ZX10R-2026', 6, 1, N'MOTORCYCLE', 729000000, 6, N'998 cc', N'203 hp', N'207 kg', NULL, N'Kawasaki liter-class superbike.', 1),
    (14, N'Z900 SE', N'KAW-Z900SE-2026', 6, 2, N'MOTORCYCLE', 299000000, 8, N'948 cc', N'123 hp', N'212 kg', NULL, N'Middleweight naked bike for street performance.', 1),
    (15, N'AGV Pista GP RR Helmet', N'AGV-PISTAGPRR', 7, 7, N'ACCESSORY', 33900000, 20, NULL, NULL, N'1450 g', NULL, N'Carbon full-face racing helmet.', 1),
    (16, N'Shoei X-Fifteen Helmet', N'SHO-X15', 8, 7, N'ACCESSORY', 18900000, 25, NULL, NULL, N'1550 g', NULL, N'Premium full-face helmet for sport riding.', 1),
    (17, N'Motul 300V 10W40 1L', N'MOT-300V-10W40', 9, 8, N'PART', 520000, 120, NULL, NULL, NULL, NULL, N'High-performance synthetic engine oil.', 1),
    (18, N'Brembo Front Brake Pads Sintered', N'BRE-PAD-FRONT', 10, 9, N'PART', 1850000, 60, NULL, NULL, NULL, NULL, N'Sintered front brake pads for sport motorcycles.', 1),
    (19, N'Michelin Road 6 Tire 180/55ZR17', N'MIC-ROAD6-180', 11, 10, N'PART', 5200000, 40, NULL, NULL, NULL, NULL, N'Sport touring rear tire.', 1),
    (20, N'Gói bảo dưỡng 1.000 km', N'SVC-1000KM', 1, 11, N'SERVICE', 1500000, 999, NULL, NULL, NULL, NULL, N'Initial maintenance service package.', 1),
    (21, N'Gói bảo dưỡng phanh ABS', N'SVC-ABS-BRAKE', 10, 11, N'SERVICE', 2200000, 999, NULL, NULL, NULL, NULL, N'Brake inspection, cleaning and ABS diagnostics.', 1);
SET IDENTITY_INSERT dbo.products OFF;

UPDATE dbo.products SET image_url = N'assets/img/products/superbike.svg' WHERE sku IN (N'DUC-PV4R-2026', N'HON-CBR-2026', N'YAM-R1M-2026', N'KAW-ZX10R-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/naked.svg' WHERE sku IN (N'DUC-SFV4-2026', N'DUC-MON-2026', N'KAW-Z900SE-2026', N'HON-WINNERX-2026', N'YAM-EX155-2026', N'SUZ-RAIDER-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/adventure.svg' WHERE sku = N'DUC-DX-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/scooter.svg' WHERE sku IN (N'HON-AB160-2026', N'YAM-GRANDE-2026', N'PIO-SPRINTS-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/helmet.svg' WHERE sku IN (N'AGV-PISTAGPRR', N'SHO-X15');
UPDATE dbo.products SET image_url = N'assets/img/products/parts.svg' WHERE sku IN (N'MOT-300V-10W40', N'BRE-PAD-FRONT', N'MIC-ROAD6-180');
UPDATE dbo.products SET image_url = N'assets/img/products/service.svg' WHERE sku IN (N'SVC-1000KM', N'SVC-ABS-BRAKE');

SET IDENTITY_INSERT dbo.vouchers ON;
INSERT INTO dbo.vouchers (id, code, discount_percent, is_active)
VALUES
    (1, N'DUCATI10', 10, 1),
    (2, N'HELMET5', 5, 1),
    (3, N'SERVICE15', 15, 1);
SET IDENTITY_INSERT dbo.vouchers OFF;
GO
