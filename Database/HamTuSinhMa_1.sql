create database QuanLyRapChieuPhim;
go
use QuanLyRapChieuPhim
go
--The Loai Phim
CREATE FUNCTION AUTO_IDTLP()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaTheLoaiPhim) FROM THE_LOAI_PHIM) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaTheLoaiPhim, 3)) FROM THE_LOAI_PHIM
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TLP00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TLP0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TLP' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Loai Nha Cung Cap

CREATE FUNCTION AUTO_IDLOAINCC()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaLoaiNCC) FROM LOAI_NHA_CUNG_CAP) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaLoaiNCC, 2)) FROM LOAI_NHA_CUNG_CAP
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'LNCC0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'LNCC' + CONVERT(CHAR, CONVERT(INT, @ID) + 1) end
	RETURN @ID
END
go
--Nha Cung Cap

CREATE FUNCTION AUTO_IDNCC()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaNhaCungCap) FROM NHA_CUNG_CAP) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaNhaCungCap, 3)) FROM NHA_CUNG_CAP
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NCC00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'NCC0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'NCC' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Hang San Xuat Phim
CREATE FUNCTION AUTO_IDHSXP()
RETURNS VARCHAR(9)
AS
BEGIN
	DECLARE @ID VARCHAR(9)
	IF (SELECT COUNT(MaHangSanXuatPhim) FROM HANG_SAN_XUAT_PHIM) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaHangSanXuatPhim, 5)) FROM HANG_SAN_XUAT_PHIM
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HSXP0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'HSXP000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'HSXP00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'HSXP0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 THEN 'HSXP' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Phim

CREATE FUNCTION AUTO_IDP()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaPhim) FROM PHIM) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaPhim, 5)) FROM PHIM
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'P0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'P000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'P00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'P0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 THEN 'P' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--DienVienDaoDien

CREATE FUNCTION AUTO_IDDVDD()
RETURNS VARCHAR(9)
AS
BEGIN
	DECLARE @ID VARCHAR(9)
	IF (SELECT COUNT(MaDienVienDaoDien) FROM DIEN_VIEN_DAO_DIEN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaDienVienDaoDien, 5)) FROM DIEN_VIEN_DAO_DIEN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'DVDD0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'DVDD000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'DVDD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'DVDD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 THEN 'DVDD' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Phong Chieu

CREATE FUNCTION AUTO_IDPC()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaPhongChieu) FROM PHONG_CHIEU) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaPhongChieu, 4)) FROM PHONG_CHIEU
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'PC000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'PC00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'PC0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'PC' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Khung Gio Chieu

CREATE FUNCTION AUTO_IDKGC()
RETURNS VARCHAR(8)
AS
BEGIN
	DECLARE @ID VARCHAR(8)
	IF (SELECT COUNT(MaKhungGioChieu) FROM KHUNG_GIO_CHIEU) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaKhungGioChieu, 5)) FROM KHUNG_GIO_CHIEU
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'KGC0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'KGC000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'KGC00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'KGC0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 THEN 'KGC' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Ca Lam Viec

CREATE FUNCTION AUTO_IDCLV()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaCa) FROM CA_LAM_VIEC) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaCa, 3)) FROM CA_LAM_VIEC
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CLV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CLV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'CLV' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go

--Chinh Sach 

CREATE FUNCTION AUTO_IDCS()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaChinhSach) FROM CHINH_SACH) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaChinhSach, 4)) FROM CHINH_SACH
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CS000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CS00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'CS0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'CS' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Chuc Vu

CREATE FUNCTION AUTO_IDCV()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaChucVu) FROM CHUC_VU) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaChucVu, 4)) FROM CHUC_VU
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CV000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'CV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'CV' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Nhan Vien

CREATE FUNCTION AUTO_IDNV()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaNhanVien) FROM NHAN_VIEN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaNhanVien, 4)) FROM NHAN_VIEN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NV000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'NV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'NV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'NV' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Loai Kho

CREATE FUNCTION AUTO_IDLK()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MaLoaiKho) FROM LOAI_KHO) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaLoaiKho, 3)) FROM LOAI_KHO
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'LK00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'LK0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'LK' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Kho

CREATE FUNCTION AUTO_IDK()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MaKho) FROM KHO) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaKho, 4)) FROM KHO
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'K000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'K00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'K0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 990 THEN 'K' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Thuc An

CREATE FUNCTION AUTO_IDTA()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaThucAn) FROM THUC_AN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaThucAn, 4)) FROM THUC_AN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TA000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TA00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'TA0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'TA' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Vat Tu

CREATE FUNCTION AUTO_IDVT()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaVatTu) FROM VAT_TU) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaVatTu, 4)) FROM VAT_TU
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'VT000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'VT00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'VT0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'VT' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Loai De Xuat

CREATE FUNCTION AUTO_IDLDX()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MaLoaiDeXuat) FROM LOAI_DE_XUAT) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaLoaiDeXuat, 2)) FROM LOAI_DE_XUAT
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'LDX0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'LDX' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--De Xuat

CREATE FUNCTION AUTO_IDDX()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaDeXuat) FROM DE_XUAT) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaDeXuat, 4)) FROM DE_XUAT
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'DX000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'DX00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'DX0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'DX' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Loai Phieu

CREATE FUNCTION AUTO_IDLP()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MaLoaiPhieu) FROM LOAI_PHIEU) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaLoaiPhieu, 3)) FROM LOAI_PHIEU
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'LP00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'LP0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'LP' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
--Phieu

CREATE FUNCTION AUTO_IDPH()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaPhieu) FROM PHIEU) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaPhieu, 4)) FROM PHIEU
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'PH000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'PH00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'PH0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'PH' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go

--- HOP DONG
CREATE FUNCTION AUTO_IDHOPDONG()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaHopDong) FROM HOP_DONG) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaHopDong, 4)) FROM HOP_DONG
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HD000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'HD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'HD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'HD' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
-- LoaiHopDong
go
CREATE FUNCTION AUTO_IDLOAIHOPDONG()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaLoaiHopDong) FROM LOAI_HOP_DONG) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaLoaiHopDong, 3)) FROM LOAI_HOP_DONG
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'LHD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'LHD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'LHD' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END
go
CREATE FUNCTION AUTO_IDLOAIPHONGCHIEU()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaLoaiPhongChieu) FROM LOAI_PHONG_CHIEU) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaLoaiPhongChieu, 3)) FROM LOAI_PHONG_CHIEU
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'LPC00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'LPC0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'LPC' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			end
	RETURN @ID
END