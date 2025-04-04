-- Create database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'NET1720_RPR231_PRJ_G2_SkincareBookingSystem')
BEGIN
    CREATE DATABASE [NET1720_RPR231_PRJ_G2_SkincareBookingSystem];
END;
GO

USE [NET1720_RPR231_PRJ_G2_SkincareBookingSystem];
GO



-- Create User table
CREATE TABLE [User] (
    [ID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    [Username] NVARCHAR(50) NOT NULL,
    [FullName] NVARCHAR(50) NOT NULL,
    [Password] NVARCHAR(180) NOT NULL,
    [Email] NVARCHAR(100) UNIQUE NOT NULL,
    [Avatar] NVARCHAR(255),
    [Phone] NVARCHAR(20),
    [Gender] NVARCHAR(7) CHECK ([Gender] IN ('Male','Female','N/A')) NOT NULL,
    [Role] NVARCHAR(8) CHECK ([Role] IN ('Admin', 'Employee', 'Customer')) NOT NULL,
    [Status] NVARCHAR(8) CHECK ([Status] IN ('Active', 'Inactive', 'Removed')) NOT NULL,
    [Rating] FLOAT DEFAULT 0,
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME DEFAULT GETDATE()
);
GO

-- Create Transaction table
CREATE TABLE [Transaction] (
    [ID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    [UserID] UNIQUEIDENTIFIER NOT NULL,
    [Amount] FLOAT NOT NULL,
    [PaymentMethod] NVARCHAR(50) CHECK ([PaymentMethod] IN ('Cash', 'Card', 'Online')) NOT NULL,
    [Timestamp] DATETIME DEFAULT GETDATE() NOT NULL,
    [Status] NVARCHAR(50) CHECK ([Status] IN ('Success', 'Failed', 'Pending')) NOT NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME DEFAULT GETDATE(),
    FOREIGN KEY ([UserID]) REFERENCES [User]([ID])
);
GO

