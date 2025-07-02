-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jul 2025 pada 06.47
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `k_means`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_mapel`
--

CREATE TABLE `data_mapel` (
  `id` int(11) NOT NULL,
  `mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `data_mapel`
--

INSERT INTO `data_mapel` (`id`, `mapel`) VALUES
(54, 'Agama'),
(55, 'PKN'),
(56, 'B. Indonesia'),
(57, 'Matematika'),
(58, 'PJOK'),
(59, 'Seni Budaya'),
(60, 'TTB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_nilai`
--

CREATE TABLE `data_nilai` (
  `id` int(10) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `nilai` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_nilai`
--

INSERT INTO `data_nilai` (`id`, `siswa_id`, `mapel_id`, `nilai`) VALUES
(24, 42, 54, '90'),
(25, 42, 55, '85'),
(26, 42, 56, '88'),
(27, 42, 57, '83'),
(28, 42, 58, '91'),
(29, 42, 59, '85'),
(30, 42, 60, '85'),
(31, 43, 54, '95'),
(32, 43, 55, '90'),
(33, 43, 56, '90'),
(34, 43, 57, '86'),
(35, 43, 58, '91'),
(36, 43, 59, '88'),
(37, 43, 60, '90'),
(38, 59, 54, '81'),
(39, 59, 55, '83'),
(40, 59, 56, '83'),
(41, 59, 57, '84'),
(42, 59, 58, '88.2'),
(43, 59, 59, '79'),
(44, 59, 60, '76'),
(45, 47, 54, '84'),
(46, 47, 55, '80'),
(47, 47, 56, '80'),
(48, 47, 57, '78'),
(49, 47, 58, '85'),
(50, 47, 59, '80'),
(51, 47, 60, '79'),
(52, 44, 54, '90'),
(53, 44, 55, '92'),
(54, 44, 56, '92'),
(55, 44, 57, '89'),
(56, 44, 58, '90'),
(57, 44, 59, '87'),
(58, 44, 60, '88'),
(59, 61, 54, '79'),
(60, 61, 55, '75'),
(61, 61, 56, '76'),
(62, 61, 57, '75'),
(63, 61, 58, '90'),
(64, 61, 59, '75'),
(65, 61, 60, '72'),
(66, 62, 54, '81'),
(67, 62, 55, '85'),
(68, 62, 56, '85'),
(69, 62, 57, '86'),
(70, 62, 58, '90'),
(71, 62, 59, '77'),
(72, 62, 60, '77'),
(73, 45, 54, '90'),
(74, 45, 55, '85'),
(75, 45, 56, '85'),
(76, 45, 57, '83'),
(77, 45, 58, '88'),
(78, 45, 59, '90'),
(79, 45, 60, '80'),
(80, 46, 54, '86'),
(81, 46, 55, '85'),
(82, 46, 56, '80'),
(83, 46, 57, '80'),
(84, 46, 58, '90'),
(85, 46, 59, '80'),
(86, 46, 60, '80'),
(87, 63, 54, '83'),
(88, 63, 55, '79'),
(89, 63, 56, '84'),
(90, 63, 57, '84'),
(91, 63, 58, '90.4'),
(92, 63, 59, '77'),
(93, 63, 60, '78'),
(94, 48, 54, '88'),
(95, 48, 55, '85'),
(96, 48, 56, '86'),
(97, 48, 57, '80'),
(98, 48, 58, '90'),
(99, 48, 59, '85'),
(100, 48, 60, '80'),
(101, 49, 54, '84'),
(102, 49, 55, '84'),
(103, 49, 56, '82'),
(104, 49, 57, '76'),
(105, 49, 58, '92'),
(106, 49, 59, '80'),
(107, 49, 60, '80'),
(108, 50, 54, '90'),
(109, 50, 55, '90'),
(110, 50, 56, '90'),
(111, 50, 57, '86'),
(112, 50, 58, '91'),
(113, 50, 59, '88'),
(114, 50, 60, '85'),
(115, 64, 54, '83'),
(116, 64, 55, '86'),
(117, 64, 56, '87'),
(118, 64, 57, '88'),
(119, 64, 58, '91'),
(120, 64, 59, '83'),
(121, 64, 60, '79'),
(122, 65, 54, '89'),
(123, 65, 55, '88'),
(124, 65, 56, '92'),
(125, 65, 57, '87'),
(126, 65, 58, '90.8'),
(127, 65, 59, '95'),
(128, 65, 60, '85'),
(129, 66, 54, '91'),
(130, 66, 55, '90'),
(131, 66, 56, '94'),
(132, 66, 57, '95'),
(133, 66, 58, '91.6'),
(134, 66, 59, '84'),
(135, 66, 60, '84'),
(136, 76, 54, '80'),
(137, 76, 55, '85'),
(138, 76, 56, '82'),
(139, 76, 57, '83'),
(140, 76, 58, '90'),
(141, 76, 59, '77'),
(142, 76, 60, '76'),
(143, 79, 54, '84'),
(144, 79, 55, '82'),
(145, 79, 56, '81'),
(146, 79, 57, '81'),
(147, 79, 58, '90'),
(148, 79, 59, '75'),
(149, 79, 60, '75'),
(150, 67, 54, '84'),
(151, 67, 55, '81'),
(152, 67, 56, '81'),
(153, 67, 57, '83'),
(154, 67, 58, '87'),
(155, 67, 59, '75'),
(156, 67, 60, '77'),
(157, 51, 54, '88'),
(158, 51, 55, '85'),
(159, 51, 56, '82'),
(160, 51, 57, '75'),
(161, 51, 58, '90'),
(162, 51, 59, '80'),
(163, 51, 60, '78'),
(164, 68, 54, '83'),
(165, 68, 55, '85'),
(166, 68, 56, '85'),
(167, 68, 57, '80'),
(168, 68, 58, '89'),
(169, 68, 59, '79'),
(170, 68, 60, '75'),
(171, 69, 54, '91'),
(172, 69, 55, '86'),
(173, 69, 56, '94'),
(174, 69, 57, '90'),
(175, 69, 58, '89.4'),
(176, 69, 59, '79'),
(177, 69, 60, '75'),
(178, 52, 54, '88'),
(179, 52, 55, '85'),
(180, 52, 56, '80'),
(181, 52, 57, '75'),
(182, 52, 58, '90'),
(183, 52, 59, '80'),
(184, 52, 60, '79'),
(185, 53, 54, '86'),
(186, 53, 55, '85'),
(187, 53, 56, '86'),
(188, 53, 57, '85'),
(189, 53, 58, '91'),
(190, 53, 59, '80'),
(191, 53, 60, '83'),
(192, 54, 54, '90'),
(193, 54, 55, '90'),
(194, 54, 56, '88'),
(195, 54, 57, '83'),
(196, 54, 58, '91'),
(197, 54, 59, '90'),
(198, 54, 60, '89'),
(199, 70, 54, '86.5'),
(200, 70, 55, '84'),
(201, 70, 56, '85'),
(202, 70, 57, '88'),
(203, 70, 58, '90.4'),
(204, 70, 59, '86'),
(205, 70, 60, '82'),
(206, 71, 54, '91'),
(207, 71, 55, '85'),
(208, 71, 56, '86'),
(209, 71, 57, '85'),
(210, 71, 58, '91.4'),
(211, 71, 59, '78'),
(212, 71, 60, '80'),
(213, 72, 54, '83'),
(214, 72, 55, '77'),
(215, 72, 56, '77'),
(216, 72, 57, '77'),
(217, 72, 58, '90'),
(218, 72, 59, '75'),
(219, 72, 60, '79'),
(220, 73, 54, '84'),
(221, 73, 55, '82'),
(222, 73, 56, '86'),
(223, 73, 57, '83'),
(224, 73, 58, '90'),
(225, 73, 59, '81'),
(226, 73, 60, '77'),
(227, 55, 54, '84'),
(228, 55, 55, '80'),
(229, 55, 56, '82'),
(230, 55, 57, '78'),
(231, 55, 58, '91'),
(232, 55, 59, '75'),
(233, 55, 60, '75'),
(234, 58, 54, '90'),
(235, 58, 55, '90'),
(236, 58, 56, '90'),
(237, 58, 57, '87'),
(238, 58, 58, '91'),
(239, 58, 59, '85'),
(240, 58, 60, '87'),
(241, 74, 54, '88'),
(242, 74, 55, '81'),
(243, 74, 56, '82'),
(244, 74, 57, '85'),
(245, 74, 58, '90.6'),
(246, 74, 59, '80'),
(247, 74, 60, '86'),
(248, 78, 54, '84'),
(249, 78, 55, '79'),
(250, 78, 56, '79'),
(251, 78, 57, '79'),
(252, 78, 58, '89.6'),
(253, 78, 59, '80'),
(254, 78, 60, '79'),
(255, 75, 54, '88'),
(256, 75, 55, '82'),
(257, 75, 56, '86'),
(258, 75, 57, '83'),
(259, 75, 58, '88.6'),
(260, 75, 59, '76'),
(261, 75, 60, '76'),
(262, 56, 54, '90'),
(263, 56, 55, '85'),
(264, 56, 56, '85'),
(265, 56, 57, '76'),
(266, 56, 58, '90'),
(267, 56, 59, '85'),
(268, 56, 60, '80'),
(269, 77, 54, '85'),
(270, 77, 55, '81'),
(271, 77, 56, '81'),
(272, 77, 57, '85'),
(273, 77, 58, '88.6'),
(274, 77, 59, '76'),
(275, 77, 60, '76'),
(276, 57, 54, '85'),
(277, 57, 55, '93'),
(278, 57, 56, '92'),
(279, 57, 57, '89'),
(280, 57, 58, '91'),
(281, 57, 59, '90'),
(282, 57, 60, '90');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_siswa`
--

CREATE TABLE `data_siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelamin` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `data_siswa`
--

INSERT INTO `data_siswa` (`id`, `nis`, `nama`, `kelamin`, `kelas`) VALUES
(42, '3000', 'ABBIYU BUMI GIBRAN', 'Laki Laki', '3B'),
(43, '3001', 'ABBIYU LANGIT GIBRAN', 'Laki Laki', '3A'),
(44, '3002', 'AISYA FAIHA', 'Perempuan', '3A'),
(45, '3003', 'ALYANA MAULIDA', 'Perempuan', '3A'),
(46, '3004', 'ARDIAN ADITIYA', 'Laki Laki', '3A'),
(47, '3005', 'AIRLANGGA AFANDI', 'Laki Laki', '3A'),
(48, '3005', 'AUFAR FAIRUZ', 'Laki Laki', '3A'),
(49, '3006', 'AURA FADILLAH', 'Perempuan', '3A'),
(50, '3007', 'DAFFA IBNU HAFIZ', 'Laki Laki', '3A'),
(51, '3008', 'DZAKIRA TALITA SAKHI WILLO', 'Perempuan', '3A'),
(52, '3009', 'FIKRIANSYAH', 'Laki Laki', '3A'),
(53, '3010', 'GHOZI FAIQ', 'Laki Laki', '3A'),
(54, '3011', 'HAWWA HANANIA HASIBUAN', 'Perempuan', '3A'),
(55, '3012', 'NAZWA AZZAHRA', 'Perempuan', '3A'),
(56, '3013', 'RAZIQ HANAN TANOTO', 'Laki Laki', '3A'),
(57, '3014', 'TSAMARA UFAIRAH', 'Perempuan', '3A'),
(58, '3016', 'NUR KAYLA RAMADHANI', 'Perempuan', '3A'),
(59, '3015', 'ACHZAM  NAUFAL', 'Laki Laki', '3A'),
(61, '3017', 'AISYAH AYUDIA INARA', 'Perempuan', '3A'),
(62, '3018', 'ALVINO ZHA TIANDRA', 'Laki Laki', '3A'),
(63, '3019', 'ARSENIO HAMIZAN', 'Laki Laki', '3A'),
(64, '3020', 'AZKA ABBINAYA', 'Laki Laki', '3A'),
(65, '3021', 'BILQIS SEPTIAWAN', 'Laki Laki', '3A'),
(66, '3022', 'CUT KUMALA SARI', 'Perempuan', '3A'),
(67, '3023', 'DARREL AQUINOH', 'Laki Laki', '3A'),
(68, '3024', 'ECA ARSYILLA YASA HASIBUAN ', 'Perempuan', '3A'),
(69, '3025', 'FAQIH AL RASYID', 'Laki Laki', '3A'),
(70, '3026', 'JONATAN DANIELIYANTO LAHAGU', 'Laki Laki', '3A'),
(71, '3027', 'KANIA AMELIA SHYNTIA BUTAR-BUTAR', 'Perempuan', '3A'),
(72, '3028', 'MIKHA RIFANA ANJEYUS', 'Perempuan', '3A'),
(73, '3029', 'NAFISAH AULIA ZAHRA', 'Perempuan', '3A'),
(74, '3032', 'PANDAPOTAN PANDIANGAN', 'Laki Laki', '3A'),
(75, '3033', 'RAISA PASE', 'Perempuan', '3A'),
(76, '3034', 'DANIEL ARFIS YOSAFAT SIAHAAN', 'Laki Laki', '3A'),
(77, '3035', 'SUCI RAMADHANI', 'Perempuan', '3A'),
(78, '3036', 'RAHMAT RIDWAN', 'Laki Laki', '3A'),
(79, '3037', 'DANIEL SEPTIAN HUTABARAT', 'Laki Laki', '3A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `refresh_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `jabatan`, `username`, `password`, `refresh_token`) VALUES
(2, 'Jovis Jocunda', 'Super Admin', 'jovis', '$2a$10$z8hSvAnfBacNBZyJEc/eHuH.z7qI1VXsgck87RYcwcrwc57a7hj4m', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsIm5hbWUiOiJKb3ZpcyBKb2N1bmRhIiwiamFiYXRhbiI6IlN1cGVyIEFkbWluIiwiaWF0IjoxNzQ3NjYyMjc4LCJleHAiOjE3NDc3NDg2Nzh9.aVbzIEQqsEFyjkycez_hkhnnQCQhLfsMZvt0KP7a2VQ'),
(7, 'Adinda Az-zahra', 'Super Admin', 'adin', '$2a$10$MwuVkIgG/5qsi/ewQlC1C.p8k8e/5FCQYz2Wm.gtEWhFD0x.2JPqy', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcsIm5hbWUiOiJBZGluZGEgQXotemFocmEiLCJqYWJhdGFuIjoiU3VwZXIgQWRtaW4iLCJpYXQiOjE3NTE0MzEyODksImV4cCI6MTc1MTUxNzY4OX0.HnqX3IA4rP7uhWuwyDU9mLrbPkva30Gv1XY93cVhCmA');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_mapel`
--
ALTER TABLE `data_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_nilai`
--
ALTER TABLE `data_nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`mapel_id`),
  ADD KEY `dataset_id` (`siswa_id`) USING BTREE;

--
-- Indeks untuk tabel `data_siswa`
--
ALTER TABLE `data_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_mapel`
--
ALTER TABLE `data_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `data_nilai`
--
ALTER TABLE `data_nilai`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT untuk tabel `data_siswa`
--
ALTER TABLE `data_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_nilai`
--
ALTER TABLE `data_nilai`
  ADD CONSTRAINT `data_nilai_ibfk_2` FOREIGN KEY (`mapel_id`) REFERENCES `data_mapel` (`id`),
  ADD CONSTRAINT `data_nilai_ibfk_3` FOREIGN KEY (`siswa_id`) REFERENCES `data_siswa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
