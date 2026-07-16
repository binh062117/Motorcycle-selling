USE MotorcycleSalesDB;
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'dbo.payments')
      AND name = N'ux_payments_vnpay_transaction'
)
BEGIN
    CREATE UNIQUE INDEX ux_payments_vnpay_transaction
        ON dbo.payments(order_id, provider, transaction_code)
        WHERE transaction_code IS NOT NULL;
END;
GO
