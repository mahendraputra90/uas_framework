-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2020 at 07:05 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbrentalmobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `merk`
--

CREATE TABLE `merk` (
  `idmerk` int(2) NOT NULL,
  `namamerk` varchar(100) DEFAULT NULL,
  `namamerk_seo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merk`
--

INSERT INTO `merk` (`idmerk`, `namamerk`, `namamerk_seo`) VALUES
(1, 'Toyota', 'toyota'),
(2, 'Honda', 'honda'),
(3, 'Daihatsu', 'daihatsu'),
(4, 'Nissan', 'nissan'),
(5, 'Suzuki', 'suzuki'),
(7, 'Mitsubishi', 'mitsubishi'),
(10, 'BMW', 'bmw'),
(11, 'Isuzu', 'isuzu'),
(12, 'Datsun', 'datsun'),
(13, 'Ferrari', 'ferrari');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `idmobil` int(3) NOT NULL,
  `date` datetime DEFAULT NULL,
  `idmerk` int(2) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `tahunproduksi` int(4) DEFAULT NULL,
  `platnomer` varchar(15) DEFAULT NULL,
  `kursi` int(2) DEFAULT NULL,
  `tarif` int(6) DEFAULT NULL,
  `lembur` int(6) DEFAULT NULL,
  `norangka` varchar(20) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `update` datetime DEFAULT NULL,
  `stmobil` enum('bebas','jalan') DEFAULT 'bebas'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`idmobil`, `date`, `idmerk`, `type`, `tahunproduksi`, `platnomer`, `kursi`, `tarif`, `lembur`, `norangka`, `foto`, `update`, `stmobil`) VALUES
(1, '2016-11-17 08:19:32', 3, 'Ayla', 2016, 'A 1234 BCD', 5, 270000, 50000, 'A123KGJR', 'ayla.jpg', '2016-11-22 16:05:00', 'bebas'),
(2, '2016-11-17 14:21:55', 1, 'Agya', 2016, 'B 1122 CD', 5, 280000, 50000, 'A4455GGHT', 'agya.jpg', '2016-11-20 09:04:54', 'bebas'),
(3, '2016-11-20 09:05:34', 3, 'Xenia', 2016, 'B 4444 DUT', 8, 350000, 50000, 'AHASDR567JH', 'xenia1.png', '2016-11-20 09:07:26', 'jalan'),
(4, '2016-11-20 09:07:18', 3, 'Luxio', 2016, 'B 2233 CD', 8, 350000, 50000, 'AGD556K7', 'luxio.png', NULL, 'jalan'),
(5, '2016-11-22 16:02:14', 1, 'Avanza', 2016, 'B 1111 AAA', 8, 350000, 50000, 'HIJKLMN123', 'avanza.jpg', NULL, 'bebas');

-- --------------------------------------------------------

--
-- Table structure for table `supir`
--

CREATE TABLE `supir` (
  `idsupir` int(2) NOT NULL,
  `date` datetime DEFAULT NULL,
  `namasupir` varchar(30) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `noktp` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `tarif` int(6) DEFAULT NULL,
  `lembur` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supir`
--

INSERT INTO `supir` (`idsupir`, `date`, `namasupir`, `tgllahir`, `alamat`, `noktp`, `foto`, `tarif`, `lembur`) VALUES
(1, NULL, 'Bambang', '1980-07-24', 'Pasar Minggu, Jakarta Selatan', '1234455678', '121116140543100465.jpg', 100000, 20000),
(3, NULL, 'Ade Margono', '1981-03-05', 'Jakarta Barat', '456712378', 'foto_pp1.png', 100000, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `idtransaksi` int(100) NOT NULL,
  `date` datetime DEFAULT NULL,
  `namapelanggan` varchar(20) DEFAULT NULL,
  `noktp` varchar(20) DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `tglsewa` date DEFAULT NULL,
  `tglkembali` date DEFAULT NULL,
  `selisih` int(2) DEFAULT '0',
  `idmobil` int(2) DEFAULT NULL,
  `idsupir` int(2) DEFAULT NULL,
  `total` int(10) DEFAULT '0',
  `sttransaksi` enum('mulai','selesai') DEFAULT 'mulai'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`idtransaksi`, `date`, `namapelanggan`, `noktp`, `nohp`, `alamat`, `tglsewa`, `tglkembali`, `selisih`, `idmobil`, `idsupir`, `total`, `sttransaksi`) VALUES
(1, '2016-11-22 13:50:33', 'Budi Pangestu', '65437890123', '0812345678', 'Depok', '2016-11-21', '2016-11-22', 2, 3, 3, 900000, 'selesai'),
(2, '2016-11-22 12:17:10', 'Dedi Irawan', '1234455678', '0812345678', 'Jakarta', '2016-11-20', NULL, 0, 4, 0, 0, 'mulai'),
(3, '2016-11-22 13:53:46', 'Jamal', '584986794039', '08982000969', 'Jakarta', '2016-11-20', NULL, 0, 3, 1, 0, 'mulai');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(2) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `stuser` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `username`, `password`, `lastlogin`, `stuser`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `merk`
--
ALTER TABLE `merk`
  ADD PRIMARY KEY (`idmerk`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`idmobil`);

--
-- Indexes for table `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`idsupir`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `merk`
--
ALTER TABLE `merk`
  MODIFY `idmerk` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `idmobil` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supir`
--
ALTER TABLE `supir`
  MODIFY `idsupir` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idtransaksi` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
