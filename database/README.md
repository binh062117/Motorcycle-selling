# MotorcycleSalesDB

Database SQL Server cho web bán xe máy.

## Kết nối local

- Server: `.\GIAHUNG`
- JDBC host: `localhost:49679`
- Database: `MotorcycleSalesDB`
- SQL user: `motorcycle_app`
- SQL password: `Motorcycle@123`

JDBC URL:

```text
jdbc:sqlserver://localhost:49679;databaseName=MotorcycleSalesDB;encrypt=true;trustServerCertificate=true
```

## Chạy lại database

```powershell
sqlcmd -S .\GIAHUNG -E -b -i database\schema.sql
sqlcmd -S .\GIAHUNG -E -b -i database\seed.sql
```

Tài khoản test:

- Admin: `admin@ducati.local` / `admin123`
- Customer: `enzo@ferrari.it` / `123456`

Seed hiện có:

- `11` thương hiệu
- `11` danh mục
- `21` sản phẩm gồm xe máy, phụ kiện, phụ tùng và gói dịch vụ
- `3` voucher
