-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 26, 2025 at 06:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `anggota_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`anggota_id`, `user_id`, `nama`, `alamat`, `email`, `no_telp`) VALUES
(1, 1, 'Budi', 'Depok', 'Budi@gmail.com', '081274856473'),
(2, 2, 'Rina', 'Depok', 'Rina@gmail.com', '081274856423');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `buku_id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `penerbit` varchar(100) DEFAULT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `jumlah_stok` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`buku_id`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `kategori`, `jumlah_stok`) VALUES
(1, 'Matahariku', 'Budi Antoro', 'PT Sanjaya Books', '2025', 'Fiksi', 100),
(2, 'Bulan Terang', 'Sasa Numangsa', 'PT Sanjaya Books', '2025', 'Fiksi', 100),
(3, 'Mengerti Koding NIh', 'Rudi Swag', 'PT Sanjaya Books', '2025', 'Pendidikan', 100);

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `detail_id` int(11) NOT NULL,
  `peminjaman_id` int(11) NOT NULL,
  `buku_id` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`detail_id`, `peminjaman_id`, `buku_id`, `jumlah`) VALUES
(1, 1, 1, 10),
(2, 2, 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `pegawai_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`pegawai_id`, `user_id`, `nama`, `email`, `no_telp`) VALUES
(1, 1, 'Andi', 'Andi@gmail.com', '081783843904'),
(2, 2, 'Rina', 'Rina@gmail.com', '081736485093');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `peminjaman_id` int(11) NOT NULL,
  `anggota_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status` enum('dipinjam','dikembalikan','terlambat') DEFAULT 'dipinjam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`peminjaman_id`, `anggota_id`, `pegawai_id`, `tanggal_pinjam`, `tanggal_kembali`, `status`) VALUES
(1, 1, 1, '2025-12-21', '2025-12-21', 'dikembalikan'),
(2, 2, 2, '2025-12-23', '2025-12-24', 'dipinjam'),
(3, 3, 3, '2025-12-10', '2025-12-11', 'dikembalikan'),
(4, 4, 4, '2025-06-22', '2025-06-29', 'dikembalikan'),
(5, 5, 5, '2025-06-15', '2025-06-16', 'dikembalikan'),
(6, 6, 6, '2025-06-24', '2025-06-25', 'dipinjam'),
(7, 7, 7, '2025-06-01', '2025-06-02', 'dipinjam'),
(8, 8, 8, '2025-06-01', '2025-06-02', 'dikembalikan');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `pengembalian_id` int(11) NOT NULL,
  `peminjaman_id` int(11) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `denda` decimal(10,2) DEFAULT 0.00,
  `nama_pembayar` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`pengembalian_id`, `peminjaman_id`, `tanggal_pengembalian`, `denda`, `nama_pembayar`) VALUES
(1, 1, '2025-06-23', 0.00, NULL),
(2, 2, '2025-06-24', 0.00, NULL),
(3, 3, '2025-06-25', 0.00, NULL),
(4, 4, '2025-07-06', 0.00, NULL),
(5, 5, '2025-06-25', 0.00, NULL),
(8, 8, '2025-07-23', 0.00, 'Budi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','pegawai','anggota') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `created_at`) VALUES
(3, 'Andi', '2fd80a9d935c1dbd59cd5bc9f0ff262a03890e8555ad8bf0e9ecf6224674b1c0', 'anggota', '2025-06-15 10:38:04'),
(4, 'Ali', 'f5ffdd23ce9f2885077809a5c0b91e405df2ef5f09388124460c114be7631b04', 'anggota', '2025-06-15 11:04:27'),
(5, 'Lisa', 'fdb9a7fa4c0d6437c47a7dc17cf6d9fd0b866815ae44c65e7b897e6cd7a14d67', 'anggota', '2025-06-15 14:36:40'),
(6, 'Rudi', '3a0c6bbd78612479787da4f255362492db7798aae12aafb4f8259aa778ee87cc', 'anggota', '2025-06-21 12:05:30'),
(7, 'admin', '9879aa2d942c756be05808ccdf806d428bbe585192388f40437f6605a5c02dfd', 'admin', '2025-06-23 09:24:43'),
(8, 'anggota', '51c896806890118c47435af532e3f616c62560f69f84ad2bfe7cc225419318c2', 'anggota', '2025-06-23 11:43:01'),
(9, 'pegawai', '3483867409fabed58c585c2783d39beb2fe8bde974ed5c3b0dfdc26ac5ee8b74', 'pegawai', '2025-06-23 12:39:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`anggota_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`buku_id`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `peminjaman_id` (`peminjaman_id`),
  ADD KEY `buku_id` (`buku_id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`pegawai_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`peminjaman_id`),
  ADD KEY `anggota_id` (`anggota_id`),
  ADD KEY `pegawai_id` (`pegawai_id`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`pengembalian_id`),
  ADD KEY `peminjaman_id` (`peminjaman_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `anggota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `buku_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `pegawai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `peminjaman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `pengembalian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD CONSTRAINT `detail_peminjaman_ibfk_1` FOREIGN KEY (`peminjaman_id`) REFERENCES `peminjaman` (`peminjaman_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_peminjaman_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`buku_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
