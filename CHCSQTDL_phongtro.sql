CREATE TABLE LOAIHINH
(
  MaLoaiHinh NUMBER ,
  TenLoaiHinh NVARCHAR2(250),
  CONSTRAINT PK_LOAIHINH PRIMARY KEY (MaLoaiHinh)
);

CREATE TABLE VITIEN
(
  TongTien NUMBER(19,4),
  MaTT NUMBER,
  TrangThai NUMBER(1) DEFAULT 1,
  NgayTT DATE,
  CONSTRAINT PK_VITIEN PRIMARY KEY (MaTT)
);

CREATE TABLE TINHTRANG
(
  MaTT NUMBER,
  TenTT NVARCHAR2(250),
  CONSTRAINT PK_TINHTRANG PRIMARY KEY (MaTT)
);

CREATE TABLE CHUCVU
(
  MaCV NUMBER,
  TenCV NVARCHAR2(250),
  TrangThai NUMBER(1) DEFAULT 1,
  CONSTRAINT PK_CHUCVU PRIMARY KEY (MaCV)
);

CREATE TABLE QUANTRIVIEN
(
  MaQTV NUMBER,
  TaiKhoan VARCHAR2(250),
  MatKhau VARCHAR2(250),
  HinhAnh VARCHAR2(250),
  Email VARCHAR2(250),
  MaCV NUMBER,
  CONSTRAINT PK_QUANTRIVIEN PRIMARY KEY (MaQTV),
  CONSTRAINT FK_QUANTRIVIEN_CHUCVU FOREIGN KEY (MaCV) REFERENCES CHUCVU(MaCV)
);

CREATE TABLE KHACHHANG
(
  MaKH NUMBER,
  SDT VARCHAR2(20),
  MatKhau VARCHAR2(250),
  HoTen VARCHAR2(250),
  HinhAnh VARCHAR2(250),
  TrangThai NUMBER(1) DEFAULT 1,
  Ngaytao DATE,
  DiaChi VARCHAR2(250),
  MaCV NUMBER,
  MaTT NUMBER,
  CONSTRAINT PK_KHACHHANG PRIMARY KEY (MaKH),
  CONSTRAINT FK_KHACHHANG_CHUCVU FOREIGN KEY (MaCV) REFERENCES CHUCVU(MaCV),
  CONSTRAINT FK_KHACHHANG_VITIEN FOREIGN KEY (MaTT) REFERENCES VITIEN(MaTT)
);
---------------------
ALTER TABLE KHACHHANG
ADD NgaySinh DATE;
--------------------
CREATE TABLE THANHPHO
(
 MaTP NUMBER,
 TenTP VARCHAR2(250),
 CONSTRAINT PK_THANHPHO PRIMARY KEY (MaTP)
);

CREATE TABLE QUAN
(
 MaQuan NUMBER,
 TenQuan VARCHAR2(250),
 MaTP NUMBER,
 CONSTRAINT PK_QUAN PRIMARY KEY (MaQuan),
 CONSTRAINT FK_QUAN_THANHPHO FOREIGN KEY (MaTP) REFERENCES THANHPHO(MaTP)
);

CREATE TABLE PHUONG
(
 MaPhuong NUMBER,
 TenPhuong VARCHAR2(250),
 MaQuan NUMBER,
 CONSTRAINT PK_PHUONG PRIMARY KEY (MaPhuong),
 CONSTRAINT FK_PHUONG_QUAN FOREIGN KEY (MaQuan) REFERENCES QUAN(MaQuan)
);


CREATE TABLE TIN
(
  MaTin NUMBER,
  TieuDe VARCHAR2(250),
  MoTa VARCHAR2(1000),
  NgayDang DATE,
  TrangThai NUMBER(1) DEFAULT 1,
  DienTich NUMBER(10, 2),
  HinhAnh VARCHAR2(250),
  TienThue NUMBER(19,4),
  TienCoc NUMBER(19,4),
  MaLoaiHinh NUMBER,
  MaTT NUMBER,
  MaTP NUMBER,
  MaQuan NUMBER,
  MaPhuong NUMBER,
  CONSTRAINT PK_TIN PRIMARY KEY (MaTin),
  CONSTRAINT FK_TIN_LOAIHINH FOREIGN KEY (MaLoaiHinh) REFERENCES LOAIHINH(MaLoaiHinh),
  CONSTRAINT FK_TIN_VITIEN FOREIGN KEY (MaTT) REFERENCES TINHTRANG(MaTT),
  CONSTRAINT FK_TIN_THANHPHO FOREIGN KEY (MaTP) REFERENCES THANHPHO(MaTP),
  CONSTRAINT FK_TIN_QUAN FOREIGN KEY (MaQuan) REFERENCES QUAN(MaQuan),
  CONSTRAINT FK_TIN_PHUONG FOREIGN KEY (MaPhuong) REFERENCES PHUONG(MaPhuong)
);

CREATE TABLE BINHLUAN
(
  MaBl NUMBER,
  NgayBinhLuan DATE,
  NoiDung VARCHAR2(1000),
  TrangThai NUMBER(1),
  MaTin NUMBER,
  MaKH NUMBER,
  CONSTRAINT PK_BINHLUAN PRIMARY KEY (MaBl),
  CONSTRAINT FK_BINHLUAN_TIN FOREIGN KEY (MaTin) REFERENCES TIN(MaTin),
  CONSTRAINT FK_BINHLUAN_KHACHHANG FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
);

CREATE TABLE YEUTHICH
(
  MaYT NUMBER,
  NgayYeuThich DATE,
  MaKH NUMBER,
  MaTin NUMBER,
  CONSTRAINT PK_YEUTHICH PRIMARY KEY (MaYT),
  CONSTRAINT FK_YEUTHICH_KHACHHANG FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
  CONSTRAINT FK_YEUTHICH_TIN FOREIGN KEY (MaTin) REFERENCES TIN(MaTin)
);

CREATE TABLE LICHSUGD
(
  MaLSGD NUMBER,
  SoTien NUMBER(19,4),
  MaTT NUMBER,
  MaTin NUMBER,
  CONSTRAINT PK_LichSuGD PRIMARY KEY (MaLSGD),
  CONSTRAINT FK_LichSuGD_VITIEN FOREIGN KEY (MaTT) REFERENCES VITIEN(MaTT),
  CONSTRAINT FK_LichSuGD_TIN FOREIGN KEY (MaTin) REFERENCES TIN(MaTin)
);
ALTER TABLE LICHSUGD
ADD NgayGD DATE;
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--SELECT DATA--
SELECT * FROM LOAIHINH;
SELECT * FROM VITIEN;
SELECT * FROM TINHTRANG;
SELECT * FROM CHUCVU;
SELECT * FROM QUANTRIVIEN;
SELECT * FROM KHACHHANG;
SELECT * FROM THANHPHO;
SELECT * FROM QUAN;
SELECT * FROM PHUONG;
SELECT * FROM TIN;
SELECT * FROM BINHLUAN;
SELECT * FROM LICHSUGD;
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--INSERT INTO--
--LOAIHINH--
INSERT INTO LOAIHINH (MaLoaiHinh, TenLoaiHinh) VALUES (1, 'Phòng tr?');
INSERT INTO LOAIHINH (MaLoaiHinh, TenLoaiHinh) VALUES (2, 'Nhà nguyên c?n');
INSERT INTO LOAIHINH (MaLoaiHinh, TenLoaiHinh) VALUES (3, 'C?n h?');
INSERT INTO LOAIHINH (MaLoaiHinh, TenLoaiHinh) VALUES (4, 'M?t b?ng');
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--VITIEN--
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (6069902, 1, 0, TO_DATE('2022-11-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7096929, 2, 0, TO_DATE('2024-02-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9123413, 3, 1, TO_DATE('2020-03-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9278266, 4, 0, TO_DATE('2021-02-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (8074053, 5, 0, TO_DATE('2024-03-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9350775, 6, 1, TO_DATE('2022-01-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3984308, 7, 0, TO_DATE('2022-10-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9797979, 8, 0, TO_DATE('2020-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9281770, 9, 0, TO_DATE('2024-01-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (656965, 10, 0, TO_DATE('2021-05-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (6686432, 11, 0, TO_DATE('2021-09-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (126683, 12, 0, TO_DATE('2023-07-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3481528, 13, 1, TO_DATE('2022-11-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5128885, 14, 1, TO_DATE('2021-12-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7353021, 15, 1, TO_DATE('2020-04-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5004520, 16, 1, TO_DATE('2023-06-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9089167, 17, 0, TO_DATE('2020-04-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2331890, 18, 1, TO_DATE('2021-09-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3360538, 19, 0, TO_DATE('2023-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (6789287, 20, 0, TO_DATE('2021-11-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5215728, 21, 0, TO_DATE('2022-06-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (1091999, 22, 1, TO_DATE('2023-04-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3478629, 23, 0, TO_DATE('2023-03-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (1851928, 24, 0, TO_DATE('2020-09-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5876558, 25, 0, TO_DATE('2024-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (6110659, 26, 0, TO_DATE('2021-07-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (709483, 27, 1, TO_DATE('2023-09-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7551979, 28, 0, TO_DATE('2020-08-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (567285, 29, 1, TO_DATE('2022-05-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2806574, 30, 1, TO_DATE('2020-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3393899, 31, 0, TO_DATE('2021-06-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5953435, 32, 0, TO_DATE('2022-03-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (6105109, 33, 0, TO_DATE('2023-02-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (763094, 34, 0, TO_DATE('2023-12-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (6971392, 35, 0, TO_DATE('2022-04-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (4447908, 36, 0, TO_DATE('2021-08-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7531729, 37, 0, TO_DATE('2020-03-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2415756, 38, 1, TO_DATE('2023-05-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7455602, 39, 0, TO_DATE('2020-08-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7691130, 40, 0, TO_DATE('2023-06-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9736500, 41, 1, TO_DATE('2021-01-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (318267, 42, 0, TO_DATE('2024-01-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3974633, 43, 0, TO_DATE('2022-08-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5520384, 44, 0, TO_DATE('2021-07-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3954513, 45, 0, TO_DATE('2022-06-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (4102164, 46, 1, TO_DATE('2021-01-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7088511, 47, 0, TO_DATE('2023-05-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2361875, 48, 1, TO_DATE('2023-10-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9482589, 49, 0, TO_DATE('2020-12-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2588271, 50, 0, TO_DATE('2023-01-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (6219902, 51, 0, TO_DATE('2022-08-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5509042, 52, 1, TO_DATE('2020-12-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (1152317, 53, 1, TO_DATE('2020-01-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (6358685, 54, 1, TO_DATE('2023-11-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (691845, 55, 0, TO_DATE('2023-06-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (8093882, 56, 0, TO_DATE('2022-04-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3232499, 57, 1, TO_DATE('2022-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (537769, 58, 0, TO_DATE('2023-03-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5665523, 59, 0, TO_DATE('2021-11-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9135098, 60, 1, TO_DATE('2023-09-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (1014889, 61, 0, TO_DATE('2020-10-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (1880103, 62, 0, TO_DATE('2021-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7471472, 63, 1, TO_DATE('2020-06-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7407516, 64, 0, TO_DATE('2021-10-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (6867208, 65, 0, TO_DATE('2022-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9014855, 66, 0, TO_DATE('2021-08-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2488004, 67, 0, TO_DATE('2021-07-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (8251487, 68, 1, TO_DATE('2021-06-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3660742, 69, 1, TO_DATE('2020-04-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9514791, 70, 1, TO_DATE('2022-04-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2905409, 71, 1, TO_DATE('2021-01-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (1197409, 72, 0, TO_DATE('2022-08-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5134896, 73, 0, TO_DATE('2020-03-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2025271, 74, 1, TO_DATE('2024-01-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5427040, 75, 0, TO_DATE('2020-03-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (8936460, 76, 0, TO_DATE('2020-07-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (4212858, 77, 1, TO_DATE('2023-09-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2079574, 78, 1, TO_DATE('2020-05-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (955336, 79, 1, TO_DATE('2022-09-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3429249, 80, 1, TO_DATE('2020-08-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (4865319, 81, 0, TO_DATE('2020-07-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9616858, 82, 1, TO_DATE('2022-05-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (9115774, 83, 0, TO_DATE('2023-11-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (1093752, 84, 0, TO_DATE('2023-08-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2331088, 85, 0, TO_DATE('2023-09-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (8558841, 86, 1, TO_DATE('2020-11-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7485377, 87, 1, TO_DATE('2023-07-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (8432525, 88, 0, TO_DATE('2021-04-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (2577740, 89, 1, TO_DATE('2021-12-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (1480955, 90, 0, TO_DATE('2023-03-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7178428, 91, 1, TO_DATE('2022-03-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7503739, 92, 1, TO_DATE('2021-10-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (1599232, 93, 1, TO_DATE('2021-03-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5363262, 94, 1, TO_DATE('2023-08-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (3354709, 95, 1, TO_DATE('2020-12-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (8296077, 96, 0, TO_DATE('2020-11-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (8745275, 97, 1, TO_DATE('2020-11-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (958084, 98, 0, TO_DATE('2020-03-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (5685908, 99, 1, TO_DATE('2023-08-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VITIEN (TongTien, MaTT, TrangThai, NgayTT) VALUES (7766750, 100, 1, TO_DATE('2022-07-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--TINHTRANG--
INSERT INTO TINHTRANG (MaTT, TenTT) VALUES (1, 'N?i th?t ??y ??');
INSERT INTO TINHTRANG (MaTT, TenTT) VALUES (2, 'Có n?i th?t');
INSERT INTO TINHTRANG (MaTT, TenTT) VALUES (3, 'Không có n?i th?t');
INSERT INTO TINHTRANG (MaTT, TenTT) VALUES (4, 'Nhà tr?ng');
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--CHUCVU--
INSERT INTO CHUCVU (MaCV, TenCV, TrangThai) VALUES (1, 'Qu?n tr? viên', 1);
INSERT INTO CHUCVU (MaCV, TenCV, TrangThai) VALUES (2, 'Duy?t bài vi?t', 1);
INSERT INTO CHUCVU (MaCV, TenCV, TrangThai) VALUES (3, 'Premium', 1);
INSERT INTO CHUCVU (MaCV, TenCV, TrangThai) VALUES (4, '??ng bài', 1);
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--QUANTRIVIEN--
INSERT INTO QUANTRIVIEN (MaQTV, TaiKhoan, MatKhau, HinhAnh, Email, MaCV) VALUES (1, 'Admin', 'password','' , 'example@gmail.com',1);
INSERT INTO QUANTRIVIEN (MaQTV, TaiKhoan, MatKhau, HinhAnh, Email, MaCV) VALUES (2, 'duongquion', 'on290503','' , 'duongquion@gmail.com',2);
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--KHACHHANG--
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (1, '0389707474', 'L0ooSfJH', 'Tr?n  Tu?n', '', 1, TO_DATE('2022-04-13', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 1, 388, TO_DATE('1966-07-30', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (2, '0664599449', 'Ep9iiZjN', 'Tr?n Th? Nam', '', 1, TO_DATE('2023-12-10', 'YYYY-MM-DD'), '???ng Lê L?i', 5, 271, TO_DATE('1975-10-20', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (3, '0636707041', 'CzwHA0oC', 'Ph?m Th? Oanh', '', 1, TO_DATE('2023-02-16', 'YYYY-MM-DD'), '???ng Lê L?i', 2, 858, TO_DATE('1986-06-05', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (4, '0891024244', '9np3M1gL', 'Lý Th? Uyên', '', 1, TO_DATE('2022-01-26', 'YYYY-MM-DD'), '???ng Lê L?i', 1, 427, TO_DATE('2005-11-15', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (5, '0836179688', 'pIQwh2AP', 'Lê H?u Linh', '', 1, TO_DATE('2021-02-21', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 3, 634, TO_DATE('2001-12-14', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (6, '0554206495', 'oL7QVsie', 'Bùi V?n Y?n', '', 1, TO_DATE('2022-11-24', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 5, 915, TO_DATE('1965-06-25', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (7, '0100564255', '6Ttg0ti8', 'Lý Th? B?o', '', 1, TO_DATE('2022-03-31', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 5, 419, TO_DATE('1961-09-15', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (8, '0505349883', 'XbBmTF3M', 'H? H?u Linh', '', 1, TO_DATE('2021-03-08', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 5, 177, TO_DATE('1976-06-02', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (9, '0722370078', '1avNRczA', 'Ngô H?u B?o', '', 1, TO_DATE('2023-03-14', 'YYYY-MM-DD'), 'S? nhà 10', 5, 165, TO_DATE('1961-06-03', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (10, '0340004091', '3CU3kvUD', 'Ph?m V?n Vi', '', 1, TO_DATE('2023-04-30', 'YYYY-MM-DD'), '???ng Lê L?i', 1, 537, TO_DATE('1971-02-21', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (11, '0261142410', '2xAlbupg', 'Ph?m V?n Tu?n', '', 1, TO_DATE('2022-06-06', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 1, 778, TO_DATE('1994-07-09', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (12, '0591804880', 'qY34nghJ', 'Ngô H?u Công', '', 1, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 1, 804, TO_DATE('1967-02-23', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (13, '0255929498', '5FBDvBJj', '??ng V?n H?i', '', 1, TO_DATE('2023-01-29', 'YYYY-MM-DD'), 'S? nhà 10', 2, 638, TO_DATE('1960-03-19', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (14, '0185591624', '3C853sE2', 'Bùi Th? Linh', '', 1, TO_DATE('2020-07-31', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 2, 712, TO_DATE('1993-04-30', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (15, '0249231274', 'pzHHCg7j', 'Võ Th? Tu?n', '', 1, TO_DATE('2020-07-24', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 1, 175, TO_DATE('1985-04-20', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (16, '0842356953', 'Z73dSQFM', 'D??ng H?u Oanh', '', 1, TO_DATE('2020-02-18', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 1, 664, TO_DATE('1974-05-10', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (17, '0013515086', 'V9VzTJrU', 'D??ng Th? D?ng', '', 1, TO_DATE('2020-10-23', 'YYYY-MM-DD'), 'S? nhà 10', 3, 76, TO_DATE('1973-04-09', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (18, '0059825329', 'utfyynSv', 'Nguy?n Th? Qu?nh', '', 1, TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 1, 672, TO_DATE('1980-09-07', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (19, '0618274101', 'tsPVAskw', 'D??ng Minh Nam', '', 1, TO_DATE('2023-02-25', 'YYYY-MM-DD'), '???ng Lê L?i', 4, 934, TO_DATE('1997-11-05', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (20, '0732858577', 'KRZHZFp6', 'D??ng Qu?c Y?n', '', 1, TO_DATE('2024-02-18', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 2, 594, TO_DATE('1972-06-11', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (21, '0479215343', 'M6X9Mg7z', 'Lý Minh Khang', '', 1, TO_DATE('2021-04-12', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 3, 581, TO_DATE('2001-03-02', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (22, '0236965844', 'jZuLGdjd', 'Ph?m Qu?c H?i', '', 1, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 1, 154, TO_DATE('1974-09-25', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (23, '0161372579', 'Y6l2B1y3', 'Tr?n Th? Y?n', '', 1, TO_DATE('2020-10-14', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 1, 919, TO_DATE('1979-03-25', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (24, '0367108953', 'Ay7lDGMH', '?? H?u B?o', '', 1, TO_DATE('2020-07-17', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 4, 875, TO_DATE('1979-06-25', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (25, '0032310795', 'IduhoGaq', 'Lê Th? Zoo', '', 1, TO_DATE('2020-12-13', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 2, 97, TO_DATE('1985-05-26', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (26, '0343683621', 'g0kVtQMo', 'Tr?n Minh Uyên', '', 1, TO_DATE('2024-02-24', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 5, 945, TO_DATE('1963-10-12', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (27, '0277687991', 'YTiFZOs8', 'Ngô Th? Uyên', '', 1, TO_DATE('2020-02-22', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 5, 403, TO_DATE('2004-12-28', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (28, '0520057256', 'VHCGM3AV', 'H? Qu?c Xuân', '', 1, TO_DATE('2020-03-11', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 5, 1000, TO_DATE('1983-07-05', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (29, '0651289019', 'njnnZ4U3', 'Lê V?n Vi', '', 1, TO_DATE('2022-08-05', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 4, 151, TO_DATE('1966-03-30', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (30, '0733526134', 'yp6pwbaT', 'Lý Th? Công', '', 1, TO_DATE('2022-02-27', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 5, 994, TO_DATE('1963-02-17', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (31, '0056565339', 'gcVot0mF', 'H?  Công', '', 1, TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 5, 217, TO_DATE('1996-11-03', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (32, '0769949659', 'kCWjVXgt', 'Võ H?u Khang', '', 1, TO_DATE('2021-01-08', 'YYYY-MM-DD'), 'S? nhà 10', 2, 276, TO_DATE('1966-12-27', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (33, '0729176934', '2NtZICuQ', 'Hu?nh Th? Vi', '', 1, TO_DATE('2021-12-24', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 4, 723, TO_DATE('1992-07-03', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (34, '0720723675', 'c29sVVAC', 'Bùi V?n Anh', '', 1, TO_DATE('2023-11-06', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 3, 177, TO_DATE('1970-11-02', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (35, '0949635078', 'TYV7c4aK', 'Lý  Ph??ng', '', 1, TO_DATE('2022-01-18', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 5, 494, TO_DATE('1994-08-02', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (36, '0319199650', 'Qpb4dlEd', '??ng  Y?n', '', 1, TO_DATE('2020-11-11', 'YYYY-MM-DD'), 'S? nhà 10', 1, 890, TO_DATE('1969-06-26', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (37, '0779030906', 'JyZo0A7u', 'Võ H?u Uyên', '', 1, TO_DATE('2020-11-29', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 1, 706, TO_DATE('1997-08-12', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (38, '0183515322', 'fGF8x6iB', '?? V?n Y?n', '', 1, TO_DATE('2021-10-10', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 2, 999, TO_DATE('1960-06-20', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (39, '0080396179', 'f0J69qQf', 'Tr?n Qu?c Khang', '', 1, TO_DATE('2020-08-29', 'YYYY-MM-DD'), 'S? nhà 10', 5, 505, TO_DATE('1980-01-30', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (40, '0199959978', 'RnrInBo7', 'Lý  Vi', '', 1, TO_DATE('2023-10-11', 'YYYY-MM-DD'), '???ng Lê L?i', 3, 944, TO_DATE('1966-12-24', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (41, '0292751175', 'vM8YJSYk', '??ng Qu?c Oanh', '', 1, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'S? nhà 10', 1, 41, TO_DATE('1997-10-04', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (42, '0365492768', 'd53jvPTh', 'Ph?m Th? Vi', '', 1, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 1, 295, TO_DATE('1983-06-13', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (43, '0067948314', '095B0VKL', 'Ph?m Minh Xuân', '', 1, TO_DATE('2021-06-04', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 5, 214, TO_DATE('1983-09-04', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (44, '0492939818', 'lNqaTDUA', 'Ngô Minh Zoo', '', 1, TO_DATE('2022-02-11', 'YYYY-MM-DD'), 'S? nhà 10', 3, 791, TO_DATE('1992-02-21', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (45, '0288326621', 'rDncTi0p', 'Lê  Ph??ng', '', 1, TO_DATE('2022-09-22', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 2, 580, TO_DATE('2001-02-19', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (46, '0941187006', '6GQhe1DU', 'Lý Minh Xuân', '', 1, TO_DATE('2022-07-23', 'YYYY-MM-DD'), '???ng Lê L?i', 1, 470, TO_DATE('1987-12-03', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (47, '0468415148', '7A9JXaSo', 'Võ V?n Vi', '', 1, TO_DATE('2023-06-30', 'YYYY-MM-DD'), '???ng Lê L?i', 5, 769, TO_DATE('1965-02-13', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (48, '0076209948', 'mrv2aWYq', 'H? Qu?c Linh', '', 1, TO_DATE('2021-02-19', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 4, 810, TO_DATE('1969-01-23', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (49, '0546299779', 'MKKdg2ye', 'Nguy?n Th? Vi', '', 1, TO_DATE('2022-10-15', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 2, 829, TO_DATE('1989-02-21', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (50, '0974985721', 'oE8jmjLF', 'Lý  Khang', '', 1, TO_DATE('2020-10-09', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 3, 182, TO_DATE('1968-08-28', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (51, '0994039362', 'eP1pJqRU', 'Tr?n  Zoo', '', 1, TO_DATE('2021-09-06', 'YYYY-MM-DD'), '???ng Lê L?i', 4, 199, TO_DATE('1970-03-20', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (52, '0900738708', '89qz50J1', 'Tr?n H?u Nam', '', 1, TO_DATE('2023-03-08', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 2, 24, TO_DATE('1962-03-04', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (53, '0482163920', 'yHPi38UJ', 'Bùi Qu?c Nam', '', 1, TO_DATE('2020-11-02', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 4, 760, TO_DATE('1977-02-09', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (54, '0216998307', 'EBZxeCPl', 'Ngô H?u Qu?nh', '', 1, TO_DATE('2021-05-04', 'YYYY-MM-DD'), '???ng Lê L?i', 1, 61, TO_DATE('1985-07-21', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (55, '0162852754', 'Rnf25Ibu', '?? H?u Nam', '', 1, TO_DATE('2020-02-17', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 3, 476, TO_DATE('1996-10-15', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (56, '0915060263', 'TMnOeW9Y', 'D??ng Th? D?ng', '', 1, TO_DATE('2022-09-09', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 4, 517, TO_DATE('1995-04-08', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (57, '0212052761', 'TBtP3L3e', 'D??ng  Uyên', '', 1, TO_DATE('2020-03-21', 'YYYY-MM-DD'), '???ng Lê L?i', 3, 366, TO_DATE('1965-09-18', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (58, '0663316123', 'oHwk67Mt', 'Võ Qu?c Tu?n', '', 1, TO_DATE('2023-03-28', 'YYYY-MM-DD'), '???ng Lê L?i', 1, 714, TO_DATE('1964-04-15', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (59, '0820749376', 'eFlQ94V5', 'Lý Qu?c Oanh', '', 1, TO_DATE('2023-11-29', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 5, 68, TO_DATE('1964-04-28', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (60, '0944645186', 'wq0zR5No', '??ng V?n Xuân', '', 1, TO_DATE('2020-08-22', 'YYYY-MM-DD'), 'S? nhà 10', 2, 296, TO_DATE('1983-05-16', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (61, '0347217954', 'pTwIhgox', 'Lý H?u Anh', '', 1, TO_DATE('2021-10-30', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 1, 58, TO_DATE('1997-10-19', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (62, '0435850398', '6LcuDUXX', 'Tr?n V?n H?i', '', 1, TO_DATE('2024-02-07', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 1, 302, TO_DATE('1993-09-27', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (63, '0564198264', 'ORUFuJCD', 'Võ Qu?c Linh', '', 1, TO_DATE('2021-06-04', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 2, 194, TO_DATE('1988-01-23', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (64, '0092521689', 'JLQgv3al', 'Võ V?n D?ng', '', 1, TO_DATE('2024-02-07', 'YYYY-MM-DD'), '???ng Lê L?i', 1, 308, TO_DATE('1988-03-31', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (65, '0482985547', 'neeGWI4Y', 'Võ Minh Linh', '', 1, TO_DATE('2020-07-15', 'YYYY-MM-DD'), '???ng Lê L?i', 4, 848, TO_DATE('1994-11-08', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (66, '0176201124', 'rVvtNGGA', 'Bùi Qu?c Anh', '', 1, TO_DATE('2022-07-27', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 4, 914, TO_DATE('1969-04-26', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (67, '0885544826', 'L8JtiMQT', '??ng Minh Oanh', '', 1, TO_DATE('2021-03-05', 'YYYY-MM-DD'), 'S? nhà 10', 5, 692, TO_DATE('1993-01-11', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (68, '0538679624', 'uy415OqB', 'Hu?nh Th? Zoo', '', 1, TO_DATE('2023-07-10', 'YYYY-MM-DD'), 'S? nhà 10', 4, 433, TO_DATE('1981-05-11', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (69, '0795461769', 'G0zQv6Bx', 'Lý  D?ng', '', 1, TO_DATE('2021-11-30', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 5, 736, TO_DATE('1973-04-09', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (70, '0746690104', '5Zh0qpJK', 'Bùi Th? Vi', '', 1, TO_DATE('2022-01-14', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 3, 800, TO_DATE('2003-08-05', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (71, '0392826795', 'vMRiptQv', 'Võ Qu?c Y?n', '', 1, TO_DATE('2020-08-16', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 3, 484, TO_DATE('1980-02-28', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (72, '0843920939', 'C2HIuk0c', 'D??ng Th? Oanh', '', 1, TO_DATE('2021-02-09', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 1, 403, TO_DATE('1991-11-05', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (73, '0478009952', '93iDidkp', 'Võ  Linh', '', 1, TO_DATE('2022-01-05', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 1, 664, TO_DATE('1965-10-13', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (74, '0826828571', 'GS11l14l', 'Hu?nh Th? Anh', '', 1, TO_DATE('2023-02-24', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 1, 917, TO_DATE('1967-10-26', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (75, '0214475998', 'ckOLATE2', '??ng V?n Oanh', '', 1, TO_DATE('2020-06-09', 'YYYY-MM-DD'), '???ng Lê L?i', 2, 52, TO_DATE('1986-08-18', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (76, '0096347100', 'a5PLGQ5a', 'Bùi Th? B?o', '', 1, TO_DATE('2020-10-07', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 5, 664, TO_DATE('1991-06-23', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (77, '0369182792', 'uEng2DxU', 'Bùi Qu?c Ph??ng', '', 1, TO_DATE('2020-02-01', 'YYYY-MM-DD'), '???ng Lê L?i', 2, 148, TO_DATE('1989-01-03', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (78, '0432868905', 'DYOyTVtb', 'Ph?m V?n Uyên', '', 1, TO_DATE('2021-04-27', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 5, 661, TO_DATE('1974-07-17', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (79, '0400533257', 'e4ipsA0W', '??ng Th? Vi', '', 1, TO_DATE('2024-01-22', 'YYYY-MM-DD'), '???ng Lê L?i', 3, 817, TO_DATE('1997-03-18', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (80, '0818197848', 'BAAMU9Jo', 'Lê Th? Linh', '', 1, TO_DATE('2020-03-17', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 4, 171, TO_DATE('1967-12-31', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (81, '0605392845', 'Os8sssWW', 'H? Qu?c Linh', '', 1, TO_DATE('2020-01-13', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 2, 812, TO_DATE('1989-09-09', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (82, '0442090594', 'R0M2QCMr', 'D??ng Minh Vi', '', 1, TO_DATE('2022-09-25', 'YYYY-MM-DD'), 'S? nhà 10', 5, 597, TO_DATE('1995-03-20', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (83, '0747859985', 'dYMjf7cc', 'Lý  Khang', '', 1, TO_DATE('2020-08-22', 'YYYY-MM-DD'), '???ng Lê L?i', 2, 883, TO_DATE('1964-04-03', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (84, '0578340507', 'fiOP09nX', 'Bùi H?u Nam', '', 1, TO_DATE('2020-05-26', 'YYYY-MM-DD'), 'S? nhà 10', 5, 269, TO_DATE('2005-03-12', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (85, '0780674993', 'ULAZaULC', 'Ph?m H?u Zoo', '', 1, TO_DATE('2022-11-13', 'YYYY-MM-DD'), '???ng Lê L?i', 3, 155, TO_DATE('1987-09-22', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (86, '0661976025', 'f4XnI5Mn', 'H?  D?ng', '', 1, TO_DATE('2020-07-17', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 1, 45, TO_DATE('2000-05-30', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (87, '0465916838', 'ZRjzLUWA', 'Nguy?n H?u Ph??ng', '', 1, TO_DATE('2021-06-24', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 1, 262, TO_DATE('1992-08-01', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (88, '0824691882', 'AkVAt1JD', 'Hu?nh Th? Linh', '', 1, TO_DATE('2021-04-09', 'YYYY-MM-DD'), 'S? nhà 10', 1, 651, TO_DATE('1988-02-29', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (89, '0756702000', 'a8G9Y1K9', 'Ngô H?u Linh', '', 1, TO_DATE('2022-10-24', 'YYYY-MM-DD'), 'S? nhà 10', 4, 667, TO_DATE('1975-07-08', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (90, '0530409957', 'sPRrDEPc', 'Ngô  Uyên', '', 1, TO_DATE('2022-02-13', 'YYYY-MM-DD'), '???ng Lê L?i', 5, 160, TO_DATE('1962-03-05', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (91, '0915556964', '17BNGpCI', 'Tr?n  Qu?nh', '', 1, TO_DATE('2020-01-08', 'YYYY-MM-DD'), 'S? nhà 10', 3, 226, TO_DATE('1980-05-19', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (92, '0681328528', 'OKrqFN5Z', '?? Minh Nam', '', 1, TO_DATE('2020-05-22', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 2, 460, TO_DATE('1969-11-24', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (93, '0044058703', '3rXXR8UE', 'Lý V?n Uyên', '', 1, TO_DATE('2020-06-26', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 2, 828, TO_DATE('1960-09-05', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (94, '0906816805', 'OHRxzVFA', 'Hu?nh  Anh', '', 1, TO_DATE('2022-07-09', 'YYYY-MM-DD'), 'S? nhà 10', 5, 530, TO_DATE('1978-03-18', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (95, '0996087912', 'KaOlFfqN', 'Lê  Xuân', '', 1, TO_DATE('2021-07-29', 'YYYY-MM-DD'), 'Ph??ng Hòa Minh', 4, 486, TO_DATE('1972-08-05', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (96, '0147789431', 'nnoMTUvC', 'Bùi V?n Tu?n', '', 1, TO_DATE('2023-11-16', 'YYYY-MM-DD'), '???ng Lê L?i', 5, 355, TO_DATE('1973-09-23', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (97, '0702334091', '50BsGQ7F', 'Võ V?n D?ng', '', 1, TO_DATE('2024-01-13', 'YYYY-MM-DD'), 'Qu?n Liên Chi?u', 5, 795, TO_DATE('1978-11-21', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (98, '0059653902', 'veOt2FKh', 'D??ng Qu?c Anh', '', 1, TO_DATE('2023-08-17', 'YYYY-MM-DD'), 'Thành ph? ?à N?ng', 4, 68, TO_DATE('1970-08-24', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (99, '0459630079', 'wNFyO3ig', 'Bùi  Công', '', 1, TO_DATE('2022-08-28', 'YYYY-MM-DD'), '???ng Lê L?i', 1, 86, TO_DATE('1970-10-27', 'YYYY-MM-DD'));
INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh) VALUES (100, '0968089446', 'MACUBUdw', 'Nguy?n Qu?c Ph??ng', '', 1, TO_DATE('2023-08-09', 'YYYY-MM-DD'), '???ng Lê L?i', 1, 23, TO_DATE('1964-06-28', 'YYYY-MM-DD'));
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--THANH PHO--
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (1, 'Hà N?i');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (2, 'H? Chí Minh');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (3, '?à N?ng');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (4, 'H?i Phòng');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (5, 'C?n Th?');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (6, 'B?c Ninh');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (7, 'H?i D??ng');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (8, 'Nam ??nh');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (9, 'Thái Bình');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (10, 'Vinh');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (11, 'Hu?');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (12, 'Quy Nh?n');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (13, 'Nha Trang');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (14, '?à L?t');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (15, 'V?ng Tàu');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (16, 'Biên Hòa');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (17, 'Long Xuyên');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (18, 'R?ch Giá');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (19, 'B?c Liêu');
INSERT INTO THANHPHO (MaTP, TenTP) VALUES (20, 'Cà Mau');
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--QUAN--
-- C?n Th?
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (1, 'Ninh Ki?u', 1);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (2, 'Bình Th?y', 1);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (3, 'Cái R?ng', 1);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (4, 'Ô Môn', 1);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (5, 'Th?t N?t', 1);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (6, 'V?nh Th?nh', 1);

-- H?i D??ng
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (7, 'H?ng Bàng', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (8, 'Ngô Quy?n', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (9, 'Lê Chân', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (10, 'H?i An', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (11, 'Ki?n An', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (12, '?? S?n', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (13, 'An D??ng', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (14, 'An Lão', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (15, 'Ki?n Th?y', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (16, 'Th?y Nguyên', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (17, 'Tiên Lãng', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (18, 'V?nh B?o', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (19, 'Cát H?i', 2);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (20, 'B?ch Long V?', 2);

-- H? Chí Minh
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (21, 'Qu?n 1', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (22, 'Qu?n 2', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (23, 'Qu?n 3', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (24, 'Qu?n 4', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (25, 'Qu?n 5', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (26, 'Qu?n 6', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (27, 'Qu?n 7', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (28, 'Qu?n 8', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (29, 'Qu?n 9', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (30, 'Qu?n 10', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (31, 'Qu?n 11', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (32, 'Qu?n 12', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (33, 'Bình Tân', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (34, 'Bình Th?nh', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (35, 'Gò V?p', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (36, 'Phú Nhu?n', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (37, 'Tân Bình', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (38, 'Tân Phú', 3);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (39, 'Th? ??c', 3);
-- Quy Nh?n
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (40, 'Nguy?n V?n C?', 4);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (41, 'Ngô Mây', 4);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (42, 'Lý Th??ng Ki?t', 4);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (43, 'Tr?n Phú', 4);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (44, 'Tr?n H?ng ??o', 4);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (45, 'Tr?n Cao Vân', 4);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (46, 'Lê H?ng Phong', 4);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (47, 'Tr?n Quang Di?u', 4);

-- B?c Ninh
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (48, 'B?c Ninh', 5);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (49, 'Yên Phong', 5);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (50, 'Qu? Võ', 5);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (51, 'Tiên Du', 5);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (52, 'T? S?n', 5);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (53, 'Thu?n Thành', 5);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (54, 'Gia Bình', 5);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (55, 'L??ng Tài', 5);

-- Nha Trang
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (56, 'L?c Th?', 7);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (57, 'Ph??c Long', 7);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (58, 'Ph??c Tân', 7);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (59, 'Ph??c H?i', 7);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (60, 'Ph??c Hòa', 7);

-- Biên Hòa
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (61, 'Tr?ng Dài', 8);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (62, 'Quang Vinh', 8);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (63, 'Bình ?a', 8);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (64, 'Tân Mai', 8);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (65, 'Tân Phong', 8);
-- B?c Liêu
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (66, 'V?nh L?c', 9);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (67, 'Th?nh Tr?', 9);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (68, 'H?ng Dân', 9);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (69, 'Ph??c Long', 9);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (70, 'Nhà Mát', 9);

-- Long Xuyên
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (71, 'M? Hòa', 11);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (72, 'M? Bình', 11);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (73, 'M? Th?nh', 11);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (74, 'M? Long', 11);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (75, 'M? Quý', 11);

-- ?à L?t
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (76, '1', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (77, '2', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (78, '3', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (79, '4', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (80, '5', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (81, '6', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (82, '7', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (83, '8', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (84, '9', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (85, '10', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (86, '11', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (87, '12', 13);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (88, 'Lâm ??ng', 13);

-- Thái Bình
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (89, 'H?ng Bàng', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (90, 'Ngô Quy?n', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (91, 'Lê Chân', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (92, 'H?i An', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (93, 'Ki?n An', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (94, '?? S?n', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (95, 'An D??ng', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (96, 'An Lão', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (97, 'Ki?n Th?y', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (98, 'Th?y Nguyên', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (99, 'Tiên Lãng', 20);
INSERT INTO QUAN (MaQuan, TenQuan, MaTP) VALUES (100, 'V?nh B?o', 20);
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--PHUONG--
-- C?n Th?
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (1, 'An Bình', 1);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (2, 'An C?', 1);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (3, 'An Hòa', 1);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (4, 'An Khánh', 1);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (5, 'An Nghi?p', 1);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (6, 'An Phú', 1);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (7, 'An Th?i', 1);

-- H?i D??ng
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (8, 'Ch? Mai', 7);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (9, 'Kênh Giang', 7);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (10, 'T? Minh', 7);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (11, 'Vinh Khê', 7);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (12, 'T? Qu?n', 7);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (13, 'Lam S?n', 7);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (14, 'Tr?n Phú', 7);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (15, 'Quang Trung', 7);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (16, 'H?i Tân', 7);

-- H? Chí Minh
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (17, 'B?n Nghé', 21);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (18, 'B?n Thành', 21);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (19, 'C?u Kho', 21);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (20, 'C?u Ông Lãnh', 21);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (21, 'Cô Giang', 21);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (22, 'C?u Ông Lãnh', 21);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (23, '?a Kao', 21);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (24, 'Nguy?n C? Trinh', 21);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (25, 'Nguy?n Thái Bình', 21);
-- Qu?n Liên Chi?u
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (26, 'Hòa H?i', 29);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (27, 'Hòa Quý', 29);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (28, 'Hòa Hi?p B?c', 29);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (29, 'Hòa Hi?p Nam', 29);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (30, 'Hòa Khánh B?c', 29);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (31, 'Hòa Khánh Nam', 29);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (32, 'Hòa Minh', 29);

-- Thành ph? ?à N?ng
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (33, 'An H?i B?c', 32);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (34, 'An H?i ?ông', 32);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (35, 'An H?i Tây', 32);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (36, 'An H?i ?ông', 32);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (37, 'B?c M? An', 32);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (38, 'B?c S?n', 32);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (39, 'Hòa C??ng B?c', 32);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (40, 'Hòa C??ng Nam', 32);
-- Qu?n Ng? Hành S?n (?à N?ng)
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (41, 'M? An', 33);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (42, 'Khuê M?', 33);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (43, 'Hòa Quý', 33);

-- Qu?n S?n Trà (?à N?ng)
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (44, 'An H?i B?c', 34);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (45, 'An H?i ?ông', 34);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (46, 'An H?i Tây', 34);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (47, 'An H?i Nam', 34);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (48, 'M? An', 34);

-- Qu?n H?i Châu (?à N?ng)
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (49, 'H?i Châu 1', 35);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (50, 'H?i Châu 2', 35);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (51, 'Hòa C??ng B?c', 35);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (52, 'Hòa C??ng Nam', 35);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (53, 'Hòa Thu?n ?ông', 35);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (54, 'Hòa Thu?n Tây', 35);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (55, 'Nam D??ng', 35);

-- Qu?n Hòa Vang (?à N?ng)
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (56, 'Hòa B?c', 36);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (57, 'Hòa Châu', 36);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (58, 'Hòa Kh??ng', 36);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (59, 'Hòa Liên', 36);
INSERT INTO PHUONG (MaPhuong, TenPhuong, MaQuan) VALUES (60, 'Hòa Nh?n', 36);
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--TIN--
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (1, 'Cho thuê phòng tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2023-07-13', 'YYYY-MM-DD'), 1, 84.91, ' ', 1448185.4105, 2049090.0419, 3, 2, 11, 74, 51);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (2, 'Cho thuê phòng tr?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2022-12-27', 'YYYY-MM-DD'), 1, 43.95, ' ', 4495871.3974, 2063049.0334, 1, 1, 6, 93, 36);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (3, 'C?n tìm nhà ?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 1, 33.05, ' ', 1181917.3065, 2413900.4631, 1, 3, 3, 55, 26);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (4, 'Cho thuê phòng tr?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2022-06-30', 'YYYY-MM-DD'), 1, 91.37, ' ', 4550331.8974, 1659707.9543, 3, 1, 10, 92, 34);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (5, 'C?n tìm nhà ?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2020-08-01', 'YYYY-MM-DD'), 1, 98.85, ' ', 3740358.0928, 2943768.3218, 1, 1, 2, 2, 27);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (6, 'C?n thuê nhà nguyên c?n', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 1, 33.41, ' ', 4115046.022, 1245672.2494, 2, 1, 7, 58, 46);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (7, 'Cho thuê phòng tr?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2022-09-26', 'YYYY-MM-DD'), 1, 44.76, ' ', 4779308.7129, 1275376.6015, 2, 1, 4, 55, 8);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (8, 'Cho thuê c?n h?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2023-05-26', 'YYYY-MM-DD'), 1, 27.55, ' ', 4664824.6916, 1922717.7806, 3, 1, 2, 23, 58);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (9, 'Cho thuê nhà tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2020-02-12', 'YYYY-MM-DD'), 1, 51.83, ' ', 2890613.5386, 1323162.6174, 3, 1, 9, 18, 15);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (10, 'C?n tìm nhà ?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2021-09-12', 'YYYY-MM-DD'), 1, 66.32, ' ', 1774749.089, 1017263.5659, 4, 3, 4, 1, 27);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (11, 'C?n tìm nhà ?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2024-02-23', 'YYYY-MM-DD'), 1, 21.22, ' ', 2400311.7071, 2516171.6084, 4, 4, 14, 53, 59);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (12, 'C?n tìm nhà ?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2020-07-20', 'YYYY-MM-DD'), 1, 86.12, ' ', 1963351.7576, 2930402.2501, 4, 3, 18, 85, 47);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (13, 'C?n tìm nhà ?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2023-07-29', 'YYYY-MM-DD'), 1, 88.14, ' ', 2005868.4382, 1527782.7298, 3, 1, 3, 26, 42);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (14, 'C?n thuê nhà nguyên c?n', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2020-08-24', 'YYYY-MM-DD'), 1, 80.98, ' ', 3682054.1438, 1973862.3271, 2, 4, 12, 55, 54);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (15, 'C?n tìm nhà ?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2021-08-15', 'YYYY-MM-DD'), 1, 39.11, ' ', 4523535.8172, 1347763.2891, 3, 4, 5, 3, 11);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (16, 'Cho thuê phòng tr?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2023-05-02', 'YYYY-MM-DD'), 1, 58.37, ' ', 1524073.7673, 2100510.0266, 4, 4, 17, 98, 21);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (17, 'C?n thuê nhà nguyên c?n', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2022-01-09', 'YYYY-MM-DD'), 1, 89.08, ' ', 4563788.4149, 1970485.0152, 4, 1, 1, 63, 55);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (18, 'Cho thuê c?n h?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2020-12-17', 'YYYY-MM-DD'), 1, 36.99, ' ', 1730992.4416, 2964603.4005, 4, 3, 11, 100, 16);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (19, 'Cho thuê c?n h?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2021-02-28', 'YYYY-MM-DD'), 1, 54.24, ' ', 3809938.023, 1848668.7044, 1, 1, 9, 53, 10);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (20, 'C?n thuê nhà nguyên c?n', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2022-02-09', 'YYYY-MM-DD'), 1, 70.04, ' ', 3304468.7741, 1678111.1624, 3, 2, 8, 66, 27);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (21, 'C?n tìm nhà ?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2023-10-25', 'YYYY-MM-DD'), 1, 25.29, ' ', 3008452.2256, 1924034.1639, 1, 4, 9, 2, 43);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (22, 'Cho thuê phòng tr?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2022-10-23', 'YYYY-MM-DD'), 1, 59.84, ' ', 2275340.1142, 1150107.0653, 2, 2, 13, 15, 35);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (23, 'Cho thuê nhà tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2020-07-07', 'YYYY-MM-DD'), 1, 47.59, ' ', 2443725.3972, 1538644.6568, 2, 2, 19, 29, 47);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (24, 'Cho thuê nhà tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2020-06-09', 'YYYY-MM-DD'), 1, 57.65, ' ', 1297566.0172, 2806407.4325, 2, 1, 6, 3, 17);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (25, 'Cho thuê phòng tr?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2020-10-11', 'YYYY-MM-DD'), 1, 67.57, ' ', 4503449.1597, 2311818.2013, 4, 1, 2, 66, 34);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (26, 'Cho thuê nhà tr?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2023-02-22', 'YYYY-MM-DD'), 1, 74.98, ' ', 2165444.6248, 1166566.9381, 4, 4, 15, 29, 51);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (27, 'C?n tìm nhà ?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 1, 28.21, ' ', 3412652.7605, 1449053.4212, 3, 2, 6, 70, 11);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (28, 'C?n tìm nhà ?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2023-07-28', 'YYYY-MM-DD'), 1, 62.33, ' ', 1860349.707, 1717796.1086, 3, 2, 6, 42, 27);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (29, 'Cho thuê phòng tr?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2022-06-04', 'YYYY-MM-DD'), 1, 71.76, ' ', 3721820.904, 1622912.8203, 3, 2, 4, 22, 53);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (30, 'C?n thuê nhà nguyên c?n', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2020-03-31', 'YYYY-MM-DD'), 1, 89.13, ' ', 3682835.1778, 1566340.8073, 2, 2, 16, 16, 46);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (31, 'C?n thuê nhà nguyên c?n', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2020-03-23', 'YYYY-MM-DD'), 1, 82.53, ' ', 4948392.8632, 2226471.2969, 4, 2, 16, 34, 23);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (32, 'Cho thuê nhà tr?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2021-02-19', 'YYYY-MM-DD'), 1, 71.35, ' ', 1293558.2616, 2513572.2056, 3, 2, 10, 68, 30);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (33, 'Cho thuê nhà tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2020-11-17', 'YYYY-MM-DD'), 1, 99.12, ' ', 3036189.6571, 2475407.6784, 4, 3, 16, 55, 52);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (34, 'Cho thuê phòng tr?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2022-10-20', 'YYYY-MM-DD'), 1, 49.51, ' ', 2833754.2023, 2864518.5717, 2, 3, 1, 76, 53);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (35, 'Cho thuê c?n h?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2021-11-17', 'YYYY-MM-DD'), 1, 86.23, ' ', 1930288.1858, 2964215.016, 1, 3, 11, 62, 32);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (36, 'Cho thuê nhà tr?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2022-07-31', 'YYYY-MM-DD'), 1, 50.96, ' ', 2926554.9121, 1124323.5323, 4, 3, 12, 40, 2);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (37, 'C?n thuê nhà nguyên c?n', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2020-05-16', 'YYYY-MM-DD'), 1, 84.9, ' ', 3591710.2751, 1178289.6909, 1, 2, 8, 76, 52);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (38, 'C?n tìm nhà ?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2021-06-09', 'YYYY-MM-DD'), 1, 78.02, ' ', 4709574.7025, 2846640.4474, 1, 1, 12, 10, 23);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (39, 'Cho thuê phòng tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2020-03-12', 'YYYY-MM-DD'), 1, 48.67, ' ', 1302495.079, 1746928.3336, 4, 3, 14, 88, 10);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (40, 'Cho thuê nhà tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2022-03-17', 'YYYY-MM-DD'), 1, 24.49, ' ', 2780126.45, 1997713.6428, 3, 1, 15, 98, 17);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (41, 'Cho thuê c?n h?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2020-10-11', 'YYYY-MM-DD'), 1, 69.53, ' ', 3968251.5925, 1732554.636, 3, 3, 18, 4, 27);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (42, 'C?n tìm nhà ?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2020-07-11', 'YYYY-MM-DD'), 1, 40.64, ' ', 1318318.7739, 1321258.3002, 3, 3, 20, 3, 11);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (43, 'C?n thuê nhà nguyên c?n', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1, 84.75, ' ', 3268489.5298, 1304720.7121, 4, 1, 8, 90, 8);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (44, 'Cho thuê c?n h?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2022-02-28', 'YYYY-MM-DD'), 1, 94.49, ' ', 4672142.8694, 1661687.3686, 4, 2, 14, 50, 54);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (45, 'Cho thuê nhà tr?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2023-05-07', 'YYYY-MM-DD'), 1, 57.91, ' ', 3832361.6628, 1995946.5852, 1, 3, 18, 16, 3);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (46, 'C?n thuê nhà nguyên c?n', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2023-10-18', 'YYYY-MM-DD'), 1, 89.22, ' ', 1524693.2917, 1171403.6349, 4, 2, 8, 17, 38);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (47, 'C?n thuê nhà nguyên c?n', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2021-05-12', 'YYYY-MM-DD'), 1, 30.59, ' ', 3553834.8918, 1361541.3884, 2, 4, 15, 29, 49);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (48, 'C?n tìm nhà ?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2020-03-18', 'YYYY-MM-DD'), 1, 71.63, ' ', 2870169.334, 2882635.6304, 3, 1, 20, 18, 8);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (49, 'Cho thuê phòng tr?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2020-10-02', 'YYYY-MM-DD'), 1, 68.07, ' ', 4593838.0909, 1064389.162, 4, 4, 20, 20, 31);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (50, 'Cho thuê phòng tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2021-12-05', 'YYYY-MM-DD'), 1, 63.55, ' ', 1718932.857, 1656735.4767, 2, 3, 13, 41, 37);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (51, 'Cho thuê c?n h?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2022-07-12', 'YYYY-MM-DD'), 1, 88.81, ' ', 4587561.6196, 2099938.2919, 4, 4, 3, 82, 32);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (52, 'Cho thuê phòng tr?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2024-01-09', 'YYYY-MM-DD'), 1, 27.39, ' ', 3445041.1388, 2325616.7477, 3, 3, 17, 60, 22);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (53, 'C?n thuê nhà nguyên c?n', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2024-01-06', 'YYYY-MM-DD'), 1, 60.72, ' ', 2731616.6171, 1878459.4691, 4, 4, 7, 97, 59);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (54, 'Cho thuê c?n h?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2022-03-05', 'YYYY-MM-DD'), 1, 62.5, ' ', 1097551.858, 1308091.6495, 3, 2, 15, 47, 8);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (55, 'Cho thuê phòng tr?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2021-03-09', 'YYYY-MM-DD'), 1, 82.84, ' ', 4060344.2779, 1619213.5082, 4, 1, 4, 21, 36);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (56, 'Cho thuê nhà tr?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2023-03-29', 'YYYY-MM-DD'), 1, 56.17, ' ', 1429276.9955, 1749700.9588, 4, 4, 16, 16, 5);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (57, 'Cho thuê c?n h?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2020-03-27', 'YYYY-MM-DD'), 1, 52.61, ' ', 3659110.6955, 2141315.5819, 2, 4, 7, 77, 1);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (58, 'Cho thuê nhà tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2022-12-24', 'YYYY-MM-DD'), 1, 86.37, ' ', 1669844.3111, 1413516.7583, 2, 1, 11, 87, 10);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (59, 'C?n thuê nhà nguyên c?n', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2020-11-07', 'YYYY-MM-DD'), 1, 57.7, ' ', 3401570.5176, 1938693.3222, 2, 2, 17, 59, 18);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (60, 'Cho thuê phòng tr?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2022-07-29', 'YYYY-MM-DD'), 1, 23.2, ' ', 1797579.3959, 2124671.133, 2, 3, 20, 7, 8);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (61, 'C?n thuê nhà nguyên c?n', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2023-03-31', 'YYYY-MM-DD'), 1, 30.46, ' ', 3143436.8172, 1280620.4227, 1, 2, 5, 12, 12);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (62, 'Cho thuê c?n h?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2021-01-16', 'YYYY-MM-DD'), 1, 27.09, ' ', 2356561.4048, 2465567.1604, 2, 3, 18, 9, 16);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (63, 'C?n tìm nhà ?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2024-02-05', 'YYYY-MM-DD'), 1, 32.19, ' ', 1811005.6382, 1705839.5445, 3, 1, 15, 81, 28);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (64, 'Cho thuê phòng tr?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2023-04-22', 'YYYY-MM-DD'), 1, 21.5, ' ', 3930578.4339, 1762913.4785, 2, 1, 5, 43, 13);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (65, 'C?n thuê nhà nguyên c?n', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2022-09-26', 'YYYY-MM-DD'), 1, 47.63, ' ', 1475456.5614, 2003049.3813, 1, 3, 7, 3, 5);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (66, 'C?n tìm nhà ?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2021-06-23', 'YYYY-MM-DD'), 1, 48.85, ' ', 1111108.6589, 1149820.2905, 2, 3, 11, 84, 17);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (67, 'Cho thuê phòng tr?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2020-03-14', 'YYYY-MM-DD'), 1, 32.42, ' ', 1636615.8723, 2512736.2759, 4, 1, 4, 65, 2);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (68, 'C?n thuê nhà nguyên c?n', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2021-03-12', 'YYYY-MM-DD'), 1, 81.03, ' ', 1479971.9719, 2003644.3207, 3, 2, 11, 6, 17);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (69, 'Cho thuê phòng tr?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2020-11-12', 'YYYY-MM-DD'), 1, 76.31, ' ', 3109449.9788, 2613967.095, 3, 3, 4, 36, 54);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (70, 'C?n tìm nhà ?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 1, 82.83, ' ', 1399300.1518, 2709635.7829, 2, 4, 6, 54, 17);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (71, 'Cho thuê phòng tr?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2020-07-15', 'YYYY-MM-DD'), 1, 21.77, ' ', 4102082.3786, 2882447.0482, 1, 1, 19, 63, 35);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (72, 'Cho thuê c?n h?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2020-10-25', 'YYYY-MM-DD'), 1, 76.67, ' ', 3531830.4942, 2969644.6302, 1, 4, 18, 6, 7);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (73, 'C?n thuê nhà nguyên c?n', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2021-04-08', 'YYYY-MM-DD'), 1, 38.06, ' ', 4204050.9689, 2824931.0186, 3, 3, 3, 96, 41);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (74, 'C?n thuê nhà nguyên c?n', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 1, 68.37, ' ', 1481885.3414, 2136834.123, 4, 1, 5, 18, 12);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (75, 'C?n thuê nhà nguyên c?n', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2023-06-23', 'YYYY-MM-DD'), 1, 75.91, ' ', 1241531.9187, 1727231.4935, 3, 1, 9, 58, 46);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (76, 'Cho thuê c?n h?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2021-10-29', 'YYYY-MM-DD'), 1, 21.93, ' ', 4055648.0657, 2305329.9404, 2, 2, 8, 88, 49);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (77, 'Cho thuê nhà tr?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2021-12-17', 'YYYY-MM-DD'), 1, 85.17, ' ', 2591992.3411, 2849720.68, 3, 4, 13, 94, 24);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (78, 'C?n thuê nhà nguyên c?n', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2021-01-31', 'YYYY-MM-DD'), 1, 31.2, ' ', 3062641.2136, 1092478.7335, 3, 2, 8, 1, 5);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (79, 'Cho thuê c?n h?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2021-05-19', 'YYYY-MM-DD'), 1, 50.1, ' ', 1171746.1714, 1210258.1544, 4, 1, 12, 65, 15);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (80, 'Cho thuê c?n h?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2022-10-30', 'YYYY-MM-DD'), 1, 36.0, ' ', 4907974.2847, 1322127.3871, 3, 1, 16, 89, 16);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (81, 'Cho thuê c?n h?', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2023-11-11', 'YYYY-MM-DD'), 1, 43.01, ' ', 1441006.9761, 2249087.5403, 3, 2, 5, 1, 24);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (82, 'Cho thuê nhà tr?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2020-01-17', 'YYYY-MM-DD'), 1, 54.66, ' ', 2386473.4278, 1705450.3256, 4, 2, 5, 35, 35);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (83, 'Cho thuê c?n h?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2022-11-07', 'YYYY-MM-DD'), 1, 87.4, ' ', 4977818.3892, 1590468.9555, 3, 4, 20, 1, 9);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (84, 'Cho thuê phòng tr?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 1, 81.6, ' ', 3531807.6562, 2774631.844, 3, 2, 14, 69, 58);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (85, 'C?n thuê nhà nguyên c?n', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2020-07-09', 'YYYY-MM-DD'), 1, 82.66, ' ', 1965632.6405, 2347452.2992, 2, 2, 2, 72, 20);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (86, 'C?n thuê nhà nguyên c?n', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2020-05-04', 'YYYY-MM-DD'), 1, 40.17, ' ', 4027912.8998, 1599031.5629, 4, 1, 3, 39, 23);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (87, 'C?n thuê nhà nguyên c?n', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2020-03-23', 'YYYY-MM-DD'), 1, 61.4, ' ', 1130761.6418, 1896138.1589, 4, 3, 5, 15, 28);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (88, 'Cho thuê c?n h?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2021-11-13', 'YYYY-MM-DD'), 1, 32.07, ' ', 4333832.0527, 1478150.0389, 4, 4, 9, 73, 15);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (89, 'C?n tìm nhà ?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2023-10-06', 'YYYY-MM-DD'), 1, 24.0, ' ', 4500275.3908, 1370856.2133, 4, 4, 17, 94, 50);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (90, 'Cho thuê phòng tr?', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2023-09-27', 'YYYY-MM-DD'), 1, 57.26, ' ', 4119724.369, 2099294.2469, 2, 1, 20, 65, 37);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (91, 'C?n tìm nhà ?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2021-07-24', 'YYYY-MM-DD'), 1, 41.12, ' ', 2773384.1162, 2282885.5205, 3, 3, 20, 39, 23);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (92, 'Cho thuê phòng tr?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2022-04-16', 'YYYY-MM-DD'), 1, 69.04, ' ', 3216514.953, 1475626.5833, 2, 4, 3, 63, 53);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (93, 'C?n thuê nhà nguyên c?n', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2020-12-15', 'YYYY-MM-DD'), 1, 22.06, ' ', 3556588.6071, 1717012.3338, 1, 2, 10, 91, 48);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (94, 'C?n tìm nhà ?', 'Phòng tr? có gác l?ng, có sân ph?i', TO_DATE('2024-01-25', 'YYYY-MM-DD'), 1, 95.01, ' ', 4746860.7819, 2842199.037, 1, 3, 20, 80, 29);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (95, 'Cho thuê phòng tr?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2022-09-08', 'YYYY-MM-DD'), 1, 70.34, ' ', 3182943.3656, 1177559.6365, 3, 2, 16, 22, 24);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (96, 'C?n tìm nhà ?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2023-10-16', 'YYYY-MM-DD'), 1, 95.65, ' ', 1815079.7918, 2306539.6502, 3, 4, 10, 4, 19);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (97, 'C?n thuê nhà nguyên c?n', 'C?n h? view ??p, ti?n nghi ??y ??', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 1, 54.74, ' ', 3747745.7822, 2502114.8558, 3, 3, 18, 17, 23);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (98, 'Cho thuê c?n h?', 'Phòng tr? m?i xây s?ch s?, giá c? h?p lý', TO_DATE('2022-06-15', 'YYYY-MM-DD'), 1, 31.56, ' ', 4868870.6688, 1921756.9222, 3, 3, 11, 47, 30);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (99, 'C?n thuê nhà nguyên c?n', 'G?n tr??ng h?c và ch?, thu?n ti?n ?i l?i', TO_DATE('2022-01-12', 'YYYY-MM-DD'), 1, 42.51, ' ', 2429266.1666, 1587500.6339, 3, 3, 3, 73, 6);
INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong) VALUES (100, 'Cho thuê nhà tr?', 'Nhà nguyên c?n r?ng rãi, thoáng mát, yên t?nh', TO_DATE('2022-08-06', 'YYYY-MM-DD'), 1, 36.4, ' ', 2116035.0127, 1909064.7014, 2, 3, 7, 91, 15);
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--BINHLUAN--
Python 3.12.1 (tags/v3.12.1:2305ca5, Dec  7 2023, 22:03:25) [MSC v.1937 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license()" for more information.

= RESTART: C:\Users\On\OneDrive\Máy tính\insertdulieu.py
Generating SQL INSERT statements for BINHLUAN table...
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (1, TO_DATE('2021-07-12', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 74, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (2, TO_DATE('2021-03-05', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 95, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (3, TO_DATE('2022-09-06', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 44, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (4, TO_DATE('2020-04-11', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 52, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (5, TO_DATE('2021-11-03', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 98, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (6, TO_DATE('2020-05-18', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 62, 34);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (7, TO_DATE('2023-01-24', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 37, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (8, TO_DATE('2022-03-01', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 54, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (9, TO_DATE('2023-06-11', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 82, 65);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (10, TO_DATE('2023-12-04', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 73, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (11, TO_DATE('2020-08-06', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 62, 76);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (12, TO_DATE('2024-01-13', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 14, 31);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (13, TO_DATE('2022-10-12', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 66, 4);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (14, TO_DATE('2020-04-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 64, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (15, TO_DATE('2022-12-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 43, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (16, TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 52, 39);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (17, TO_DATE('2023-02-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 38, 60);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (18, TO_DATE('2020-07-09', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 50, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (19, TO_DATE('2021-01-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 48, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (20, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 101, 62);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (21, TO_DATE('2022-04-18', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 11, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (22, TO_DATE('2024-02-09', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 11, 16);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (23, TO_DATE('2022-11-13', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 42, 31);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (24, TO_DATE('2021-08-27', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 18, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (25, TO_DATE('2020-04-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 17, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (26, TO_DATE('2020-01-27', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 57, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (27, TO_DATE('2020-10-30', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 46, 82);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (28, TO_DATE('2021-03-03', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 18, 66);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (29, TO_DATE('2022-09-29', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 75, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (30, TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 76, 56);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (31, TO_DATE('2023-08-16', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 71, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (32, TO_DATE('2020-01-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 65, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (33, TO_DATE('2020-01-26', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 71, 66);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (34, TO_DATE('2021-11-10', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 50, 55);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (35, TO_DATE('2020-01-20', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 32, 39);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (36, TO_DATE('2020-10-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 68, 48);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (37, TO_DATE('2020-11-30', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 55, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (38, TO_DATE('2021-11-13', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 35, 62);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (39, TO_DATE('2021-05-05', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 47, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (40, TO_DATE('2020-01-20', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 52, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (41, TO_DATE('2021-08-04', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 55, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (42, TO_DATE('2022-01-09', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 51, 29);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (43, TO_DATE('2020-11-22', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 96, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (44, TO_DATE('2022-01-03', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 97, 90);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (45, TO_DATE('2021-04-30', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 44, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (46, TO_DATE('2020-08-13', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 100, 41);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (47, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 93, 76);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (48, TO_DATE('2022-05-27', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 24, 94);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (49, TO_DATE('2021-05-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 84, 71);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (50, TO_DATE('2022-12-09', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 72, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (51, TO_DATE('2023-04-20', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 101, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (52, TO_DATE('2020-10-09', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 68, 62);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (53, TO_DATE('2022-10-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 64, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (54, TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 17, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (55, TO_DATE('2021-07-09', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 1, 41);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (56, TO_DATE('2020-07-16', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 19, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (57, TO_DATE('2022-10-17', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 96, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (58, TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 31, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (59, TO_DATE('2020-01-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 94, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (60, TO_DATE('2021-11-18', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 40, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (61, TO_DATE('2022-05-09', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 84, 71);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (62, TO_DATE('2024-02-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 64, 91);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (63, TO_DATE('2020-05-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 17, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (64, TO_DATE('2020-03-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 96, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (65, TO_DATE('2023-05-11', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 56, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (66, TO_DATE('2021-09-24', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 48, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (67, TO_DATE('2022-01-11', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 42, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (68, TO_DATE('2023-04-14', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 80, 69);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (69, TO_DATE('2020-09-16', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 87, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (70, TO_DATE('2022-04-03', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 88, 18);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (71, TO_DATE('2022-10-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 3, 62);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (72, TO_DATE('2020-08-14', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 84, 44);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (73, TO_DATE('2021-02-22', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 100, 39);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (74, TO_DATE('2023-07-18', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 74, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (75, TO_DATE('2022-08-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 35, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (76, TO_DATE('2020-10-27', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 9, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (77, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 38, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (78, TO_DATE('2020-11-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 56, 100);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (79, TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 99, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (80, TO_DATE('2023-02-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 37, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (81, TO_DATE('2020-08-26', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 49, 101);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (82, TO_DATE('2020-06-05', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 88, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (83, TO_DATE('2022-11-08', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 41, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (84, TO_DATE('2021-12-21', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 83, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (85, TO_DATE('2022-06-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 82, 65);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (86, TO_DATE('2021-06-12', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 54, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (87, TO_DATE('2022-04-06', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 93, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (88, TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 10, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (89, TO_DATE('2023-10-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 29, 69);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (90, TO_DATE('2022-01-17', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 43, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (91, TO_DATE('2020-02-12', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 3, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (92, TO_DATE('2021-11-16', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 29, 55);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (93, TO_DATE('2021-04-24', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 33, 35);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (94, TO_DATE('2021-12-22', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 64, 55);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (95, TO_DATE('2024-01-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 93, 83);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (96, TO_DATE('2022-10-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 29, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (97, TO_DATE('2022-05-01', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 39, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (98, TO_DATE('2020-06-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 99, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (99, TO_DATE('2021-11-25', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 2, 58);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (100, TO_DATE('2021-02-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 32, 100);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (101, TO_DATE('2020-09-25', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 27, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (102, TO_DATE('2023-05-19', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 31, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (103, TO_DATE('2020-10-24', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 100, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (104, TO_DATE('2020-02-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 56, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (105, TO_DATE('2020-11-29', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 62, 5);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (106, TO_DATE('2023-04-09', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 74, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (107, TO_DATE('2022-02-09', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 53, 35);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (108, TO_DATE('2022-03-17', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 31, 5);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (109, TO_DATE('2022-06-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 67, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (110, TO_DATE('2021-04-01', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 49, 49);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (111, TO_DATE('2021-10-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 78, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (112, TO_DATE('2022-04-07', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 98, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (113, TO_DATE('2020-12-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 14, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (114, TO_DATE('2021-01-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 85, 54);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (115, TO_DATE('2021-09-13', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 34, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (116, TO_DATE('2021-01-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 26, 61);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (117, TO_DATE('2020-04-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 18, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (118, TO_DATE('2020-02-19', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 77, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (119, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 28, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (120, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 94, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (121, TO_DATE('2021-02-11', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 58, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (122, TO_DATE('2022-09-19', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 18, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (123, TO_DATE('2021-04-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 68, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (124, TO_DATE('2021-03-05', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 59, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (125, TO_DATE('2020-10-31', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 88, 27);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (126, TO_DATE('2020-11-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 48, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (127, TO_DATE('2020-12-04', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 47, 86);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (128, TO_DATE('2022-10-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 6, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (129, TO_DATE('2023-10-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 87, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (130, TO_DATE('2021-06-06', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 3, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (131, TO_DATE('2021-05-29', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 55, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (132, TO_DATE('2023-03-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 27, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (133, TO_DATE('2021-12-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 79, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (134, TO_DATE('2020-12-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 70, 31);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (135, TO_DATE('2021-02-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 66, 100);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (136, TO_DATE('2020-08-14', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 10, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (137, TO_DATE('2024-02-03', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 81, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (138, TO_DATE('2022-06-16', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 72, 5);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (139, TO_DATE('2021-09-29', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 63, 72);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (140, TO_DATE('2024-02-04', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 78, 91);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (141, TO_DATE('2022-03-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 36, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (142, TO_DATE('2024-02-04', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 22, 90);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (143, TO_DATE('2023-07-18', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 88, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (144, TO_DATE('2022-05-22', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 58, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (145, TO_DATE('2024-01-26', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 87, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (146, TO_DATE('2022-08-28', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 53, 79);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (147, TO_DATE('2022-03-05', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 61, 23);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (148, TO_DATE('2024-03-13', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 54, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (149, TO_DATE('2020-04-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 56, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (150, TO_DATE('2023-09-21', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 65, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (151, TO_DATE('2023-09-06', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 61, 52);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (152, TO_DATE('2020-02-05', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 99, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (153, TO_DATE('2020-09-18', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 59, 83);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (154, TO_DATE('2023-12-14', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 72, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (155, TO_DATE('2021-09-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 1, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (156, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 87, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (157, TO_DATE('2023-10-27', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 51, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (158, TO_DATE('2023-04-23', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 8, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (159, TO_DATE('2022-01-31', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 70, 18);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (160, TO_DATE('2020-04-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 31, 45);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (161, TO_DATE('2022-06-07', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 79, 61);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (162, TO_DATE('2021-08-21', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 70, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (163, TO_DATE('2022-11-30', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 35, 16);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (164, TO_DATE('2021-05-11', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 24, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (165, TO_DATE('2022-01-09', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 64, 29);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (166, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 21, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (167, TO_DATE('2021-04-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 101, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (168, TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 86, 39);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (169, TO_DATE('2021-07-07', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 60, 29);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (170, TO_DATE('2022-05-07', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 54, 45);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (171, TO_DATE('2021-12-18', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 33, 58);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (172, TO_DATE('2020-02-10', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 42, 82);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (173, TO_DATE('2023-12-11', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 59, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (174, TO_DATE('2022-01-31', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 79, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (175, TO_DATE('2022-04-23', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 34, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (176, TO_DATE('2023-05-09', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 29, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (177, TO_DATE('2023-02-17', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 73, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (178, TO_DATE('2021-12-06', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 76, 61);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (179, TO_DATE('2023-02-12', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 37, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (180, TO_DATE('2023-07-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 87, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (181, TO_DATE('2022-11-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 36, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (182, TO_DATE('2020-12-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 8, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (183, TO_DATE('2020-08-17', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 76, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (184, TO_DATE('2021-03-07', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 41, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (185, TO_DATE('2021-05-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 44, 71);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (186, TO_DATE('2022-06-02', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 80, 61);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (187, TO_DATE('2022-06-24', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 30, 11);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (188, TO_DATE('2021-01-04', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 69, 49);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (189, TO_DATE('2020-06-29', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 20, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (190, TO_DATE('2020-03-11', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 100, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (191, TO_DATE('2020-04-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 32, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (192, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 83, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (193, TO_DATE('2020-11-01', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 58, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (194, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 47, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (195, TO_DATE('2021-11-07', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 83, 94);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (196, TO_DATE('2022-07-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 56, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (197, TO_DATE('2020-11-07', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 32, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (198, TO_DATE('2020-11-19', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 85, 41);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (199, TO_DATE('2021-10-19', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 83, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (200, TO_DATE('2022-12-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 31, 90);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (201, TO_DATE('2021-06-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 1, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (202, TO_DATE('2020-08-07', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 7, 45);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (203, TO_DATE('2022-08-19', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 59, 54);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (204, TO_DATE('2020-12-25', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 83, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (205, TO_DATE('2020-07-18', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 30, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (206, TO_DATE('2020-08-07', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 10, 66);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (207, TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 101, 83);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (208, TO_DATE('2020-09-07', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 34, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (209, TO_DATE('2023-06-13', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 4, 64);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (210, TO_DATE('2023-12-07', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 41, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (211, TO_DATE('2020-01-02', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 34, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (212, TO_DATE('2020-02-27', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 60, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (213, TO_DATE('2021-10-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 79, 79);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (214, TO_DATE('2023-01-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 14, 79);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (215, TO_DATE('2021-03-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 61, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (216, TO_DATE('2021-04-03', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 78, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (217, TO_DATE('2020-07-31', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 18, 58);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (218, TO_DATE('2021-09-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 21, 49);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (219, TO_DATE('2021-04-28', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 1, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (220, TO_DATE('2020-10-25', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 13, 22);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (221, TO_DATE('2021-02-18', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 34, 34);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (222, TO_DATE('2021-03-30', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 93, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (223, TO_DATE('2023-08-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 44, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (224, TO_DATE('2022-10-20', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 23, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (225, TO_DATE('2020-09-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 99, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (226, TO_DATE('2020-09-07', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 78, 12);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (227, TO_DATE('2023-10-30', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 34, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (228, TO_DATE('2021-02-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 92, 69);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (229, TO_DATE('2020-07-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 25, 72);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (230, TO_DATE('2023-02-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 80, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (231, TO_DATE('2021-03-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 63, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (232, TO_DATE('2021-06-15', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 89, 28);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (233, TO_DATE('2023-08-23', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 62, 86);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (234, TO_DATE('2022-10-18', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 84, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (235, TO_DATE('2022-01-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 25, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (236, TO_DATE('2022-04-17', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 37, 72);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (237, TO_DATE('2021-04-16', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 32, 94);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (238, TO_DATE('2020-07-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 36, 29);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (239, TO_DATE('2020-09-12', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 82, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (240, TO_DATE('2021-07-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 14, 56);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (241, TO_DATE('2023-06-29', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 59, 44);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (242, TO_DATE('2023-01-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 77, 43);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (243, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 83, 83);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (244, TO_DATE('2020-12-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 17, 41);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (245, TO_DATE('2021-05-01', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 17, 83);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (246, TO_DATE('2020-12-19', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 62, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (247, TO_DATE('2022-07-20', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 16, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (248, TO_DATE('2023-07-23', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 49, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (249, TO_DATE('2021-05-27', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 47, 82);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (250, TO_DATE('2022-02-04', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 23, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (251, TO_DATE('2023-03-14', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 57, 101);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (252, TO_DATE('2022-12-11', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 101, 90);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (253, TO_DATE('2022-03-26', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 61, 4);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (254, TO_DATE('2021-04-26', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 6, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (255, TO_DATE('2024-02-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 34, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (256, TO_DATE('2020-03-22', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 72, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (257, TO_DATE('2023-05-17', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 49, 27);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (258, TO_DATE('2022-11-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 81, 23);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (259, TO_DATE('2021-11-01', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 65, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (260, TO_DATE('2020-07-02', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 80, 48);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (261, TO_DATE('2022-06-14', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 17, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (262, TO_DATE('2024-03-09', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 12, 43);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (263, TO_DATE('2020-03-22', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 22, 100);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (264, TO_DATE('2020-03-12', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 58, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (265, TO_DATE('2022-10-07', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 41, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (266, TO_DATE('2022-03-06', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 92, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (267, TO_DATE('2022-02-04', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 55, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (268, TO_DATE('2020-03-21', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 62, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (269, TO_DATE('2020-05-28', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 64, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (270, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 36, 42);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (271, TO_DATE('2022-01-31', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 59, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (272, TO_DATE('2022-03-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 26, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (273, TO_DATE('2022-02-24', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 82, 49);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (274, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 76, 60);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (275, TO_DATE('2023-04-17', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 33, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (276, TO_DATE('2021-02-18', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 36, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (277, TO_DATE('2020-12-07', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 75, 12);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (278, TO_DATE('2021-11-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 80, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (279, TO_DATE('2021-08-18', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 49, 27);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (280, TO_DATE('2020-09-24', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 91, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (281, TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 11, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (282, TO_DATE('2020-08-21', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 12, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (283, TO_DATE('2022-07-11', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 73, 44);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (284, TO_DATE('2023-04-22', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 67, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (285, TO_DATE('2021-05-13', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 63, 29);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (286, TO_DATE('2020-11-14', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 70, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (287, TO_DATE('2023-11-29', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 82, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (288, TO_DATE('2023-08-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 54, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (289, TO_DATE('2024-02-11', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 91, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (290, TO_DATE('2021-03-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 86, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (291, TO_DATE('2023-04-04', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 15, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (292, TO_DATE('2020-02-17', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 28, 55);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (293, TO_DATE('2023-01-11', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 60, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (294, TO_DATE('2023-04-14', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 54, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (295, TO_DATE('2021-04-17', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 72, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (296, TO_DATE('2023-01-02', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 70, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (297, TO_DATE('2021-11-10', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 11, 31);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (298, TO_DATE('2020-02-26', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 29, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (299, TO_DATE('2021-11-20', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 65, 62);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (300, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 86, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (301, TO_DATE('2023-04-06', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 8, 91);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (302, TO_DATE('2023-11-11', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 37, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (303, TO_DATE('2023-11-30', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 14, 39);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (304, TO_DATE('2022-07-30', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 56, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (305, TO_DATE('2021-09-16', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 2, 49);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (306, TO_DATE('2022-06-18', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 7, 38);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (307, TO_DATE('2024-02-02', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 86, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (308, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 43, 47);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (309, TO_DATE('2023-10-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 16, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (310, TO_DATE('2021-10-23', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 19, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (311, TO_DATE('2023-06-21', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 5, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (312, TO_DATE('2021-12-20', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 50, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (313, TO_DATE('2020-07-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 42, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (314, TO_DATE('2022-01-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 29, 65);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (315, TO_DATE('2021-11-10', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 16, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (316, TO_DATE('2023-05-04', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 77, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (317, TO_DATE('2023-10-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 44, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (318, TO_DATE('2021-01-01', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 14, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (319, TO_DATE('2022-07-11', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 30, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (320, TO_DATE('2022-04-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 25, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (321, TO_DATE('2021-09-25', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 80, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (322, TO_DATE('2022-01-17', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 39, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (323, TO_DATE('2022-07-21', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 100, 35);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (324, TO_DATE('2023-08-16', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 17, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (325, TO_DATE('2023-03-08', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 70, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (326, TO_DATE('2022-10-17', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 29, 61);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (327, TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 64, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (328, TO_DATE('2023-11-06', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 12, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (329, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 75, 31);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (330, TO_DATE('2021-05-23', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 64, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (331, TO_DATE('2020-09-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 100, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (332, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 95, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (333, TO_DATE('2022-03-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 82, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (334, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 48, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (335, TO_DATE('2024-01-04', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 89, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (336, TO_DATE('2020-08-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 97, 18);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (337, TO_DATE('2020-04-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 84, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (338, TO_DATE('2022-11-26', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 79, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (339, TO_DATE('2021-01-27', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 2, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (340, TO_DATE('2023-03-31', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 73, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (341, TO_DATE('2023-04-11', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 30, 66);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (342, TO_DATE('2021-09-15', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 17, 52);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (343, TO_DATE('2023-07-28', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 49, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (344, TO_DATE('2021-06-14', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 97, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (345, TO_DATE('2021-10-01', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 66, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (346, TO_DATE('2022-11-02', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 21, 41);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (347, TO_DATE('2020-10-25', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 100, 4);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (348, TO_DATE('2021-06-26', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 78, 94);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (349, TO_DATE('2020-11-04', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 72, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (350, TO_DATE('2022-05-18', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 4, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (351, TO_DATE('2021-07-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 89, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (352, TO_DATE('2020-09-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 43, 27);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (353, TO_DATE('2023-04-10', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 72, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (354, TO_DATE('2022-03-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 2, 90);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (355, TO_DATE('2022-07-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 30, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (356, TO_DATE('2024-02-06', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 87, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (357, TO_DATE('2024-02-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 63, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (358, TO_DATE('2021-11-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 61, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (359, TO_DATE('2022-10-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 88, 35);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (360, TO_DATE('2020-03-02', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 20, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (361, TO_DATE('2023-01-18', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 43, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (362, TO_DATE('2023-10-13', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 88, 50);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (363, TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 56, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (364, TO_DATE('2023-05-21', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 22, 60);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (365, TO_DATE('2021-07-24', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 42, 61);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (366, TO_DATE('2023-09-14', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 22, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (367, TO_DATE('2023-01-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 6, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (368, TO_DATE('2023-01-18', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 29, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (369, TO_DATE('2020-03-18', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 13, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (370, TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 64, 54);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (371, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 7, 52);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (372, TO_DATE('2021-03-20', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 42, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (373, TO_DATE('2022-02-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 91, 66);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (374, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 20, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (375, TO_DATE('2022-01-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 68, 65);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (376, TO_DATE('2020-02-15', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 1, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (377, TO_DATE('2021-03-28', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 9, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (378, TO_DATE('2020-11-22', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 84, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (379, TO_DATE('2022-11-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 90, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (380, TO_DATE('2021-03-20', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 45, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (381, TO_DATE('2020-08-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 29, 79);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (382, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 85, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (383, TO_DATE('2023-07-19', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 22, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (384, TO_DATE('2020-02-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 97, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (385, TO_DATE('2021-07-28', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 5, 16);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (386, TO_DATE('2021-10-04', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 47, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (387, TO_DATE('2022-08-06', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 4, 83);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (388, TO_DATE('2022-09-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 2, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (389, TO_DATE('2021-06-16', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 64, 42);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (390, TO_DATE('2022-03-28', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 78, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (391, TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 44, 76);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (392, TO_DATE('2020-05-29', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 42, 45);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (393, TO_DATE('2022-09-09', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 80, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (394, TO_DATE('2023-10-29', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 68, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (395, TO_DATE('2022-03-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 79, 55);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (396, TO_DATE('2020-04-05', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 19, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (397, TO_DATE('2020-07-24', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 19, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (398, TO_DATE('2023-04-11', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 69, 60);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (399, TO_DATE('2024-02-06', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 45, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (400, TO_DATE('2021-04-06', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 59, 82);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (401, TO_DATE('2021-08-10', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 39, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (402, TO_DATE('2020-03-14', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 7, 4);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (403, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 25, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (404, TO_DATE('2022-04-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 25, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (405, TO_DATE('2024-02-23', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 11, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (406, TO_DATE('2023-07-22', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 4, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (407, TO_DATE('2020-06-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 6, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (408, TO_DATE('2020-07-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 21, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (409, TO_DATE('2022-09-18', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 100, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (410, TO_DATE('2022-04-23', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 35, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (411, TO_DATE('2022-06-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 53, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (412, TO_DATE('2020-05-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 64, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (413, TO_DATE('2022-03-15', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 34, 72);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (414, TO_DATE('2021-09-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 45, 62);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (415, TO_DATE('2021-10-10', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 24, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (416, TO_DATE('2022-08-01', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 25, 41);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (417, TO_DATE('2020-06-09', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 25, 48);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (418, TO_DATE('2020-06-23', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 80, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (419, TO_DATE('2021-07-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 24, 69);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (420, TO_DATE('2021-11-15', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 48, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (421, TO_DATE('2023-04-07', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 41, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (422, TO_DATE('2021-02-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 72, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (423, TO_DATE('2020-05-04', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 98, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (424, TO_DATE('2022-11-22', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 71, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (425, TO_DATE('2022-09-18', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 9, 56);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (426, TO_DATE('2020-08-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 13, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (427, TO_DATE('2022-07-21', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 24, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (428, TO_DATE('2021-05-19', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 42, 22);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (429, TO_DATE('2021-10-20', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 14, 43);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (430, TO_DATE('2021-04-17', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 86, 71);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (431, TO_DATE('2022-03-04', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 53, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (432, TO_DATE('2020-02-27', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 93, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (433, TO_DATE('2021-01-27', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 27, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (434, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 73, 64);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (435, TO_DATE('2020-11-27', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 26, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (436, TO_DATE('2021-05-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 67, 4);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (437, TO_DATE('2022-02-23', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 19, 66);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (438, TO_DATE('2022-11-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 55, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (439, TO_DATE('2021-07-09', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 7, 5);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (440, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 90, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (441, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 35, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (442, TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 55, 28);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (443, TO_DATE('2020-10-19', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 53, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (444, TO_DATE('2022-10-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 10, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (445, TO_DATE('2020-07-20', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 34, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (446, TO_DATE('2021-01-15', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 43, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (447, TO_DATE('2020-01-02', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 92, 39);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (448, TO_DATE('2021-07-04', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 84, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (449, TO_DATE('2023-08-17', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 36, 71);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (450, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 72, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (451, TO_DATE('2022-02-06', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 33, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (452, TO_DATE('2023-06-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 32, 18);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (453, TO_DATE('2024-01-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 95, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (454, TO_DATE('2020-07-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 56, 11);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (455, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 54, 47);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (456, TO_DATE('2021-03-29', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 30, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (457, TO_DATE('2023-08-19', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 40, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (458, TO_DATE('2022-12-21', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 85, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (459, TO_DATE('2020-11-09', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 94, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (460, TO_DATE('2022-03-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 33, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (461, TO_DATE('2023-07-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 93, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (462, TO_DATE('2020-12-12', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 83, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (463, TO_DATE('2023-10-16', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 49, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (464, TO_DATE('2022-04-11', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 16, 83);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (465, TO_DATE('2023-07-19', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 88, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (466, TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 56, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (467, TO_DATE('2021-06-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 1, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (468, TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 69, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (469, TO_DATE('2023-05-31', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 41, 86);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (470, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 16, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (471, TO_DATE('2023-06-08', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 64, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (472, TO_DATE('2023-04-24', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 35, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (473, TO_DATE('2021-10-04', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 7, 90);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (474, TO_DATE('2021-02-15', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 48, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (475, TO_DATE('2020-09-09', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 101, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (476, TO_DATE('2020-10-15', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 55, 44);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (477, TO_DATE('2020-09-13', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 90, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (478, TO_DATE('2022-07-29', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 20, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (479, TO_DATE('2023-06-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 32, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (480, TO_DATE('2020-11-14', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 49, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (481, TO_DATE('2022-10-30', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 77, 5);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (482, TO_DATE('2022-03-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 16, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (483, TO_DATE('2022-10-10', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 70, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (484, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 84, 83);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (485, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 61, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (486, TO_DATE('2020-02-20', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 80, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (487, TO_DATE('2023-06-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 99, 54);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (488, TO_DATE('2022-08-22', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 76, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (489, TO_DATE('2024-03-11', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 69, 65);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (490, TO_DATE('2020-05-30', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 64, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (491, TO_DATE('2021-06-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 55, 58);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (492, TO_DATE('2024-01-29', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 19, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (493, TO_DATE('2022-04-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 20, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (494, TO_DATE('2021-05-11', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 38, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (495, TO_DATE('2021-07-09', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 16, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (496, TO_DATE('2020-10-17', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 74, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (497, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 80, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (498, TO_DATE('2023-12-25', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 77, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (499, TO_DATE('2020-03-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 36, 5);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (500, TO_DATE('2021-01-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 17, 94);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (501, TO_DATE('2022-10-13', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 71, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (502, TO_DATE('2021-03-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 54, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (503, TO_DATE('2022-12-27', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 25, 45);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (504, TO_DATE('2020-07-29', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 25, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (505, TO_DATE('2022-09-28', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 1, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (506, TO_DATE('2020-01-07', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 1, 28);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (507, TO_DATE('2023-07-25', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 62, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (508, TO_DATE('2020-07-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 61, 61);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (509, TO_DATE('2023-08-21', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 66, 82);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (510, TO_DATE('2020-10-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 76, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (511, TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 26, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (512, TO_DATE('2021-01-19', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 87, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (513, TO_DATE('2021-05-15', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 93, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (514, TO_DATE('2020-10-06', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 88, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (515, TO_DATE('2023-05-28', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 44, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (516, TO_DATE('2021-02-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 10, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (517, TO_DATE('2024-02-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 16, 27);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (518, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 44, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (519, TO_DATE('2021-06-11', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 22, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (520, TO_DATE('2022-04-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 5, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (521, TO_DATE('2021-07-31', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 4, 47);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (522, TO_DATE('2020-04-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 101, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (523, TO_DATE('2020-09-14', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 1, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (524, TO_DATE('2022-12-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 75, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (525, TO_DATE('2022-01-29', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 26, 44);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (526, TO_DATE('2022-02-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 28, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (527, TO_DATE('2020-05-03', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 21, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (528, TO_DATE('2022-03-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 8, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (529, TO_DATE('2020-02-02', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 67, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (530, TO_DATE('2023-01-30', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 9, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (531, TO_DATE('2022-05-19', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 6, 56);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (532, TO_DATE('2023-11-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 58, 28);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (533, TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 17, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (534, TO_DATE('2021-02-18', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 86, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (535, TO_DATE('2020-02-12', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 18, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (536, TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 13, 43);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (537, TO_DATE('2022-07-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 44, 64);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (538, TO_DATE('2021-05-05', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 77, 100);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (539, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 15, 79);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (540, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 45, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (541, TO_DATE('2020-02-27', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 55, 100);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (542, TO_DATE('2021-01-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 64, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (543, TO_DATE('2022-10-12', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 6, 4);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (544, TO_DATE('2022-03-23', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 53, 31);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (545, TO_DATE('2022-07-22', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 63, 52);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (546, TO_DATE('2022-04-23', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 7, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (547, TO_DATE('2022-10-22', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 38, 29);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (548, TO_DATE('2020-12-16', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 95, 59);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (549, TO_DATE('2021-09-21', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 67, 5);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (550, TO_DATE('2023-05-29', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 86, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (551, TO_DATE('2021-01-08', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 27, 41);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (552, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 74, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (553, TO_DATE('2022-02-14', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 60, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (554, TO_DATE('2020-04-17', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 48, 44);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (555, TO_DATE('2024-01-26', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 41, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (556, TO_DATE('2022-06-09', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 65, 58);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (557, TO_DATE('2021-03-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 53, 65);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (558, TO_DATE('2021-09-26', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 37, 23);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (559, TO_DATE('2022-03-29', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 62, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (560, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 80, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (561, TO_DATE('2022-07-24', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 43, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (562, TO_DATE('2021-01-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 71, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (563, TO_DATE('2023-12-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 5, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (564, TO_DATE('2020-10-24', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 43, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (565, TO_DATE('2022-03-22', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 50, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (566, TO_DATE('2023-07-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 67, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (567, TO_DATE('2021-04-13', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 4, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (568, TO_DATE('2022-09-04', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 44, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (569, TO_DATE('2021-06-19', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 76, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (570, TO_DATE('2020-07-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 77, 28);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (571, TO_DATE('2022-10-02', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 80, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (572, TO_DATE('2024-01-14', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 87, 16);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (573, TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 79, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (574, TO_DATE('2020-08-04', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 71, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (575, TO_DATE('2022-05-15', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 54, 65);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (576, TO_DATE('2022-09-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 71, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (577, TO_DATE('2020-05-30', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 16, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (578, TO_DATE('2023-05-16', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 56, 60);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (579, TO_DATE('2020-12-21', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 9, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (580, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 11, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (581, TO_DATE('2020-11-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 12, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (582, TO_DATE('2021-06-02', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 4, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (583, TO_DATE('2023-01-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 64, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (584, TO_DATE('2021-04-21', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 79, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (585, TO_DATE('2022-12-16', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 13, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (586, TO_DATE('2022-08-18', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 54, 43);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (587, TO_DATE('2020-07-27', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 80, 5);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (588, TO_DATE('2021-04-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 53, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (589, TO_DATE('2022-05-29', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 30, 27);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (590, TO_DATE('2022-09-27', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 39, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (591, TO_DATE('2022-04-09', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 46, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (592, TO_DATE('2022-03-15', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 1, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (593, TO_DATE('2021-05-07', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 75, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (594, TO_DATE('2020-12-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 57, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (595, TO_DATE('2023-03-02', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 96, 86);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (596, TO_DATE('2023-12-07', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 22, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (597, TO_DATE('2021-10-18', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 64, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (598, TO_DATE('2022-09-04', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 88, 28);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (599, TO_DATE('2020-12-29', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 39, 43);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (600, TO_DATE('2023-08-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 21, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (601, TO_DATE('2022-05-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 78, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (602, TO_DATE('2021-08-13', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 29, 38);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (603, TO_DATE('2022-11-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 59, 28);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (604, TO_DATE('2020-05-11', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 98, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (605, TO_DATE('2022-05-08', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 27, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (606, TO_DATE('2021-03-09', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 64, 76);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (607, TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 38, 59);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (608, TO_DATE('2020-08-31', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 54, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (609, TO_DATE('2021-02-02', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 73, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (610, TO_DATE('2022-10-19', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 27, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (611, TO_DATE('2024-02-07', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 89, 38);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (612, TO_DATE('2020-04-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 86, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (613, TO_DATE('2022-12-18', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 3, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (614, TO_DATE('2024-02-11', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 41, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (615, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 42, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (616, TO_DATE('2022-10-11', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 72, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (617, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 73, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (618, TO_DATE('2022-02-28', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 101, 56);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (619, TO_DATE('2022-06-27', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 49, 54);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (620, TO_DATE('2020-03-17', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 50, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (621, TO_DATE('2021-01-23', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 88, 18);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (622, TO_DATE('2021-12-27', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 38, 22);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (623, TO_DATE('2023-10-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 77, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (624, TO_DATE('2020-10-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 84, 55);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (625, TO_DATE('2023-09-27', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 3, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (626, TO_DATE('2022-10-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 85, 69);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (627, TO_DATE('2021-12-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 41, 56);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (628, TO_DATE('2021-04-19', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 29, 76);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (629, TO_DATE('2022-04-26', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 16, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (630, TO_DATE('2020-06-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 14, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (631, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 31, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (632, TO_DATE('2022-03-07', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 36, 60);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (633, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 86, 12);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (634, TO_DATE('2023-06-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 35, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (635, TO_DATE('2020-11-30', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 88, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (636, TO_DATE('2020-03-09', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 47, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (637, TO_DATE('2022-06-11', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 36, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (638, TO_DATE('2023-04-22', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 60, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (639, TO_DATE('2023-06-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 19, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (640, TO_DATE('2021-10-23', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 25, 94);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (641, TO_DATE('2024-03-07', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 38, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (642, TO_DATE('2022-06-02', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 65, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (643, TO_DATE('2020-01-22', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 32, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (644, TO_DATE('2022-01-14', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 79, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (645, TO_DATE('2023-11-16', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 50, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (646, TO_DATE('2020-12-29', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 91, 42);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (647, TO_DATE('2021-08-03', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 74, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (648, TO_DATE('2023-06-18', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 92, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (649, TO_DATE('2021-09-23', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 49, 59);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (650, TO_DATE('2023-09-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 80, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (651, TO_DATE('2021-02-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 13, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (652, TO_DATE('2022-01-06', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 4, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (653, TO_DATE('2021-05-15', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 89, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (654, TO_DATE('2020-05-11', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 59, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (655, TO_DATE('2023-10-17', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 79, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (656, TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 9, 82);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (657, TO_DATE('2021-08-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 44, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (658, TO_DATE('2023-03-02', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 8, 94);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (659, TO_DATE('2023-02-21', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 4, 2);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (660, TO_DATE('2022-07-11', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 87, 76);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (661, TO_DATE('2022-03-04', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 71, 101);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (662, TO_DATE('2022-03-27', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 30, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (663, TO_DATE('2022-02-02', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 32, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (664, TO_DATE('2021-07-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 70, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (665, TO_DATE('2021-06-23', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 16, 94);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (666, TO_DATE('2021-02-02', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 11, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (667, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 39, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (668, TO_DATE('2020-04-29', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 47, 45);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (669, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 76, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (670, TO_DATE('2020-03-19', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 1, 39);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (671, TO_DATE('2022-06-13', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 75, 101);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (672, TO_DATE('2022-11-01', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 49, 71);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (673, TO_DATE('2022-09-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 61, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (674, TO_DATE('2021-05-29', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 9, 82);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (675, TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 54, 22);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (676, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 58, 58);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (677, TO_DATE('2022-05-09', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 59, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (678, TO_DATE('2020-07-15', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 57, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (679, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 5, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (680, TO_DATE('2022-11-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 40, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (681, TO_DATE('2020-05-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 64, 50);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (682, TO_DATE('2022-01-05', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 3, 50);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (683, TO_DATE('2023-11-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 24, 82);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (684, TO_DATE('2022-06-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 15, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (685, TO_DATE('2020-02-17', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 17, 48);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (686, TO_DATE('2022-11-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 100, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (687, TO_DATE('2022-06-09', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 44, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (688, TO_DATE('2021-06-20', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 50, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (689, TO_DATE('2022-07-27', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 83, 55);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (690, TO_DATE('2021-12-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 44, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (691, TO_DATE('2021-08-10', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 22, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (692, TO_DATE('2021-06-11', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 70, 54);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (693, TO_DATE('2021-01-31', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 71, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (694, TO_DATE('2021-10-25', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 70, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (695, TO_DATE('2023-06-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 77, 42);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (696, TO_DATE('2023-09-21', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 22, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (697, TO_DATE('2021-03-21', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 72, 49);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (698, TO_DATE('2021-02-12', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 71, 55);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (699, TO_DATE('2021-10-31', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 31, 60);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (700, TO_DATE('2021-12-01', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 85, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (701, TO_DATE('2023-08-05', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 65, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (702, TO_DATE('2020-09-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 32, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (703, TO_DATE('2021-12-01', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 100, 42);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (704, TO_DATE('2022-10-28', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 6, 38);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (705, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 45, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (706, TO_DATE('2023-07-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 47, 86);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (707, TO_DATE('2023-11-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 74, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (708, TO_DATE('2021-01-25', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 17, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (709, TO_DATE('2023-03-28', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 30, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (710, TO_DATE('2022-05-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 67, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (711, TO_DATE('2020-09-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 21, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (712, TO_DATE('2021-12-07', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 74, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (713, TO_DATE('2021-06-12', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 32, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (714, TO_DATE('2023-03-02', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 63, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (715, TO_DATE('2023-08-29', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 5, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (716, TO_DATE('2020-06-30', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 24, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (717, TO_DATE('2023-08-27', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 82, 64);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (718, TO_DATE('2022-08-18', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 68, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (719, TO_DATE('2020-12-07', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 51, 61);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (720, TO_DATE('2020-12-09', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 48, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (721, TO_DATE('2021-11-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 58, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (722, TO_DATE('2021-07-25', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 12, 91);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (723, TO_DATE('2021-03-07', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 47, 39);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (724, TO_DATE('2020-08-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 59, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (725, TO_DATE('2020-07-29', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 61, 43);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (726, TO_DATE('2023-07-07', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 5, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (727, TO_DATE('2023-05-06', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 11, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (728, TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 94, 22);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (729, TO_DATE('2023-03-24', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 12, 34);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (730, TO_DATE('2022-07-30', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 93, 28);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (731, TO_DATE('2023-10-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 45, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (732, TO_DATE('2022-01-25', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 35, 23);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (733, TO_DATE('2020-10-17', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 48, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (734, TO_DATE('2022-12-22', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 37, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (735, TO_DATE('2023-05-06', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 68, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (736, TO_DATE('2020-11-14', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 20, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (737, TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 29, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (738, TO_DATE('2022-02-16', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 64, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (739, TO_DATE('2020-05-31', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 26, 4);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (740, TO_DATE('2023-04-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 21, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (741, TO_DATE('2023-10-11', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 64, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (742, TO_DATE('2023-04-19', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 62, 51);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (743, TO_DATE('2022-09-06', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 64, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (744, TO_DATE('2022-11-22', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 10, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (745, TO_DATE('2022-12-15', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 16, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (746, TO_DATE('2022-12-12', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 22, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (747, TO_DATE('2023-05-10', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 26, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (748, TO_DATE('2022-10-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 35, 88);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (749, TO_DATE('2021-03-09', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 12, 18);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (750, TO_DATE('2021-06-25', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 23, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (751, TO_DATE('2023-09-21', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 12, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (752, TO_DATE('2022-12-17', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 16, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (753, TO_DATE('2021-03-21', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 97, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (754, TO_DATE('2020-11-01', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 45, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (755, TO_DATE('2023-07-12', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 48, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (756, TO_DATE('2023-01-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 62, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (757, TO_DATE('2023-03-14', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 31, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (758, TO_DATE('2022-01-18', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 12, 56);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (759, TO_DATE('2021-03-08', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 10, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (760, TO_DATE('2021-01-16', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 96, 47);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (761, TO_DATE('2023-11-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 64, 45);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (762, TO_DATE('2023-07-01', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 49, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (763, TO_DATE('2021-08-01', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 36, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (764, TO_DATE('2021-06-26', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 26, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (765, TO_DATE('2022-01-30', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 75, 72);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (766, TO_DATE('2023-12-02', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 64, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (767, TO_DATE('2023-04-25', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 80, 91);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (768, TO_DATE('2021-08-20', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 80, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (769, TO_DATE('2022-06-11', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 50, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (770, TO_DATE('2020-02-14', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 53, 101);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (771, TO_DATE('2023-12-11', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 37, 69);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (772, TO_DATE('2021-05-27', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 75, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (773, TO_DATE('2022-02-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 97, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (774, TO_DATE('2022-06-12', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 75, 66);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (775, TO_DATE('2022-07-29', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 7, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (776, TO_DATE('2021-01-18', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 30, 54);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (777, TO_DATE('2022-04-24', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 97, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (778, TO_DATE('2022-08-27', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 6, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (779, TO_DATE('2021-12-11', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 53, 18);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (780, TO_DATE('2020-07-10', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 52, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (781, TO_DATE('2020-04-28', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 54, 66);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (782, TO_DATE('2021-05-12', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 22, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (783, TO_DATE('2022-01-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 54, 67);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (784, TO_DATE('2022-08-05', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 67, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (785, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 6, 35);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (786, TO_DATE('2022-03-10', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 87, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (787, TO_DATE('2021-11-07', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 61, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (788, TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 88, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (789, TO_DATE('2021-09-01', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 37, 91);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (790, TO_DATE('2020-01-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 77, 35);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (791, TO_DATE('2020-04-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 47, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (792, TO_DATE('2020-02-17', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 31, 96);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (793, TO_DATE('2020-11-18', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 48, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (794, TO_DATE('2020-11-24', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 58, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (795, TO_DATE('2023-11-13', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 29, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (796, TO_DATE('2023-10-29', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 20, 22);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (797, TO_DATE('2022-02-13', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 7, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (798, TO_DATE('2022-06-13', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 82, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (799, TO_DATE('2022-12-11', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 33, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (800, TO_DATE('2023-09-23', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 32, 82);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (801, TO_DATE('2022-04-23', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 63, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (802, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 67, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (803, TO_DATE('2022-08-07', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 24, 34);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (804, TO_DATE('2020-12-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 24, 71);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (805, TO_DATE('2023-10-16', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 84, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (806, TO_DATE('2022-07-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 21, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (807, TO_DATE('2023-03-12', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 60, 16);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (808, TO_DATE('2021-03-21', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 1, 79);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (809, TO_DATE('2021-01-31', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 60, 11);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (810, TO_DATE('2022-07-04', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 78, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (811, TO_DATE('2021-03-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 27, 101);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (812, TO_DATE('2021-05-08', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 59, 27);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (813, TO_DATE('2021-09-04', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 68, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (814, TO_DATE('2021-05-16', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 78, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (815, TO_DATE('2020-03-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 53, 47);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (816, TO_DATE('2022-03-08', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 58, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (817, TO_DATE('2020-11-30', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 81, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (818, TO_DATE('2021-11-17', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 89, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (819, TO_DATE('2022-07-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 14, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (820, TO_DATE('2023-01-26', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 86, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (821, TO_DATE('2020-07-26', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 54, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (822, TO_DATE('2020-03-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 52, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (823, TO_DATE('2021-05-16', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 21, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (824, TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 39, 83);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (825, TO_DATE('2022-10-19', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 21, 17);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (826, TO_DATE('2020-09-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 38, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (827, TO_DATE('2023-07-01', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 8, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (828, TO_DATE('2022-12-21', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 14, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (829, TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 101, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (830, TO_DATE('2021-07-23', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 91, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (831, TO_DATE('2023-07-13', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 27, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (832, TO_DATE('2024-02-29', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 10, 35);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (833, TO_DATE('2023-01-21', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 23, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (834, TO_DATE('2021-03-25', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 4, 58);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (835, TO_DATE('2021-07-03', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 4, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (836, TO_DATE('2021-02-12', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 19, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (837, TO_DATE('2021-10-05', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 90, 84);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (838, TO_DATE('2020-08-05', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 59, 36);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (839, TO_DATE('2023-11-03', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 4, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (840, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 28, 45);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (841, TO_DATE('2022-10-12', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 9, 59);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (842, TO_DATE('2021-08-18', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 15, 23);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (843, TO_DATE('2023-10-16', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 97, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (844, TO_DATE('2023-08-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 77, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (845, TO_DATE('2020-10-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 56, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (846, TO_DATE('2020-03-30', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 97, 48);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (847, TO_DATE('2021-02-19', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 16, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (848, TO_DATE('2023-05-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 71, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (849, TO_DATE('2021-08-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 93, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (850, TO_DATE('2021-05-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 69, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (851, TO_DATE('2020-07-10', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 2, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (852, TO_DATE('2020-11-15', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 24, 81);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (853, TO_DATE('2023-05-11', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 9, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (854, TO_DATE('2021-08-19', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 55, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (855, TO_DATE('2023-04-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 77, 22);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (856, TO_DATE('2020-04-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 47, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (857, TO_DATE('2022-06-23', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 93, 47);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (858, TO_DATE('2021-01-29', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 44, 31);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (859, TO_DATE('2020-12-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 45, 41);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (860, TO_DATE('2022-04-20', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 16, 70);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (861, TO_DATE('2023-10-19', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 17, 38);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (862, TO_DATE('2021-01-07', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 48, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (863, TO_DATE('2022-08-08', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 73, 23);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (864, TO_DATE('2020-03-12', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 13, 72);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (865, TO_DATE('2020-09-18', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 31, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (866, TO_DATE('2021-06-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 57, 35);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (867, TO_DATE('2020-08-10', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 38, 40);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (868, TO_DATE('2023-05-08', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 45, 79);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (869, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 40, 9);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (870, TO_DATE('2022-12-04', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 21, 100);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (871, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 17, 38);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (872, TO_DATE('2023-08-30', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 100, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (873, TO_DATE('2023-02-04', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 92, 56);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (874, TO_DATE('2021-11-01', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 28, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (875, TO_DATE('2022-08-24', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 26, 101);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (876, TO_DATE('2020-02-01', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 15, 19);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (877, TO_DATE('2022-12-27', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 67, 27);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (878, TO_DATE('2022-02-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 32, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (879, TO_DATE('2022-09-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 101, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (880, TO_DATE('2020-09-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 99, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (881, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 32, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (882, TO_DATE('2023-08-25', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 90, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (883, TO_DATE('2023-09-17', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 51, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (884, TO_DATE('2023-12-28', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 43, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (885, TO_DATE('2021-09-03', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 12, 58);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (886, TO_DATE('2022-10-20', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 44, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (887, TO_DATE('2020-02-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 3, 24);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (888, TO_DATE('2021-10-02', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 76, 64);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (889, TO_DATE('2021-06-13', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 22, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (890, TO_DATE('2020-05-15', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 31, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (891, TO_DATE('2021-11-12', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 14, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (892, TO_DATE('2023-05-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 17, 16);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (893, TO_DATE('2023-10-14', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 55, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (894, TO_DATE('2022-12-24', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 3, 31);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (895, TO_DATE('2021-09-10', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 84, 100);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (896, TO_DATE('2020-12-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 60, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (897, TO_DATE('2020-08-28', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 16, 79);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (898, TO_DATE('2023-03-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 10, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (899, TO_DATE('2023-04-23', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 79, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (900, TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 18, 28);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (901, TO_DATE('2022-03-25', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 58, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (902, TO_DATE('2020-05-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 62, 32);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (903, TO_DATE('2023-01-25', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 59, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (904, TO_DATE('2022-08-31', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 85, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (905, TO_DATE('2020-02-01', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 33, 95);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (906, TO_DATE('2021-07-15', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 40, 56);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (907, TO_DATE('2023-12-26', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 94, 91);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (908, TO_DATE('2020-04-22', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 65, 80);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (909, TO_DATE('2021-08-20', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 40, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (910, TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 75, 12);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (911, TO_DATE('2020-11-04', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 77, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (912, TO_DATE('2020-06-14', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 80, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (913, TO_DATE('2023-04-30', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 60, 91);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (914, TO_DATE('2023-08-11', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 88, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (915, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 97, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (916, TO_DATE('2020-12-13', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 91, 78);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (917, TO_DATE('2021-03-20', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 98, 4);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (918, TO_DATE('2021-04-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 30, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (919, TO_DATE('2022-02-15', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 7, 69);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (920, TO_DATE('2020-05-17', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 1, 72);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (921, TO_DATE('2024-03-11', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 16, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (922, TO_DATE('2023-08-23', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 13, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (923, TO_DATE('2020-01-02', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 23, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (924, TO_DATE('2022-01-02', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 89, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (925, TO_DATE('2022-06-21', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 73, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (926, TO_DATE('2023-04-16', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 36, 50);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (927, TO_DATE('2023-10-17', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 72, 90);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (928, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 96, 27);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (929, TO_DATE('2020-12-25', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 20, 13);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (930, TO_DATE('2021-02-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 7, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (931, TO_DATE('2023-04-11', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 56, 89);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (932, TO_DATE('2020-06-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 59, 46);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (933, TO_DATE('2023-05-10', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 81, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (934, TO_DATE('2021-09-08', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 96, 74);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (935, TO_DATE('2022-08-05', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 34, 99);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (936, TO_DATE('2021-12-16', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 101, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (937, TO_DATE('2021-07-29', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 82, 57);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (938, TO_DATE('2023-01-03', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 85, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (939, TO_DATE('2022-09-09', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 93, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (940, TO_DATE('2023-11-04', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 29, 20);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (941, TO_DATE('2022-08-05', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 17, 11);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (942, TO_DATE('2023-01-31', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 31, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (943, TO_DATE('2021-03-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 94, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (944, TO_DATE('2023-04-27', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 81, 60);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (945, TO_DATE('2023-08-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 87, 33);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (946, TO_DATE('2020-04-05', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 6, 8);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (947, TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 36, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (948, TO_DATE('2020-08-04', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 38, 15);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (949, TO_DATE('2022-10-01', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 48, 75);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (950, TO_DATE('2022-06-26', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 92, 53);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (951, TO_DATE('2022-05-26', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 9, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (952, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 17, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (953, TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 90, 87);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (954, TO_DATE('2024-03-03', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 48, 68);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (955, TO_DATE('2020-11-27', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 37, 3);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (956, TO_DATE('2020-06-28', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 67, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (957, TO_DATE('2020-07-24', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 43, 34);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (958, TO_DATE('2020-08-29', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 23, 58);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (959, TO_DATE('2020-08-23', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 52, 16);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (960, TO_DATE('2023-07-02', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 66, 71);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (961, TO_DATE('2024-01-26', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 63, 65);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (962, TO_DATE('2023-08-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 43, 72);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (963, TO_DATE('2022-05-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 18, 86);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (964, TO_DATE('2021-05-28', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 57, 26);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (965, TO_DATE('2020-08-20', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 28, 63);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (966, TO_DATE('2021-01-28', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 99, 10);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (967, TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'Phòng tr? này có g?n b?nh vi?n không?', 1, 72, 7);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (968, TO_DATE('2022-10-23', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 80, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (969, TO_DATE('2021-09-23', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 98, 14);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (970, TO_DATE('2021-04-04', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 85, 37);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (971, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 14, 100);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (972, TO_DATE('2022-08-09', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 72, 29);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (973, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'C?n h? này có g?n tr??ng h?c không?', 1, 52, 69);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (974, TO_DATE('2021-11-11', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 4, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (975, TO_DATE('2024-01-17', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 65, 91);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (976, TO_DATE('2022-08-15', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 5, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (977, TO_DATE('2021-04-05', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 73, 85);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (978, TO_DATE('2021-08-27', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 48, 98);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (979, TO_DATE('2020-10-01', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 9, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (980, TO_DATE('2021-04-14', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 24, 1);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (981, TO_DATE('2020-07-17', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 83, 12);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (982, TO_DATE('2020-06-07', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 27, 49);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (983, TO_DATE('2020-08-21', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 41, 73);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (984, TO_DATE('2023-01-09', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có gác l?ng không?', 1, 10, 93);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (985, TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 24, 35);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (986, TO_DATE('2021-10-21', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 17, 31);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (987, TO_DATE('2022-11-03', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 55, 94);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (988, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 4, 6);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (989, TO_DATE('2022-12-30', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 11, 30);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (990, TO_DATE('2021-06-26', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 10, 97);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (991, TO_DATE('2023-11-26', 'YYYY-MM-DD'), 'C?n h? này có an ninh t?t không?', 1, 95, 77);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (992, TO_DATE('2024-01-19', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 96, 90);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (993, TO_DATE('2022-06-01', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có ch? ?? xe không?', 1, 9, 38);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (994, TO_DATE('2020-01-26', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 84, 61);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (995, TO_DATE('2023-08-06', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 8, 54);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (996, TO_DATE('2021-07-25', 'YYYY-MM-DD'), 'Phòng tr? này có g?n siêu th? không?', 1, 47, 65);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (997, TO_DATE('2024-02-04', 'YYYY-MM-DD'), 'Phòng tr? này có sân ph?i không?', 1, 14, 92);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (998, TO_DATE('2020-08-07', 'YYYY-MM-DD'), 'Nhà nguyên c?n này có sân v??n không?', 1, 75, 21);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (999, TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'M?t b?ng này có g?n trung tâm thành ph? không?', 1, 81, 25);
INSERT INTO BINHLUAN (MaBl, NgayBinhLuan, NoiDung, TrangThai, MaTin, MaKH) VALUES (1000, TO_DATE('2020-07-06', 'YYYY-MM-DD'), 'M?t b?ng này có view ??p không?', 1, 40, 83);
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--YEUTHICH--
INSERT INTO YEUTHICH (MaYT, NgayYeuThich, MaKH, MaTin) VALUES (1, TO_DATE('2021-01-14', 'YYYY-MM-DD'), 1, 1);
INSERT INTO YEUTHICH (MaYT, NgayYeuThich, MaKH, MaTin) VALUES (2, TO_DATE('2021-01-14', 'YYYY-MM-DD'), 2, 1);
INSERT INTO YEUTHICH (MaYT, NgayYeuThich, MaKH, MaTin) VALUES (3, TO_DATE('2021-01-14', 'YYYY-MM-DD'), 3, 2);
INSERT INTO YEUTHICH (MaYT, NgayYeuThich, MaKH, MaTin) VALUES (4, TO_DATE('2021-01-14', 'YYYY-MM-DD'), 4, 1);
INSERT INTO YEUTHICH (MaYT, NgayYeuThich, MaKH, MaTin) VALUES (5, TO_DATE('2021-01-14', 'YYYY-MM-DD'), 5, 2);
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--LSGD--

--------------------------------------------------------------
------------------VIET CAC THU TUC----------------------------
---------------------TRIGGER----------------------------------
---------------------FUNCTION---------------------------------

--4.3.2 Thi?t k? và cài ??t các Stored Procedure/Function c?n thi?t cho h? th?ng
--THÊM KHÁCH HÀNG VÀ KI?M TRA RÀNG BU?C V?I CH?C V?, TÌNH TR?NG:
CREATE OR REPLACE PROCEDURE Them_KhachHang (
    p_MaKH IN NUMBER,
    p_SDT IN VARCHAR2,
    p_MatKhau IN VARCHAR2,
    p_HoTen IN VARCHAR2,
    p_HinhAnh IN VARCHAR2,
    P_TrangThai IN NUMBER,
    p_Ngaytao IN DATE,
    p_DiaChi IN VARCHAR2,
    p_MaCV IN NUMBER,
    p_MaTT IN NUMBER,
    p_NgaySinh DATE
) IS
    v_ChucVu NUMBER;
    v_ThanhToan NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_ChucVu FROM CHUCVU WHERE MaCV = p_MaCV;
    IF v_ChucVu = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Ch?c v? không t?n t?i.');
    END IF;

    SELECT COUNT(*) INTO v_ThanhToan FROM VITIEN WHERE MaTT = p_MaTT;
    IF v_ThanhToan = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'B?n ch?a có ti?n trong tài kho?n!.');
    END IF;

    INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh)
        VALUES (p_MaKH, p_SDT, p_MatKhau, p_HoTen, p_HinhAnh, P_TrangThai, p_Ngaytao, p_DiaChi, p_MaCV, p_MaTT, p_NgaySinh);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('D? li?u khách hàng ?ã ???c chèn thành công.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20003, 'Mã khách hàng b? trùng.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'L?i: ' || SQLERRM);
END Them_KhachHang;
/
--------------------------------------------------------------
--THÊM KHÁCH HÀNG VÀ KI?M TRA KHÓA CHÍNH CÓ TRÙNG L?P HAY KHÔNG:
CREATE OR REPLACE PROCEDURE KiemTraKhoa_KhachHang (
    p_MaKH IN NUMBER,
    p_SDT IN VARCHAR2,
    p_MatKhau IN VARCHAR2,
    p_HoTen IN VARCHAR2,
    p_HinhAnh IN VARCHAR2,
    P_TrangThai IN NUMBER,
    p_Ngaytao IN DATE,
    p_DiaChi IN VARCHAR2,
    p_MaCV IN NUMBER,
    p_MaTT IN NUMBER,
    p_NgaySinh DATE
) IS
    v_Count NUMBER;
BEGIN

    SELECT COUNT(*) INTO v_Count FROM KHACHHANG WHERE MaKH = p_MaKH;  
    IF v_Count > 0 THEN

        RAISE_APPLICATION_ERROR(-20005, 'Mã khách hàng ?ã t?n t?i.');
    ELSE

        INSERT INTO KHACHHANG (MaKH, SDT, MatKhau, HoTen, HinhAnh, TrangThai, Ngaytao, DiaChi, MaCV, MaTT, NgaySinh)
        VALUES (p_MaKH, p_SDT, p_MatKhau, p_HoTen, p_HinhAnh, P_TrangThai, p_Ngaytao, p_DiaChi, p_MaCV, p_MaTT, p_NgaySinh);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('D? li?u khách hàng ?ã ???c chèn thành công.');
    END IF;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN

        RAISE_APPLICATION_ERROR(-20006, 'Mã khách hàng b? trùng l?p.');
    WHEN OTHERS THEN

        RAISE_APPLICATION_ERROR(-20007, 'L?i: ' || SQLERRM);
END KiemTraKhoa_KhachHang;
/
--------------------------------------------------------------
--C?P NH?T M?T KH?U CHO KHÁCH HÀNG--
CREATE OR REPLACE PROCEDURE CapNhat_KhachHang (
    P_MaKH NUMBER,
    p_MatKhau IN VARCHAR2
) IS
    v_Count NUMBER;
BEGIN

    SELECT COUNT(*) INTO v_Count FROM KHACHHANG WHERE MaKH = P_MaKH;
    
    IF v_Count = 0 THEN
        RAISE_APPLICATION_ERROR(-20008, 'Không tìm th?y khách hàng có mã ' || P_MaKH);
    ELSE
 
        UPDATE KHACHHANG
        SET MatKhau = p_MatKhau
        WHERE MaKH = P_MaKH;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Thông tin khách hàng ?ã ???c c?p nh?t thành công.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20009, 'L?i: ' || SQLERRM);
END CapNhat_KhachHang;
/
--------------------------------------------------------------
--XÓA KHÁCH HÀNG--
CREATE OR REPLACE PROCEDURE Xoa_KhachHang (
    p_MaKH IN NUMBER
) IS
BEGIN

    DELETE FROM KHACHHANG WHERE MaKH = p_MaKH;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tin ??ng ?ã ???c xóa thành công.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20010, 'Không tìm th?y tin ??ng có mã ' || p_MaKH);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20011, 'L?i: ' || SQLERRM);
END Xoa_KhachHang;
/

--------------------------------------------------------------
--TÍNH T?NG NGÀY ?Ã ??NG TIN--
CREATE OR REPLACE PROCEDURE DemTongSoNgayDang (
    p_MaTin IN NUMBER,
    p_TongNgay OUT NUMBER
) IS
BEGIN

    DECLARE
        v_NgayDang DATE;
    BEGIN

        SELECT NgayDang INTO v_NgayDang FROM TIN WHERE MaTin = p_MaTin;


        p_TongNgay := TRUNC(SYSDATE) - TRUNC(v_NgayDang);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RAISE_APPLICATION_ERROR(-20001, 'Không tìm th?y tin v?i mã tin ' || p_MaTin);
    END;
END DemTongSoNgayDang;
/
--CH?Y--
DECLARE
    v_TongNgay NUMBER;
BEGIN
    DemTongSoNgayDang(1, v_TongNgay); -- Thay 1 b?ng mã tin c? th? c?a b?n
    DBMS_OUTPUT.PUT_LINE('T?ng s? ngày ??ng: ' || v_TongNgay);
END;
/
--------------------------------------------------------------
--TÌM KI?M TIN THEO TIÊU ??--
CREATE OR REPLACE PROCEDURE TimKiem_TinDang_Theo_TieuDe (
    p_TieuDe IN VARCHAR2
) IS
    v_MaTin TIN.MaTin%TYPE;
BEGIN
    -- Tìm ki?m tin ??ng t? b?ng TIN
    SELECT MaTin INTO v_MaTin
    FROM TIN
    WHERE TieuDe LIKE '%' || p_TieuDe || '%';

    DBMS_OUTPUT.PUT_LINE('Tìm th?y tin ??ng có tiêu ?? ch?a: ' || p_TieuDe || '. Mã tin: ' || v_MaTin);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20014, 'Không tìm th?y tin ??ng v?i tiêu ?? ch?a: ' || p_TieuDe);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20015, 'L?i: ' || SQLERRM);
END TimKiem_TinDang_Theo_TieuDe;
/
EXEC TimKiem_TinDang_Theo_TieuDe('Không bi?t');
EXEC TimKiem_TinDang_Theo_TieuDe('Không bi?t ghi sao');
--------------------------------------------------------------
--------------------------------------------------------------
-------------------------FUNCTION-----------------------------
--------------------------------------------------------------
--C?P NH?T L?I TIN T?C--
CREATE OR REPLACE FUNCTION CapNhatTin(
    p_MaTin IN NUMBER,
    p_TieuDe IN VARCHAR2,
    p_MoTa IN VARCHAR2,
    p_NgayDang IN DATE,
    p_DienTich IN NUMBER,
    p_HinhAnh IN VARCHAR2,
    p_TienThue IN NUMBER,
    p_TienCoc IN NUMBER,
    p_MaLoaiHinh IN NUMBER,
    p_MaTT IN NUMBER,
    p_MaTP IN NUMBER,
    p_MaQuan IN NUMBER,
    p_MaPhuong IN NUMBER
) RETURN NUMBER
IS
BEGIN
    UPDATE TIN
    SET TieuDe = p_TieuDe,
        MoTa = p_MoTa,
        NgayDang = p_NgayDang,
        DienTich = p_DienTich,
        HinhAnh = p_HinhAnh,
        TienThue = p_TienThue,
        TienCoc = p_TienCoc,
        MaLoaiHinh = p_MaLoaiHinh,
        MaTT = p_MaTT,
        MaTP = p_MaTP,
        MaQuan = p_MaQuan,
        MaPhuong = p_MaPhuong
    WHERE MaTin = p_MaTin;
    
    RETURN SQL%ROWCOUNT; -- Tr? v? s? l??ng dòng ?ã ???c c?p nh?t
END CapNhatTin;
/
--DECLARE
DECLARE
    v_SoDongCapNhat NUMBER;
BEGIN
    v_SoDongCapNhat := CapNhatTin(
        p_MaTin => 1,
        p_TieuDe => 'Tieu de moi',
        p_MoTa => 'Mo ta moi',
        p_NgayDang => SYSDATE,
        p_DienTich => 100,
        p_HinhAnh => 'new_image.jpg',
        p_TienThue => 2000000,
        p_TienCoc => 3000000,
        p_MaLoaiHinh => 2,
        p_MaTT => 1,
        p_MaTP => 3,
        p_MaQuan => 5,
        p_MaPhuong => 10
    );
    DBMS_OUTPUT.PUT_LINE('S? dòng ?ã ???c c?p nh?t: ' || v_SoDongCapNhat);
END;
/
--------------------------------------------------------------
CREATE OR REPLACE FUNCTION ThemTin(
    p_TieuDe IN VARCHAR2,
    p_MoTa IN VARCHAR2,
    p_NgayDang IN DATE,
    p_TrangThai IN NUMBER,
    p_DienTich IN NUMBER,
    p_HinhAnh IN VARCHAR2,
    p_TienThue IN NUMBER,
    p_TienCoc IN NUMBER,
    p_MaLoaiHinh IN NUMBER,
    p_MaTT IN NUMBER,
    p_MaTP IN NUMBER,
    p_MaQuan IN NUMBER,
    p_MaPhuong IN NUMBER
) RETURN NUMBER
IS
    v_MaTin NUMBER;
BEGIN
    -- T?o mã tin m?i
    SELECT NVL(MAX(MaTin), 0) + 1 INTO v_MaTin FROM TIN;

    -- Chèn d? li?u vào b?ng TIN
    INSERT INTO TIN (MaTin, TieuDe, MoTa, NgayDang, TrangThai, DienTich, HinhAnh, TienThue, TienCoc, MaLoaiHinh, MaTT, MaTP, MaQuan, MaPhuong)
    VALUES (v_MaTin, p_TieuDe, p_MoTa, p_NgayDang, p_TrangThai, p_DienTich, p_HinhAnh, p_TienThue, p_TienCoc, p_MaLoaiHinh, p_MaTT, p_MaTP, p_MaQuan, p_MaPhuong);

    -- Tr? v? mã tin m?i ???c chèn
    RETURN v_MaTin;
END ThemTin;
/
--EXECT
--DECLARE
DECLARE
    v_MaTinMoi NUMBER;
BEGIN
    v_MaTinMoi := ThemTin(
        p_TieuDe => 'Tiêu ?? m?i',
        p_MoTa => 'Mô t? m?i',
        p_NgayDang => SYSDATE,
        p_TrangThai => 1,
        p_DienTich => 120,
        p_HinhAnh => 'new_image.jpg',
        p_TienThue => 2500000,
        p_TienCoc => 3000000,
        p_MaLoaiHinh => 2,
        p_MaTT => 1,
        p_MaTP => 3,
        p_MaQuan => 5,
        p_MaPhuong => 10
    );
    DBMS_OUTPUT.PUT_LINE('Mã tin m?i ???c chèn: ' || v_MaTinMoi);
END;
/
--------------------------------------------------------------
--VI?T FUNCTION DELETE M?T B?NG GHI
CREATE OR REPLACE FUNCTION Xoa_Tin (
    p_MaTin IN NUMBER
)RETURN NUMBER 
IS
BEGIN
    -- Xóa tin ??ng t? b?ng TIN
    DELETE FROM TIN WHERE MaTin = p_MaTin;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tin ?ã ???c xóa thành công.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20016, 'Không tìm th?y tin ??ng có mã ' || p_MaTin);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20017, 'L?i: ' || SQLERRM);
END Xoa_Tin;
/
--DECLARE
DECLARE
    v_SoBanGhiDaXoa NUMBER;
BEGIN
    v_SoBanGhiDaXoa := Xoa_Tin(100); -- Thay 1 b?ng mã tin c? th? c?a b?n
    IF v_SoBanGhiDaXoa = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Không có b?n ghi nào ???c xóa.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('?ã xóa ' || v_SoBanGhiDaXoa || ' b?n ghi.');
    END IF;
END;
/
--------------------------------------------------------------
--VI?T FUNCTIO TÌM KI?M TIN THEO GIÁ
    
--VI?T FUNCTION ?? C?P NH?T 1 B?N GHI CHO TIN KHI NG??I DÙNG S?A L?I TIN ??NG--
CREATE OR REPLACE FUNCTION CapNhatTin(
    p_MaTin IN NUMBER,
    p_TieuDe IN VARCHAR2,
    p_MoTa IN VARCHAR2,
    p_NgayDang IN DATE,
    p_DienTich IN NUMBER,
    p_HinhAnh IN VARCHAR2,
    p_TienThue IN NUMBER,
    p_TienCoc IN NUMBER,
    p_MaLoaiHinh IN NUMBER,
    p_MaTT IN NUMBER,
    p_MaTP IN NUMBER,
    p_MaQuan IN NUMBER,
    p_MaPhuong IN NUMBER
) RETURN NUMBER
IS
BEGIN
    UPDATE TIN
    SET TieuDe = p_TieuDe,
        MoTa = p_MoTa,
        NgayDang = p_NgayDang,
        DienTich = p_DienTich,
        HinhAnh = p_HinhAnh,
        TienThue = p_TienThue,
        TienCoc = p_TienCoc,
        MaLoaiHinh = p_MaLoaiHinh,
        MaTT = p_MaTT,
        MaTP = p_MaTP,
        MaQuan = p_MaQuan,
        MaPhuong = p_MaPhuong
    WHERE MaTin = p_MaTin;
    
    RETURN SQL%ROWCOUNT; -- Tr? v? s? l??ng dòng ?ã ???c c?p nh?t
END CapNhatTin;
/
--------------------------------------------------------------
--------------------------------------------------------------
-------------------PH?N VI?T CÁC QUI ??NH---------------------
--------------------------------------------------------------

--M?i tin ??ng ph?i có m?t tiêu ??, mô t? và ??y ?? các tr??ng d? li?u.--
CREATE OR REPLACE TRIGGER KiemTra_TinDang
BEFORE INSERT OR UPDATE ON TIN
FOR EACH ROW
BEGIN
    IF :NEW.TieuDe IS NULL OR :NEW.MoTa IS NULL OR :NEW.NgayDang IS NULL OR
       :NEW.TrangThai IS NULL OR :NEW.DienTich IS NULL OR :NEW.HinhAnh IS NULL OR
       :NEW.TienThue IS NULL OR :NEW.TienCoc IS NULL OR :NEW.MaLoaiHinh IS NULL OR
       :NEW.MaTT IS NULL OR :NEW.MaTP IS NULL OR :NEW.MaQuan IS NULL OR
       :NEW.MaPhuong IS NULL THEN
       
        RAISE_APPLICATION_ERROR(-20001, 'Thông tin tin ??ng không ???c ?? tr?ng.');
    END IF;
END;
/

--M?t tin ??ng ph?i có ít nh?t 3 hình và nhi?u nh?t 12 hình.--
CREATE OR REPLACE TRIGGER Check_HinhAnh_TinDang
BEFORE INSERT OR UPDATE ON TIN
FOR EACH ROW
DECLARE
    v_HinhAnhCount NUMBER;
BEGIN
    -- ??m s? l??ng hình ?nh trong tin ??ng
    SELECT COUNT(*) INTO v_HinhAnhCount FROM TIN WHERE MaTin = :NEW.MaTin;
    
    -- Ki?m tra s? l??ng hình ?nh
    IF v_HinhAnhCount < 3 OR v_HinhAnhCount > 12 THEN
        RAISE_APPLICATION_ERROR(-20002, 'M?i tin ??ng ph?i có ít nh?t 3 hình và nhi?u nh?t 12 hình.');
    END IF;
END;
/

--M?i ng??i dùng ph?i có m?t tài kho?n duy nh?t ???c ??ng ký b?ng s? ?i?n tho?i.--
CREATE OR REPLACE TRIGGER KiemTraTaiKhoan
BEFORE INSERT OR UPDATE ON QUANTRIVIEN
FOR EACH ROW
DECLARE
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count FROM QUANTRIVIEN WHERE SDT = :NEW.SDT;
    IF v_Count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, ' M?i ng??i dùng ph?i có m?t tài kho?n duy nh?t ???c ??ng ký b?ng s? ?i?n tho?i ');
    END IF;
END;
/


--Khi ng??i dùng ??ng nh?p thì m?c ??nh CHUCVU b?ng 4--
CREATE OR REPLACE TRIGGER Set_MacDinh_ChucVu
BEFORE INSERT ON CHUCVU
FOR EACH ROW
BEGIN
    :NEW.MaCV := 4; -- M?c ??nh CHUCVU b?ng 4 khi ng??i dùng ??ng nh?p
END;
/

--??m b?o r?ng tr??ng "SoTien" trong b?ng "LICHSUGD" ph?i có giá tr? không âm--
CREATE OR REPLACE TRIGGER Trg_KiemTraSoTien
BEFORE INSERT OR UPDATE ON LICHSUGD
FOR EACH ROW
BEGIN
    -- Ki?m tra giá tr? c?a tr??ng SoTien không âm
    IF :NEW.SoTien < 0 THEN
        RAISE_APPLICATION_ERROR(-20002, Giá tr? c?a s? ti?n ph?i l?n h?n b?ng 0');
    END IF;
END;
/

--Khi ng??i dùng ??ng nh?p s? t? sinh ra MaTT ? b?ng VITIEN v?i c?t TongTien = 0.--
CREATE OR REPLACE TRIGGER TuDong_TaoVi_MaTT
BEFORE INSERT ON VITIEN
FOR EACH ROW
BEGIN
    SELECT NVL(MAX(MaTT), 0) + 1 INTO :NEW.MaTT FROM VITIEN;
    :NEW.TongTien := 0; -- Thi?t l?p TongTien m?c ??nh là 0
END;
/

--Xóa tin ??ng khi nó ?ã t?n t?i 30 ngày.--
CREATE OR REPLACE TRIGGER DeleteExpiredPostsTrigger
BEFORE INSERT OR UPDATE ON TIN
FOR EACH ROW
BEGIN
    -- Ki?m tra n?u ngày ??ng c?a tin ??ng m?i làm cho nó ?ã t?n t?i trong vòng 30 ngày
    IF :NEW.NgayDang <= SYSDATE - 30 THEN
        -- Xóa tin ??ng ?ã t?n t?i trong vòng 30 ngày
        DELETE FROM TIN
        WHERE MaTin = :NEW.MaTin;
    END IF;
END;
/

--PROCEDURE--
--Khi tìm ki?m lo?i hình b?t ??ng s?n nào ?ó s? xu?t ra các k?t qu? t??ng t? v?i MaLoaiHinh--
CREATE OR REPLACE PROCEDURE TimKiemLoaiHinh(
    p_MaLoaiHinh IN NUMBER
) AS
BEGIN
    -- Tìm ki?m các tin ??ng có cùng MaLoaiHinh
    FOR tin IN (SELECT * FROM TIN WHERE MaLoaiHinh = p_MaLoaiHinh) LOOP
        -- In ra thông tin c?a các tin ??ng t??ng ?ng
        DBMS_OUTPUT.PUT_LINE('MaTin: ' || tin.MaTin || ', TieuDe: ' || tin.TieuDe || ', MoTa: ' || tin.MoTa);
        -- Thêm các tr??ng thông tin khác n?u c?n
    END LOOP;
END TimKiemLoaiHinh;
/

--K?t qu? tìm ki?m ph?i ???c s?p x?p theo m?t th? t? nh?t ??nh, ch?ng h?n nh? theo th?i gian ??ng m?i nh?t.--
CREATE OR REPLACE PROCEDURE TimKiemVaSapXep(
    p_MaLoaiHinh IN NUMBER
) AS
BEGIN
    -- Tìm ki?m và s?p x?p các tin ??ng theo th?i gian ??ng m?i nh?t
    FOR tin IN (
        SELECT * 
        FROM TIN 
        WHERE MaLoaiHinh = p_MaLoaiHinh 
        ORDER BY NgayDang DESC -- S?p x?p theo th?i gian ??ng m?i nh?t
    ) LOOP
        -- In ra thông tin c?a các tin ??ng t??ng ?ng
        DBMS_OUTPUT.PUT_LINE('MaTin: ' || tin.MaTin || ', TieuDe: ' || tin.TieuDe || ', MoTa: ' || tin.MoTa);
        -- Thêm các tr??ng thông tin khác n?u c?n
    END LOOP;
END TimKiemVaSapXep;
/

--Khi ng??i dùng ??ng tin thành công thì b?ng VITIEN s? t? ??ng tr? ?i 3000--
CREATE OR REPLACE PROCEDURE DangTinTuDongTru (
    p_UserPhoneNumber IN VARCHAR2
) IS
    v_UserTTID NUMBER;
BEGIN
    -- L?y mã s? tài kho?n c?a ng??i dùng t? b?ng KHACHHANG
    SELECT MaTT INTO v_UserTTID FROM KHACHHANG WHERE SDT = p_UserPhoneNumber;
    -- Tr? 3000 t? c?t TongTien
    UPDATE VITIEN
    SET TongTien = TongTien - 3000
    WHERE MaTT = v_UserTTID;
    -- Commit các thay ??i
    COMMIT;
    -- In ra thông báo tr? ti?n thành công
    DBMS_OUTPUT.PUT_LINE('?ã tr? 3000 t? tài kho?n c?a ng??i dùng có s? ?i?n tho?i ' || p_UserPhoneNumber);
END DeductBalanceOnPosting;
/







