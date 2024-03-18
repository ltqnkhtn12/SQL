USE MASTER
GO
if exists(select * from sys.databases where name='CsdlDonDatHang')
DROP DATABASE CsdlDonDatHang;
GO
CREATE DATABASE CsdlDonDatHang;
GO
USE CsdlDonDatHang;
GO
-- Tạo bảng NHACUNGCAP
CREATE TABLE NHACUNGCAP(
    MaNCC      int,
	TenNCC     varchar(40) not null,
	Email      varChar(40),
	ThanhPho   varchar(40) not null,
	QuocGia    varchar(40) not null,
	constraint NHACUNGCAP_PK primary key (MaNCC)
);
-- Tạo bảng MATHANG
CREATE TABLE MATHANG(
    MaMH       int,
	TenMH      varchar(50) not null,
	MaNCC      int,
	DonGia     decimal(12,2),
	TinhTrang  int,
	constraint MATHANG_PK primary key (MaMH),
	constraint MATHANG_NHACUNGCAP_FK foreign key (MaNCC) references NHACUNGCAP (MaNCC)
);
--Tạo bảng KHACHHANG
CREATE TABLE KHACHHANG(
    MaKH       int,
	HoTen      varchar(50) not null,
	DiaChi     varchar(50) not null,
	ThanhPho   varchar(40) not null,
	QuocGia    varchar(40) not null,
	SoDT       varchar(15) not null,
	constraint KHACHHANG_PK primary key (MaKH)
)
--Tạo bảng DONDATHANG
CREATE TABLE DONDATHANG(
    MaDDH        int,
	NgayDatHang  datetime,
	MaKH         int,
	TriGia       decimal(12,2),
	constraint DONDATHANG_PK primary key (MaDDH),
	constraint DONDATHANG_KHACHHANG_FK foreign key (MaKH) references KHACHHANG (MaKH)
);
--Tạo bảng CHITIETDDH
CREATE TABLE CHITIETDDH(
    MaCT       int,
	MaDDH      int,
	MaMH       int,
	DonGia     decimal(12,2),
	SoLuong    int,
	constraint CHITIETDDH_PK primary key (MaCT,MaDDH),
	constraint CHITIETDDH_DONDATHANG_FK foreign key (MaDDH) references DONDATHANG (MaDDH),
	constraint CHITIETDDH_MATHANG_FK foreign key (MaMH) references MATHANG (MaMH)
);
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES(1,'Exotic Liquids','London','UK')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES(2,'New Orleans Cajun Delights','New Orleans','USA')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES(3,'Grandma Kelly Homestead','Ann Arbor','USA')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (4,'Traders','Tokyo','Japan')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (5,'Cooperativa de Quesos Las Cabras','Oviedo','Spain')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (6,'Mayumi','Osaka','Japan')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (7,'Pavlova,Ltd.','Melbourne','Australia')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (8,'Specialty Biscuits, Ltd.','Manchester','UK')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES(9,'PB Knackebrod AB','Goteborg','Sweden')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (10,'Refrescos Americanas LTDA','Sao','Brazil')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (11,'Heli Subwaren GmbH & Co.KG','Berlin','Germany')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (12,'Plutzer Lebensmittelgrobmarkte AG','Frankfurt','Germany')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Cuxhaven','Germany')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (14,'Formaggi Fortini s.r.l.','Ravenna','Italy')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (15,'Norske Meierier','Sandvika','Norway')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (16,'Bigfoot Breweries','Bend','USA')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (17,'Svensk Sjofoda AB','Stockholm','Sweden')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (18,'Aux joyeux ecclesiastiques','Paris','France')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (19,'New England Seafood Cannery','Boston','USA')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (20,'Leka Trading','Singapore','Singapore')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (21,'Lyngbysild','Lyngby','Denmark')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (22,'Zaanse Snoepfabriek','Zaandam','Netherlands')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (23,'Karkki Oy','Lappeenranta','Finland')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (24,'Gday,Mate','Sydney','Australia')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (25,'Ma Maison','Montreal','Canada')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (26,'Pasta Buttini s.r.l.','Salerno','Italy')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (27,'Escargots Nouveaux','Montceau','France')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (28,'Gai paturage','Annecy','France')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,ThanhPho,QuocGia) VALUES (29,'Forets derables','Ste-Hyacinthe','Canada')
INSERT INTO KHACHHANG VALUES(1,'Maria Anders','NULL','Berlin', 'Germany','030-0074321');
INSERT INTO KHACHHANG VALUES(2,'Ana Trujillo','NULL','Mexico D.F.','Mexico','(5) 555-4729');
INSERT INTO KHACHHANG VALUES(3,'Antonio Moreno','NULL','Mexico D.F.','Mexico','(5) 555-3932');
INSERT INTO KHACHHANG VALUES(4,'Thomas Hardy','NULL','London','UK','(171) 555-7788');
INSERT INTO KHACHHANG VALUES(5,'Christina Berglund','NULL','Lulea','Sweden','0921-12 34 65');
INSERT INTO KHACHHANG VALUES(6,'Hanna Moos','NULL','Mannheim','Germany','0621-08460');
INSERT INTO KHACHHANG VALUES(7,'Frederique Citeaux','NULL','Strasbourg','France','88.60.15.31');
INSERT INTO KHACHHANG VALUES(8,'Martin Sommer','NULL','Madrid','Spain','(91) 555 22 82');
INSERT INTO KHACHHANG VALUES(9,'Laurence Lebihan','NULL','Marseille','France','91.24.45.40');
INSERT INTO KHACHHANG VALUES(10,'Elizabeth Lincoln','NULL','Tsawassen','Canada','(604) 555-4729');
INSERT INTO KHACHHANG VALUES(11,'Victoria Ashworth','NULL','London','UK','(171) 555-1212');
INSERT INTO KHACHHANG VALUES(12,'Patricio Simpson','NULL','Buenos Aires','Argentina','(1) 135-5555');
INSERT INTO KHACHHANG VALUES(13,'Francisco Chang','NULL','Mexico D.F.','Mexico','(5) 555-3392');
INSERT INTO KHACHHANG VALUES(14,'Yang Wang','NULL','Bern','Switzerland','0452-076545');
INSERT INTO KHACHHANG VALUES(15,'Pedro Afonso','NULL','Sao Paulo','Brazil','(11) 555-7647');
INSERT INTO KHACHHANG VALUES(16,'Elizabeth Brown','NULL','London','UK','(171) 555-2282');
INSERT INTO KHACHHANG VALUES(17,'Sven Ottlieb','NULL','Aachen','Germany','0241-039123');
INSERT INTO KHACHHANG VALUES(18,'Janine Labrune','NULL','Nantes','France','40.67.88.88');
INSERT INTO KHACHHANG VALUES(19,'Ann Devon','NULL','London','UK','(171) 555-0297');
INSERT INTO KHACHHANG VALUES(20,'Roland Mendel','NULL','Graz','Austria','7675-3425');
INSERT INTO KHACHHANG VALUES(21,'Aria Cruz','NULL',' Sao Paulo','Brazil','(11) 555-9857');
INSERT INTO KHACHHANG VALUES(22,'Diego Roel','NULL','Madrid','Spain','(91) 555 94 44');
INSERT INTO KHACHHANG VALUES(23,'Martine Rance','NULL','Lille','France','20.16.10.16');
INSERT INTO KHACHHANG VALUES(24,'Maria Larsson','NULL','Bracke','Sweden','0695-34 67 21');
INSERT INTO KHACHHANG VALUES(25,'Peter Franken','NULL','Munchen','Germany','089-0877310');
INSERT INTO KHACHHANG VALUES(26,'Carine Schmitt','NULL','Nantes','France','40.32.21.21');
INSERT INTO KHACHHANG VALUES(27,'Paolo','Accorti','Torino','Italy','011-4988260');
INSERT INTO KHACHHANG VALUES(28,'Lino Rodriguez','NULL','Lisboa','Portugal','(1) 354-2534');
INSERT INTO KHACHHANG VALUES(29,'Eduardo Saavedra','NULL','Barcelona','Spain','(93) 203 4560');
INSERT INTO KHACHHANG VALUES(30,'Jose Pedro Freyre','NULL','Sevilla','Spain','(95) 555 82 82');
INSERT INTO KHACHHANG VALUES(31,'Andre Fonseca','NULL','Campinas','Brazil','(11) 555-9482');
INSERT INTO KHACHHANG VALUES(32,'Howard Snyder','NULL','Eugene','USA','(503) 555-7555');
INSERT INTO KHACHHANG VALUES(33,'Manuel Pereira','NULL','Caracas','Venezuela','(2) 283-2951');
INSERT INTO KHACHHANG VALUES(34,'Mario Pontes','NULL','Rio de Janeiro','Brazil','(21) 555-0091');
INSERT INTO KHACHHANG VALUES(35,'Carlos Hernandez','NULL','San Cristobal','Venezuela','(5) 555-1340');
INSERT INTO KHACHHANG VALUES(36,'Yoshi Latimer','NULL','Elgin','USA','(503) 555-6874');
INSERT INTO KHACHHANG VALUES(37,'Patricia McKenna','NULL','Cork','Ireland','2967 542');
INSERT INTO KHACHHANG VALUES(38,'Helen Bennett','NULL','Cowes','UK','(198) 555-8888');
INSERT INTO KHACHHANG VALUES(39,'Philip Cramer','NULL','Brandenburg','Germany','0555-09876');
INSERT INTO KHACHHANG VALUES(40,'Daniel Tonini','NULL','Versailles','France','30.59.84.10');
INSERT INTO MATHANG VALUES(1,'Chai',1,18, 0);
INSERT INTO MATHANG VALUES(2,'Chang',1,19, 0);
INSERT INTO MATHANG VALUES(3,'Aniseed Syrup',1,10, 0);
INSERT INTO MATHANG VALUES(4,'Chef Antons Cajun Seasoning',2,22, 0);
INSERT INTO MATHANG VALUES(5,'Chef Antons Gumbo Mix',2,21.35, 1);
INSERT INTO MATHANG VALUES(6,'Grandmas Boysenberry Spread',3,25, 0);
INSERT INTO MATHANG VALUES(7,'Uncle Bobs Organic Dried Pears',3,30, 0);
INSERT INTO MATHANG VALUES(8,'Northwoods Cranberry Sauce',3,40, 0);
INSERT INTO MATHANG VALUES(9,'Mishi Kobe Niku',4,97, 1);
INSERT INTO MATHANG VALUES(10,'Ikura',4,31, 0);
INSERT INTO MATHANG VALUES(11,'Queso Cabrales',5,21, 0);
INSERT INTO MATHANG VALUES(12,'Queso Manchego La Pastora',5,38, 0);
INSERT INTO MATHANG VALUES(13,'Konbu',6,6, 0);
INSERT INTO MATHANG VALUES(14,'Tofu',6,23.25, 0);
INSERT INTO MATHANG VALUES(15,'Genen Shouyu',6,15.5, 0);
INSERT INTO MATHANG VALUES(16,'Pavlova',7,17.45, 0);
INSERT INTO MATHANG VALUES(17,'Alice Mutton',7,39, 1);
INSERT INTO MATHANG VALUES(18,'Carnarvon Tigers',7,62.5, 0);
INSERT INTO MATHANG VALUES(19,'Teatime Chocolate Biscuits',8,9.2, 0);
INSERT INTO MATHANG VALUES(20,'Sir Rodneys Marmalade',8,81, 0);
INSERT INTO MATHANG VALUES(21,'Sir Rodneys Scones',8,10, 0);
INSERT INTO MATHANG VALUES(22,'Gustafs Knackebröd',9,21, 0);
INSERT INTO MATHANG VALUES(23,'Tunnbrod',9,9, 0);
INSERT INTO MATHANG VALUES(24,'Guarana Fantastica',10,4.5, 1);
INSERT INTO MATHANG VALUES(25,'NuNuCa Nub-Nougat-Creme',11,14, 0);
INSERT INTO MATHANG VALUES(26,'Gumbar Gummibarchen',11,31.23, 0);
INSERT INTO MATHANG VALUES(27,'Schoggi Schokolade',11,43.9, 0);
INSERT INTO MATHANG VALUES(28,'Rossle Sauerkraut',12,45.6, 1);
INSERT INTO MATHANG VALUES(29,'Thuringer Rostbratwurst',12,123.79, 1);
INSERT INTO MATHANG VALUES(30,'Nord-Ost Matjeshering',13,25.89, 0);
INSERT INTO MATHANG VALUES(31,'Gorgonzola Telino',14,12.5, 0);
INSERT INTO MATHANG VALUES(32,'Mascarpone Fabioli',14,32, 0);
INSERT INTO MATHANG VALUES(33,'Geitost',15,2.5, 0);
INSERT INTO MATHANG VALUES(34,'Sasquatch Ale',16,14, 0);
INSERT INTO MATHANG VALUES(35,'Steeleye Stout',16,18, 0);
INSERT INTO MATHANG VALUES(36,'Inlagd Sill',17,19, 0);
INSERT INTO MATHANG VALUES(37,'Gravad lax',17,26, 0);
INSERT INTO MATHANG VALUES(38,'Cote de Blaye',18,263.5, 0);
INSERT INTO MATHANG VALUES(39,'Chartreuse verte',18,18, 0);
INSERT INTO MATHANG VALUES(40,'Boston Crab Meat',19,18.4, 0);
INSERT INTO MATHANG VALUES(41,'Jacks New England Clam Chowder',19,9.65, 0);
INSERT INTO MATHANG VALUES(42,'Singaporean Hokkien Fried Mee',20,14, 1);
INSERT INTO MATHANG VALUES(43,'Ipoh Coffee',20,46, 0);
INSERT INTO MATHANG VALUES(44,'Gula Malacca',20,19.45, 0);
INSERT INTO MATHANG VALUES(45,'Rogede sild',21,9.5, 0);
INSERT INTO MATHANG VALUES(46,'Spegesild',21,12, 0);
INSERT INTO MATHANG VALUES(47,'Zaanse koeken',22,9.5, 0);
INSERT INTO MATHANG VALUES(48,'Chocolade',22,12.75, 0);
INSERT INTO MATHANG VALUES(49,'Maxilaku',23,20, 0);
INSERT INTO MATHANG VALUES(50,'Valkoinen suklaa',23,16.25, 0);
INSERT INTO MATHANG VALUES(51,'Manjimup Dried Apples',24,53, 0);
INSERT INTO MATHANG VALUES(52,'Filo Mix',24,7, 0);
INSERT INTO MATHANG VALUES(53,'Perth Pasties',24,32.8, 1);
INSERT INTO MATHANG VALUES(54,'Tourtiere',25,7.45, 0);
INSERT INTO MATHANG VALUES(55,'Pâté chinois',25,24, 0);
INSERT INTO MATHANG VALUES(56,'Gnocchi di nonna Alice',26,38, 0);
INSERT INTO MATHANG VALUES(57,'Ravioli Angelo',26,19.5, 0);
INSERT INTO MATHANG VALUES(58,'Escargots de Bourgogne',27,13.25, 0);
INSERT INTO MATHANG VALUES(59,'Raclette Courdavault',28,55, 0);
INSERT INTO MATHANG VALUES(60,'Camembert Pierrot',28,34, 0);
INSERT INTO MATHANG VALUES(61,'Sirop derable',29,28.5, 0);
INSERT INTO MATHANG VALUES(62,'Tarte au sucre',29,49.3, 0);
INSERT INTO MATHANG VALUES(63,'Vegie-spread',7,43.9, 0);
INSERT INTO MATHANG VALUES(64,'Wimmers gute Semmelknodel',12,33.25, 0);
INSERT INTO MATHANG VALUES(65,'Louisiana Fiery Hot Pepper Sauce',2,21.05, 0);
INSERT INTO MATHANG VALUES(66,'Louisiana Hot Spiced Okra',2,17, 0);
INSERT INTO MATHANG VALUES(67,'Laughing Lumberjack Lager',16,14, 0);
INSERT INTO MATHANG VALUES(68,'Scottish Longbreads',8,12.5, 0);
INSERT INTO MATHANG VALUES(69,'Gudbrandsdalsost',15,36, 0);
INSERT INTO MATHANG VALUES(70,'Outback Lager',7,15, 0);
INSERT INTO MATHANG VALUES(71,'Flotemysost',15,21.5, 0);
INSERT INTO MATHANG VALUES(72,'Mozzarella di Giovanni',14,34.8, 0);
INSERT INTO MATHANG VALUES(73,'Rod Kaviar',17,15, 0);
INSERT INTO MATHANG VALUES(74,'Longlife Tofu',4,10, 0);
INSERT INTO MATHANG VALUES(75,'Rhonbrau Klosterbier',12,7.75, 0);
INSERT INTO MATHANG VALUES(76,'Lakkalikoori',23,18, 0);
INSERT INTO MATHANG VALUES(77,'Original Frankfurter grune Sobe',12,13, 0);
INSERT INTO MATHANG VALUES(78,'Stroopwafels',22,9.75, 0);
INSERT INTO DONDATHANG VALUES(1,'07/04/2012',15,440);
INSERT INTO DONDATHANG VALUES(2,'07/05/2012',9,1863.4);
INSERT INTO DONDATHANG VALUES(3,'07/08/2012',34,1813);
INSERT INTO DONDATHANG VALUES(4,'07/08/2012',14,670.8);
INSERT INTO DONDATHANG VALUES(5,'07/09/2012',26,3730);
INSERT INTO DONDATHANG VALUES(6,'07/10/2012',34,1444.8);
INSERT INTO DONDATHANG VALUES(7,'07/11/2012',14,625.2);
INSERT INTO DONDATHANG VALUES(8,'07/12/2012',38,2490.5);
INSERT INTO DONDATHANG VALUES(9,'07/15/2012',28,517.8);
INSERT INTO DONDATHANG VALUES(10,'07/16/2012',35,1119.9);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(1, 1, 11, 14, 12);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(2, 1, 42, 9.8, 10);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(3, 1, 72, 34.8, 5);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(4, 2, 14, 18.6, 9);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(5, 2, 51, 42.4, 40);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(6, 3, 41, 7.7, 10);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(7, 3, 51, 42.4, 35);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(8, 3, 65, 16.8, 15);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(9, 4, 22, 16.8, 6);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(10, 4, 57, 15.6, 15);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(11, 4, 65, 16.8, 20);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(12, 5, 20, 64.8, 40);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(13, 5, 33, 2, 25);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(14, 5, 60, 27.2, 40);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(15, 6, 31, 10, 20);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(16, 6, 39, 14.4, 42);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(17, 6, 49, 16, 40);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(18, 7, 24, 3.6, 15);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(19, 7, 55, 19.2, 21);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(20, 7, 74, 8, 21);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(21, 8, 2, 15.2, 20);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(22, 8, 16, 13.9, 35);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(23, 8, 36, 15.2, 25);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(24, 8, 59, 44, 30);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(25, 9, 53, 26.2, 15);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(26, 9, 77, 10.4, 12);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(27, 10, 27, 35.1, 25);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(28, 10, 39, 14.4, 6);
INSERT INTO CHITIETDDH(MaCT,MaDDH,MaMH,DonGia,SoLuong) VALUES(29, 10, 77, 10.4, 15);

--Cho biết mã số, họ tên, email của các nhà cung cấp ở Germany
select NCC.MaNCC, NCC.TenNCC, NCC.Email, NCC.QuocGia
from NHACUNGCAP as NCC
where (NCC.QuocGia = 'Germany')

--Cho biết danh sách các khách hàng. Sắp xếp theo thứ tự tăng của họ tên khách hàng, thứ tự giảm của tên quốc gia
select *
from KHACHHANG as KH
order by KH.HoTen ASC, KH.QuocGia DESC;

--Cho biết mã số, họ tên, số điện thoại của các khách hàng có tên bắt đầu bằng chữ L(ví dụ Elizabeth Lincoln, Maria Larsson, …)
select SUBSTRING(KH.HoTen, CHARINDEX(' ', KH.HoTen) + 1, LEN(KH.HoTen)) as Name, KH.MaKH, KH.SoDT
from KHACHHANG as KH
where SUBSTRING(KH.HoTen, CHARINDEX(' ', KH.HoTen) + 1, LEN(KH.HoTen)) LIKE 'L%';



--Với các nhà cung cấp ở Germany, cho biết mã số, tên nhà cung cấp và mã số, tên các mặt hàng của họ
select NCC.MaNCC, NCC.TenNCC, NCC.QuocGia, MH.MaMH, MH.TenMH
from NHACUNGCAP as NCC
inner join MATHANG as MH on NCC.MaNCC = MH.MaMH
where NCC.QuocGia = 'Germany'
order by NCC.MaNCC;

--Cho biết số lượng nhà cung cấp có nguồn gốc ở France
select NCC.MaNCC, NCC.QuocGia, MH.MaMH, CTDDH.SoLuong
from NHACUNGCAP as NCC
inner join MATHANG as MH on MH.MaNCC = NCC.MaNCC
inner join CHITIETDDH as CTDDH on CTDDH.MaMH =	MH.MaMH
Where NCC.QuocGia = 'France'
order by CTDDH.SoLuong;

--Cho biết mã số, địa chỉ, số điện thoại và tổng trị giá các đơn hàng của khách hàng có tên Yang Wang.
select KH.MaKH, KH.DiaChi, KH.SoDT, sum(DDH.TriGia) as TongTriGia
from KHACHHANG as KH
inner join DONDATHANG as DDH on DDH.MaKH = KH.MaKH
where KH.HoTen LIKE 'Yang Wang'
group by KH.MaKH, KH.DiaChi, KH.SoDT;

--Cho biết mã số, tên, đơn giá và đơn giá đặt hàng trung bình, tổng số lượng của các mặt hàng được đặt hàng trong tháng 07/2012. 
select avg(DonGia) as 'Don Gia Trung Binh'
from  MATHANG; 
select MH.MaMH, MH.TenMH,sum(CTDDH.SoLuong) as 'So Luong'
from CHITIETDDH as CTDDH, MATHANG as MH
where (CTDDH.MaMH = MH.MaMH)
group by MH.MaMH, MH.TenMH,MH.DonGia

--Cho biết các khách hàng mà tổng trị giá tất cả các đơn đặt hàng của họ lớn hơn 3,000. 
select KH.HoTen, sum(TriGia) as "TriGia"
from DONDATHANG as DDH, KHACHHANG as KH
where (DDH.MaKH=KH.MaKH)
group by KH.HoTen
having sum(TriGia) > 3000;

--Với mỗi nhà cung cấp, cho biết mã số, tên, email và tổng số mặt hàng có đơn giá lớn hơn 30 mà họ cung cấp
select NCC.MaNCC, NCC.TenNCC, NCC.Email, count(MH.MaMH) as 'So Luong'
from NHACUNGCAP as NCC
inner join MATHANG as MH on MH.MaNCC = NCC.MaNCC
where MH.DonGia > 30
group by NCC.MaNCC, NCC.TenNCC, NCC.Email

--Cho biết mã số, tên các mặt hàng với số lượng được đặt hàng nhiều nhất. 
select MH.MaMH, MH.TenMH, sum(DDH.SoLuong) as TongSoLuong
from MATHANG as MH
inner join CHITIETDDH as DDH on DDH.MaMH=MH.MaMH
group by MH.MaMH,MH.TenMH
Having sum(DDH.SoLuong) = (
select max(TongSoLuong)
from (
select sum(DDH.SoLuong) as TongSoLuong
from MATHANG as MH
inner join CHITIETDDH as DDH on DDH.MaMH=MH.MaMH
group by MH.DonGia,MH.TenMH
) as T
)

--Cho biết mã số, họ tên, email của các khách hàng không đặt mặt hàng của các nhà cung cấp từ Japan
select KH.MaKH, KH.HoTen, KH.DiaChi
from KHACHHANG as KH
inner join DONDATHANG as DDH on DDH.MaKH = KH.MaKH
inner join CHITIETDDH as CTDDH on CTDDH.MaDDH = DDH.MaDDH
inner join MATHANG as MH on MH.MaMH = CTDDH.MaMH
inner join NHACUNGCAP as NCC on NCC.MaNCC = MH.MaNCC
where NCC.QuocGia not in (
select NCC.QuocGia
from NHACUNGCAP as NCC
where NCC.QuocGia in ('Japan')
)
group by KH.MaKH, KH.HoTen, KH.DiaChi

--Cho biết mã số, tên, đơn giá của các mặt hàng xuất hiện trong tất cả các đơn đặt hàng của khách hàng có mã số 34
select MH.MaMH,MH.TenMH,MH.DonGia
from MATHANG as MH
inner join CHITIETDDH as CTDDH on CTDDH.MaMH = MH.MaMH
inner join DONDATHANG as DDH on DDH.MaDDH = CTDDH.MaDDH
where DDH.MaKH = 34

--Cho biết các khách hàng ở Brazil có đơn đặt hàng có trị giá lớn nhất.
select KH.MaKH, KH.HoTen, sum(DDH.TriGia) as TriGia
from KHACHHANG as KH
inner join DONDATHANG as DDH on DDH.MaKH = KH.MaKH
group by KH.MaKH, KH.HoTen
having sum(DDH.TriGia) = (
select max(TriGia)
from (
select sum(DDH.TriGia) as TriGia
from KHACHHANG as KH
inner join DONDATHANG as DDH on DDH.MaKH = KH.MaKH
where KH.QuocGia = 'Brazil'
group by KH.MaKH, KH.HoTen
) as T
)






