USE saham_indonesia;
SHOW TABLES;
DESC sektorTeknologi;
DROP TABLE sektorTeknologi;

CREATE TABLE sektorTeknologi(
	id INT NOT NULL AUTO_INCREMENT,
	kodeSaham VARCHAR(4) NOT NULL,
    namaEmiten VARCHAR(100),
    tglListing VARCHAR(100),
    jumlahSaham BIGINT,
    papanBursa VARCHAR(20),
    PRIMARY KEY (id)
) ENGINE = InnoDB;

-- Menambahkan data
INSERT INTO sektorTeknologi(kodeSaham, namaEmiten, tglListing, jumlahSaham, papanBursa) VALUES
('ATIC',	    'Anabatic Technologies Tbk.',     '2015 Jul 08',	      2315361355,	'Utama'),
('BUKA',	    'Bukalapak.com Tbk.',     '2021 Aug 06',	    103062019354,	'Pengembangan'),
('CASH',	    'Cashlez Worldwide Indonesia Tbk.',     '2020 May 04',	      1431125517,	'Akselerasi'),
('DCII',	    'DCI Indonesia Tbk.',     '2021 Jan 06',	      2383745900,	'Pengembangan'),
('DIVA',	    'Distribusi Voucher Nusantara Tbk.',     '2018 Nov 27',	      1428571400,	'Pengembangan'),
('DMMX',	    'Digital Mediatama Maxima Tbk.',     '2019 Oct 21',	      7692307700,	'Pengembangan'),
('EDGE',	    'Indointernet Tbk.',     '2021 Feb 08',	       404050000,	'Pengembangan'),
('EMTK',	    'Elang Mahkota Teknologi Tbk.',     '2010 Jan 12',	     61241751483,	'Utama'),
('ENVY',	    'Envy Technologies Indonesia Tbk.',     '2019 Jul 08',	      1800000000,	'Pengembangan'),
('GLVA',	    'Galva Technologies Tbk.',     '2019 Dec 23',	      1500000000,	'Pengembangan'),
('HDIT',	    'Hensel Davest Indonesia Tbk.',     '2019 Jul 12',	      1524680000,	'Utama'),
('KIOS',	    'Kioson Komersial Indonesia Tbk.',     '2017 Oct 05',	       717239900,	'Pengembangan'),
('KREN',	    'Kresna Graha Investama Tbk.',     '2002 Jun 28',	     18208470100,	'Utama'),
('LMAS',	    'Limas Indonesia Makmur Tbk.',     '2001 Dec 28',	       787851525,	'Pengembangan'),
('LUCK',	    'Sentral Mitra Informatika Tbk.',     '2018 Nov 28',	       715749640,	'Pengembangan'),
('MCAS',	    'M Cash Integrasi Tbk.',     '2017 Nov 01',	       867933300,	'Pengembangan'),
('MLPT',	    'Multipolar Technology Tbk.',     '2013 Jul 08',	      1875000000,	'Utama'),
('MTDL',	    'Metrodata Electronics Tbk.',     '1990 Apr 09',	     12276884585,	'Utama'),
('NFCX',	    'NFC Indonesia Tbk.',     '2018 Jul 12',	       666667500,	'Pengembangan'),
('PGJO',	    'Tourindo Guide Indonesia Tbk.',     '2020 Jan 08',	       723859095,	'Akselerasi'),
('PTSN',	    'Sat Nusapersada Tbk',     '2007 Nov 08',	      5314344000,	'Utama'),
('RUNS',	    'Global Sukses Solusi Tbk.',     '2021 Sep 08',	       983557875,	'Akselerasi'),
('SKYB',	    'Northcliff Citranusa Indonesia Tbk.',     '2010 Jul 07',	       585000000,	'PENGEMBANGAN'),
('TECH',	    'Indosterling Technomedia Tbk.',     '2020 Jun 04',	      1256300000,	'Pengembangan'),
('TFAS',	    'Telefast Indonesia Tbk.',     '2019 Sep 17',	      1666666500,	'Pengembangan'),
('UVCR',	    'Trimegah Karya Pratama Tbk.',     '2021 Jul 27',	      2000072603,	'Akselerasi'),
('WGSH',	    'Wira Global Solusi Tbk.',     '2021 Dec 06',	      1042500000,	'Akselerasi'),
('ZYRX',	    'Zyrexindo Mandiri Buana Tbk.',     '2021 Mar 30',	      1333333300,	'Pengembangan');

-- Tambah kolom
ALTER TABLE sektorTeknologi
ADD COLUMN kode_sektor VARCHAR(10) AFTER id;
ALTER TABLE sektorTeknologi
ADD COLUMN sektor_usaha VARCHAR(100) AFTER kode_sektor;

-- Membuat foreign key
ALTER TABLE sektorTeknologi
	ADD CONSTRAINT fk_kode_sektor_teknologi
		FOREIGN KEY (kode_sektor) REFERENCES daftar_sektor (kode_sektor);

-- Memasukkan data foreign key --> kode ekskul
UPDATE sektorTeknologi SET kode_sektor = 'IDX:I' WHERE id < 30;
UPDATE sektorTeknologi SET sektor_usaha = 'Teknologi' WHERE kode_sektor = 'IDX:I'; -- Data akan direplace semua karena foreign key sama



SELECT * FROM sektorTeknologi; -- Menampilkan kolom beserta isinya
TRUNCATE sektorTeknologi; -- Menghapus seluruh data yang sudah ada didalam kolom
DESCRIBE sektorTeknologi; -- Menampilkan pengaturan tabel