USE MotorcycleSalesDB;
GO

UPDATE dbo.brands SET origin = N'Ý' WHERE name IN (N'Ducati', N'Piaggio', N'AGV', N'Brembo');
UPDATE dbo.brands SET origin = N'Nhật Bản' WHERE name IN (N'Honda', N'Yamaha', N'Suzuki', N'Kawasaki', N'Shoei');
UPDATE dbo.brands SET origin = N'Pháp' WHERE name IN (N'Motul', N'Michelin');
GO

UPDATE dbo.products
SET name = N'Gói bảo dưỡng 1.000 km',
    description = N'Gói bảo dưỡng đầu tiên sau 1.000 km.'
WHERE sku = N'SVC-1000KM';

UPDATE dbo.products
SET name = N'Gói bảo dưỡng phanh ABS',
    description = N'Kiểm tra, vệ sinh phanh và chẩn đoán hệ thống ABS.'
WHERE sku = N'SVC-ABS-BRAKE';
GO
