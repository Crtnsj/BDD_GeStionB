-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 20, 2024 at 08:58 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsb`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergie`
--

CREATE TABLE `allergie` (
  `id_al` int(11) NOT NULL,
  `libelle_al` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `allergie`
--

INSERT INTO `allergie` (`id_al`, `libelle_al`) VALUES
(1, 'Allergie à l\'aspirine'),
(2, 'Allergie au paracétamol'),
(3, 'Réaction allergique aux pénicillines'),
(4, 'Allergie au cacao'),
(6, 'Allergie respiratoire'),
(7, 'Allergie au poulet'),
(8, 'Allergie au latex'),
(9, 'Allergie au piqure de guepe');

-- --------------------------------------------------------

--
-- Table structure for table `antecedent`
--

CREATE TABLE `antecedent` (
  `id_a` int(11) NOT NULL,
  `libelle_a` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `antecedent`
--

INSERT INTO `antecedent` (`id_a`, `libelle_a`) VALUES
(1, 'Ulcères gastriques actifs'),
(2, 'Tendinite'),
(3, 'Insuffisance rénale'),
(4, 'Grossesse'),
(5, 'Hyperkaliémie'),
(6, 'Hypotension sévère'),
(7, 'Syndrome sérotoninergique'),
(8, 'Maladie du foie active'),
(9, 'Dépendance aux substances'),
(10, 'Infections fongiques systémiques'),
(11, 'Angioedème'),
(12, 'Tachycardie'),
(13, 'Dépendance'),
(14, 'Porphyrie aiguë'),
(21, 'Allergie au cacao'),
(22, '');

-- --------------------------------------------------------

--
-- Table structure for table `a_eu`
--

CREATE TABLE `a_eu` (
  `id_a` int(11) NOT NULL,
  `id_p` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `a_eu`
--

INSERT INTO `a_eu` (`id_a`, `id_p`) VALUES
(1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `est`
--

CREATE TABLE `est` (
  `id_al` int(11) NOT NULL,
  `id_p` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `est`
--

INSERT INTO `est` (`id_al`, `id_p`) VALUES
(1, 7),
(3, 7),
(3, 11),
(8, 11);

-- --------------------------------------------------------

--
-- Table structure for table `incompatible`
--

CREATE TABLE `incompatible` (
  `id` int(11) NOT NULL,
  `id_a` int(11) DEFAULT NULL,
  `id_med` int(11) NOT NULL,
  `id_al` int(11) DEFAULT NULL,
  `id_med_Medicament` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `incompatible`
--

INSERT INTO `incompatible` (`id`, `id_a`, `id_med`, `id_al`, `id_med_Medicament`) VALUES
(20, 22, 30, 1, 30),
(21, 22, 32, 4, NULL),
(22, 14, 39, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medecin`
--

CREATE TABLE `medecin` (
  `id_m` int(11) NOT NULL,
  `nom_m` varchar(50) NOT NULL,
  `prenom_m` varchar(50) NOT NULL,
  `birthday_m` date NOT NULL,
  `login_m` varchar(50) NOT NULL,
  `password_m` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medecin`
--

INSERT INTO `medecin` (`id_m`, `nom_m`, `prenom_m`, `birthday_m`, `login_m`, `password_m`) VALUES
(3, 'Sanjuan', 'Corentin', '2005-12-13', 'sanjuanc', '$2a$13$0uCfsVd6tWi8L5VyPoCvsujiiKxUssNflyJJI8D7PBZkRal72hRRK'),
(5, 'Administrateur', 'Administrateur', '2024-01-12', 'administrateur', '$2a$13$NKNX3x8LJD54OO1JsTyhvukMT/.dXLb1vTQdOSAIfrAczMeARONJa'),
(6, 'Testeur', 'testeur', '2024-01-20', 'testeur', '$2a$13$VcLzfl54cXNqlFupdJR7PeHKfTZy.dBozEuvr4PeoimvbVZxB.9tC');

-- --------------------------------------------------------

--
-- Table structure for table `medicament`
--

CREATE TABLE `medicament` (
  `id_med` int(11) NOT NULL,
  `libelle_med` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicament`
--

INSERT INTO `medicament` (`id_med`, `libelle_med`) VALUES
(30, 'Aspirine'),
(31, 'Paracétamol'),
(32, 'Ibuprofène'),
(33, 'Amoxicilline'),
(34, 'Ciprofloxacine'),
(35, 'Metformine'),
(36, 'Omeprazole'),
(37, 'Losartan'),
(38, 'Simvastatine'),
(39, 'Amlodipine'),
(40, 'Atorvastatine'),
(41, 'Sertraline'),
(42, 'Fluoxetine'),
(43, 'Diazepam'),
(44, 'Prednisone'),
(45, 'Lisinopril'),
(46, 'Albuterol'),
(47, 'Gabapentine'),
(48, 'Ranitidine'),
(49, 'Warfarine');

-- --------------------------------------------------------

--
-- Table structure for table `ordonnance`
--

CREATE TABLE `ordonnance` (
  `id_o` int(11) NOT NULL,
  `posologie` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `duree_traitement` int(11) NOT NULL,
  `instruction_specifique` varchar(50) NOT NULL,
  `id_m` int(11) NOT NULL,
  `id_p` int(11) NOT NULL,
  `id_med` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordonnance`
--

INSERT INTO `ordonnance` (`id_o`, `posologie`, `date`, `duree_traitement`, `instruction_specifique`, `id_m`, `id_p`, `id_med`) VALUES
(15, '4 fois par jour', '2024-01-16', 7, 'A prendre après manger', 3, 7, 46),
(16, '1 fois par jour', '2024-01-16', 4, '', 3, 8, 46),
(18, '1 fois par jour', '2024-01-20', 7, '', 3, 7, 43);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id_p` int(11) NOT NULL,
  `nom_p` varchar(50) NOT NULL,
  `prenom_p` varchar(50) NOT NULL,
  `sexe` char(5) NOT NULL,
  `birthday_p` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id_p`, `nom_p`, `prenom_p`, `sexe`, `birthday_p`) VALUES
(7, 'Colombet ', 'Josselyn', 'Homme', '1969-02-07'),
(8, 'Bendahmane', 'Mounir', 'Homme', '1990-06-13'),
(9, 'Martin', 'Olivier', 'Homme', '1969-03-06'),
(10, 'Zidane', 'Zinedine', 'Homme', '1967-06-21'),
(11, 'Macron', 'Emmanuel', 'Homme', '1986-07-07'),
(12, 'Bardot', 'Brigitte', 'Femme', '1951-07-10'),
(13, 'Bernier', 'Michelle', 'Femme', '1953-11-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allergie`
--
ALTER TABLE `allergie`
  ADD PRIMARY KEY (`id_al`);

--
-- Indexes for table `antecedent`
--
ALTER TABLE `antecedent`
  ADD PRIMARY KEY (`id_a`);

--
-- Indexes for table `a_eu`
--
ALTER TABLE `a_eu`
  ADD PRIMARY KEY (`id_a`,`id_p`),
  ADD KEY `a_eu_Patient0_FK` (`id_p`);

--
-- Indexes for table `est`
--
ALTER TABLE `est`
  ADD PRIMARY KEY (`id_al`,`id_p`),
  ADD KEY `est_Patient0_FK` (`id_p`);

--
-- Indexes for table `incompatible`
--
ALTER TABLE `incompatible`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incompatible_Antecedent_FK` (`id_a`),
  ADD KEY `incompatible_Medicament0_FK` (`id_med`),
  ADD KEY `incompatible_Allergie1_FK` (`id_al`),
  ADD KEY `incompatible_Medicament2_FK` (`id_med_Medicament`);

--
-- Indexes for table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`id_m`);

--
-- Indexes for table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id_med`);

--
-- Indexes for table `ordonnance`
--
ALTER TABLE `ordonnance`
  ADD PRIMARY KEY (`id_o`),
  ADD KEY `ordonnance_Medecin_FK` (`id_m`),
  ADD KEY `ordonnance_Patient0_FK` (`id_p`),
  ADD KEY `ordonnance_Medicament1_FK` (`id_med`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id_p`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allergie`
--
ALTER TABLE `allergie`
  MODIFY `id_al` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `antecedent`
--
ALTER TABLE `antecedent`
  MODIFY `id_a` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `incompatible`
--
ALTER TABLE `incompatible`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `id_m` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `id_med` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `ordonnance`
--
ALTER TABLE `ordonnance`
  MODIFY `id_o` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `a_eu`
--
ALTER TABLE `a_eu`
  ADD CONSTRAINT `a_eu_Antecedent_FK` FOREIGN KEY (`id_a`) REFERENCES `antecedent` (`id_a`),
  ADD CONSTRAINT `a_eu_Patient0_FK` FOREIGN KEY (`id_p`) REFERENCES `patient` (`id_p`);

--
-- Constraints for table `est`
--
ALTER TABLE `est`
  ADD CONSTRAINT `est_Allergie_FK` FOREIGN KEY (`id_al`) REFERENCES `allergie` (`id_al`),
  ADD CONSTRAINT `est_Patient0_FK` FOREIGN KEY (`id_p`) REFERENCES `patient` (`id_p`);

--
-- Constraints for table `incompatible`
--
ALTER TABLE `incompatible`
  ADD CONSTRAINT `incompatible_Allergie1_FK` FOREIGN KEY (`id_al`) REFERENCES `allergie` (`id_al`),
  ADD CONSTRAINT `incompatible_Antecedent_FK` FOREIGN KEY (`id_a`) REFERENCES `antecedent` (`id_a`),
  ADD CONSTRAINT `incompatible_Medicament0_FK` FOREIGN KEY (`id_med`) REFERENCES `medicament` (`id_med`),
  ADD CONSTRAINT `incompatible_Medicament2_FK` FOREIGN KEY (`id_med_Medicament`) REFERENCES `medicament` (`id_med`);

--
-- Constraints for table `ordonnance`
--
ALTER TABLE `ordonnance`
  ADD CONSTRAINT `ordonnance_Medecin_FK` FOREIGN KEY (`id_m`) REFERENCES `medecin` (`id_m`),
  ADD CONSTRAINT `ordonnance_Medicament1_FK` FOREIGN KEY (`id_med`) REFERENCES `medicament` (`id_med`),
  ADD CONSTRAINT `ordonnance_Patient0_FK` FOREIGN KEY (`id_p`) REFERENCES `patient` (`id_p`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
