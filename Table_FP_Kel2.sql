CREATE TABLE jabatan (
    jabatan_id CHAR(5) PRIMARY KEY,
    jabatan_nama VARCHAR(60) NOT NULL
);

CREATE TABLE users (
    users_id CHAR(10) NOT NULL PRIMARY KEY,
    users_jabatan_id CHAR(5) NOT NULL,
    users_nama VARCHAR(50) NOT NULL,
    users_departemen VARCHAR(40),
    users_fakultas VARCHAR(20),
    users_noTelp VARCHAR(20) NOT NULL,
    users_email VARCHAR(50) NOT NULL,
    FOREIGN KEY (users_jabatan_id) REFERENCES jabatan (jabatan_id)
);

CREATE TABLE peminjaman (
    P_id CHAR(4) NOT NULL PRIMARY KEY,
    P_users_id CHAR(10) NOT NULL,
    P_namaOrganisasi VARCHAR(30),
    P_tgl DATE NOT NULL,
    P_waktuMulai TIMESTAMP NOT NULL,
    P_waktuSelesai TIMESTAMP NOT NULL,
    P_rutinitas VARCHAR(35),
    P_banyakRuangan INT NOT NULL,
    P_status VARCHAR(20),
    FOREIGN KEY (P_users_id) REFERENCES users (users_id)
);

CREATE TABLE kategori_kegiatan (
    kategori_id CHAR(5) NOT NULL PRIMARY KEY,
    kategori_nama VARCHAR(40) NOT NULL
);

CREATE TABLE Kegiatan (
    K_id CHAR(6) NOT NULL PRIMARY KEY,
    K_P_id CHAR(4) NOT NULL,
    K_kategori_id CHAR(5) NOT NULL,
    K_nama VARCHAR(35) NOT NULL,
    K_deskripsiKegiatan VARCHAR(200) NOT NULL,
    K_img VARCHAR(200),
    FOREIGN KEY (K_P_id) REFERENCES peminjaman (P_id),
    FOREIGN KEY (K_kategori_id) REFERENCES kategori_kegiatan (kategori_id)
);

CREATE TABLE instansi (
    instansi_id CHAR(6) NOT NULL PRIMARY KEY,
    instansi_name VARCHAR(60) NOT NULL,
    instansi_email VARCHAR(50) NOT NULL,
    instansi_telp  VARCHAR(50) NOT NULL
);

CREATE TABLE myAdmin (
    myAdmin_id CHAR(6) NOT NULL PRIMARY KEY,
    myAdmin_jabatan_id CHAR(5) NOT NULL,
    myAdmin_instansi_id CHAR(6) NOT NULL,
    myAdmin_nama VARCHAR(50) NOT NULL,
    myAdmin_email VARCHAR(50) NOT NULL,
    myAdmin_password VARCHAR(50) NOT NULL,
    FOREIGN KEY (myAdmin_jabatan_id) REFERENCES jabatan (jabatan_id),
    FOREIGN KEY (myAdmin_instansi_id) REFERENCES instansi (instansi_id)
);

CREATE TABLE jenis_ruangan (
    jenis_id CHAR(5) NOT NULL PRIMARY KEY,
    jenis_nama VARCHAR(50) NOT NULL
);

CREATE TABLE ruangan (
    ruangan_id VARCHAR(13) NOT NULL PRIMARY KEY,
    ruangan_jenis_id CHAR(5) NOT NULL,
    ruangan_myAdmin_id CHAR(6) NOT NULL,
    ruangan_instansi_id CHAR(6) NOT NULL,
    ruangan_nama VARCHAR(100) NOT NULL,
    ruangan_img VARCHAR(200),
    ruangan_status VARCHAR(200),
    FOREIGN KEY (ruangan_jenis_id) REFERENCES jenis_ruangan (jenis_id),
    FOREIGN KEY (ruangan_myAdmin_id) REFERENCES myAdmin (myAdmin_id),
    FOREIGN KEY (ruangan_instansi_id) REFERENCES instansi (instansi_id)
);

CREATE TABLE detail_peminjaman (
    DP_P_id CHAR(4) NOT NULL,
    DP_ruangan_id VARCHAR(11) NOT NULL,
    FOREIGN KEY (DP_P_id) REFERENCES peminjaman (P_id),
    FOREIGN KEY (DP_ruangan_id) REFERENCES ruangan (ruangan_id)
);
