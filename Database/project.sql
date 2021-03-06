USE [master]
GO
/****** Object:  Database [project_Check_Attandance]    Script Date: 3/24/2022 10:43:54 AM ******/
CREATE DATABASE [project_Check_Attandance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project_Check_Attandance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project_Check_Attandance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_Check_Attandance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project_Check_Attandance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [project_Check_Attandance] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project_Check_Attandance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project_Check_Attandance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET ARITHABORT OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project_Check_Attandance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project_Check_Attandance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET  DISABLE_BROKER 
GO
ALTER DATABASE [project_Check_Attandance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project_Check_Attandance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project_Check_Attandance] SET  MULTI_USER 
GO
ALTER DATABASE [project_Check_Attandance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project_Check_Attandance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project_Check_Attandance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project_Check_Attandance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project_Check_Attandance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [project_Check_Attandance] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [project_Check_Attandance] SET QUERY_STORE = OFF
GO
USE [project_Check_Attandance]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttenID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ScheID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[SlotID] [int] NOT NULL,
	[Attendance] [bit] NOT NULL,
	[note] [varchar](200) NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[AttenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassMember]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassMember](
	[UserID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_ClassMember] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupFeature]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupFeature](
	[roleID] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_GroupFeature] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Majors](
	[MajorsID] [int] NOT NULL,
	[MajorsName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Majors] PRIMARY KEY CLUSTERED 
(
	[MajorsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] NOT NULL,
	[roleName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SubID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [int] NOT NULL,
	[Time] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubID] [int] NOT NULL,
	[SubCode] [varchar](10) NOT NULL,
	[Subname] [varchar](150) NOT NULL,
	[numberSlot] [int] NOT NULL,
 CONSTRAINT [PK_Subject_1] PRIMARY KEY CLUSTERED 
(
	[SubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/24/2022 10:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](150) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[address] [nvarchar](150) NOT NULL,
	[majorsID] [int] NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (16, 3, 6, CAST(N'2022-01-05' AS Date), 2, 0, NULL)
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (40, 3, 6, CAST(N'2022-03-01' AS Date), 2, 0, NULL)
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (71, 1, 1, CAST(N'2022-03-24' AS Date), 1, 1, N'10 diem')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (72, 9, 1, CAST(N'2022-03-24' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (73, 11, 1, CAST(N'2022-03-24' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (74, 12, 1, CAST(N'2022-03-24' AS Date), 1, 0, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (75, 13, 1, CAST(N'2022-03-24' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (76, 210, 1, CAST(N'2022-03-24' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (77, 212, 1, CAST(N'2022-03-24' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (78, 1, 1, CAST(N'2022-03-17' AS Date), 1, 1, N'10 diem')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (79, 9, 1, CAST(N'2022-03-17' AS Date), 1, 0, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (80, 11, 1, CAST(N'2022-03-17' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (81, 12, 1, CAST(N'2022-03-17' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (82, 13, 1, CAST(N'2022-03-17' AS Date), 1, 0, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (83, 210, 1, CAST(N'2022-03-17' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (84, 212, 1, CAST(N'2022-03-17' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (92, 1, 1, CAST(N'2022-03-09' AS Date), 1, 0, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (93, 9, 1, CAST(N'2022-03-09' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (94, 11, 1, CAST(N'2022-03-09' AS Date), 1, 0, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (95, 12, 1, CAST(N'2022-03-09' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (96, 13, 1, CAST(N'2022-03-09' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (97, 210, 1, CAST(N'2022-03-09' AS Date), 1, 1, N'')
INSERT [dbo].[Attendance] ([AttenID], [UserID], [ScheID], [Date], [SlotID], [Attendance], [note]) VALUES (98, 212, 1, CAST(N'2022-03-09' AS Date), 1, 0, N'')
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (1, N'SE1601')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (2, N'SE1602')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (3, N'SE1603')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (4, N'SE1604')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (5, N'SE1605')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (8, N'IA1603')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (9, N'IA1604')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (11, N'IA1606')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (12, N'IA1607')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (14, N'MK1601')
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (1, 1)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (1, 3)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (1, 8)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (3, 2)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (3, 8)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (4, 8)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (9, 1)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (11, 1)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (12, 1)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (12, 3)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (13, 1)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (210, 1)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (212, 1)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (222, 2)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (223, 8)
GO
INSERT [dbo].[Majors] ([MajorsID], [MajorsName]) VALUES (0, N'admin')
INSERT [dbo].[Majors] ([MajorsID], [MajorsName]) VALUES (1, N'Software Engineer')
INSERT [dbo].[Majors] ([MajorsID], [MajorsName]) VALUES (2, N'Artificial Intelligence')
INSERT [dbo].[Majors] ([MajorsID], [MajorsName]) VALUES (3, N'Information Security ')
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'Student')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'Teacher')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (3, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([ScheID], [UserID], [SubID], [ClassID], [StartDate], [EndDate]) VALUES (1, 4, 1, 1, CAST(N'2021-12-02' AS Date), CAST(N'2022-03-02' AS Date))
INSERT [dbo].[Schedule] ([ScheID], [UserID], [SubID], [ClassID], [StartDate], [EndDate]) VALUES (2, 10, 4, 1, CAST(N'2021-12-02' AS Date), CAST(N'2022-03-02' AS Date))
INSERT [dbo].[Schedule] ([ScheID], [UserID], [SubID], [ClassID], [StartDate], [EndDate]) VALUES (3, 14, 2, 1, CAST(N'2021-12-02' AS Date), CAST(N'2022-03-02' AS Date))
INSERT [dbo].[Schedule] ([ScheID], [UserID], [SubID], [ClassID], [StartDate], [EndDate]) VALUES (4, 10, 1, 2, CAST(N'2021-12-02' AS Date), CAST(N'2022-03-02' AS Date))
INSERT [dbo].[Schedule] ([ScheID], [UserID], [SubID], [ClassID], [StartDate], [EndDate]) VALUES (6, 4, 1, 2, CAST(N'2021-12-02' AS Date), CAST(N'2022-03-02' AS Date))
INSERT [dbo].[Schedule] ([ScheID], [UserID], [SubID], [ClassID], [StartDate], [EndDate]) VALUES (8, 10, 4, 4, CAST(N'2022-02-02' AS Date), CAST(N'2022-05-07' AS Date))
SET IDENTITY_INSERT [dbo].[Schedule] OFF
GO
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (1, N'7.30-9.00')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (2, N'9.10-10.40')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (3, N'10.40-12.20')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (4, N'12.50-14.20')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (5, N'14.30-16.00')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (6, N'16.10-17.40')
GO
INSERT [dbo].[Subject] ([SubID], [SubCode], [Subname], [numberSlot]) VALUES (1, N'DBI202', N'	Introduction to Databases', 30)
INSERT [dbo].[Subject] ([SubID], [SubCode], [Subname], [numberSlot]) VALUES (2, N'JDP112', N'	Elementary Japanese 2', 30)
INSERT [dbo].[Subject] ([SubID], [SubCode], [Subname], [numberSlot]) VALUES (3, N'MAS291', N'Statistics & Probability', 30)
INSERT [dbo].[Subject] ([SubID], [SubCode], [Subname], [numberSlot]) VALUES (4, N'PRJ301', N'Java Web Application Development', 30)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (0, N'admin123@fpt.edu.vn', N'123456', N'admin', CAST(N'2001-08-08' AS Date), 1, N'0886969888', N'Hung Yen', 1, 3)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (1, N'thongnkhe150031@fpt.edu.vn', N'123', N'Nguyen Kiem Thong', CAST(N'2001-08-08' AS Date), 1, N'0886969888', N'Hung Yen', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (3, N'luongvdhe15027', N'123', N'Vu Dai Luongw', CAST(N'2000-01-01' AS Date), 1, N'0122345678', N'Hai Duong', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (4, N'bantq@fpt.edu.vn', N'123', N'Tran Quy Ban', CAST(N'1985-01-29' AS Date), 1, N'0123456789', N'Ha Noi', 1, 2)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (9, N'baoltnhe150022@fpt.edu.vn', N'123', N'Le Thi Ngoc Bao', CAST(N'2001-01-13' AS Date), 0, N'0123456789', N'Thanh Hoa', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (10, N'sonnt@fe.com', N'1', N'Nguyen Thanh Son', CAST(N'1887-01-22' AS Date), 1, N'0123456789', N'ha Noi', 2, 2)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (11, N'sonhe12300@fpt.edu.vn', N'1', N'Nguyen Thanh Son', CAST(N'2000-01-22' AS Date), 1, N'0123456789', N'ha Noi', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (12, N'khanhnkhe15555@fpt.edu.vn', N'1', N'Nguyen Minh Khanh', CAST(N'2001-03-22' AS Date), 1, N'0123456789', N'ha Noi', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (13, N'ngocnkhe15555@fpt.edu.vn', N'1', N'Nguyen khanh Ngoc', CAST(N'2001-01-22' AS Date), 0, N'0123456789', N'ha Noi', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (14, N'linhvn@fe.com', N'1', N'Vu Ngoc Linh', CAST(N'1887-09-22' AS Date), 0, N'0123456789', N'ha Noi', 2, 2)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (15, N'manhnk@fpt.edu.vn', N'1', N'Nguyen Khanh Manh', CAST(N'2001-07-17' AS Date), 1, N'0123456789', N'Phu Tho', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (20, N'gogo@fpt.vn', N'1', N'thong', CAST(N'2001-01-01' AS Date), 1, N'012345', N'Ha Noi', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (21, N'thong2382001@gmail.com', N'1', N'Thong Nguyen', CAST(N'2022-03-17' AS Date), 1, N'0886969888', N'An Vi - Khoai Chau - Hung Yen', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (122, N'aangier0@ehow.com', N'1', N'Annabela Angier', CAST(N'2000-12-27' AS Date), 1, N'4211637531', N'0 5th Center', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (123, N'serlam1@blinklist.com', N'1', N'Selinda Erlam', CAST(N'2000-10-30' AS Date), 1, N'6244329301', N'4 Mayer Parkway', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (124, N'ukornel2@creativecommons.org', N'1', N'Urbain Kornel', CAST(N'2000-06-22' AS Date), 0, N'1499953125', N'8 Grover Alley', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (125, N'vmatura3@tuttocitta.it', N'1', N'Viviana Matura', CAST(N'2000-07-07' AS Date), 1, N'9024355907', N'2 Novick Avenue', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (126, N'ltucknutt4@cdc.gov', N'1', N'Lainey Tucknutt', CAST(N'2001-02-14' AS Date), 1, N'5912612676', N'97 Dovetail Drive', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (127, N'abenian5@hexun.com', N'1', N'Alastair Benian', CAST(N'2000-03-30' AS Date), 1, N'6703982143', N'36807 Fuller Place', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (128, N'aballance6@sphinn.com', N'1', N'Allan Ballance', CAST(N'2001-01-22' AS Date), 1, N'8412877662', N'04075 Union Avenue', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (129, N'ngeorghiou7@aboutads.info', N'1', N'Natalina Georghiou', CAST(N'2000-07-30' AS Date), 0, N'3234399500', N'9384 Hermina Pass', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (130, N'rmeeson8@aboutads.info', N'1', N'Robin Meeson', CAST(N'2000-11-07' AS Date), 0, N'8791061994', N'12364 Del Sol Junction', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (131, N'bmeere9@tinyurl.com', N'1', N'Bron Meere', CAST(N'2000-04-09' AS Date), 0, N'6228162789', N'1978 Sunnyside Lane', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (132, N'bgaukrogera@ox.ac.uk', N'1', N'Bary Gaukroger', CAST(N'2001-02-24' AS Date), 0, N'9905832136', N'17 Knutson Circle', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (133, N'cparlettb@fda.gov', N'1', N'Carie Parlett', CAST(N'2000-11-04' AS Date), 0, N'5655162137', N'2 Lakeland Circle', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (134, N'rdumpletonc@nyu.edu', N'1', N'Rhodia Dumpleton', CAST(N'2000-11-08' AS Date), 0, N'9735389893', N'16 Colorado Court', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (135, N'cgledstaned@tripadvisor.com', N'1', N'Cyndia Gledstane', CAST(N'2000-09-08' AS Date), 1, N'7232815513', N'9805 Butternut Alley', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (136, N'wbilbrooke@patch.com', N'1', N'Worthington Bilbrook', CAST(N'2001-02-10' AS Date), 0, N'7779855871', N'1020 Pennsylvania Lane', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (137, N'dmibournef@patch.com', N'1', N'Dyan Mibourne', CAST(N'2000-09-30' AS Date), 0, N'8276417119', N'9 Harper Street', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (138, N'olehemanng@instagram.com', N'1', N'Orson Lehemann', CAST(N'2000-07-08' AS Date), 0, N'2529875077', N'753 Brentwood Court', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (139, N'asnowlingh@seattletimes.com', N'1', N'Artie Snowling', CAST(N'2001-01-26' AS Date), 1, N'8685502190', N'560 Gateway Court', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (140, N'aspeedyi@discuz.net', N'1', N'Arri Speedy', CAST(N'2001-01-25' AS Date), 0, N'1781681286', N'825 Hoepker Trail', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (141, N'rfauningj@time.com', N'1', N'Rosco Fauning', CAST(N'2000-04-17' AS Date), 0, N'4335841198', N'998 Eggendart Alley', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (142, N'amarleyk@eepurl.com', N'1', N'Aymer Marley', CAST(N'2000-10-06' AS Date), 1, N'8893680485', N'5 Russell Road', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (143, N'cgalierl@wordpress.org', N'1', N'Candi Galier', CAST(N'2000-09-07' AS Date), 0, N'2812158492', N'0420 Onsgard Way', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (144, N'nackeroydm@google.it', N'1', N'Nester Ackeroyd', CAST(N'2000-09-07' AS Date), 0, N'9444264138', N'751 Scoville Drive', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (145, N'gwoolfordn@pcworld.com', N'1', N'Ginnifer Woolford', CAST(N'2000-06-04' AS Date), 1, N'4207684998', N'181 Browning Way', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (146, N'ehainso@csmonitor.com', N'1', N'Erina Hains', CAST(N'2000-05-14' AS Date), 0, N'4921242230', N'15 Garrison Junction', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (147, N'mgeroldinip@addtoany.com', N'1', N'Marj Geroldini', CAST(N'2000-09-19' AS Date), 1, N'6613742349', N'55 Claremont Place', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (148, N'tkneeq@globo.com', N'1', N'Thorndike Knee', CAST(N'2000-05-12' AS Date), 0, N'2637838730', N'74 Vahlen Plaza', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (149, N'amaciar@plala.or.jp', N'1', N'Ambrose Macia', CAST(N'2000-07-29' AS Date), 0, N'2863528773', N'46033 Bowman Park', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (150, N'ameedendorpes@hubpages.com', N'1', N'Allyn Meedendorpe', CAST(N'2000-04-05' AS Date), 0, N'7107596659', N'78822 Columbus Crossing', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (151, N'rcroysdalet@linkedin.com', N'1', N'Rurik Croysdale', CAST(N'2000-08-02' AS Date), 0, N'3922681026', N'83097 Corry Alley', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (152, N'hslefordu@cnn.com', N'1', N'Harcourt Sleford', CAST(N'2001-01-22' AS Date), 0, N'8757830169', N'8 Superior Pass', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (153, N'icortesv@hubpages.com', N'1', N'Ivor Cortes', CAST(N'2000-10-17' AS Date), 1, N'8678899127', N'86 Esker Parkway', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (154, N'dmckeranw@blogspot.com', N'1', N'Derward McKeran', CAST(N'2000-09-19' AS Date), 0, N'2364824497', N'643 Mitchell Street', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (155, N'ncrutchx@paginegialle.it', N'1', N'Ninnette Crutch', CAST(N'2001-03-14' AS Date), 0, N'7075115640', N'3426 East Avenue', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (156, N'cledwichy@rakuten.co.jp', N'1', N'Corine Ledwich', CAST(N'2000-03-28' AS Date), 1, N'9448038612', N'3331 Columbus Way', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (157, N'drominovz@github.com', N'1', N'Dolly Rominov', CAST(N'2001-02-05' AS Date), 1, N'8982648184', N'01 Petterle Avenue', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (158, N'alenox10@sogou.com', N'1', N'Alyda Lenox', CAST(N'2000-12-16' AS Date), 1, N'1519880424', N'3 David Road', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (159, N'cfirebrace11@moonfruit.com', N'1', N'Cammy Firebrace', CAST(N'2000-05-14' AS Date), 1, N'2453062061', N'9 Veith Road', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (160, N'jmcilhatton12@howstuffworks.com', N'1', N'Josiah McIlhatton', CAST(N'2001-03-04' AS Date), 0, N'9675514020', N'0 Anniversary Circle', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (161, N'cmuldownie13@twitter.com', N'1', N'Cynthea Muldownie', CAST(N'2000-12-26' AS Date), 0, N'4668346441', N'4279 Anniversary Park', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (162, N'adesvignes14@hugedomains.com', N'1', N'Anatole Desvignes', CAST(N'2001-02-03' AS Date), 1, N'9149499912', N'56797 Granby Court', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (163, N'lgladtbach15@wix.com', N'1', N'Lanny Gladtbach', CAST(N'2000-04-17' AS Date), 1, N'6686936596', N'682 Stang Road', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (164, N'nmanville16@microsoft.com', N'1', N'Nanice Manville', CAST(N'2000-11-21' AS Date), 0, N'1121536074', N'407 Manufacturers Circle', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (165, N'morrum17@sciencedaily.com', N'1', N'Michale Orrum', CAST(N'2001-02-11' AS Date), 1, N'6488773836', N'6721 Eagle Crest Circle', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (166, N'hposvner18@nationalgeographic.com', N'1', N'Harper Posvner', CAST(N'2001-01-10' AS Date), 1, N'3753245183', N'16 Summit Way', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (167, N'phepher19@google.nl', N'1', N'Pen Hepher', CAST(N'2001-01-20' AS Date), 0, N'7937035098', N'900 Mendota Hill', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (168, N'cstrowlger1a@weibo.com', N'1', N'Cordi Strowlger', CAST(N'2000-07-08' AS Date), 1, N'4417383571', N'38602 Knutson Hill', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (169, N'efishby1b@tiny.cc', N'1', N'Eugenio Fishby', CAST(N'2000-09-04' AS Date), 0, N'1798752504', N'7398 Weeping Birch Avenue', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (170, N'nsummerrell1c@booking.com', N'1', N'Neill Summerrell', CAST(N'2000-04-12' AS Date), 1, N'2743247442', N'7 Farragut Way', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (171, N'kbrunskill1d@ca.gov', N'1', N'Karlan Brunskill', CAST(N'2000-07-10' AS Date), 0, N'8692065588', N'5 Hanson Crossing', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (172, N'aolivas1e@ocn.ne.jp', N'1', N'Arlina Olivas', CAST(N'2000-05-07' AS Date), 1, N'8993309715', N'0986 Johnson Avenue', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (173, N'sjakeman1f@pinterest.com', N'1', N'Sigismundo Jakeman', CAST(N'2000-09-17' AS Date), 0, N'8815347640', N'7 Golden Leaf Place', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (174, N'fkinner1g@360.cn', N'1', N'Flossy Kinner', CAST(N'2000-08-09' AS Date), 1, N'9492085195', N'1504 Artisan Parkway', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (175, N'cphelips1h@alexa.com', N'1', N'Corey Phelips', CAST(N'2000-10-31' AS Date), 1, N'7958191221', N'101 Crownhardt Court', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (176, N'iinstock1i@auda.org.au', N'1', N'Israel Instock', CAST(N'2000-07-22' AS Date), 1, N'1214489471', N'0 Duke Street', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (177, N'sgoggey1j@spiegel.de', N'1', N'Sinclair Goggey', CAST(N'2000-06-30' AS Date), 0, N'6208447387', N'18583 Gerald Parkway', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (178, N'acastellino1k@vimeo.com', N'1', N'Anna Castellino', CAST(N'2000-10-29' AS Date), 0, N'4089664502', N'01 Reinke Drive', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (179, N'tlyptratt1l@alibaba.com', N'1', N'Terese Lyptratt', CAST(N'2001-02-14' AS Date), 0, N'3628267924', N'2330 Mifflin Lane', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (180, N'swhittenbury1m@unc.edu', N'1', N'Susette Whittenbury', CAST(N'2000-07-20' AS Date), 1, N'2059721569', N'7 School Terrace', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (181, N'aantonat1n@csmonitor.com', N'1', N'Auroora Antonat', CAST(N'2000-04-13' AS Date), 1, N'2879920799', N'52911 Logan Way', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (182, N'pcheckley1o@usatoday.com', N'1', N'Phoebe Checkley', CAST(N'2000-03-28' AS Date), 0, N'8568572928', N'38201 Garrison Pass', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (183, N'amartinelli1p@acquirethisname.com', N'1', N'Avery Martinelli', CAST(N'2000-08-23' AS Date), 1, N'2646332058', N'78 Derek Road', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (184, N'cserrell1q@webnode.com', N'1', N'Cybill Serrell', CAST(N'2000-09-22' AS Date), 1, N'3241909049', N'8 Marquette Trail', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (185, N'mhambling1r@4shared.com', N'1', N'Maynord Hambling', CAST(N'2000-04-04' AS Date), 1, N'6323010685', N'9593 5th Road', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (186, N'mdallman1s@github.io', N'1', N'Mallory Dallman', CAST(N'2001-02-10' AS Date), 1, N'4593557556', N'37 Moose Way', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (187, N'asorey1t@jiathis.com', N'1', N'Andrey Sorey', CAST(N'2000-08-28' AS Date), 0, N'9409880161', N'74 Express Street', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (188, N'lcoslitt1u@qq.com', N'1', N'Lettie Coslitt', CAST(N'2000-04-05' AS Date), 1, N'8631337621', N'71 Jenifer Road', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (189, N'aschwandt1v@sciencedirect.com', N'1', N'Amandie Schwandt', CAST(N'2000-07-15' AS Date), 1, N'8544368890', N'4851 Reinke Circle', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (190, N'gfaichnie1w@amazonaws.com', N'1', N'Goldie Faichnie', CAST(N'2000-06-05' AS Date), 1, N'7567953491', N'92673 Pearson Point', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (191, N'cfolkerts1x@latimes.com', N'1', N'Caitlin Folkerts', CAST(N'2000-08-09' AS Date), 0, N'8147641303', N'4 Bashford Parkway', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (192, N'rjewsbury1y@ox.ac.uk', N'1', N'Rhianna Jewsbury', CAST(N'2000-09-12' AS Date), 0, N'9291775569', N'4 Buena Vista Hill', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (193, N'cprozillo1z@google.pl', N'1', N'Collete Prozillo', CAST(N'2000-06-22' AS Date), 0, N'5615105646', N'247 Sauthoff Center', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (194, N'bmitford20@google.de', N'1', N'Basil Mitford', CAST(N'2000-08-30' AS Date), 1, N'4117545730', N'69344 Swallow Park', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (195, N'kyounglove21@clickbank.net', N'1', N'Kellina Younglove', CAST(N'2001-03-08' AS Date), 1, N'2013210094', N'99330 Fulton Trail', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (196, N'cstoves22@ow.ly', N'1', N'Chan Stoves', CAST(N'2000-06-01' AS Date), 0, N'2655027827', N'7122 Dapin Circle', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (198, N'ttomaszewski24@craigslist.org', N'1', N'Thurstan Tomaszewski', CAST(N'2001-02-04' AS Date), 0, N'9096719536', N'0734 Butterfield Way', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (199, N'fdukes25@mapquest.com', N'1', N'Franky Dukes', CAST(N'2001-03-08' AS Date), 1, N'4649306094', N'402 Bashford Crossing', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (200, N'cgriffitts26@purevolume.com', N'1', N'Candice Griffitts', CAST(N'2000-07-02' AS Date), 0, N'7625279358', N'70795 Arapahoe Alley', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (201, N'htizzard27@redcross.org', N'1', N'Happy Tizzard', CAST(N'2000-05-12' AS Date), 0, N'5471705217', N'6 Veith Point', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (202, N'abeausang28@mail.ru', N'1', N'Arvy Beausang', CAST(N'2000-04-20' AS Date), 0, N'2061840142', N'5 Victoria Plaza', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (203, N'neskriett29@soup.io', N'1', N'Norris Eskriett', CAST(N'2000-09-08' AS Date), 1, N'3134326361', N'868 Fremont Terrace', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (204, N'rsemens2a@blogs.com', N'1', N'Rora Semens', CAST(N'2000-11-29' AS Date), 0, N'7432698741', N'93 Tennyson Center', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (205, N'tmeikle2b@sphinn.com', N'1', N'Torr Meikle', CAST(N'2000-11-25' AS Date), 1, N'3285698328', N'723 Westerfield Park', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (206, N'lecclestone2c@jimdo.com', N'1', N'Leela Ecclestone', CAST(N'2000-09-02' AS Date), 1, N'3777964245', N'88237 Jenna Court', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (207, N'abugdale2d@myspace.com', N'1', N'Austine Bugdale', CAST(N'2000-10-19' AS Date), 1, N'1136875836', N'4376 Cody Hill', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (208, N'hfoxen2e@sfgate.com', N'1', N'Helsa Foxen', CAST(N'2000-05-17' AS Date), 1, N'7059490765', N'7 Schmedeman Court', 3, 1)
GO
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (209, N'pmarusik2f@umn.edu', N'1', N'Patience Marusik', CAST(N'2000-03-28' AS Date), 1, N'3163349944', N'83 Spaight Plaza', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (210, N'gkitley2g@smh.com.au', N'1', N'Goldia Kitley', CAST(N'2000-07-01' AS Date), 0, N'5326426734', N'824 Center Center', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (211, N'dgabitis2h@smh.com.au', N'1', N'Domenico Gabitis', CAST(N'2000-04-24' AS Date), 1, N'4134801975', N'5110 Mariners Cove Lane', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (212, N'hgarci2i@cloudflare.com', N'1', N'Holden Garci', CAST(N'2000-12-09' AS Date), 1, N'4486991854', N'1803 Dexter Lane', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (213, N'bcolton2j@gov.uk', N'1', N'Bertina Colton', CAST(N'2000-12-28' AS Date), 0, N'8691937506', N'6 2nd Road', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (214, N'ecaddell2k@netlog.com', N'1', N'Ediva Caddell', CAST(N'2000-12-22' AS Date), 1, N'2105814717', N'79909 Thackeray Park', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (215, N'lfransseni2l@instagram.com', N'1', N'Larine Fransseni', CAST(N'2000-04-20' AS Date), 0, N'9428109337', N'6351 Warrior Street', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (216, N'treiling2m@tiny.cc', N'1', N'Tamas Reiling', CAST(N'2000-07-10' AS Date), 0, N'7408923339', N'07238 Moose Lane', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (218, N'gcalverley2o@youku.com', N'1', N'Gisella Calverley', CAST(N'2001-03-01' AS Date), 0, N'3152154139', N'9 Hallows Point', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (219, N'abard2p@ibm.com', N'1', N'Alia Bard', CAST(N'2000-04-09' AS Date), 0, N'1376918232', N'7 Truax Junction', 2, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (220, N'wreinhart2q@ustream.tv', N'1', N'Winfield Reinhart', CAST(N'2000-12-14' AS Date), 1, N'4836167913', N'3235 Basil Terrace', 3, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (222, N'rdunster0@dedecms.com', N'1', N'Redd Dunster', CAST(N'2000-11-28' AS Date), 1, N'4301288928', N'68 Erie Circle', 1, 2)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (223, N'bsanders1@usnews.com', N'1', N'Briano Sanders', CAST(N'2000-11-27' AS Date), 1, N'3914734854', N'447 Anzinger Pass', 2, 2)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (224, N'ijakubovits2@nytimes.com', N'1', N'Idette Jakubovits', CAST(N'2000-06-15' AS Date), 1, N'9559465506', N'81936 Schmedeman Circle', 3, 2)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (225, N'kalforde3@artisteer.com', N'1', N'Karissa Alforde', CAST(N'2000-11-06' AS Date), 1, N'8669464297', N'092 Kim Place', 1, 2)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (226, N'jdonoher4@blogtalkradio.com', N'1', N'Jenica Donoher', CAST(N'2000-10-23' AS Date), 0, N'1638591365', N'40 Shopko Lane', 2, 2)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (227, N'rthorouggood5@apache.org', N'1', N'Roderick Thorouggood', CAST(N'2000-06-29' AS Date), 0, N'6947697781', N'46989 Johnson Point', 3, 2)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (229, N'abc123@gmail.com', N'1', N'alizabeet', CAST(N'2022-03-10' AS Date), 1, N'1231231231', N'An Vi - Khoai Chau - Hung Yen', 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__AB6E6164F12D45BF]    Script Date: 3/24/2022 10:43:54 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__AB6E6164F12D45BF] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendance] ADD  CONSTRAINT [DF_Attendance_Attendance]  DEFAULT ((0)) FOR [Attendance]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Schedule] FOREIGN KEY([ScheID])
REFERENCES [dbo].[Schedule] ([ScheID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Schedule]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Slot] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Slot]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_User]
GO
ALTER TABLE [dbo].[ClassMember]  WITH CHECK ADD  CONSTRAINT [FK_ClassMember_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[ClassMember] CHECK CONSTRAINT [FK_ClassMember_Class]
GO
ALTER TABLE [dbo].[ClassMember]  WITH CHECK ADD  CONSTRAINT [FK_ClassMember_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ClassMember] CHECK CONSTRAINT [FK_ClassMember_User]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Feature]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Role]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Class]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Subject] FOREIGN KEY([SubID])
REFERENCES [dbo].[Subject] ([SubID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Subject]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Majors] FOREIGN KEY([majorsID])
REFERENCES [dbo].[Majors] ([MajorsID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Majors]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [project_Check_Attandance] SET  READ_WRITE 
GO
