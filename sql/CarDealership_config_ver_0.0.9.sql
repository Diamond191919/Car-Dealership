USE [master]
GO
/****** Object:  Database [Car_Dealership]    Script Date: 01/01/2025 18:40:58 ******/
CREATE DATABASE [Car_Dealership]
GO
use [Car_Dealership]
GO
ALTER DATABASE [Car_DealerShip] COLLATE Vietnamese_CI_AS;

CREATE TABLE [dbo].[Parts](
	[partID] [decimal](18, 0) NOT NULL,
	[part_name] [nvarchar](MAX) NULL,
	[purchasePrice] [money] NULL,
	[retailPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[partID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(101 AS Decimal(18, 0)), N'Ắc quy', 1345000.0000, 1750000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(102 AS Decimal(18, 0)), N'Dầu trợ lực lái', 12000.0000, 155000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(103 AS Decimal(18, 0)), N'Lọc nhiên liệu', 78000.0000, 99000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(104 AS Decimal(18, 0)), N'Lọc gió động cơ', 120000.0000, 155000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(105 AS Decimal(18, 0)), N'Dầu hộp số tự động', 215000.0000, 266000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(106 AS Decimal(18, 0)), N'Bugi đánh lửa', 38000.0000, 45000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(107 AS Decimal(18, 0)), N'Dây curoa động cơ và dây curoa cam', 278000.0000, 350000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(108 AS Decimal(18, 0)), N'Dung dịch nước làm mát', 38000.0000, 45000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(109 AS Decimal(18, 0)), N'Lốp xe', 1030000.0000, 1200000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(110 AS Decimal(18, 0)), N'Dầu phanh', 34000.0000, 55000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(111 AS Decimal(18, 0)), N'Má phanh', 370000.0000, 450000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(112 AS Decimal(18, 0)), N'Kính chắn gió', 1420000.0000, 1500000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(113 AS Decimal(18, 0)), N'Cần gạt nước', 280000.0000, 396000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(114 AS Decimal(18, 0)), N'Hệ thống đèn', 1750000.0000, 2000000.0000)
INSERT [dbo].[Parts] ([partID], [part_name], [purchasePrice], [retailPrice]) VALUES (CAST(115 AS Decimal(18, 0)), N'Bộ lọc không khí', 176000.0000, 200000.0000)
/****** Object:  Table [dbo].[Mechanic]    Script Date: 01/01/2025 18:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mechanic](
	[mechanicID] [decimal](18, 0) NOT NULL,
	[mechanic_name] [nvarchar](MAX) NULL,
PRIMARY KEY CLUSTERED 
(
	[mechanicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230025 AS Decimal(18, 0)), N'Cao Xuân Trường')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230026 AS Decimal(18, 0)), N'Nguyễn Nam Ninh')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230027 AS Decimal(18, 0)), N'Đoàn Huy An')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230031 AS Decimal(18, 0)), N'Cao Văn Minh')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230032 AS Decimal(18, 0)), N'Bùi Minh Tiến')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230033 AS Decimal(18, 0)), N'Lê Văn Bình')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230034 AS Decimal(18, 0)), N'Nguyễn Văn Linh')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230035 AS Decimal(18, 0)), N'Trường Văn Cao')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230038 AS Decimal(18, 0)), N'Mai Huy Ân')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230039 AS Decimal(18, 0)), N'Bùi Văn Thịnh')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230040 AS Decimal(18, 0)), N'Nguyễn Xuân Thịnh')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230041 AS Decimal(18, 0)), N'Lê Hào')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230060 AS Decimal(18, 0)), N'Nguyễn Văn Sang')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230062 AS Decimal(18, 0)), N'Lê Minh Tâm')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230142 AS Decimal(18, 0)), N'Bùi Văn Nhất')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230143 AS Decimal(18, 0)), N'Ngô Đăng Khoa')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230158 AS Decimal(18, 0)), N'Thái Văn Hiếu')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230159 AS Decimal(18, 0)), N'Trường Xuân Đức')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230244 AS Decimal(18, 0)), N'Ngô Mạnh Quỳnh')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230245 AS Decimal(18, 0)), N'Ngô Văn Tiến')
INSERT [dbo].[Mechanic] ([mechanicID], [mechanic_name]) VALUES (CAST(41051230246 AS Decimal(18, 0)), N'Nguyễn Minh Huy')
/****** Object:  Table [dbo].[Customer]    Script Date: 01/01/2025 18:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[custID] [decimal](18, 0) NOT NULL,
	[cust_name] [nvarchar](MAX) NULL,
	[phone] [decimal](18, 0) NULL,
	[sex] [char](20) NULL,
	[cust_address] [nvarchar](MAX) NULL,
PRIMARY KEY CLUSTERED 
(
	[custID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11013 AS Decimal(18, 0)), N'Phạm Nguyên Dũng', CAST(906572342 AS Decimal(18, 0)), N'M    ', N'Long An')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11019 AS Decimal(18, 0)), N'Nguyễn Thị Thùy Dung', CAST(753634123 AS Decimal(18, 0)), N'F    ', N'TP. Hà Nội')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11024 AS Decimal(18, 0)), N'Hà Mỹ Duyên', CAST(763989821 AS Decimal(18, 0)), N'F    ', N'Nam Định')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11032 AS Decimal(18, 0)), N'Bùi Phương Ngọc', CAST(903426751 AS Decimal(18, 0)), N'M    ', N'Vũng Tàu')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11037 AS Decimal(18, 0)), N'Nguyễn Thạc Hải', CAST(112755456 AS Decimal(18, 0)), N'M    ', N'Khánh Hòa')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11051 AS Decimal(18, 0)), N'Phan Thành Đăng', CAST(12272718 AS Decimal(18, 0)), N'M    ', N'Khánh Hòa')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11055 AS Decimal(18, 0)), N'Nguyễn Thị Minh Hằng', CAST(987653421 AS Decimal(18, 0)), N'F    ', N'Nha Trang')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11076 AS Decimal(18, 0)), N'Đoàn Minh Đạo', CAST(879355621 AS Decimal(18, 0)), N'M    ', N'Huế')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11077 AS Decimal(18, 0)), N'Nguyễn Thị Thu Hằng', CAST(81200176 AS Decimal(18, 0)), N'F    ', N'Bình Thuận')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11078 AS Decimal(18, 0)), N'Vương Thị Kim Cúc', CAST(904532178 AS Decimal(18, 0)), N'F    ', N'Huế')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11089 AS Decimal(18, 0)), N'Huỳnh Thị Ngọc Điệp', CAST(907772818 AS Decimal(18, 0)), N'F    ', N'Thanh Hóa')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11095 AS Decimal(18, 0)), N'Hồ Đức Trung Hữu', CAST(1278654321 AS Decimal(18, 0)), N'M    ', N'Thanh Hóa ')
INSERT [dbo].[Customer] ([custID], [cust_name], [phone], [sex], [cust_address]) VALUES (CAST(11098 AS Decimal(18, 0)), N'Nguyễn Thị Minh Hà', CAST(907865432 AS Decimal(18, 0)), N'F    ', N'TP. Hà Nội')
/****** Object:  Table [dbo].[Cars]    Script Date: 01/01/2025 18:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[carID] [decimal](18, 0) NOT NULL,
	[car_name] [nvarchar](MAX) NULL,
	[price] [money] NULL,
	[serialNumber] [nvarchar](MAX) NULL,
	[model] [nvarchar](MAX) NULL,
	[colour] [nvarchar](100) NULL,
	[year] [int] NULL,
	[img] [nvarchar](MAX) NULL,
	[status] [nvarchar] (MAX)NULL,
	[description] [nvarchar](MAX) NULL
PRIMARY KEY CLUSTERED 
(
	[carID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334454 AS Decimal(18, 0)), N'Chevrolet Impala', 15000000.00, N'2ABC2ABC2ABC2ABC2', N'chevrolet', N'Silver', 2017, N'https://via.placeholder.com/400x200?text=Chevrolet+Impala', N'Available', N'Comfortable family sedan with great fuel efficiency.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334455 AS Decimal(18, 0)), N'Volkswagen Golf', 18000000.00, N'1ABC1ABC1ABC1ABC1', N'volkswagen', N'Black', 2017, N'https://via.placeholder.com/400x200?text=Volkswagen+Golf', N'Available', N'Compact and sporty hatchback with excellent handling.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334456 AS Decimal(18, 0)), N'Toyota Tundra LX', 30000000.00, N'3ABC3ABC3ABC3ABC3', N'Tundra LX', N'Gray', 2019, N'https://via.placeholder.com/400x200?text=Toyota+Tundra+LX', N'Available', N'Reliable full-size pickup truck with powerful towing capacity.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334457 AS Decimal(18, 0)), N'Plymouth Fury', 12000000.00, N'4ABC4ABC4ABC4ABC4', N'plymouth', N'Tan', 2019, N'https://via.placeholder.com/400x200?text=Plymouth+Fury', N'Available', N'Classic American muscle car with vintage appeal.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334458 AS Decimal(18, 0)), N'AMC Gremlin', 9000000.00, N'5ABC5ABC5ABC5ABC5', N'amc', N'White', 2020, N'https://via.placeholder.com/400x200?text=AMC+Gremlin', N'Available', N'Compact and unique, perfect for city driving.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334459 AS Decimal(18, 0)), N'Ford Mustang', 25000000.00, N'6ABC6ABC6ABC6ABC6', N'ford', N'Black', 2017, N'https://via.placeholder.com/400x200?text=Ford+Mustang', N'Available', N'Iconic American sports car with thrilling performance.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334460 AS Decimal(18, 0)), N'Generic Vehicle', 10000000.00, N'7ABC7ABC7ABC7ABC7', N'Vehicle', N'Silver', 2019, N'https://via.placeholder.com/400x200?text=Vehicle', N'Available', N'Simple, no-frills vehicle for daily use.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334470 AS Decimal(18, 0)), N'Pontiac Firebird', 22000000.00, N'8ABC8ABC8ABC8ABC8', N'pontiac', N'Gray', 2017, N'https://via.placeholder.com/400x200?text=Pontiac+Firebird', N'Available', N'Powerful muscle car with a legendary history.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334471 AS Decimal(18, 0)), N'Ford Escape', 28000000.00, N'9ABC9ABC9ABC9ABC9', N'Escape', N'Tan', 2020, N'https://via.placeholder.com/400x200?text=Ford+Escape', N'Available', N'Compact SUV with ample interior space and great fuel efficiency.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334472 AS Decimal(18, 0)), N'Acura TLX', 35000000.00, N'10ABC10ABC10ABC10', N'TLX', N'White', 2017, N'https://via.placeholder.com/400x200?text=Acura+TLX', N'Available', N'Luxury sedan with advanced tech and a smooth ride.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334473 AS Decimal(18, 0)), N'Buick Regal', 27000000.00, N'11ABC11ABC11ABC11', N'buick', N'Black', 2017, N'https://via.placeholder.com/400x200?text=Buick+Regal', N'Available', N'Mid-size sedan with elegant design and reliable performance.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334474 AS Decimal(18, 0)), N'Citroen C3', 21000000.00, N'12ABC12ABC12ABC12', N'citroen', N'Silver', 2019, N'https://via.placeholder.com/400x200?text=Citroen+C3', N'Available', N'Compact and efficient hatchback with a stylish design.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334475 AS Decimal(18, 0)), N'Toyota Corolla', 23000000.00, N'13ABC13ABC13ABC13', N'toyota', N'Gray', 2017, N'https://via.placeholder.com/400x200?text=Toyota+Corolla', N'Available', N'Reliable and fuel-efficient compact sedan.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334476 AS Decimal(18, 0)), N'Ford Escape', 28000000.00, N'14ACB14ABC14ABC14', N'Escape', N'Tan', 2020, N'https://via.placeholder.com/400x200?text=Ford+Escape', N'Available', N'Comfortable and practical compact SUV with a spacious interior.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334477 AS Decimal(18, 0)), N'Chevrolet Camaro', 32000000.00, N'15ABC15ABC15ABC15', N'chevrolet', N'White', 2017, N'https://via.placeholder.com/400x200?text=Chevrolet+Camaro', N'Available', N'Bold and aggressive American muscle car.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334478 AS Decimal(18, 0)), N'Dodge Grand Caravan', 26000000.00, N'16ABC16ABC16ABC16', N'Grand Caravan', N'Black', 2017, N'https://via.placeholder.com/400x200?text=Dodge+Grand+Caravan', N'Available', N'Family-friendly minivan with plenty of room and versatile seating.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334479 AS Decimal(18, 0)), N'Audi A4', 40000000.00, N'17ABC17ABC17ABC17', N'audi', N'Silver', 2019, N'https://via.placeholder.com/400x200?text=Audi+A4', N'Available', N'Elegant and refined compact luxury sedan with high-tech features.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334480 AS Decimal(18, 0)), N'BMW 3 Series', 42000000.00, N'18ABC18ABC18ABC18', N'bmw', N'Gray', 2017, N'https://via.placeholder.com/400x200?text=BMW+3+Series', N'Available', N'Iconic luxury sedan with precision handling and advanced features.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334481 AS Decimal(18, 0)), N'Ford Escape', 28000000.00, N'19ABC19ACB19ABC19', N'Escape', N'Tan', 2020, N'https://via.placeholder.com/400x200?text=Ford+Escape', N'Available', N'Comfortable and efficient compact SUV with off-road capabilities.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334482 AS Decimal(18, 0)), N'Acura TLX', 35000000.00, N'20ABC20ABC20ABC20', N'TLX', N'White', 2017, N'https://via.placeholder.com/400x200?text=Acura+TLX', N'Available', N'Luxury sedan with sport-tuned suspension and a sleek design.');

INSERT [dbo].[Cars] ([carID], [car_name], [price], [serialNumber], [model], [colour], [year], [img], [status], [description])
VALUES (CAST(1122334483 AS Decimal(18, 0)), N'Dodge Charger', 38000000.00, N'21ABC21ABC21ABC21', N'dodge', N'Black', 2017, N'https://via.placeholder.com/400x200?text=Dodge+Charger', N'Available', N'Muscular sedan with thrilling acceleration and bold styling.');

/****** Object:  Table [dbo].[Service]    Script Date: 01/01/2025 18:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	serviceID INT IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](MAX) NULL,
	[hourly_rate] [money] NULL,
	[status] [nvarchar](50) NULL
PRIMARY KEY CLUSTERED 
(
	[serviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Thay nhớt', 1000000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Vệ sinh lọc gió động cơ', 2000000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Vệ sinh lọc điều hòa, máy lạnh', 1800000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Thay lọc nhớt', 18800000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Đảo lốp', 2000000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Thay lọc gió điều hòa', 1750000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Kiểm tra và vệ sinh phanh', 1650000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Thay dầu phanh + dầu tay lái (nếu có), dầu hộp số, dầu cần sau', 3800000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Thay nước làm mát', 4000000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Thay lọc nhiên liệu (xăng hoặc dầu tùy xe sử dụng)', 6500000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Thay dây curoa', 7600000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Thay bugi', 1000000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Kiểm tra hệ thống lái', 800000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Kiểm tra hệ thống đèn', 7500000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Kiểm tra Gầm', 6800000.0000, 'active');
INSERT [dbo].[Service] ([service_name], [hourly_rate], [status]) VALUES (N'Kiểm tra hệ thống gạt mưa', 3200000.0000, 'active');

/****** Object:  Table [dbo].[SalesPerson]    Script Date: 01/01/2025 18:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesPerson](
	[salesID] [decimal](18, 0) NOT NULL,
	[sales_name] [nvarchar](MAX) NULL,
	[birthday] [date] NULL,
	[sex] [char](20) NULL,
	[salesAddress] [nvarchar](MAX) NULL,
PRIMARY KEY CLUSTERED 
(
	[salesID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050004 AS Decimal(18, 0)), N'Mai Duy An', CAST(0x8EF60A00 AS Date), N'M    ', N'Long An')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050015 AS Decimal(18, 0)), N'Huỳnh Mai Anh', CAST(0xB8EF0A00 AS Date), N'F    ', N'TP. Hồ Chí Minh')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050027 AS Decimal(18, 0)), N'Nguyễn Thúy Quỳnh Anh', CAST(0x9A030B00 AS Date), N'F    ', N'Nam Định')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050035 AS Decimal(18, 0)), N'Tống Thị Lan Anh', CAST(0xD0050B00 AS Date), N'F    ', N'Vũng Tàu')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050037 AS Decimal(18, 0)), N'Võ Việt Anh', CAST(0x29000B00 AS Date), N'M    ', N'Khánh Hòa')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050038 AS Decimal(18, 0)), N'Vũ Thuỵ Hồng Anh', CAST(0x28F40A00 AS Date), N'F    ', N'TP. Hồ Chí Minh')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050049 AS Decimal(18, 0)), N'Trần Nguyễn Phương Bình', CAST(0x10EA0A00 AS Date), N'F    ', N'TP. Hồ Chí Minh')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050060 AS Decimal(18, 0)), N'Trần Thiện Bảo', CAST(0x3AE50A00 AS Date), N'M    ', N'TP. Hồ Chí Minh')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050142 AS Decimal(18, 0)), N'Nguyễn Hoàng Dũng', CAST(0x78E50A00 AS Date), N'M    ', N'TP. Hồ Chí Minh')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050158 AS Decimal(18, 0)), N'Lê Hoàng Linh Giang', CAST(0x72E70A00 AS Date), N'M    ', N'Huế')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050180 AS Decimal(18, 0)), N'Trần Ngọc Như Hằng', CAST(0xCEF90A00 AS Date), N'F    ', N'TP. Hồ Chí Minh')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050184 AS Decimal(18, 0)), N'Nguyễn Thị Minh Hưng', CAST(0x2E030B00 AS Date), N'FS   ', N'Thanh Hóa ')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050254 AS Decimal(18, 0)), N'Bùi Thị Thu Hương', CAST(0x3FF90A00 AS Date), N'F    ', N'TP. Hà Nội')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050265 AS Decimal(18, 0)), N'Phạm Thị Ngọc Hảo', CAST(0x7E000B00 AS Date), N'F    ', N'Gia Lai')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050294 AS Decimal(18, 0)), N'Trịnh Hạnh', CAST(0x61030B00 AS Date), N'F    ', N'TP. Đà Nẵng')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050295 AS Decimal(18, 0)), N'Huỳnh Thị Như Hồng', CAST(0x1BFA0A00 AS Date), N'F    ', N'TP. Cần Thơ')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050322 AS Decimal(18, 0)), N'Đỗ Thị Thúy Hùng', CAST(0x52EF0A00 AS Date), N'F    ', N'Sông Bé')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050336 AS Decimal(18, 0)), N'Trương Thanh Hiền', CAST(0xC4EF0A00 AS Date), N'M    ', N'TP. Hải Phòng')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050341 AS Decimal(18, 0)), N'Nguyễn Đặng Hiếu', CAST(0x2BFA0A00 AS Date), N'M    ', N'TP. Hồ Chí Minh')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050418 AS Decimal(18, 0)), N'Vũ Phạm Minh Hương', CAST(0x8BFB0A00 AS Date), N'M    ', N'TP. Hà Nội')
INSERT [dbo].[SalesPerson] ([salesID], [sales_name], [birthday], [sex], [salesAddress]) VALUES (CAST(30121050982 AS Decimal(18, 0)), N'Hồ Việt Hoà', CAST(0x5BF90A00 AS Date), N'M    ', N'Đồng Nai')
/****** Object:  Table [dbo].[SalesInvoice]    Script Date: 01/01/2025 18:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoice](
	[invoiceID] [int] NOT NULL,
	[invoiceDate] [date] NULL,
	[salesID] [decimal](18, 0) NULL,
	[carID] [decimal](18, 0) NULL,
	[custID] [decimal](18, 0) NULL,
	[status] [nvarchar](50) DEFAULT 'inactive' NULL,
PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (1, CAST(0xFE410B00 AS Date), CAST(30121050004 AS Decimal(18, 0)), CAST(1122334454 AS Decimal(18, 0)), CAST(11013 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (2, CAST(0x9D400B00 AS Date), CAST(30121050015 AS Decimal(18, 0)), CAST(1122334455 AS Decimal(18, 0)), CAST(11019 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (3, CAST(0x35420B00 AS Date), CAST(30121050027 AS Decimal(18, 0)), CAST(1122334456 AS Decimal(18, 0)), CAST(11024 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (4, CAST(0xF9400B00 AS Date), CAST(30121050035 AS Decimal(18, 0)), CAST(1122334457 AS Decimal(18, 0)), CAST(11032 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (5, CAST(0x8C420B00 AS Date), CAST(30121050037 AS Decimal(18, 0)), CAST(1122334458 AS Decimal(18, 0)), CAST(11037 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (6, CAST(0x8D420B00 AS Date), CAST(30121050038 AS Decimal(18, 0)), CAST(1122334459 AS Decimal(18, 0)), CAST(11051 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (7, CAST(0x14410B00 AS Date), CAST(30121050035 AS Decimal(18, 0)), CAST(1122334460 AS Decimal(18, 0)), CAST(11055 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (8, CAST(0xB5410B00 AS Date), CAST(30121050060 AS Decimal(18, 0)), CAST(1122334470 AS Decimal(18, 0)), CAST(11076 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (9, CAST(0xED410B00 AS Date), CAST(30121050142 AS Decimal(18, 0)), CAST(1122334471 AS Decimal(18, 0)), CAST(11077 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (10, CAST(0xD4410B00 AS Date), CAST(30121050027 AS Decimal(18, 0)), CAST(1122334472 AS Decimal(18, 0)), CAST(11078 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (11, CAST(0x9E400B00 AS Date), CAST(30121050038 AS Decimal(18, 0)), CAST(1122334473 AS Decimal(18, 0)), CAST(11089 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (12, CAST(0x4A420B00 AS Date), CAST(30121050184 AS Decimal(18, 0)), CAST(1122334474 AS Decimal(18, 0)), CAST(11095 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (13, CAST(0x3F410B00 AS Date), CAST(30121050142 AS Decimal(18, 0)), CAST(1122334475 AS Decimal(18, 0)), CAST(11098 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (14, CAST(0xDB420B00 AS Date), CAST(30121050265 AS Decimal(18, 0)), CAST(1122334476 AS Decimal(18, 0)), CAST(11051 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (15, CAST(0x0D410B00 AS Date), CAST(30121050035 AS Decimal(18, 0)), CAST(1122334477 AS Decimal(18, 0)), CAST(11095 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (16, CAST(0x5C430B00 AS Date), CAST(30121050038 AS Decimal(18, 0)), CAST(1122334478 AS Decimal(18, 0)), CAST(11032 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (17, CAST(0xCB410B00 AS Date), CAST(30121050027 AS Decimal(18, 0)), CAST(1122334479 AS Decimal(18, 0)), CAST(11076 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (18, CAST(0x72420B00 AS Date), CAST(30121050142 AS Decimal(18, 0)), CAST(1122334480 AS Decimal(18, 0)), CAST(11076 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (19, CAST(0x6D410B00 AS Date), CAST(30121050341 AS Decimal(18, 0)), CAST(1122334481 AS Decimal(18, 0)), CAST(11051 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (21, CAST(0xD8410B00 AS Date), CAST(30121050027 AS Decimal(18, 0)), CAST(1122334483 AS Decimal(18, 0)), CAST(11013 AS Decimal(18, 0)))
INSERT [dbo].[SalesInvoice] ([invoiceID], [invoiceDate], [salesID], [carID], [custID]) VALUES (29, CAST(0xCB420B00 AS Date), CAST(30121050035 AS Decimal(18, 0)), CAST(1122334482 AS Decimal(18, 0)), CAST(11019 AS Decimal(18, 0)))
/****** Object:  Table [dbo].[ServiceTicket]    Script Date: 01/01/2025 18:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceTicket](
	[serviceTicketID] [int] NOT NULL,
	[dateReceived] [date] NULL,
	[dateReturned] [date] NULL,
	[custID] [decimal](18, 0) NULL,
	[carID] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceTicketID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111231, CAST(0x1D420B00 AS Date), CAST(0x23420B00 AS Date), CAST(11013 AS Decimal(18, 0)), CAST(1122334454 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111232, CAST(0x55430B00 AS Date), CAST(0x5D430B00 AS Date), CAST(11078 AS Decimal(18, 0)), CAST(1122334472 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111233, CAST(0xB5400B00 AS Date), CAST(0xC1400B00 AS Date), CAST(11089 AS Decimal(18, 0)), CAST(1122334473 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111234, CAST(0x5E430B00 AS Date), CAST(0x66430B00 AS Date), CAST(11095 AS Decimal(18, 0)), CAST(1122334474 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111235, CAST(0x49420B00 AS Date), CAST(0x55420B00 AS Date), CAST(11098 AS Decimal(18, 0)), CAST(1122334475 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111236, CAST(0x4C430B00 AS Date), CAST(0x51430B00 AS Date), CAST(11051 AS Decimal(18, 0)), CAST(1122334476 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111237, CAST(0x47420B00 AS Date), CAST(0x4C420B00 AS Date), CAST(11095 AS Decimal(18, 0)), CAST(1122334477 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111238, CAST(0x3F440B00 AS Date), CAST(0x43440B00 AS Date), CAST(11032 AS Decimal(18, 0)), CAST(1122334478 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111239, CAST(0x47420B00 AS Date), CAST(0x48420B00 AS Date), CAST(11076 AS Decimal(18, 0)), CAST(1122334479 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111240, CAST(0x3F440B00 AS Date), CAST(0x41440B00 AS Date), CAST(11076 AS Decimal(18, 0)), CAST(1122334480 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111241, CAST(0x32430B00 AS Date), CAST(0x35430B00 AS Date), CAST(11051 AS Decimal(18, 0)), CAST(1122334481 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111242, CAST(0x85420B00 AS Date), CAST(0x89420B00 AS Date), CAST(11019 AS Decimal(18, 0)), CAST(1122334455 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111243, CAST(0xFE410B00 AS Date), CAST(0x04420B00 AS Date), CAST(11013 AS Decimal(18, 0)), CAST(1122334483 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111244, CAST(0xFF420B00 AS Date), CAST(0x07430B00 AS Date), CAST(11019 AS Decimal(18, 0)), CAST(1122334482 AS Decimal(18, 0)))
INSERT [dbo].[ServiceTicket] ([serviceTicketID], [dateReceived], [dateReturned], [custID], [carID]) VALUES (10111245, CAST(0xBA430B00 AS Date), CAST(0xBE430B00 AS Date), CAST(11024 AS Decimal(18, 0)), CAST(1122334456 AS Decimal(18, 0)))
/****** Object:  Table [dbo].[ServiceMechanic]    Script Date: 01/01/2025 18:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceMechanic](
	[serviceTicketID] [int] NOT NULL,
	[serviceID] [int] NOT NULL,
	[mechanicID] [decimal](18, 0) NOT NULL,
	[hours] [int] NULL,
	[comment] [nvarchar] (MAX) NULL,
	[rate] [money] NULL,
	[vote] DECIMAL(3,1) NULL
 CONSTRAINT [PRK_serviceTicketID_serviceID_mechanicID] PRIMARY KEY CLUSTERED 
(
	[serviceTicketID] ASC,
	[serviceID] ASC,
	[mechanicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111231, 1, CAST(41051230025 AS Decimal(18, 0)), 3, NULL, 1000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111231, 2, CAST(41051230025 AS Decimal(18, 0)), 2, NULL, 2000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111231, 3, CAST(41051230026 AS Decimal(18, 0)), 1, NULL, 1800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111232, 4, CAST(41051230027 AS Decimal(18, 0)), 2, NULL, 18800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111232, 5, CAST(41051230031 AS Decimal(18, 0)), 4, NULL, 2000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111232, 12, CAST(41051230032 AS Decimal(18, 0)), 2, NULL, 1000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111233, 7, CAST(41051230033 AS Decimal(18, 0)), 5, NULL, 1650000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111233, 8, CAST(41051230033 AS Decimal(18, 0)), 1, NULL, 3800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111233, 9, CAST(41051230033 AS Decimal(18, 0)), 4, NULL, 4000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111234, 10, CAST(41051230034 AS Decimal(18, 0)), 2, NULL, 6500000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111235, 1, CAST(41051230038 AS Decimal(18, 0)), 1, NULL, 1000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111235, 2, CAST(41051230039 AS Decimal(18, 0)), 1, NULL, 2000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111235, 11, CAST(41051230035 AS Decimal(18, 0)), 2, NULL, 7600000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111236, 1, CAST(41051230041 AS Decimal(18, 0)), 1, NULL, 1000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111236, 13, CAST(41051230040 AS Decimal(18, 0)), 2, NULL, 800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111236, 15, CAST(41051230041 AS Decimal(18, 0)), 3, NULL, 6800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111237, 5, CAST(41051230032 AS Decimal(18, 0)), 2, NULL, 2000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111237, 10, CAST(41051230062 AS Decimal(18, 0)), 3, NULL, 6500000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111237, 16, CAST(41051230060 AS Decimal(18, 0)), 5, NULL, 3200000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111238, 2, CAST(41051230143 AS Decimal(18, 0)), 1, NULL, 2000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111238, 7, CAST(41051230244 AS Decimal(18, 0)), 3, NULL, 1650000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111238, 12, CAST(41051230142 AS Decimal(18, 0)), 4, NULL, 1000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111238, 15, CAST(41051230159 AS Decimal(18, 0)), 5, NULL, 6800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111239, 4, CAST(41051230245 AS Decimal(18, 0)), 2, NULL, 18800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111239, 5, CAST(41051230246 AS Decimal(18, 0)), 2, NULL, 2000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111240, 2, CAST(41051230031 AS Decimal(18, 0)), 2, NULL, 2000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111240, 7, CAST(41051230244 AS Decimal(18, 0)), 4, NULL, 1650000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111240, 16, CAST(41051230041 AS Decimal(18, 0)), 1, NULL, 1000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111241, 3, CAST(41051230032 AS Decimal(18, 0)), 2, NULL, 1800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111241, 5, CAST(41051230026 AS Decimal(18, 0)), 2, NULL, 2000000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111241, 11, CAST(41051230060 AS Decimal(18, 0)), 1, NULL, 7600000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111242, 16, CAST(41051230158 AS Decimal(18, 0)), 5, NULL, 3200000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111243, 13, CAST(41051230034 AS Decimal(18, 0)), 6, NULL, 800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111244, 3, CAST(41051230025 AS Decimal(18, 0)), 1, NULL, 1800000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111244, 10, CAST(41051230142 AS Decimal(18, 0)), 2, NULL, 6500000.0000, 4.5)
INSERT [dbo].[ServiceMechanic] ([serviceTicketID], [serviceID], [mechanicID], [hours], [comment], [rate], [vote]) VALUES (10111245, 12, CAST(41051230038 AS Decimal(18, 0)), 2, NULL, 1000000.0000, 4.5)
/****** Object:  Table [dbo].[PartsUsed]    Script Date: 01/01/2025 18:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartsUsed](
	[serviceTicketID] [int] NOT NULL,
	[partID] [decimal](18, 0) NOT NULL,
	[numberUsed] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PRK_serviceTicketID_partID] PRIMARY KEY CLUSTERED 
(
	[serviceTicketID] ASC,
	[partID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111231, CAST(112 AS Decimal(18, 0)), 1, 1500000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111231, CAST(115 AS Decimal(18, 0)), 1, 200000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111232, CAST(102 AS Decimal(18, 0)), 1, 155000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111234, CAST(107 AS Decimal(18, 0)), 1, 350000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111235, CAST(102 AS Decimal(18, 0)), 1, 155000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111235, CAST(115 AS Decimal(18, 0)), 1, 200000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111236, CAST(103 AS Decimal(18, 0)), 1, 99000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111236, CAST(110 AS Decimal(18, 0)), 1, 55000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111236, CAST(112 AS Decimal(18, 0)), 1, 1500000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111237, CAST(104 AS Decimal(18, 0)), 1, 155000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111237, CAST(106 AS Decimal(18, 0)), 1, 45000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111238, CAST(114 AS Decimal(18, 0)), 1, 2000000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111243, CAST(101 AS Decimal(18, 0)), 1, 1750000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111244, CAST(111 AS Decimal(18, 0)), 1, 450000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111244, CAST(113 AS Decimal(18, 0)), 1, 396000.0000)
INSERT [dbo].[PartsUsed] ([serviceTicketID], [partID], [numberUsed], [price]) VALUES (10111245, CAST(115 AS Decimal(18, 0)), 1, 200000.0000)

-- Tạo bảng Account
CREATE TABLE [dbo].[Account](
    [id] [decimal](18, 0) NOT NULL PRIMARY KEY,                 -- ID tài khoản
    [name] [nvarchar](MAX) NULL,                                -- Tên tài khoản
    [address] [nvarchar](MAX) NULL,                             -- Địa chỉ
    [email] [nvarchar](255) NULL,                               -- Email
    [phone] VARCHAR(15) NULL,									-- Số điện thoại
    [password] [nvarchar](MAX) NULL,                            -- Mật khẩu
    [roleID] [nvarchar](20) NULL,								-- Vai trò (ví dụ: Admin: 1, Customer:2, Mechanic:3, SalesPerson:4)
    [status] [nvarchar](50) NULL,                               -- Trạng thái (ví dụ: Active, Inactive)
	[sex] NVARCHAR(20) NULL										-- Male, Female
);

-- Tạo bảng Role
CREATE TABLE [dbo].[Role](
    [roleID] [nvarchar](20) NOT NULL PRIMARY KEY,
    [name] [nvarchar](100) NULL
);
SELECT * FROM Role
INSERT INTO Role(roleID, name)
VALUES('1','Admin')

INSERT INTO Role(roleID, name)
VALUES('2','Customer')

INSERT INTO Role(roleID, name)
VALUES('3','Mechanic')

INSERT INTO Role(roleID, name)
VALUES('4','Sale')

/****** Object:  Add UNIQUE    Script Date: 17/02/2025 16:20:59 ******/
-- Đảm bảo tính duy nhất cho id trong bảng Account
ALTER TABLE [dbo].[Account]
ADD UNIQUE (id);

-- Đảm bảo tính duy nhất cho id trong bảng Customer, Mechanic, Sale
ALTER TABLE [dbo].[Customer]
ADD UNIQUE (custID);

ALTER TABLE [dbo].[Mechanic]
ADD UNIQUE (mechanicID);

ALTER TABLE [dbo].[SalesPerson]
ADD UNIQUE (salesID);


-- Tạo ràng buộc khóa ngoại
ALTER TABLE [dbo].[Account]
ADD CONSTRAINT FK_Account_Role
FOREIGN KEY ([roleID])
REFERENCES [dbo].[Role]([roleID]);

INSERT INTO [dbo].[Account] (id, name, address, email, phone, password, status, roleID) VALUES
(11013, N'Trần Văn A', N'123 Đường ABC, Thành phố Hồ Chí Minh', 'trana@example.com', 0987654321, 'MatKhauA123', 'Active', '2'),
(11019, N'Nguyễn Thị B', N'124 Đường DEF, Hà Nội', 'nguyenb@example.com', 0987654322, 'MatKhauB123', 'Active', '2'),
(11024, N'Lê Văn C', N'125 Đường GHI, Đà Nẵng', 'lecc@example.com', 0987654323, 'MatKhauC123', 'Active', '2'),
(11032, N'Phạm Thị D', N'126 Đường JKL, Hải Phòng', 'phamd@example.com', 0987654324, 'MatKhauD123', 'Active', '2'),
(11037, N'Hoàng Văn E', N'127 Đường MNO, Cần Thơ', 'hoange@example.com', 0987654325, 'MatKhauE123', 'Active', '2'),
(11051, N'Võ Thị F', N'128 Đường PQR, Bình Dương', 'vof@example.com', 0987654326, 'MatKhauF123', 'Active', '2'),
(11055, N'Đỗ Văn G', N'129 Đường STU, Nha Trang', 'dog@example.com', 0987654327, 'MatKhauG123', 'Active', '2'),
(11076, N'Ngô Thị H', N'130 Đường VWX, Vũng Tàu', 'ngoh@example.com', 0987654328, 'MatKhauH123', 'Active', '2'),
(11077, N'Bùi Văn I', N'131 Đường YZ, Quy Nhơn', 'buoi@example.com', 0987654329, 'MatKhauI123', 'Active', '2'),
(11078, N'Đặng Thị J', N'132 Đường ABC, Huế', 'dangj@example.com', 0987654330, 'MatKhauJ123', 'Active', '2'),
(11089, N'Tô Văn K', N'133 Đường DEF, Cà Mau', 'tok@example.com', 0987654331, 'MatKhauK123', 'Active', '2'),
(11095, N'Đinh Thị L', N'134 Đường GHI, Đồng Nai', 'dinhl@example.com', 0987654332, 'MatKhauL123', 'Active', '2'),
(11098, N'Tạ Văn M', N'135 Đường JKL, Long An', 'tam@example.com', 0987654333, 'MatKhauM123', 'Active', '2'),
(11099, N'Nguyễn Zịt Hải', N'TP.Hồ Chí Minh', 'haricoder@gmail.com', 0987654330, '123456', 'Active', '2');

INSERT INTO account ([id], [name], [address], [email], [phone], [password], [status], [roleID]) VALUES 
('41051230025', N'Cao Xuân Trường', N'Hà Nội', '41051230025@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230026', N'Nguyễn Nam Ninh', N'Hà Nội', '41051230026@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230027', N'Đoàn Huy An', N'Hà Nội', '41051230027@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230031', N'Cao Văn Minh', N'Hà Nội', '41051230031@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230032', N'Bùi Minh Tiến', N'Hà Nội', '41051230032@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230033', N'Lê Văn Bình', N'Hà Nội', '41051230033@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230034', N'Nguyễn Văn Linh', N'Hà Nội', '41051230034@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230035', N'Trường Văn Cao', N'Hà Nội', '41051230035@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230038', N'Mai Huy Ân', N'Hà Nội', '41051230038@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230039', N'Bùi Văn Thịnh', N'Hà Nội', '41051230039@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230040', N'Nguyễn Xuân Thịnh', N'Hà Nội', '41051230040@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230041', N'Lê Hào', N'Hà Nội', '41051230041@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230060', N'Nguyễn Văn Sang', N'Hà Nội', '41051230060@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230062', N'Lê Minh Tâm', N'Hà Nội', '41051230062@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230142', N'Bùi Văn Nhất', N'Hà Nội', '41051230142@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230143', N'Ngô Đăng Khoa', N'Hà Nội', '41051230143@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230158', N'Thái Văn Hiếu', N'Hà Nội', '41051230158@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230159', N'Trường Xuân Đức', N'Hà Nội', '41051230159@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230244', N'Ngô Mạnh Quỳnh', N'Hà Nội', '41051230244@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230245', N'Ngô Văn Tiến', N'Hà Nội', '41051230245@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230246', N'Nguyễn Minh Huy', N'Hà Nội', '41051230246@mechanic.com', '0123456789', '123456', 'Active', '3'),
('41051230535', N'Nguyễn Zịt Hải', N'TP.Hồ Chí Minh', 'haricoder@gmail.com', '0987654330', '123456', 'Active', '3');


INSERT INTO account (id, name, address, email, phone, password, status, roleID) VALUES
(30121050004, N'Mai Duy An', N'Long An', 'maiduyan@gmail.com', '0901234567', 'P@ssw0rd1', 'active', 4),
(30121050015, N'Huỳnh Mai Anh', N'TP. Hồ Chí Minh', 'huynhmaianh@gmail.com', '0901234568', 'P@ssw0rd2', 'active', 4),
(30121050027, N'Nguyễn Thúy Quỳnh Anh', N'Nam Định', 'nguyentqanh@gmail.com', '0901234569', 'P@ssw0rd3', 'active', 4),
(30121050035, N'Tống Thị Lan Anh', N'Vũng Tàu', 'tonglananh@gmail.com', '0901234570', 'P@ssw0rd4', 'active', 4),
(30121050037, N'Võ Việt Anh', N'Khánh Hòa', 'vovietan@gmail.com', '0901234571', 'P@ssw0rd5', 'active', 4),
(30121050038, N'Vũ Thuỵ Hồng Anh', N'TP. Hồ Chí Minh', 'vuthonganh@gmail.com', '0901234572', 'P@ssw0rd6', 'active', 4),
(30121050049, N'Trần Nguyễn Phương Bình', N'TP. Hồ Chí Minh', 'tranphuongbinh@gmail.com', '0901234573', 'P@ssw0rd7', 'active', 4),
(30121050060, N'Trần Thiện Bảo', N'TP. Hồ Chí Minh', 'tranthienbao@gmail.com', '0901234574', 'P@ssw0rd8', 'active', 4),
(30121050142, N'Nguyễn Hoàng Dũng', N'TP. Hồ Chí Minh', 'nguyenhoangdung@gmail.com', '0901234575', 'P@ssw0rd9', 'active', 4),
(30121050158, N'Lê Hoàng Linh Giang', N'Huế', 'lelinhgiang@gmail.com', '0901234576', 'P@ssw0rd10', 'active', 4),
(30121050180, N'Trần Ngọc Như Hằng', N'TP. Hồ Chí Minh', 'tranngochang@gmail.com', '0901234577', 'P@ssw0rd11', 'active', 4),
(30121050184, N'Nguyễn Thị Minh Hưng', N'Thanh Hóa', 'nguyenminhhung@gmail.com', '0901234578', 'P@ssw0rd12', 'active', 4),
(30121050254, N'Bùi Thị Thu Hương', N'TP. Hà Nội', 'buithuhuong@gmail.com', '0901234579', 'P@ssw0rd13', 'active', 4),
(30121050265, N'Phạm Thị Ngọc Hảo', N'Gia Lai', 'phamngochoa@gmail.com', '0901234580', 'P@ssw0rd14', 'active', 4),
(30121050294, N'Trịnh Hạnh', N'TP. Đà Nẵng', 'trinhhanh@gmail.com', '0901234581', 'P@ssw0rd15', 'active', 4),
(30121050295, N'Huỳnh Thị Như Hồng', N'TP. Cần Thơ', 'huynhnhuhong@gmail.com', '0901234582', 'P@ssw0rd16', 'active', 4),
(30121050322, N'Đỗ Thị Thúy Hùng', N'Sông Bé', 'dothuyhung@gmail.com', '0901234583', 'P@ssw0rd17', 'active', 4),
(30121050336, N'Trương Thanh Hiền', N'TP. Hải Phòng', 'truongthanhhien@gmail.com', '0901234584', 'P@ssw0rd18', 'active', 4),
(30121050341, N'Nguyễn Đặng Hiếu', N'TP. Hồ Chí Minh', 'nguyendanghieu@gmail.com', '0901234585', 'P@ssw0rd19', 'active', 4),
(30121050418, N'Vũ Phạm Minh Hương', N'TP. Hà Nội', 'vuphuong@gmail.com', '0901234586', 'P@ssw0rd20', 'active', 4),
(30121050982, N'Hồ Việt Hoà', N'Đồng Nai', 'hoviethoa@gmail.com', '0901234587', 'P@ssw0rd21', 'active', 4);

/****** Object:  ForeignKey [PK_custID]    Script Date: 13/02/2025 22:50:51 ******/
ALTER TABLE [dbo].[Customer]
ADD CONSTRAINT FK_Customer_Account
FOREIGN KEY (custID) REFERENCES [dbo].[Account](id);

/****** Object:  ForeignKey [PK_mechanicID]    Script Date: 17/02/2025 14:13:52 ******/
ALTER TABLE [dbo].[Mechanic]
ADD CONSTRAINT FK_Mechanic_Account
FOREIGN KEY (mechanicID) REFERENCES [dbo].[Account](id);

/****** Object:  ForeignKey [PK_salesPerson]    Script Date: 17/02/2025 14:13:52 ******/
ALTER TABLE [dbo].[SalesPerson]
ADD CONSTRAINT FK_SalesPerson_Account
FOREIGN KEY (salesID) REFERENCES [dbo].[Account](id);


/****** Object:  ForeignKey [PK_carID]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[SalesInvoice]  WITH CHECK ADD  CONSTRAINT [PK_carID] FOREIGN KEY([carID])
REFERENCES [dbo].[Cars] ([carID])
GO
ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [PK_carID]
GO
/****** Object:  ForeignKey [PK_custID]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[SalesInvoice]  WITH CHECK ADD  CONSTRAINT [PK_custID] FOREIGN KEY([custID])
REFERENCES [dbo].[Customer] ([custID])
GO
ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [PK_custID]
GO
/****** Object:  ForeignKey [PK_salesID]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[SalesInvoice]  WITH CHECK ADD  CONSTRAINT [PK_salesID] FOREIGN KEY([salesID])
REFERENCES [dbo].[SalesPerson] ([salesID])
GO
ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [PK_salesID]
GO
/****** Object:  ForeignKey [PK_carID2]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[ServiceTicket]  WITH CHECK ADD  CONSTRAINT [PK_carID2] FOREIGN KEY([carID])
REFERENCES [dbo].[Cars] ([carID])
GO
ALTER TABLE [dbo].[ServiceTicket] CHECK CONSTRAINT [PK_carID2]
GO
/****** Object:  ForeignKey [PK_custID2]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[ServiceTicket]  WITH CHECK ADD  CONSTRAINT [PK_custID2] FOREIGN KEY([custID])
REFERENCES [dbo].[Customer] ([custID])
GO
ALTER TABLE [dbo].[ServiceTicket] CHECK CONSTRAINT [PK_custID2]
GO
/****** Object:  ForeignKey [PK_mechanicID]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[ServiceMechanic]  WITH CHECK ADD  CONSTRAINT [PK_mechanicID] FOREIGN KEY([mechanicID])
REFERENCES [dbo].[Mechanic] ([mechanicID])
GO
ALTER TABLE [dbo].[ServiceMechanic] CHECK CONSTRAINT [PK_mechanicID]
GO
/****** Object:  ForeignKey [PK_serviceID]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[ServiceMechanic]  WITH CHECK ADD  CONSTRAINT [PK_serviceID] FOREIGN KEY([serviceID])
REFERENCES [dbo].[Service] ([serviceID])
GO
ALTER TABLE [dbo].[ServiceMechanic] CHECK CONSTRAINT [PK_serviceID]
GO
/****** Object:  ForeignKey [PK_serviceTicketID]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[ServiceMechanic]  WITH CHECK ADD  CONSTRAINT [PK_serviceTicketID] FOREIGN KEY([serviceTicketID])
REFERENCES [dbo].[ServiceTicket] ([serviceTicketID])
GO
ALTER TABLE [dbo].[ServiceMechanic] CHECK CONSTRAINT [PK_serviceTicketID]
GO
/****** Object:  ForeignKey [PK_partID]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[PartsUsed]  WITH CHECK ADD  CONSTRAINT [PK_partID] FOREIGN KEY([partID])
REFERENCES [dbo].[Parts] ([partID])
GO
ALTER TABLE [dbo].[PartsUsed] CHECK CONSTRAINT [PK_partID]
GO
/****** Object:  ForeignKey [PK_serviceTicketID2]    Script Date: 01/01/2025 18:40:59 ******/
ALTER TABLE [dbo].[PartsUsed]  WITH CHECK ADD  CONSTRAINT [PK_serviceTicketID2] FOREIGN KEY([serviceTicketID])
REFERENCES [dbo].[ServiceTicket] ([serviceTicketID])
GO
ALTER TABLE [dbo].[PartsUsed] CHECK CONSTRAINT [PK_serviceTicketID2]
GO

ALTER TABLE [dbo].[Account]
ALTER COLUMN name nvarchar(255) COLLATE Vietnamese_CI_AS;
GO



/****** Create trigger Script Date: 18/02/2025 15:24:20 ******/
-- Trigger này tự động thêm dữ liệu account mới vào bảng Customer
GO
CREATE TRIGGER trg_AfterInsertOnAccount
ON account
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO customer (custID, cust_name, phone, sex, cust_address)
    SELECT 
        i.id,       -- ID là khóa chính của bảng account
        i.name,     -- tên của account
        i.phone,    -- Trường điện thoại của account
        i.sex,      -- Trường giới tính của account
        i.address   -- Trường địa chỉ của account
    FROM inserted i;
END;
GO

/****** Create trigger Script Date: 06/03/2025 14:26:52 ******/
-- Trigger này cập nhật hourly_rate từ bảng Service sang bảng ServiceMechanic
GO
CREATE TRIGGER trg_UpdateServiceMechanicRate
ON [Car_Dealership].[dbo].[Service]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF UPDATE(hourly_rate) AND @@NESTLEVEL = 1
    BEGIN
        UPDATE sm
        SET sm.rate = s.hourly_rate
        FROM [Car_Dealership].[dbo].[ServiceMechanic] sm
        INNER JOIN inserted s ON sm.serviceID = s.serviceID;
        
        PRINT 'ServiceMechanic rates have been updated based on new hourly_rates';
    END
END;
GO

/****** Create trigger Script Date: 08/03/2025 2:01:55 ******/
-- Trigger này cập nhật hourly_rate từ bảng ServiceMechanic sang bảng Service
GO
CREATE TRIGGER trg_UpdateServiceRate
ON [dbo].[ServiceMechanic]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(rate) AND @@NESTLEVEL = 1
    BEGIN
        UPDATE S
        SET S.hourly_rate = I.rate
        FROM [dbo].[Service] S
        INNER JOIN inserted I ON S.serviceID = I.serviceID;
    END
END;
GO