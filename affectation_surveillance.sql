-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2023 at 01:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `affectation_surveillance`
--

-- --------------------------------------------------------

--
-- Table structure for table `annee`
--

CREATE TABLE `annee` (
  `id` int(11) NOT NULL,
  `nom` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `annee`
--

INSERT INTO `annee` (`id`, `nom`) VALUES
(1, '2022');

-- --------------------------------------------------------

--
-- Table structure for table `filiere`
--

CREATE TABLE `filiere` (
  `id` int(11) NOT NULL,
  `nom` varchar(8) NOT NULL,
  `respo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filiere`
--

INSERT INTO `filiere` (`id`, `nom`, `respo`) VALUES
(1, 'SMIA1', 32),
(2, 'SMIA2', 2),
(3, 'SMI3', 42),
(4, 'SMI4', 4),
(5, 'SMI5', 33),
(6, 'SMI6', 6),
(7, 'SMA5', 7),
(8, 'SMA3', 8),
(9, 'SMPC1', 16),
(10, 'SVTU1', 10);

-- --------------------------------------------------------

--
-- Table structure for table `filiere_annee`
--

CREATE TABLE `filiere_annee` (
  `id` int(11) NOT NULL,
  `id_filiere` int(11) NOT NULL,
  `id_annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filiere_annee`
--

INSERT INTO `filiere_annee` (`id`, `id_filiere`, `id_annee`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `filiere_module`
--

CREATE TABLE `filiere_module` (
  `id` int(11) NOT NULL,
  `filiere` int(11) DEFAULT NULL,
  `module` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filiere_module`
--

INSERT INTO `filiere_module` (`id`, `filiere`, `module`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 5),
(4, 2, 6),
(5, 5, 8),
(6, 6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `horaire`
--

CREATE TABLE `horaire` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `duree` time NOT NULL,
  `module` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `horaire`
--

INSERT INTO `horaire` (`id`, `date`, `heure`, `duree`, `module`) VALUES
(1, '2022-01-31', '10:30:00', '01:30:00', 1),
(2, '2022-02-01', '08:30:00', '01:30:00', 2),
(3, '2022-02-02', '08:30:00', '01:30:00', 3),
(4, '2022-02-03', '08:30:00', '01:30:00', 4),
(5, '2022-02-03', '10:30:00', '01:30:00', 5),
(6, '2022-02-04', '08:30:00', '01:30:00', 6),
(7, '2022-02-04', '10:30:00', '01:30:00', 7),
(8, '2022-02-05', '08:30:00', '01:30:00', 8),
(9, '2022-02-05', '10:30:00', '01:30:00', 9),
(10, '2022-02-07', '09:00:00', '01:30:00', 10),
(11, '2022-02-02', '10:30:00', '01:30:00', 11),
(12, '2022-02-07', '15:00:00', '01:30:00', 12);

-- --------------------------------------------------------

--
-- Table structure for table `locale`
--

CREATE TABLE `locale` (
  `id` int(11) NOT NULL,
  `nom` varchar(16) NOT NULL,
  `capacite` int(11) NOT NULL,
  `nbr_surveillant` int(11) NOT NULL,
  `respo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locale`
--

INSERT INTO `locale` (`id`, `nom`, `capacite`, `nbr_surveillant`, `respo`) VALUES
(1, 'AMPHI B', 85, 3, 1),
(2, 'AMPHI C', 85, 3, 2),
(3, 'BL2.3', 50, 2, 3),
(4, 'BL2.5', 20, 2, 4),
(5, 'BL2.6', 50, 2, 5),
(6, 'BL3.3', 20, 2, 6),
(7, 'BL3.4', 20, 2, 7),
(8, 'BL3.5', 20, 2, 8),
(9, 'BL3.6', 20, 2, 9),
(10, 'BL3.7', 30, 2, 10),
(11, 'BL3.8', 20, 2, 11),
(12, 'BL4.2', 20, 2, 12),
(13, 'BL4.3', 20, 2, 13),
(14, 'BL4.4', 20, 2, 14),
(15, 'BL4.5', 20, 2, 15),
(16, 'BL4.6', 20, 2, 16),
(17, 'BL4.7', 20, 2, 17),
(18, 'BL4.8', 20, 2, 18),
(19, 'BL4.9', 20, 2, 1),
(20, 'BL5.1', 20, 2, 2),
(21, 'BL5.2', 20, 2, 3),
(22, 'BL5.3', 20, 2, 4),
(23, 'BL5.4', 30, 2, 5),
(24, 'BL8.1', 45, 2, 6),
(25, 'BL8.2', 45, 2, 7),
(26, 'AMPHI D', 60, 3, 8),
(27, 'AMPHI E', 60, 3, 9),
(31, 'BL9.5', 45, 2, 10),
(32, 'BL9.6', 45, 2, 11),
(33, 'CED C2', 38, 2, 12),
(34, 'CED C3', 38, 2, 13),
(35, 'BL8.3', 45, 2, 14),
(36, 'BL8.4', 45, 2, 15),
(37, 'BL8.5', 44, 2, 16),
(38, 'BL8.6', 44, 2, 17),
(39, 'CED C10', 43, 2, 18),
(40, 'CED C14', 44, 2, 1),
(41, 'CED C15', 44, 2, 2),
(42, 'CED C16', 44, 2, 3),
(43, 'BL9.4', 45, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `locale` int(11) DEFAULT NULL,
  `horaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `locale`, `horaire`) VALUES
(434, 1, 1),
(435, 2, 1),
(436, 3, 1),
(437, 12, 1),
(438, 2, 2),
(439, 16, 2),
(440, 25, 2),
(441, 38, 2),
(442, 3, 5),
(443, 15, 6),
(444, 33, 8),
(445, 43, 10);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `nom` varchar(16) NOT NULL,
  `nbrinscrits` int(11) NOT NULL,
  `semestre` int(11) DEFAULT NULL,
  `respo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `nom`, `nbrinscrits`, `semestre`, `respo`) VALUES
(1, 'ALGORITHMIQUE II', 110, 1, 39),
(2, 'BASES DE DONNEES', 66, 2, 42),
(3, 'SYSTEME D\'EXPLOI', 97, 3, 3),
(4, 'INFORMATIQUE 1', 632, 4, 36),
(5, 'CONCEPTION ORIEN', 62, 5, 5),
(6, 'PROGRAMMATION OR', 63, 6, 6),
(7, 'PROGRAMMATION 1', 83, 1, 36),
(8, 'TECHNOLOGIE DU W', 90, 2, 8),
(9, 'COMPILATION', 62, 3, 9),
(10, 'RESEAUX', 67, 4, 41),
(11, 'LANGUE ET TERMIN', 938, 5, 11),
(12, 'ANALYSE5', 243, 6, 12),
(13, 'ALGEBRE4', 257, 1, 13),
(14, 'ANALYSE4', 252, 2, 14),
(15, 'INFORMATIQUE5', 248, 3, 15),
(16, 'INFORMATIQUE3', 256, 4, 16),
(17, 'LANGUE ET THERMI', 988, 5, 17);

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

CREATE TABLE `professeur` (
  `id` int(11) NOT NULL,
  `nom` varchar(16) NOT NULL,
  `prenom` varchar(16) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professeur`
--

INSERT INTO `professeur` (`id`, `nom`, `prenom`, `admin`, `email`, `password`) VALUES
(1, 'AGHOUTANE', 'BADRADDINE', 0, 'user', 'user'),
(2, 'AKSASSE', 'BRAHIM', 0, 'user', 'user'),
(3, 'ATAY', 'RACHID', 0, 'user', 'user'),
(4, 'BEKRI', 'MY ALI', 0, 'user', 'user'),
(5, 'BENHLIMA', 'SAID', 0, 'user', 'user'),
(6, 'EL ANSARI', 'MOHAMED', 0, 'user', 'user'),
(7, 'EL BELRHITI ELAL', 'AB', 0, 'user', 'user'),
(8, 'EL YASSINI', 'KHALID', 0, 'user', 'user'),
(9, 'EL FREGOUGUI', 'ABDESLAM', 0, 'user', 'user'),
(10, 'ELOUADGHIRI', 'MOULAY DRISS', 0, 'user', 'user'),
(11, 'ISMAILI ALAOUI ', 'ELMEHDI', 0, 'user', 'user'),
(12, 'KAMAL', 'ASMAE', 0, 'user', 'user'),
(13, 'LAHBI', 'ZAKARIA', 0, 'user', 'user'),
(14, 'OUANAN', 'MOHAMMED', 0, 'user', 'user'),
(15, 'OUBELKACEM', 'ALI', 1, 'admin', 'admin'),
(16, 'SABBANE', 'MOHAMED', 0, 'user', 'user'),
(17, 'ZAIM', 'AHMED', 0, 'user', 'user'),
(18, 'NEMMAR HOUDA ', 'HOUDA', 0, 'user', 'user'),
(32, 'a', 'a', 0, NULL, NULL),
(33, 'aa', 'bb', 0, NULL, NULL),
(34, 'a', 'b', 0, NULL, NULL),
(35, 'aa', 'aa', 0, NULL, NULL),
(36, 'abdelilah', 'dh', 0, NULL, NULL),
(37, 'a', 'a', 0, NULL, NULL),
(38, 'b', 'b', 0, NULL, NULL),
(39, 'd', 'd', 0, NULL, NULL),
(40, 'b', 'b', 0, NULL, NULL),
(41, 'ff', 'ff', 0, NULL, NULL),
(42, 'hh', 'hh', 0, NULL, NULL),
(43, 'gg', 'gg', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `semestre`
--

CREATE TABLE `semestre` (
  `id` int(11) NOT NULL,
  `nom` varchar(8) NOT NULL,
  `annee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semestre`
--

INSERT INTO `semestre` (`id`, `nom`, `annee`) VALUES
(1, 'S1', 1),
(2, 'S2', 1),
(3, 'S3', 1),
(4, 'S4', 1),
(5, 'S5', 1),
(6, 'S6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `semestre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `nom`, `type`, `semestre`) VALUES
(1, 'automne', 'ordinaire', 1),
(2, 'automne', 'rattrapage', 2),
(3, 'printemps', 'ordinaire', 3),
(4, 'printemps', 'rattrapage', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annee`
--
ALTER TABLE `annee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filiere_professeur_id_fk` (`respo`);

--
-- Indexes for table `filiere_annee`
--
ALTER TABLE `filiere_annee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_FILIERE` (`id_filiere`),
  ADD KEY `FK_ANNEE` (`id_annee`);

--
-- Indexes for table `filiere_module`
--
ALTER TABLE `filiere_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filiere_module_filiere_id_fk` (`filiere`),
  ADD KEY `filiere_module_module_id_fk` (`module`);

--
-- Indexes for table `horaire`
--
ALTER TABLE `horaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `horaire_module_id_fk` (`module`);

--
-- Indexes for table `locale`
--
ALTER TABLE `locale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locale_professeur_id_fk` (`respo`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_horaire_id_fk` (`horaire`),
  ADD KEY `location_locale_id_fk` (`locale`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_semestre_id_fk` (`semestre`),
  ADD KEY `module_professeur_id_fk` (`respo`);

--
-- Indexes for table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semestre_annee_id_fk` (`annee`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_semestre_id_fk` (`semestre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annee`
--
ALTER TABLE `annee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `filiere_annee`
--
ALTER TABLE `filiere_annee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `filiere_module`
--
ALTER TABLE `filiere_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `horaire`
--
ALTER TABLE `horaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `locale`
--
ALTER TABLE `locale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `filiere`
--
ALTER TABLE `filiere`
  ADD CONSTRAINT `filiere_professeur_id_fk` FOREIGN KEY (`respo`) REFERENCES `professeur` (`id`);

--
-- Constraints for table `filiere_annee`
--
ALTER TABLE `filiere_annee`
  ADD CONSTRAINT `FK_ANNEE` FOREIGN KEY (`id_annee`) REFERENCES `annee` (`id`),
  ADD CONSTRAINT `FK_FILIERE` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id`);

--
-- Constraints for table `filiere_module`
--
ALTER TABLE `filiere_module`
  ADD CONSTRAINT `filiere_module_filiere_id_fk` FOREIGN KEY (`filiere`) REFERENCES `filiere` (`id`),
  ADD CONSTRAINT `filiere_module_module_id_fk` FOREIGN KEY (`module`) REFERENCES `module` (`id`);

--
-- Constraints for table `horaire`
--
ALTER TABLE `horaire`
  ADD CONSTRAINT `horaire_module_id_fk` FOREIGN KEY (`module`) REFERENCES `module` (`id`);

--
-- Constraints for table `locale`
--
ALTER TABLE `locale`
  ADD CONSTRAINT `locale_professeur_id_fk` FOREIGN KEY (`respo`) REFERENCES `professeur` (`id`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_horaire_id_fk` FOREIGN KEY (`horaire`) REFERENCES `horaire` (`id`),
  ADD CONSTRAINT `location_locale_id_fk` FOREIGN KEY (`locale`) REFERENCES `locale` (`id`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_professeur_id_fk` FOREIGN KEY (`respo`) REFERENCES `professeur` (`id`),
  ADD CONSTRAINT `module_semestre_id_fk` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`id`);

--
-- Constraints for table `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `semestre_annee_id_fk` FOREIGN KEY (`annee`) REFERENCES `annee` (`id`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_semestre_id_fk` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
