DROP DATABASE IF EXISTS WebBanSach

CREATE DATABASE WebBanSach

USE WebBanSach

CREATE TABLE KHACHHANG (
	Id int not null identity,
	TenDangNhap varchar(50) not null,
	HoTen nvarchar(50) not null,
	SoDienThoai varchar(12) not null,
	MatKhau nvarchar(50),
	Email varchar(50),
	GioiTinh nvarchar(10),
	NgaySinh date,

	primary key (id),
	unique (SoDienThoai, TenDangNhap, Email)
)

INSERT INTO KHACHHANG
	(TenDangNhap, HoTen, SoDienThoai, MatKhau, Email, GioiTinh, NgaySinh)
VALUES 
	('thu', 'Nguyễn Phan Minh Thư', '0898154428', '123', 'minhthu20201@gmail.com', 'Nữ', '20/02/2001')
