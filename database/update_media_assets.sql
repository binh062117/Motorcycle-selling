USE MotorcycleSalesDB;
GO

IF COL_LENGTH('dbo.brands', 'logo_url') IS NULL
BEGIN
    ALTER TABLE dbo.brands ADD logo_url NVARCHAR(1000) NULL;
END;
GO

UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/ducati.png' WHERE name = N'Ducati';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/honda.png' WHERE name = N'Honda';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/yamaha.png' WHERE name = N'Yamaha';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/suzuki.png' WHERE name = N'Suzuki';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/piaggio.png' WHERE name = N'Piaggio';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/kawasaki.png' WHERE name = N'Kawasaki';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/agv.png' WHERE name = N'AGV';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/shoei.png' WHERE name = N'Shoei';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/motul.png' WHERE name = N'Motul';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/brembo.png' WHERE name = N'Brembo';
UPDATE dbo.brands SET logo_url = N'assets/img/brands/original/michelin.png' WHERE name = N'Michelin';
GO

UPDATE dbo.products SET image_url = N'assets/img/products/superbike.svg' WHERE sku IN (N'DUC-PV4R-2026', N'HON-CBR-2026', N'YAM-R1M-2026', N'KAW-ZX10R-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/naked.svg' WHERE sku IN (N'DUC-SFV4-2026', N'DUC-MON-2026', N'HON-WINNERX-2026', N'SUZ-RAIDER-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/adventure.svg' WHERE sku = N'DUC-DX-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/scooter.svg' WHERE sku IN (N'HON-AB160-2026', N'YAM-GRANDE-2026', N'PIO-SPRINTS-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/parts.svg' WHERE sku IN (N'MOT-300V-10W40', N'BRE-PAD-FRONT', N'MIC-ROAD6-180');
UPDATE dbo.products SET image_url = N'assets/img/products/service.svg' WHERE sku IN (N'SVC-1000KM', N'SVC-ABS-BRAKE');

UPDATE dbo.products SET image_url = N'https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67'
WHERE sku = N'DUC-PV4R-2026';
UPDATE dbo.products SET image_url = N'https://lh3.googleusercontent.com/aida-public/AB6AXuAdKorEA5p1QaRZfD9I48o79FNOC7NyiKtFTK8QD43Xo-Ra6Dz2jw-CHFFLuvoVm5bI_t_vlOFiVAs3kp7sRtfYgdv6ElZqsbRgkPeSJffTMxIy1mzoeLAlMiJ_kHyTg7rimhxUeJktaVfSuac8eQS288HTBRiy1MI8rj9cbBRMawtNZnTix0r4X-DUMMRL8P_gu3nkU_6QyvOWcFy5UyUX0r-k044QU0y1Ijdf5TUhlEWiFJwjomAnK2DSAzo4KSP_J1TlKLSSTIwB'
WHERE sku = N'DUC-SFV4-2026';
UPDATE dbo.products SET image_url = N'https://lh3.googleusercontent.com/aida-public/AB6AXuCBXWGA3Q6A06Fdqg9k14jbsUfBP6Man3goQ1exH_nI-_FVJo1bOLlK5VLe20yFR7mGUrI6udKwF7qwDXo4I-O3ER6C0kCwC7a8c15cenbmUH_XcQ2BLMVRVM3KpQghrWFtTS7D76GS4FE0yFFaC0DnR49cD1XlvZfbnSMkFuE7tv98VZIMc5IQP1ZW_dIkso8lU9vbT3YkRehoQqo6OeXL3QHVrduBq6-tcwe__PhbF687tVRrgP9F9vu-fvvA3PedOi3remkBKknn'
WHERE sku = N'DUC-DX-2026';
UPDATE dbo.products SET image_url = N'https://lh3.googleusercontent.com/aida-public/AB6AXuBif3qRnlXx-AZkEKd1Go_V6_BZ2Wr5--I9X9hM8CdRdYpjfmPUC3QcYS0r-PlMia_o8Y_J1Ja6kJdY3Q6wq_g7tQuH_sCbvNsTFII2Y9G2VC300DzkfD45Aoie_l6tu1NKZJWaMQKcyVFtySzGmcLkfvu__TcFOvSECrDRD4TKaJ3tt1QoPzwa9LC4_g2Uyv69hhla3EGZWFXy7hPA2hHpouE1gErb0SkvBEKwvpiEKH9ByMjNweT6dqq1k7QdkcXeMUsd6NzQWPE4'
WHERE sku = N'DUC-MON-2026';

UPDATE dbo.products SET image_url = N'assets/img/products/real/panigale-v4-r.jpg' WHERE sku = N'DUC-PV4R-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/streetfighter-v4-sp2.png' WHERE sku = N'DUC-SFV4-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/cbr1000rr-r.jpg' WHERE sku = N'HON-CBR-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/yzf-r1m.png' WHERE sku = N'YAM-R1M-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/monster-sp.jpg' WHERE sku = N'DUC-MON-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/exciter-155-vva.png' WHERE sku = N'YAM-EX155-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/z900-se.png' WHERE sku = N'KAW-Z900SE-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/agv-pista-gp-rr.png' WHERE sku = N'AGV-PISTAGPRR';
UPDATE dbo.products SET image_url = N'assets/img/products/real/shoei-x-fifteen.png' WHERE sku = N'SHO-X15';
GO

UPDATE dbo.products
SET name = N'CB1000R',
    sku = N'HON-CB1000R-2026',
    brand_id = 2,
    category_id = 2,
    product_type = N'MOTORCYCLE',
    price = 468000000,
    stock = 10,
    displacement = N'998 cc',
    horsepower = N'143 hp',
    weight = N'212 kg',
    image_url = N'assets/img/products/real/cb1000r.png',
    description = N'Honda neo sports cafe liter-class naked bike with inline-four performance.'
WHERE sku IN (N'HON-WINNERX-2026', N'HON-CB1000R-2026') OR name = N'Winner X 150';

UPDATE dbo.products
SET name = N'CBR1000RR',
    sku = N'HON-CBR1000RR-2026',
    brand_id = 2,
    category_id = 1,
    product_type = N'MOTORCYCLE',
    price = 949000000,
    stock = 6,
    displacement = N'999 cc',
    horsepower = N'214 hp',
    weight = N'201 kg',
    image_url = N'assets/img/products/real/cbr1000rr.png',
    description = N'Honda Fireblade superbike tuned for high-speed sport performance.'
WHERE sku IN (N'HON-AB160-2026', N'HON-CBR1000RR-2026') OR name = N'Air Blade 160';

UPDATE dbo.products
SET name = N'MT-10',
    sku = N'YAM-MT10-2026',
    brand_id = 3,
    category_id = 2,
    product_type = N'MOTORCYCLE',
    price = 469000000,
    stock = 9,
    displacement = N'998 cc',
    horsepower = N'164 hp',
    weight = N'212 kg',
    image_url = N'assets/img/products/real/mt-10.png',
    description = N'Yamaha hyper naked motorcycle with crossplane liter-class engine.'
WHERE sku IN (N'YAM-GRANDE-2026', N'YAM-MT10-2026') OR name = N'Grande Hybrid';

UPDATE dbo.products
SET name = N'GSX-1300R Hayabusa',
    sku = N'SUZ-HAYABUSA-2026',
    brand_id = 4,
    category_id = 1,
    product_type = N'MOTORCYCLE',
    price = 569000000,
    stock = 5,
    displacement = N'1340 cc',
    horsepower = N'187 hp',
    weight = N'264 kg',
    image_url = N'assets/img/products/real/hayabusa.png',
    description = N'Suzuki legendary hypersport motorcycle built for long-distance speed.'
WHERE sku IN (N'SUZ-RAIDER-2026', N'SUZ-HAYABUSA-2026') OR name = N'Raider R150';

UPDATE dbo.products SET image_url = N'assets/img/products/real/desertx-discovery.png' WHERE sku = N'DUC-DX-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/vespa-sprint-s.png' WHERE sku = N'PIO-SPRINTS-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/zx10r.png' WHERE sku = N'KAW-ZX10R-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/exciter-155-vva.png' WHERE sku = N'YAM-EX155-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/z900-se.png' WHERE sku = N'KAW-Z900SE-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/real/agv-pista-gp-rr.png' WHERE sku = N'AGV-PISTAGPRR';
UPDATE dbo.products SET image_url = N'assets/img/products/real/shoei-x-fifteen.png' WHERE sku = N'SHO-X15';
UPDATE dbo.products SET image_url = N'assets/img/products/real/motul-300v.png' WHERE sku = N'MOT-300V-10W40';
UPDATE dbo.products SET image_url = N'assets/img/products/real/brembo-pads.png' WHERE sku = N'BRE-PAD-FRONT';
UPDATE dbo.products SET image_url = N'assets/img/products/real/michelin-road6.png' WHERE sku = N'MIC-ROAD6-180';
UPDATE dbo.products SET image_url = N'assets/img/products/real/service-1000km.png' WHERE sku = N'SVC-1000KM';
UPDATE dbo.products SET image_url = N'assets/img/products/real/abs-brake-service.png' WHERE sku = N'SVC-ABS-BRAKE';
GO
