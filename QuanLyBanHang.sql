use master;

if exists(select *
			from sys.databases
				where name = 'Csdl_QuanLyBanHang')
drop database Csdl_QuanLyBanHang;
go
create database Csdl_QuanLyBanHang;
go

use Csdl_QuanLyBanHang;

create table KHACHHANG (
MaKH char(4) not null,
HoTen varchar(40) not null,
DiaChi varchar(50) not null,
SoDienThoai varchar(20) not null,
NgaySinh smalldatetime not null,
DoanhSo money not null,
constraint PK_KHACHHANG primary key (MaKH)
);

create table NHANVIEN (
MaNV char(4) not null,
HoTen varchar(40) not null,
SoDienThoai varchar(20) not null,
NgayVaoLam smalldatetime not null,
constraint PK_NHANVIEN primary key (MaNV)
);

create table SANPHAM (
MaSP char(4) not null,
TenSP varchar(40) not null,
DonViTinh varchar(20) not null,
NuocSanXuat varchar(40) not null,
Gia money not null,
constraint PK_SANPHAM primary key (MaSP)
);

create table HOADON (
SoHD int not null,
NgayMuaHang smalldatetime not null,
MaKH char(4) foreign key references KHACHHANG(MaKH),
MaNV char(4) foreign key references NHANVIEN(MaNV),
TriGia money not null,
constraint PK_HOADON primary key (SoHD)
);

create table CHITIETHOADON (
SoHD int foreign key references HOADON(SoHD),
MaSP char(4) foreign key references SANPHAM(MaSP),
SoLuong int not null
);

--Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
alter table SANPHAM add GhiChu varchar(20) not null

--Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
alter table KHACHHANG add LoaiKH tinyint not null

--Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
alter table SANPHAM alter column GhiChu varchar(100) not null

--Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
alter table SANPHAM drop column GhiChu

--Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang ai”, “Thuong xuyen”, “Vip”, …
alter table KHACHHANG add constraint check_LoaiKH check(LoaiKH='Vang ai' or LoaiKH='Thuong xuyen' or LoaiKH='vip')

-- Đơn vị tính của sản phẩm chỉ có thể là (“cây”,”hộp”,”cái”,”quyển”,”chục”)
alter table SANPHAM add constraint check_DonViTinh check(DonViTinh='cay' or DonViTinh='hop' or DonViTinh='cai' or DonViTinh ='quyen' or DonViTinh='chuc')

-- Giá bán của sản phẩm từ 500 đồng trở lên.
select SP.MaSP, SP.TenSP, SP.Gia
from SANPHAM as SP
where SP.Gia >= 500