USE MotorcycleSalesDB;
GO

IF COL_LENGTH('dbo.brands', 'logo_url') IS NULL
BEGIN
    ALTER TABLE dbo.brands ADD logo_url NVARCHAR(1000) NULL;
END;
GO

UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/ducati/EA1D25' WHERE name = N'Ducati';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/honda/EA1D25' WHERE name = N'Honda';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/yamaha/EA1D25' WHERE name = N'Yamaha';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/suzuki/EA1D25' WHERE name = N'Suzuki';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/piaggio/EA1D25' WHERE name = N'Piaggio';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/kawasaki/EA1D25' WHERE name = N'Kawasaki';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/agv/EA1D25' WHERE name = N'AGV';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/shoei/EA1D25' WHERE name = N'Shoei';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/motul/EA1D25' WHERE name = N'Motul';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/brembo/EA1D25' WHERE name = N'Brembo';
UPDATE dbo.brands SET logo_url = N'https://cdn.simpleicons.org/michelin/EA1D25' WHERE name = N'Michelin';
GO

UPDATE dbo.products SET image_url = N'assets/img/products/superbike.svg' WHERE sku IN (N'DUC-PV4R-2026', N'HON-CBR-2026', N'YAM-R1M-2026', N'KAW-ZX10R-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/naked.svg' WHERE sku IN (N'DUC-SFV4-2026', N'DUC-MON-2026', N'KAW-Z900SE-2026', N'HON-WINNERX-2026', N'YAM-EX155-2026', N'SUZ-RAIDER-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/adventure.svg' WHERE sku = N'DUC-DX-2026';
UPDATE dbo.products SET image_url = N'assets/img/products/scooter.svg' WHERE sku IN (N'HON-AB160-2026', N'YAM-GRANDE-2026', N'PIO-SPRINTS-2026');
UPDATE dbo.products SET image_url = N'assets/img/products/helmet.svg' WHERE sku IN (N'AGV-PISTAGPRR', N'SHO-X15');
UPDATE dbo.products SET image_url = N'assets/img/products/parts.svg' WHERE sku IN (N'MOT-300V-10W40', N'BRE-PAD-FRONT', N'MIC-ROAD6-180');
UPDATE dbo.products SET image_url = N'assets/img/products/service.svg' WHERE sku IN (N'SVC-1000KM', N'SVC-ABS-BRAKE');
GO
