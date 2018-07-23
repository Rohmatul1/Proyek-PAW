-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30 Mar 2018 pada 07.47
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akuntansi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `nm_akun` varchar(30) NOT NULL,
  `debet` int(11) NOT NULL,
  `kredit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id_akun`, `nm_akun`, `debet`, `kredit`) VALUES
(1, 'Akun1', 1000, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatankas`
--

CREATE TABLE `catatankas` (
  `id_catatankas` varchar(8) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan_jurnal` varchar(50) NOT NULL,
  `debet` int(11) NOT NULL,
  `kredit` int(11) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `id_gaji` varchar(8) NOT NULL,
  `tgl_gaji` date NOT NULL,
  `nm_karyawan` varchar(35) NOT NULL,
  `jml_gaji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gaji`
--

INSERT INTO `gaji` (`id_gaji`, `tgl_gaji`, `nm_karyawan`, `jml_gaji`) VALUES
('G000001', '2018-02-28', 'Ari', 1000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal`
--

CREATE TABLE `jurnal` (
  `id_jurnal` int(11) NOT NULL,
  `tgl_jurnal` date NOT NULL,
  `nm_rekening` varchar(20) NOT NULL,
  `debet` int(11) NOT NULL,
  `kredit` int(11) NOT NULL,
  `id_catatankas` varchar(8) NOT NULL,
  `id_gaji` varchar(8) NOT NULL,
  `id_beli` varchar(8) NOT NULL,
  `id_penerimaankas` varchar(8) NOT NULL,
  `id_pengeluaran_kas` varchar(8) NOT NULL,
  `id_penjualan` varchar(8) NOT NULL,
  `id_produksi` varchar(8) NOT NULL,
  `id_tb` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kartugudang`
--

CREATE TABLE `kartugudang` (
  `id_kartu_gudang` varchar(8) NOT NULL,
  `id_produksi` varchar(8) NOT NULL,
  `id_beli` varchar(8) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_persediaan` enum('Gelas Produksi','Gelas Beli','Bahan Baku') DEFAULT NULL,
  `unit_masuk` int(11) NOT NULL,
  `unit_keluar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `link`
--

CREATE TABLE `link` (
  `id_link` int(11) NOT NULL,
  `id_catatankas` varchar(8) NOT NULL,
  `id_gaji` varchar(8) NOT NULL,
  `id_beli` varchar(8) NOT NULL,
  `id_penerimaankas` varchar(8) NOT NULL,
  `id_pengeluaran_kas` varchar(8) NOT NULL,
  `id_penjualan` varchar(8) NOT NULL,
  `id_produksi` varchar(8) NOT NULL,
  `id_tb` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(8) NOT NULL,
  `nm_pelanggan` varchar(35) NOT NULL,
  `no_telp` char(14) DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nm_pelanggan`, `no_telp`, `alamat`) VALUES
('P000001', 'Susan', '098765432111', 'Bantul');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasok`
--

CREATE TABLE `pemasok` (
  `id_pemasok` varchar(8) NOT NULL,
  `email` varchar(25) NOT NULL,
  `nm_pemasok` varchar(35) NOT NULL,
  `no_telp` char(14) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemasok`
--

INSERT INTO `pemasok` (`id_pemasok`, `email`, `nm_pemasok`, `no_telp`, `alamat`) VALUES
('P000002', 'ari@gmail.com', 'Ari', '098765432111', 'Sleman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_beli` varchar(8) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `id_pemasok` varchar(8) NOT NULL,
  `jenis_pembelian` enum('gelas','bahan baku') DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_beli`, `tgl_pembelian`, `id_pemasok`, `jenis_pembelian`, `qty`, `harga`, `total`) VALUES
('B000001', '2018-03-08', 'P000002', 'bahan baku', 120, 10000, 1200000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerimaankas`
--

CREATE TABLE `penerimaankas` (
  `id_penerimaankas` varchar(8) NOT NULL,
  `tgl_penerimaankas` date NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `nominal_kas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penerimaankas`
--

INSERT INTO `penerimaankas` (`id_penerimaankas`, `tgl_penerimaankas`, `keterangan`, `nominal_kas`) VALUES
('PN000001', '2018-03-24', 'Bank', 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluarankas`
--

CREATE TABLE `pengeluarankas` (
  `id_pengeluaran_kas` varchar(8) NOT NULL,
  `tgl_pengeluarankas` date NOT NULL,
  `penerima_kas` varchar(35) NOT NULL,
  `jenis_keperluan` varchar(50) NOT NULL,
  `nominal_kas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` varchar(8) NOT NULL,
  `tgl_jual` date NOT NULL,
  `id_pelanggan` varchar(8) NOT NULL,
  `qty_jual` int(11) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `total_penjualan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `tgl_jual`, `id_pelanggan`, `qty_jual`, `harga_satuan`, `total_penjualan`) VALUES
('JL000001', '2018-03-22', 'P000001', 12, 1000, 12000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `perencanaanusaha`
--

CREATE TABLE `perencanaanusaha` (
  `id_rencana` varchar(8) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` int(4) NOT NULL,
  `minggu_ke` int(1) NOT NULL,
  `kas_tersedia` int(11) NOT NULL,
  `gelas_tersedia` int(11) NOT NULL,
  `pdp_tersedia` int(11) NOT NULL,
  `bb_tersedia` int(11) NOT NULL,
  `jml_target` int(11) NOT NULL,
  `jml_realisasi` int(11) NOT NULL,
  `beli_target` int(11) NOT NULL,
  `beli_realisasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaanbb`
--

CREATE TABLE `permintaanbb` (
  `id_permintaan_bb` varchar(8) NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `nm_brg` varchar(50) NOT NULL,
  `satuan_brg` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaanpembelian`
--

CREATE TABLE `permintaanpembelian` (
  `id` int(11) NOT NULL,
  `no_form` varchar(8) NOT NULL,
  `tgl_permintaan_pembelian` date NOT NULL,
  `nominal_permintaan_pembelian` int(11) NOT NULL,
  `jenis_pembelian` enum('gelas','bahan baku') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `permintaanpembelian`
--

INSERT INTO `permintaanpembelian` (`id`, `no_form`, `tgl_permintaan_pembelian`, `nominal_permintaan_pembelian`, `jenis_pembelian`) VALUES
(1, 'NF000001', '2018-03-14', 10000, 'bahan baku'),
(2, 'NF000001', '2018-03-14', 10000, 'gelas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesan` varchar(8) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `id_pelanggan` varchar(8) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesan`, `tgl_pesan`, `id_pelanggan`, `qty`) VALUES
('PS000001', '2018-03-19', 'P000001', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produksi`
--

CREATE TABLE `produksi` (
  `id_produksi` varchar(8) NOT NULL,
  `tgl_produksi` date NOT NULL,
  `pdp_i` int(11) NOT NULL,
  `bb_i` int(11) NOT NULL,
  `gelas_o` int(11) NOT NULL,
  `pdp_o` int(11) NOT NULL,
  `bb_o` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_bank`
--

CREATE TABLE `transaksi_bank` (
  `id_tb` varchar(8) NOT NULL,
  `tgl` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `nama_penyetor` varchar(50) NOT NULL,
  `nama_teller` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(60) NOT NULL,
  `Jabatan` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `Jabatan`) VALUES
(11, 'akuntansi', 'akuntansi', '1139f90d50ba3bb7ff4b2602ad03aa26', 'akuntansi'),
(9, 'direktur', 'direktur', '4fbfd324f5ffcdff5dbf6f019b02eca8', 'direktur'),
(8, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(12, 'keuangan', 'keuangan', 'a4151d4b2856ec63368a7c784b1f0a6e', 'keuangan'),
(13, 'pembelian', 'pembelian', '025b94c9e65037bb7317c8e25389155d', 'pembelian'),
(14, 'gudang', 'gudang', '202446dd1d6028084426867365b0c7a1', 'gudang'),
(15, 'penjualan', 'penjualan', '13bf2c8effae21d17a277520aa9b9277', 'penjualan'),
(16, 'produksi', 'produksi', 'edf3017a2946290b95c783bd1a7f0ba7', 'produksi'),
(17, 'personalia', 'personalia', '2d7b9ddba458f0199b69f8bd9607c036', 'personalia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indexes for table `catatankas`
--
ALTER TABLE `catatankas`
  ADD PRIMARY KEY (`id_catatankas`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id_gaji`);

--
-- Indexes for table `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`id_jurnal`),
  ADD KEY `id_catatankas` (`id_catatankas`),
  ADD KEY `id_gaji` (`id_gaji`),
  ADD KEY `id_beli` (`id_beli`),
  ADD KEY `id_penerimaankas` (`id_penerimaankas`),
  ADD KEY `id_pengeluaran_kas` (`id_pengeluaran_kas`),
  ADD KEY `id_penjualan` (`id_penjualan`),
  ADD KEY `id_produksi` (`id_produksi`),
  ADD KEY `id_tb` (`id_tb`);

--
-- Indexes for table `kartugudang`
--
ALTER TABLE `kartugudang`
  ADD PRIMARY KEY (`id_kartu_gudang`),
  ADD KEY `id_produksi` (`id_produksi`),
  ADD KEY `id_beli` (`id_beli`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id_link`),
  ADD KEY `id_catatankas` (`id_catatankas`),
  ADD KEY `id_gaji` (`id_gaji`),
  ADD KEY `id_beli` (`id_beli`),
  ADD KEY `id_penerimaankas` (`id_penerimaankas`),
  ADD KEY `id_pengeluaran_kas` (`id_pengeluaran_kas`),
  ADD KEY `id_penjualan` (`id_penjualan`),
  ADD KEY `id_produksi` (`id_produksi`),
  ADD KEY `id_tb` (`id_tb`),
  ADD KEY `id_beli_2` (`id_beli`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id_pemasok`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_beli`),
  ADD KEY `id_pemasok` (`id_pemasok`);

--
-- Indexes for table `penerimaankas`
--
ALTER TABLE `penerimaankas`
  ADD PRIMARY KEY (`id_penerimaankas`);

--
-- Indexes for table `pengeluarankas`
--
ALTER TABLE `pengeluarankas`
  ADD PRIMARY KEY (`id_pengeluaran_kas`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `perencanaanusaha`
--
ALTER TABLE `perencanaanusaha`
  ADD PRIMARY KEY (`id_rencana`);

--
-- Indexes for table `permintaanbb`
--
ALTER TABLE `permintaanbb`
  ADD PRIMARY KEY (`id_permintaan_bb`);

--
-- Indexes for table `permintaanpembelian`
--
ALTER TABLE `permintaanpembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`id_produksi`);

--
-- Indexes for table `transaksi_bank`
--
ALTER TABLE `transaksi_bank`
  ADD PRIMARY KEY (`id_tb`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD KEY `id_user_2` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `id_jurnal` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `id_link` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permintaanpembelian`
--
ALTER TABLE `permintaanpembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jurnal`
--
ALTER TABLE `jurnal`
  ADD CONSTRAINT `jurnal_ibfk_1` FOREIGN KEY (`id_penerimaankas`) REFERENCES `penerimaankas` (`id_penerimaankas`),
  ADD CONSTRAINT `jurnal_ibfk_2` FOREIGN KEY (`id_pengeluaran_kas`) REFERENCES `pengeluarankas` (`id_pengeluaran_kas`),
  ADD CONSTRAINT `jurnal_ibfk_3` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`),
  ADD CONSTRAINT `jurnal_ibfk_4` FOREIGN KEY (`id_produksi`) REFERENCES `produksi` (`id_produksi`),
  ADD CONSTRAINT `jurnal_ibfk_5` FOREIGN KEY (`id_tb`) REFERENCES `transaksi_bank` (`id_tb`),
  ADD CONSTRAINT `jurnal_ibfk_6` FOREIGN KEY (`id_catatankas`) REFERENCES `catatankas` (`id_catatankas`),
  ADD CONSTRAINT `jurnal_ibfk_7` FOREIGN KEY (`id_gaji`) REFERENCES `gaji` (`id_gaji`);

--
-- Ketidakleluasaan untuk tabel `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `link_ibfk_1` FOREIGN KEY (`id_catatankas`) REFERENCES `catatankas` (`id_catatankas`),
  ADD CONSTRAINT `link_ibfk_2` FOREIGN KEY (`id_gaji`) REFERENCES `gaji` (`id_gaji`),
  ADD CONSTRAINT `link_ibfk_3` FOREIGN KEY (`id_penerimaankas`) REFERENCES `penerimaankas` (`id_penerimaankas`),
  ADD CONSTRAINT `link_ibfk_4` FOREIGN KEY (`id_pengeluaran_kas`) REFERENCES `pengeluarankas` (`id_pengeluaran_kas`),
  ADD CONSTRAINT `link_ibfk_5` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`),
  ADD CONSTRAINT `link_ibfk_6` FOREIGN KEY (`id_produksi`) REFERENCES `produksi` (`id_produksi`),
  ADD CONSTRAINT `link_ibfk_7` FOREIGN KEY (`id_tb`) REFERENCES `transaksi_bank` (`id_tb`),
  ADD CONSTRAINT `link_ibfk_8` FOREIGN KEY (`id_beli`) REFERENCES `pembelian` (`id_beli`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id_pemasok`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
