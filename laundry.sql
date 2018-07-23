-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2018 at 09:26 AM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--

CREATE TABLE IF NOT EXISTS `harga` (
  `id_jasa` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga_perkilo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `harga`
--

INSERT INTO `harga` (`id_jasa`, `nama`, `harga_perkilo`) VALUES
(1, 'Selimut', 8000),
(2, 'Celana', 7000),
(3, 'Baju', 5000),
(4, 'Boneka', 6000);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE IF NOT EXISTS `kasir` (
  `kd_kasir` int(11) NOT NULL,
  `user` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`kd_kasir`, `user`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat` varchar(10) NOT NULL,
  `no_telp_pelanggan` varchar(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `no_telp_pelanggan`) VALUES
(1, 'Rohmatul Ummah', 'Sleman', '8576942'),
(2, 'Apriliana Puspitasari', 'Klaten', '085729645'),
(3, 'Rully Arisandi M Baba', 'Maluku', '692369429'),
(4, 'Angga', 'Jogja', '085931487');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id_bayar` int(11) NOT NULL,
  `id_jasa` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `berat` int(10) NOT NULL,
  `harga_perkilo` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_bayar`, `id_jasa`, `id_pelanggan`, `tgl_transaksi`, `nama`, `berat`, `harga_perkilo`, `total`) VALUES
(1, 1, 1, '2019-07-26', 'Selimut', 5, 8000, 40000),
(2, 2, 2, '2019-09-16', 'Celana', 9, 7000, 63000),
(3, 3, 3, '2018-05-28', 'Baju', 4, 5000, 20000),
(4, 3, 1, '2019-11-30', 'Baju', 7, 5000, 35000),
(5, 4, 4, '2019-12-12', 'Boneka', 19, 6000, 114000),
(6, 4, 2, '2019-06-04', 'Boneka', 3, 6000, 18000),
(7, 0, 0, '0000-00-00', '', 0, 0, 0),
(8, 0, 0, '0000-00-00', '', 0, 0, 0),
(9, 4, 2, '2019-06-19', 'Boneka', 8, 6000, 48000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id_jasa`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`kd_kasir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `id_jasa` (`id_jasa`),
  ADD KEY `id_jasa_2` (`id_jasa`),
  ADD KEY `id_jasa_3` (`id_jasa`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_pelanggan_2` (`id_pelanggan`),
  ADD KEY `id_jasa_4` (`id_jasa`),
  ADD KEY `id_jasa_5` (`id_jasa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `harga`
--
ALTER TABLE `harga`
  MODIFY `id_jasa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `kd_kasir` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
