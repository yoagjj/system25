-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20251118.dfcf3dd949
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 21, 2025 at 02:16 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukklv5`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE DATABASE ukklv5;
USE ukklv5;

CREATE TABLE barang (
  id int NOT NULL AUTO_INCREMENT,
  nama varchar(50) NOT NULL,
  deskripsi text NOT NULL,
  jumlah int NOT NULL,
  jumlah_tersedia int NOT NULL,
  lokasi varchar(50) NOT NULL,
  kode varchar(50) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO barang 
(id, nama, deskripsi, jumlah, jumlah_tersedia, lokasi, kode, created_at) VALUES
(2, 'PC', 'dasd', 121, 121, '21', '21', '2025-11-21 14:09:45');

CREATE TABLE transaksi (
  id int NOT NULL AUTO_INCREMENT,
  id_barang int NOT NULL,
  peminjam varchar(50) NOT NULL,
  jumlah int NOT NULL,
  kategori enum('pinjam','kembali') NOT NULL,
  tanggal datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  catatan text NOT NULL,
  PRIMARY KEY (id),
  KEY id_barang (id_barang),
  CONSTRAINT transaksi_ibfk_1 FOREIGN KEY (id_barang) REFERENCES barang (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  username varchar(50) NOT NULL,
  fullname varchar(50) NOT NULL,
  password varchar(255) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  role enum('admin','superadmin') DEFAULT 'admin',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO users (id, username, fullname, password, created_at, role) VALUES
(4, 'superadmin', 'Superadmin', '$2y$10$nKjRMtIAPgNSueu2wMv4NuMHylVJHaJxOzkHFE6PmhlsAC54d9OXC', '2025-11-21 09:15:34', 'superadmin'),
(6, 'admin', 'Admin', '$2y$10$EUjYbXVXPf2BO9SHoJ/gke.ojEWc3jVR/Ep..EYBYnknnCEbKmVRa', '2025-11-21 14:07:30', 'admin');
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
