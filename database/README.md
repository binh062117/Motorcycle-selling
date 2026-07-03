# MotorcycleSalesDB

Database SQL Server cho web bán xe máy.

## Kết nối local

- Server: `.\GIAHUNG`
- Database: `MotorcycleSalesDB`
- SQL user: `motorcycle_app`
- SQL password: `Motorcycle@123`

JDBC URL:

```text
jdbc:sqlserver://localhost\GIAHUNG;databaseName=MotorcycleSalesDB;encrypt=true;trustServerCertificate=true
```

## Chạy lại database

```powershell
sqlcmd -S .\GIAHUNG -E -b -i database\schema.sql
sqlcmd -S .\GIAHUNG -E -b -i database\seed.sql
```

Tài khoản test:

- Admin: `admin@ducati.local` / `admin123`
- Customer: `enzo@ferrari.it` / `123456`

