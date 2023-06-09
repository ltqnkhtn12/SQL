use master;

if exists(select *
			from sys.databases
				where name = 'Csdl_QuanLySinhVien')
drop database Csdl_QuanLySinhVien;
go
create database Csdl_QuanLySinhVien;
go

use Csdl_QuanLySinhVien;

create table KHOA (
MaKhoa char(5) not null,
TenKhoa varchar(50) not null,
constraint PK_KHOA primary key (MaKhoa)
);

create table MONHOC (
TenMH varchar(50) not null,
MaMH char(5) not null,
SoTiet int not null,
constraint PK_MONHOC primary key (MaMH)
);

create table SINHVIEN (
HoSV varchar(50) not null,
TenSV varchar(10) not null,
MaSV char(5) not null,
NgaySinh datetime,
GioiTinh varchar(5) not null,
MaKhoa char(5),
constraint FK_SINHVIEN_MAKHOA foreign key (MaKhoa) references KHOA(MAKHOA),
constraint PK_SINHVIEN primary key (MaSV)
);

create table KETQUA (
MaSV char(5) foreign key references SINHVIEN(MaSV),
MaMH char(5) foreign key references MONHOC(MaMH),
LanThi decimal not null,
Diem decimal not null,
constraint PK_KETQUA_MASV_MAMH_LANTHI primary key (MASV,MAMH,LANTHI)
);


insert into KHOA values('CNTT','Cong Nghe Thong tin')
insert into KHOA values('QTKD','Quan Tri Kinh Doanh')
insert into KHOA values('DTVT','Dien Tu Vien Thong')
insert into KHOA values('AVAN','Khoa anh Van')

insert into SINHVIEN values('Tran Minh','Son','S001','01/05/1985','Nam','CNTT')
insert into SINHVIEN values('Nguyen Quoc','Bao','S002','15/06/1986','Nam','CNTT')
insert into SINHVIEN values('Phan Anh','Tung','S003','20/12/1983','Nam','QTKD')
insert into SINHVIEN values('Bui Thi anh','Thu','S004','01/02/1985','Nu','QTKD')
insert into SINHVIEN values('Le Thi Lan','Anh','S005','03/07/1987','Nu','DTVT')
insert into SINHVIEN values('Nguyen Thi','Lam','S006','25/11/1984','Nu','DTVT')
insert into SINHVIEN values('Phan Thi','Ha','S007','03/07/1988','Nu','CNTT')
insert into SINHVIEN values('Tran The','Dung','S008','21/10/1985','Nam','CNTT')

insert into MONHOC values('Ke Toan Tai Chinh','KTTC',45)
insert into MONHOC values('Toan Cao Cap','TCC',60)
insert into MONHOC values('Co So Du Lieu','CSDL',45)
insert into MONHOC values('Ky Thuat Lap Trinh','KTLT',60)
insert into MONHOC values('Tin Hoc Van Phong','THVP',30)
insert into MONHOC values('Anh Van','AV',45)
insert into MONHOC values('Tri Tue Nhan Tao','TTNT',45)

insert into KETQUA values('S001','TCC',1,5.5)
insert into KETQUA values('S002','CSDL',1,3)
insert into KETQUA values('S008','AV',1,7)
insert into KETQUA values('S002','CSDL',2,6)
insert into KETQUA values('S003','KTTC',1,4.5)
insert into KETQUA values('S004','AV',1,8)
insert into KETQUA values('S004','THVP',1,3.5)
insert into KETQUA values('S006','TCC',1,5)
insert into KETQUA values('S001','CSDL',1,4)
insert into KETQUA values('S007','AV',1,2)
insert into KETQUA values('S004','THVP',2,7.5)
insert into KETQUA values('S007','KTLT',1,6)
insert into KETQUA values('S007','AV',2,9)

--Cho biet ket qua hoc tap cua sinh vien co ma S007
select *
from KETQUA as KQ
where KQ.MaSV = 'S007'