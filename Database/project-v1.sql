USE [master]
GO
/****** Object:  Database [project_Check_Attandance]    Script Date: 2/26/2022 12:56:35 PM ******/
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
/****** Object:  Table [dbo].[Attendance]    Script Date: 2/26/2022 12:56:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttenID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Class]    Script Date: 2/26/2022 12:56:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassMember]    Script Date: 2/26/2022 12:56:35 PM ******/
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
/****** Object:  Table [dbo].[Majors]    Script Date: 2/26/2022 12:56:35 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 2/26/2022 12:56:35 PM ******/
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
/****** Object:  Table [dbo].[Schedule]    Script Date: 2/26/2022 12:56:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[SubID] [varchar](10) NOT NULL,
	[ClassID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 2/26/2022 12:56:35 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 2/26/2022 12:56:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubID] [varchar](10) NOT NULL,
	[Subname] [varchar](150) NOT NULL,
	[numberSlot] [int] NOT NULL,
 CONSTRAINT [PK_Subject_1] PRIMARY KEY CLUSTERED 
(
	[SubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/26/2022 12:56:35 PM ******/
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
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (1, N'SE1601')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (2, N'SE1602')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (3, N'SE1603')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (4, N'SE1604')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (5, N'SE1605')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (6, N'IA1601')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (7, N'IA1602')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (8, N'AI1601')
GO
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (1, 1)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (1, 2)
INSERT [dbo].[ClassMember] ([UserID], [ClassID]) VALUES (1, 3)
GO
INSERT [dbo].[Majors] ([MajorsID], [MajorsName]) VALUES (1, N'Software Engineer')
INSERT [dbo].[Majors] ([MajorsID], [MajorsName]) VALUES (2, N'Artificial Intelligence')
INSERT [dbo].[Majors] ([MajorsID], [MajorsName]) VALUES (3, N'Information Security ')
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'Student')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'Teacher')
GO
INSERT [dbo].[Schedule] ([ScheID], [UserID], [SubID], [ClassID], [StartDate], [EndDate]) VALUES (1, 1, N'DBI202', 1, CAST(N'2021-12-02' AS Date), CAST(N'2022-03-02' AS Date))
GO
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (1, N'7.30-9.00')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (2, N'9.10-10.40')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (3, N'10.40-12.20')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (4, N'12.50-14.20')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (5, N'14.30-16.00')
INSERT [dbo].[Slot] ([SlotID], [Time]) VALUES (6, N'16.10-17.40')
GO
INSERT [dbo].[Subject] ([SubID], [Subname], [numberSlot]) VALUES (N'DBI202', N'	Introduction to Databases', 30)
INSERT [dbo].[Subject] ([SubID], [Subname], [numberSlot]) VALUES (N'JDP112', N'	Elementary Japanese 2', 30)
INSERT [dbo].[Subject] ([SubID], [Subname], [numberSlot]) VALUES (N'MAS291', N'Statistics & Probability', 30)
INSERT [dbo].[Subject] ([SubID], [Subname], [numberSlot]) VALUES (N'PRJ301', N'Java Web Application Development', 30)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (1, N'thongnkhe150031@fpt.edu.vn', N'123456', N'Nguyen Kiem Thong', CAST(N'2001-08-23' AS Date), 1, N'0886969888', N'AN VI, Khoai Chau', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (3, N'luongvdhe15027', N'123', N'Vu Dai Luongw', CAST(N'2000-01-01' AS Date), 1, N'0122345678', N'Hai Duong', 1, 1)
INSERT [dbo].[User] ([UserID], [email], [password], [name], [dob], [gender], [phone], [address], [majorsID], [roleID]) VALUES (4, N'bantq@fpt.edu.vn', N'123', N'Tran Quy Ban', CAST(N'1985-12-12' AS Date), 1, N'0123456789', N'Ha Noi', 1, 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__AB6E61645E400BDD]    Script Date: 2/26/2022 12:56:35 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
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
