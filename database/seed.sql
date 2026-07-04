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
    (1, N'Ducati', N'Ý', N'assets/img/brands/original/ducati.png'),
    (2, N'Honda', N'Nhật Bản', N'assets/img/brands/original/honda.png'),
    (3, N'Yamaha', N'Nhật Bản', N'assets/img/brands/original/yamaha.png'),
    (4, N'Suzuki', N'Nhật Bản', N'assets/img/brands/original/suzuki.png'),
    (5, N'Piaggio', N'Ý', N'assets/img/brands/original/piaggio.png'),
    (6, N'Kawasaki', N'Nhật Bản', N'assets/img/brands/original/kawasaki.png'),
    (7, N'AGV', N'Ý', N'assets/img/brands/original/agv.png'),
    (8, N'Shoei', N'Nhật Bản', N'assets/img/brands/original/shoei.png'),
    (9, N'Motul', N'Pháp', N'assets/img/brands/original/motul.png'),
    (10, N'Brembo', N'Ý', N'assets/img/brands/original/brembo.png'),
    (11, N'Michelin', N'Pháp', N'assets/img/brands/original/michelin.png');
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
    (7, N'CB1000R', N'HON-CB1000R-2026', 2, 2, N'MOTORCYCLE', 468000000, 10, N'998 cc', N'143 hp', N'212 kg', N'assets/img/products/real/cb1000r.png', N'Honda neo sports cafe liter-class naked bike with inline-four performance.', 1),
    (8, N'CBR1000RR', N'HON-CBR1000RR-2026', 2, 1, N'MOTORCYCLE', 949000000, 6, N'999 cc', N'214 hp', N'201 kg', N'assets/img/products/real/cbr1000rr.png', N'Honda Fireblade superbike tuned for high-speed sport performance.', 1),
    (9, N'Exciter 155 VVA', N'YAM-EX155-2026', 3, 6, N'MOTORCYCLE', 52000000, 18, N'155 cc', NULL, N'121 kg', N'assets/img/products/real/exciter-155-vva.png', N'Sport underbone motorcycle with VVA engine.', 1),
    (10, N'MT-10', N'YAM-MT10-2026', 3, 2, N'MOTORCYCLE', 469000000, 9, N'998 cc', N'164 hp', N'212 kg', N'assets/img/products/real/mt-10.png', N'Yamaha hyper naked motorcycle with crossplane liter-class engine.', 1),
    (11, N'GSX-1300R Hayabusa', N'SUZ-HAYABUSA-2026', 4, 1, N'MOTORCYCLE', 569000000, 5, N'1340 cc', N'187 hp', N'264 kg', N'assets/img/products/real/hayabusa.png', N'Suzuki legendary hypersport motorcycle built for long-distance speed.', 1),
    (12, N'Vespa Sprint S 150', N'PIO-SPRINTS-2026', 5, 5, N'MOTORCYCLE', 92000000, 9, N'150 cc', NULL, N'130 kg', NULL, N'Italian premium scooter.', 1),
    (13, N'Ninja ZX-10R', N'KAW-ZX10R-2026', 6, 1, N'MOTORCYCLE', 729000000, 6, N'998 cc', N'203 hp', N'207 kg', NULL, N'Kawasaki liter-class superbike.', 1),
    (14, N'Z900 SE', N'KAW-Z900SE-2026', 6, 2, N'MOTORCYCLE', 299000000, 8, N'948 cc', N'123 hp', N'212 kg', N'assets/img/products/real/z900-se.png', N'Middleweight naked bike for street performance.', 1),
    (15, N'AGV Pista GP RR Helmet', N'AGV-PISTAGPRR', 7, 7, N'ACCESSORY', 33900000, 20, NULL, NULL, N'1450 g', N'assets/img/products/real/agv-pista-gp-rr.png', N'Carbon full-face racing helmet.', 1),
    (16, N'Shoei X-Fifteen Helmet', N'SHO-X15', 8, 7, N'ACCESSORY', 18900000, 25, NULL, NULL, N'1550 g', N'assets/img/products/real/shoei-x-fifteen.png', N'Premium full-face helmet for sport riding.', 1),
    (17, N'Motul 300V 10W40 1L', N'MOT-300V-10W40', 9, 8, N'PART', 520000, 120, NULL, NULL, NULL, NULL, N'High-performance synthetic engine oil.', 1),
    (18, N'Brembo Front Brake Pads Sintered', N'BRE-PAD-FRONT', 10, 9, N'PART', 1850000, 60, NULL, NULL, NULL, NULL, N'Sintered front brake pads for sport motorcycles.', 1),
    (19, N'Michelin Road 6 Tire 180/55ZR17', N'MIC-ROAD6-180', 11, 10, N'PART', 5200000, 40, NULL, NULL, NULL, NULL, N'Sport touring rear tire.', 1),
    (20, N'Gói bảo dưỡng 1.000 km', N'SVC-1000KM', 1, 11, N'SERVICE', 1500000, 999, NULL, NULL, NULL, NULL, N'Initial maintenance service package.', 1),
    (21, N'Gói bảo dưỡng phanh ABS', N'SVC-ABS-BRAKE', 10, 11, N'SERVICE', 2200000, 999, NULL, NULL, NULL, NULL, N'Brake inspection, cleaning and ABS diagnostics.', 1);
SET IDENTITY_INSERT dbo.products OFF;

UPDATE dbo.products SET image_url = N'assets/img/products/superbike.svg' WHERE sku IN (N'DUC-PV4R-2026', N'HON-CBR-2026', N'YAM-R1M-2026', N'KAW-ZX10R-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/naked.svg' WHERE sku IN (N'DUC-SFV4-2026', N'DUC-MON-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/adventure.svg' WHERE sku = N'DUC-DX-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/scooter.svg' WHERE sku IN (N'PIO-SPRINTS-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/parts.svg' WHERE sku IN (N'MOT-300V-10W40', N'BRE-PAD-FRONT', N'MIC-ROAD6-180');
UPDATE dbo.products SET image_url = N'assets/img/products/service.svg' WHERE sku IN (N'SVC-1000KM', N'SVC-ABS-BRAKE');

UPDATE dbo.products SET image_url = N'https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67' WHERE sku = N'DUC-PV4R-2026';
UPDATE dbo.products SET image_url = N'https://lh3.googleusercontent.com/aida-public/AB6AXuAdKorEA5p1QaRZfD9I48o79FNOC7NyiKtFTK8QD43Xo-Ra6Dz2jw-CHFFLuvoVm5bI_t_vlOFiVAs3kp7sRtfYgdv6ElZqsbRgkPeSJffTMxIy1mzoeLAlMiJ_kHyTg7rimhxUeJktaVfSuac8eQS288HTBRiy1MI8rj9cbBRMawtNZnTix0r4X-DUMMRL8P_gu3nkU_6QyvOWcFy5UyUX0r-k044QU0y1Ijdf5TUhlEWiFJwjomAnK2DSAzo4KSP_J1TlKLSSTIwB' WHERE sku = N'DUC-SFV4-2026';
UPDATE dbo.products SET image_url = N'https://lh3.googleusercontent.com/aida-public/AB6AXuCBXWGA3Q6A06Fdqg9k14jbsUfBP6Man3goQ1exH_nI-_FVJo1bOLlK5VLe20yFR7mGUrI6udKwF7qwDXo4I-O3ER6C0kCwC7a8c15cenbmUH_XcQ2BLMVRVM3KpQghrWFtTS7D76GS4FE0yFFaC0DnR49cD1XlvZfbnSMkFuE7tv98VZIMc5IQP1ZW_dIkso8lU9vbT3YkRehoQqo6OeXL3QHVrduBq6-tcwe__PhbF687tVRrgP9F9vu-fvvA3PedOi3remkBKknn' WHERE sku = N'DUC-DX-2026';
UPDATE dbo.products SET image_url = N'https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4' WHERE sku = N'DUC-MON-2026';

UPDATE dbo.products SET image_url = N'assets/img/products/real/panigale-v4-r.jpg' WHERE sku = N'DUC-PV4R-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/streetfighter-v4-sp2.png' WHERE sku = N'DUC-SFV4-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/cbr1000rr-r.jpg' WHERE sku = N'HON-CBR-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/yzf-r1m.png' WHERE sku = N'YAM-R1M-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/monster-sp.jpg' WHERE sku = N'DUC-MON-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/exciter-155-vva.png' WHERE sku = N'YAM-EX155-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/z900-se.png' WHERE sku = N'KAW-Z900SE-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/agv-pista-gp-rr.png' WHERE sku = N'AGV-PISTAGPRR';
UPDATE dbo.products SET image_url = N'assets/img/products/real/shoei-x-fifteen.png' WHERE sku = N'SHO-X15';
UPDATE dbo.products SET image_url = N'assets/img/products/real/desertx-discovery.png' WHERE sku = N'DUC-DX-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/vespa-sprint-s.png' WHERE sku = N'PIO-SPRINTS-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/zx10r.png' WHERE sku = N'KAW-ZX10R-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/motul-300v.png' WHERE sku = N'MOT-300V-10W40';
UPDATE dbo.products SET image_url = N'assets/img/products/real/brembo-pads.png' WHERE sku = N'BRE-PAD-FRONT';
UPDATE dbo.products SET image_url = N'assets/img/products/real/michelin-road6.png' WHERE sku = N'MIC-ROAD6-180';
UPDATE dbo.products SET image_url = N'assets/img/products/real/service-1000km.png' WHERE sku = N'SVC-1000KM';
UPDATE dbo.products SET image_url = N'assets/img/products/real/abs-brake-service.png' WHERE sku = N'SVC-ABS-BRAKE';

SET IDENTITY_INSERT dbo.vouchers ON;
INSERT INTO dbo.vouchers (id, code, discount_percent, is_active)
VALUES
    (1, N'DUCATI10', 10, 1),
    (2, N'HELMET5', 5, 1),
    (3, N'SERVICE15', 15, 1);
SET IDENTITY_INSERT dbo.vouchers OFF;
GO
