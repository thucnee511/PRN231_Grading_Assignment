CREATE DATABASE [NET1720_PRN231_PRJ_G2_SkinCareBookingSystem]
USE [NET1720_PRN231_PRJ_G2_SkinCareBookingSystem]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategories]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategories](
	[ID] [uniqueidentifier] NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogImages]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogImages](
	[ID] [uniqueidentifier] NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[ImageUrl] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[BookingDate] [datetime] NOT NULL,
	[CancelReason] [nvarchar](max) NULL,
	[Status] [nvarchar](9) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[ID] [uniqueidentifier] NOT NULL,
	[BookingID] [uniqueidentifier] NOT NULL,
	[ServiceID] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Rating] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ServiceID] [uniqueidentifier] NULL,
	[EmployeeID] [uniqueidentifier] NULL,
	[OrderID] [uniqueidentifier] NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[WorkDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[Title] [varchar](255) NULL,
	[Description] [text] NULL,
	[Location] [varchar](255) NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategories]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategories](
	[ID] [uniqueidentifier] NOT NULL,
	[ServiceID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceImages]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceImages](
	[ID] [uniqueidentifier] NOT NULL,
	[ServiceID] [uniqueidentifier] NOT NULL,
	[ImageUrl] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Duration] [int] NOT NULL,
	[Rating] [float] NULL,
	[Status] [nvarchar](11) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestAnswerDetails]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestAnswerDetails](
	[ID] [uniqueidentifier] NOT NULL,
	[TestAnswerID] [uniqueidentifier] NOT NULL,
	[SelectionNumber] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestAnswers]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestAnswers](
	[ID] [uniqueidentifier] NOT NULL,
	[TestID] [uniqueidentifier] NOT NULL,
	[QuestionNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestResults]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestResults](
	[ID] [uniqueidentifier] NOT NULL,
	[TestID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/4/2025 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](180) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NULL,
	[Gender] [nvarchar](7) NOT NULL,
	[Role] [nvarchar](8) NOT NULL,
	[Status] [nvarchar](8) NOT NULL,
	[Rating] [float] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 4/4/2025 11:38:38 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'3eec7b50-0f31-4d2e-8355-0cc62e68119e', N'13327314-9420-459c-b825-564b4ff13a79', CAST(N'2025-04-07T09:30:00.000' AS DateTime), N'Offline', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Day Off', N'Unavailable for work.', N'N/A', N'On leave.')
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'a8f6715f-f115-46bc-8b59-25f575b2e05e', N'1fb38aa7-c140-445c-9259-6eb47dd0c93e', CAST(N'2025-04-08T08:00:00.000' AS DateTime), N'Work', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Prep Time', N'Prepare rooms before appointments.', N'Front Desk', N'Check inventory.')
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'2b1f6c5b-2e01-4812-8f42-6a5ee1ad8d42', N'6ee0cb64-de6d-4c82-b99b-50bfca5f7971', CAST(N'2025-04-06T15:00:00.000' AS DateTime), N'Work', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Treatment Session', N'Hydrating facial treatment', N'Room A2', N'Client has sensitive skin.')
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'749689b0-6b34-4418-8e36-7bf25a3a2fe6', N'21bc20ef-0689-41bb-801a-290300c1375b', CAST(N'2025-04-06T10:00:00.000' AS DateTime), N'Work', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Consultation Block', N'Free consultations for first-time clients.', N'Consult Room B', N'Expect new walk-ins.')
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'0d2f6f51-2f3e-4e7e-a738-8605f0d53619', N'9c338460-a2ea-4915-a16a-5e0e45b03a3c', CAST(N'2025-04-07T14:00:00.000' AS DateTime), N'Work', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Afternoon Treatments', N'Three back-to-back sessions.', N'Room B1', N'Client #2 has allergies.')
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'700f743a-7db8-4cc6-9e72-8761c6d88333', N'babedc74-fd23-4e3c-a687-c1f6513e970c', CAST(N'2025-04-09T16:00:00.000' AS DateTime), N'Offline', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Unavailable', N'User is out of office.', N'N/A', N'Schedule resumes tomorrow.')
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'9d65919c-35be-40e9-b76b-92c42dc03b62', N'176a8f33-7b82-40fe-9be9-0037ca98e207', CAST(N'2025-04-05T09:00:00.000' AS DateTime), N'Work', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Morning Shift', N'Skin therapist session with 3 clients.', N'Room A1', N'Bring extra supplies.')
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'2e7b987f-b367-4257-b846-a4c099ef9f44', N'd0e644e3-996b-4eb6-9b4b-218cb11e0afe', CAST(N'2025-04-05T13:00:00.000' AS DateTime), N'Offline', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Offline Time', N'Not available for work today.', N'N/A', N'Scheduled time off.')
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'e28513a5-5cb2-4124-9f57-b52635acad3a', N'cf6aac4a-b661-4510-a883-962e1cdd9dbf', CAST(N'2025-04-09T10:30:00.000' AS DateTime), N'Work', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Client Session', N'Facial treatment for new client.', N'Room A3', N'Offer discount card.')
GO
INSERT [dbo].[Schedule] ([ID], [UserID], [WorkDate], [Status], [CreatedAt], [UpdatedAt], [Title], [Description], [Location], [Notes]) VALUES (N'1dfa750f-13ae-4d88-b9e8-ea83d9ad943a', N'8502ecea-7139-4b49-b4c1-9270d79497c2', CAST(N'2025-04-08T12:00:00.000' AS DateTime), N'Offline', CAST(N'2025-04-04T08:11:35.667' AS DateTime), CAST(N'2025-04-04T08:11:35.667' AS DateTime), N'Lunch Break', N'Unavailable during lunch hours.', N'N/A', N'Quick break from 12 1 PM.')
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'176a8f33-7b82-40fe-9be9-0037ca98e207', N'linda88', N'Linda Park', N'hashed_password_10', N'linda@example.com', N'avatar10.jpg', N'0912345680', N'Female', N'Customer', N'Active', 4.4, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'd0e644e3-996b-4eb6-9b4b-218cb11e0afe', N'kevin23', N'Kevin Lee', N'hashed_password_7', N'kevin@example.com', N'avatar7.jpg', N'0912345677', N'Male', N'Customer', N'Active', 4.3, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'21bc20ef-0689-41bb-801a-290300c1375b', N'michael22', N'Michael Johnson', N'hashed_password_5', N'michael@example.com', N'avatar5.jpg', N'0912345675', N'Male', N'Customer', N'Inactive', 3.5, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'6ee0cb64-de6d-4c82-b99b-50bfca5f7971', N'chrisn', N'Chris Nolan', N'hashed_password_9', N'chris@example.com', N'avatar9.jpg', N'0912345679', N'Male', N'Customer', N'Active', 2, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'13327314-9420-459c-b825-564b4ff13a79', N'johndoe1', N'John Doe', N'hashed_password_1', N'johndoe1@example.com', N'avatar1.jpg', N'0912345671', N'Male', N'Customer', N'Active', 4.2, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'9c338460-a2ea-4915-a16a-5e0e45b03a3c', N'emilyw', N'Emily White', N'hashed_password_6', N'emily@example.com', N'avatar6.jpg', N'0912345676', N'Female', N'Customer', N'Active', 4.9, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'1fb38aa7-c140-445c-9259-6eb47dd0c93e', N'bobadmin', N'Bob Admin', N'hashed_password_4', N'bob@example.com', N'avatar4.jpg', N'0912345674', N'Male', N'Admin', N'Active', 5, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'8502ecea-7139-4b49-b4c1-9270d79497c2', N'janedoe1', N'Jane Doe', N'hashed_password_2', N'janedoe1@example.com', N'avatar2.jpg', N'0912345672', N'Female', N'Customer', N'Active', 4.8, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'cf6aac4a-b661-4510-a883-962e1cdd9dbf', N'nancy9', N'Nancy Drew', N'hashed_password_8', N'nancy@example.com', N'avatar8.jpg', N'0912345678', N'Female', N'Customer', N'Active', 4.6, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
GO
INSERT [dbo].[User] ([ID], [Username], [FullName], [Password], [Email], [Avatar], [Phone], [Gender], [Role], [Status], [Rating], [CreatedAt], [UpdatedAt]) VALUES (N'babedc74-fd23-4e3c-a687-c1f6513e970c', N'alice123', N'Alice Smith', N'hashed_password_3', N'alice@example.com', N'avatar3.jpg', N'0912345673', N'Female', N'Customer', N'Active', 4.7, CAST(N'2025-04-04T08:08:03.820' AS DateTime), CAST(N'2025-04-04T08:08:03.820' AS DateTime))
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__737584F60672142C]    Script Date: 4/4/2025 11:38:38 AM ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Services__737584F6F8F38CFF]    Script Date: 4/4/2025 11:38:38 AM ******/
ALTER TABLE [dbo].[Services] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D1053413C76FEF]    Script Date: 4/4/2025 11:38:38 AM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[BlogCategories] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[BlogImages] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[BlogImages] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BlogImages] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[BookingDetails] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[BookingDetails] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BookingDetails] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[ServiceCategories] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[ServiceImages] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[ServiceImages] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ServiceImages] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[TestAnswerDetails] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[TestAnswers] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[TestResults] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[BlogCategories]  WITH CHECK ADD FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([ID])
GO
ALTER TABLE [dbo].[BlogCategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[BlogImages]  WITH CHECK ADD FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([ID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([ID])
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[ServiceCategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[ServiceCategories]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[ServiceImages]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[TestAnswerDetails]  WITH CHECK ADD FOREIGN KEY([TestAnswerID])
REFERENCES [dbo].[TestAnswers] ([ID])
GO
ALTER TABLE [dbo].[TestAnswers]  WITH CHECK ADD FOREIGN KEY([TestID])
REFERENCES [dbo].[Test] ([ID])
GO
ALTER TABLE [dbo].[TestResults]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[TestResults]  WITH CHECK ADD FOREIGN KEY([TestID])
REFERENCES [dbo].[Test] ([ID])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD CHECK  (([Status]='Draft' OR [Status]='Published'))
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Confirmed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([Status]='Hidden' OR [Status]='Visible'))
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([Type]='Order' OR [Type]='Employee' OR [Type]='Service'))
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD CHECK  (([PaymentMethod]='Card' OR [PaymentMethod]='Cash'))
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD CHECK  (([Status]='Offline' OR [Status]='Work'))
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD CHECK  (([Status]='Unavailable' OR [Status]='Available'))
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD CHECK  (([PaymentMethod]='Online' OR [PaymentMethod]='Card' OR [PaymentMethod]='Cash'))
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD CHECK  (([Status]='Pending' OR [Status]='Failed' OR [Status]='Success'))
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD CHECK  (([Gender]='N/A' OR [Gender]='Female' OR [Gender]='Male'))
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD CHECK  (([Role]='Customer' OR [Role]='Employee' OR [Role]='Admin'))
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD CHECK  (([Status]='Removed' OR [Status]='Inactive' OR [Status]='Active'))
GO
