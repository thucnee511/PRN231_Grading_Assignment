-- Create database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'NET1720_RPR231_PRJ_G2_SkincareBookingSystem')
BEGIN
    CREATE DATABASE [NET1720_RPR231_PRJ_G2_SkincareBookingSystem];
END;
GO

USE [NET1720_RPR231_PRJ_G2_SkincareBookingSystem];
GO

-- Create User table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[UserAccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[EmployeeCode] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[RequestCode] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ApplicationCode] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[UserAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TRIGGER [User_Update]
ON [UserAccount]
AFTER UPDATE
AS
BEGIN
    UPDATE [UserAccount]
    SET [ModifiedDate] = GETDATE()
    WHERE [UserAccountID] IN (SELECT [UserAccountID] FROM inserted)
END;
GO

SET IDENTITY_INSERT [dbo].[UserAccount] ON 
GO
INSERT [dbo].[UserAccount] ([UserAccountID], [UserName], [Password], [FullName], [Email], [Phone], [EmployeeCode], [RoleId], [RequestCode], [CreatedDate], [ApplicationCode], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'manager', N'@a', N'Accountant', N'Accountant@', N'0913652742', N'000001', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[UserAccount] ([UserAccountID], [UserName], [Password], [FullName], [Email], [Phone], [EmployeeCode], [RoleId], [RequestCode], [CreatedDate], [ApplicationCode], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'staff', N'@a', N'Internal Auditor', N'InternalAuditor@', N'0972224568', N'000002', 3, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[UserAccount] ([UserAccountID], [UserName], [Password], [FullName], [Email], [Phone], [EmployeeCode], [RoleId], [RequestCode], [CreatedDate], [ApplicationCode], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'admin', N'@a', N'Chief Accountant', N'ChiefAccountant@', N'0902927373', N'000003', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
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

