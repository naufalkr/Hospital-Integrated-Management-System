create database if not exists db22;

use db22;
    create table matapelajaran
    (
        mapel_id     int auto_increment
            primary key,
        mapel        varchar(255) null,
        kelas        varchar(20)  null,
        pdfs         mediumblob   null,
        videos       varchar(255) null,
        latihan_soal mediumblob   null
    );

    create table pasien
    (
		id     int,
        NIK varchar(100) primary key,
        password varchar(100) not null,
        email    varchar(100) not null,
        usertype varchar(20)  null,
        nama_pasien varchar(100) not null,
        alamat    varchar(100) not null,
        no_telepon_pasien varchar(100) not null,
        jenis_kelamin varchar(100) not null
    );
    
    CREATE TABLE Rumah_Sakit (
        rumahsakit_id INT PRIMARY KEY,
        nama_rumahsakit VARCHAR(100),
        alamat VARCHAR(255),
        no_telepon VARCHAR(15),
        kota VARCHAR(100)
	);


    create table tenaga_medis
    (
        id     int,
        tenagamedis_id INT primary key,
        rumahsakit_id INT,
        password varchar(100) not null,
        email    varchar(100) not null,
        usertype varchar(20)  null,
        nama_tenagamedis varchar(100) not null,
        spesialisasi    varchar(100) not null,
        jenis_Kelamin varchar(100) not null,
        no_telepon_tenagamedis varchar(100) not null,
        FOREIGN KEY (rumahsakit_id) REFERENCES rumah_sakit(rumahsakit_id)
    );

    

    CREATE TABLE riwayat (
        riwayat_id INT PRIMARY KEY,
        NIK VARCHAR(10),
        rumahsakit_id INT,
        tenagamedis_id INT,
        tanggal_riwayat DATE,
        jenis_layanan VARCHAR(100),
        keterangan_penyakit VARCHAR(255),
        FOREIGN KEY (NIK) REFERENCES pasien(NIK),
        FOREIGN KEY (rumahsakit_id) REFERENCES rumah_sakit(rumahsakit_id),
        FOREIGN KEY (tenagamedis_id) REFERENCES tenaga_medis(tenagamedis_id)
    );

    -- Tabel obat
    CREATE TABLE obat (
        obat_id INT PRIMARY KEY,
        nama_obat VARCHAR(100),
        deskripsi VARCHAR(255)
    );

--     -- Buat tabel email_log
--     CREATE TABLE email_log (
--         log_id INT AUTO_INCREMENT PRIMARY KEY,
--         nik_pasien VARCHAR(10),
--         riwayat_id INT,
--         email VARCHAR(100),
--         pesan TEXT,
--         waktu_kirim TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--         FOREIGN KEY (nik_pasien) REFERENCES pasien(nik_pasien),
--         FOREIGN KEY (riwayat_id) REFERENCES riwayat(riwayat_id)
--     );


--     Insert data into pasien
-- INSERT INTO pasien (nik, password, nama_pasien, alamat, no_telepon_pasien, email, jenis_kelamin)
-- VALUES
--     ('1234567890', 'password123', 'John Doe', 'Jl. Pahlawan No. 123', '081234567890', 'john.doe@example.com', 'Laki-laki'),
--     ('2345678901', 'password456', 'Jane Smith', 'Jl. Merdeka No. 456', '081345678901', 'jane.smith@example.com', 'Perempuan'),
--     ('3456789012', 'password789', 'Michael Johnson', 'Jl. Maju Jaya No. 789', '081456789012', 'michael.johnson@example.com', 'Laki-laki'),
    
-- -- Insert data into rumah_sakit
-- INSERT INTO rumah_sakit (rumahsakit_id, nama_rumahsakit, alamat, no_telepon, kota)
-- VALUES
--     (1, 'RS Aman Sentosa', 'Jl. Bahagia No. 123', '021-1234567', 'Jakarta'),
--     (2, 'RS Sejahtera Bersama', 'Jl. Damai No. 456', '022-2345678', 'Bandung'),
--     (3, 'RS Cemerlang Mandiri', 'Jl. Maju No. 789', '031-3456789', 'Surabaya'),
--     (4, 'RS Jaya Abadi', 'Jl. Kencana No. 1011', '0341-4567890', 'Malang'),
--     (5, 'RS Bahagia Indah', 'Jl. Makmur No. 1213', '0361-5678901', 'Denpasar');

-- INSERT INTO tenaga_medis (tenagamedis_id, password, rumahsakit_id, nama_tenagamedis, spesialisasi, jenis_kelamin, no_telepon_tenagamedis)
-- VALUES
--     (1, 'password123', 1, 'Dr. Alex Johnson', 'Dokter Umum', 'Laki-laki', '081234567890'),
--     (2, 'password456', 1, 'Dr. Emily White', 'Dokter Gigi', 'Perempuan', '081345678901'),
--     (3, 'password789', 2, 'Dr. Michael Brown', 'Dokter Anak', 'Laki-laki', '081456789012'),
--     (4, 'password321', 3, 'Dr. Jessica Lee', 'Dokter Bedah', 'Perempuan', '081567890123'),
--     (5, 'password654', 4, 'Dr. David Martinez', 'Dokter Mata', 'Laki-laki', '081678901234');

-- Insert data into riwayat
-- INSERT INTO riwayat (riwayat_id, NIK, rumahsakit_id, tenagamedis_id, tanggal_riwayat, jenis_layanan, keterangan_penyakit)
-- VALUES
--     (828332, '1234567890', 1, 1, '2024-04-30', 'Pemeriksaan Umum', 'Demam dan Flu'),
--     (289121, '2345678901', 2, 3, '2024-04-29', 'Pemeriksaan Gigi', 'Caries gigi'),
--     (289219, '3456789012', 3, 4, '2024-04-28', 'Operasi', 'Appendicitis'),
--     (289212, '4567890123', 4, 5, '2024-04-27', 'Pemeriksaan Mata', 'Rabun jauh'),
--     (696969, '5678901234', 5, 2, '2024-04-26', 'Pemeriksaan Anak', 'Batuk dan pilek');

-- Insert data into obat
-- INSERT INTO obat (obat_id, nama_obat, deskripsi)
-- VALUES
--     (1, 'Paracetamol', 'Obat penurun demam dan pereda nyeri'),
--     (2, 'Amoxicillin', 'Antibiotik untuk infeksi bakteri'),
--     (3, 'Ibuprofen', 'Obat pereda nyeri dan peradangan'),
--     (4, 'Dexamethasone', 'Obat antiinflamasi steroid'),
--     (5, 'Loratadine', 'Obat antihistamin untuk alergi');


--     CREATE TABLE Tenaga_Medis (
--     TenagaMedis_ID INT PRIMARY KEY,
--     RumahSakit_ID INT,
--     Nama_TenagaMedis VARCHAR(100),
--     Spesialisasi VARCHAR(100),
--     Jenis_Kelamin ENUM('Laki-laki', 'Perempuan'),
--     No_Telepon_TenagaMedis VARCHAR(15),
--     FOREIGN KEY (RumahSakit_ID) REFERENCES Rumah_Sakit(RumahSakit_ID)
-- );
--     CREATE TABLE Pasien (
--         NIK_Pasien VARCHAR(10) PRIMARY KEY,
--         Nama_Pasien VARCHAR(100),
--         Tanggal_Lahir DATE,
--         Alamat VARCHAR(255),
--         No_Telepon_Pasien VARCHAR(15),
--         Email VARCHAR(100),
--         Jenis_Kelamin ENUM('Laki-laki', 'Perempuan')
--     );

-- Insert data ke dalam tabel pasien
INSERT INTO pasien (NIK, password, email, usertype, nama_pasien, alamat, no_telepon_pasien, jenis_kelamin) 
VALUES 
('1234567890', 'password123', 'pasien1@example.com', 'pasien', 'John Doe', 'Alamat Pasien 1', '081234567890', 'Laki-laki'),
('2345678901', 'password456', 'pasien2@example.com', 'pasien', 'Jane Smith', 'Alamat Pasien 2', '082345678901', 'Perempuan'),
('3456789012', 'password789', 'pasien3@example.com', 'pasien', 'Michael Johnson', 'Alamat Pasien 3', '083456789012', 'Laki-laki'),
('4567890123', 'passwordabc', 'pasien4@example.com', 'pasien', 'Emily Brown', 'Alamat Pasien 4', '084567890123', 'Perempuan'),
('5678901234', 'passworddef', 'pasien5@example.com', 'pasien', 'Jessica Davis', 'Alamat Pasien 5', '085678901234', 'Perempuan');

-- Insert data ke dalam tabel Rumah_Sakit
INSERT INTO Rumah_Sakit (rumahsakit_id, nama_rumahsakit, alamat, no_telepon, kota) 
VALUES 
(1, 'RS A', 'Alamat RS A', '123456789', 'Kota A'),
(2, 'RS B', 'Alamat RS B', '234567890', 'Kota B'),
(3, 'RS C', 'Alamat RS C', '345678901', 'Kota C'),
(4, 'RS D', 'Alamat RS D', '456789012', 'Kota D'),
(5, 'RS E', 'Alamat RS E', '567890123', 'Kota E');

-- Insert data ke dalam tabel tenaga_medis
INSERT INTO tenaga_medis (tenagamedis_id, rumahsakit_id, password, email, usertype, nama_tenagamedis, spesialisasi, jenis_Kelamin, no_telepon_tenagamedis) 
VALUES 
(101, 1, 'passmed123', 'medis1@example.com', 'tenaga medis', 'Dr. Johnson', 'Spesialis 1', 'Laki-laki', '081011223344'),
(102, 2, 'passmed456', 'medis2@example.com', 'tenaga medis', 'Dr. Smith', 'Spesialis 2', 'Perempuan', '082122334455'),
(103, 3, 'passmed789', 'medis3@example.com', 'tenaga medis', 'Dr. Brown', 'Spesialis 3', 'Laki-laki', '083233445566'),
(104, 4, 'passmedabc', 'medis4@example.com', 'tenaga medis', 'Dr. Davis', 'Spesialis 4', 'Perempuan', '084344556677'),
(105, 5, 'passmeddef', 'medis5@example.com', 'tenaga medis', 'Dr. Lee', 'Spesialis 5', 'Laki-laki', '085455667788');

-- Insert data ke dalam tabel riwayat
INSERT INTO riwayat (riwayat_id, NIK, rumahsakit_id, tenagamedis_id, tanggal_riwayat, jenis_layanan, keterangan_penyakit) 
VALUES 
(1, '1234567890', 1, 101, '2024-05-01', 'Rawat Inap', 'Flu'),
(2, '2345678901', 2, 102, '2024-05-02', 'Pemeriksaan', 'Demam'),
(3, '3456789012', 3, 103, '2024-05-03', 'Operasi', 'Patah tulang'),
(4, '4567890123', 4, 104, '2024-05-04', 'Pemeriksaan', 'Sakit perut'),
(5, '5678901234', 5, 105, '2024-05-05', 'Rawat Inap', 'Luka bakar');

-- Insert data ke dalam tabel obat
INSERT INTO obat (obat_id, nama_obat, deskripsi) 
VALUES 
(1, 'Paracetamol', 'Obat penurun demam dan pereda nyeri'),
(2, 'Amoxicillin', 'Antibiotik untuk infeksi bakteri'),
(3, 'Ibuprofen', 'Obat antiinflamasi nonsteroid'),
(4, 'Omeprazole', 'Obat untuk masalah pencernaan'),
(5, 'Diazepam', 'Obat penenang dan antikecemasan');

-- DELETE FROM pasien; 

SELECT * FROM pasien;
SELECT * FROM tenaga_medis;

