-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 12 avr. 2025 à 00:42
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rahmansfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `assiette`
--

CREATE TABLE `assiette` (
  `id_assiette` varchar(50) NOT NULL,
  `nom_assiette` varchar(50) NOT NULL,
  `prix_assiette` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `assiette`
--

INSERT INTO `assiette` (`id_assiette`, `nom_assiette`, `prix_assiette`) VALUES
('assiette_kebab', 'KEBAB', 9.90),
('assiette_mixte', 'GRILLÉ MIXTE', 13.00),
('assiette_poulet', 'POULET MARINÉ', 9.90);

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

CREATE TABLE `boisson` (
  `id_boisson` varchar(50) NOT NULL,
  `nom_boisson` varchar(50) NOT NULL,
  `prix_boisson` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`id_boisson`, `nom_boisson`, `prix_boisson`) VALUES
('boisson_7up_33cl', '7Up 33cl', 1.20),
('boisson_ayran', 'Ayran', 1.50),
('boisson_bouteille_1.5L', 'Bouteille soda 1.5L', 2.50),
('boisson_cafe', 'Café', 3.00),
('boisson_caprisun', 'Capri-Sun', 0.80),
('boisson_chai', 'Chai', 2.50),
('boisson_coca_33cl', 'Coca-Cola 33cl', 1.20),
('boisson_eau_1.5L', 'Eau 1.5L', 1.50),
('boisson_eau_50cl', 'Eau 50cl', 0.80),
('boisson_fanta_33cl', 'Fanta 33cl', 1.20),
('boisson_freeze', 'Freeze', 1.50),
('boisson_icetea_33cl', 'Ice-Tea 33cl', 1.20),
('boisson_monster', 'Monster', 2.00),
('boisson_oasis_33cl', 'Oasis 33cl', 1.20),
('boisson_orangina_33cl', 'Orangina 33cl', 1.20),
('boisson_pepsi_33cl', 'Pepsi 33cl', 1.20),
('boisson_perrier_33cl', 'Perrier 33cl', 1.20),
('boisson_redbull', 'Red Bull', 2.00),
('boisson_sprite_33cl', 'Sprite 33cl', 1.20),
('boisson_the', 'Thé', 1.50);

-- --------------------------------------------------------

--
-- Structure de la table `burger`
--

CREATE TABLE `burger` (
  `id_burger` varchar(50) NOT NULL,
  `nom_burger` varchar(50) DEFAULT NULL,
  `prix_burger` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `burger`
--

INSERT INTO `burger` (`id_burger`, `nom_burger`, `prix_burger`) VALUES
('burger_americain', 'AMERICAIN', 7.50),
('burger_bacon', 'BACONBURGER', 8.50),
('burger_big', 'LE BIG', 11.50),
('burger_cheeseburger', 'CHEESEBURGER', 10.50),
('burger_chef', 'DU CHEF', 12.50),
('burger_chicken', 'CHICKEN', 6.90),
('burger_classic', 'LE CLASSIC', 8.50),
('burger_fish', 'FISH BURGER', 6.90),
('burger_vegetarien', 'VÉGÉTARIEN', 6.90);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` varchar(50) NOT NULL,
  `prix_commande` decimal(15,2) NOT NULL,
  `date_heure_commande` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `composer_assiette`
--

CREATE TABLE `composer_assiette` (
  `id_ingredient` varchar(50) NOT NULL,
  `id_assiette` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `composer_assiette`
--

INSERT INTO `composer_assiette` (`id_ingredient`, `id_assiette`, `quantite`) VALUES
('ing_frites', 'assiette_kebab', 1),
('ing_frites', 'assiette_mixte', 1),
('ing_frites', 'assiette_poulet', 1),
('ing_kebab', 'assiette_kebab', 1),
('ing_kebab', 'assiette_mixte', 1),
('ing_merguez', 'assiette_mixte', 1),
('ing_oignon_cru', 'assiette_kebab', 1),
('ing_oignon_cru', 'assiette_mixte', 1),
('ing_oignon_cru', 'assiette_poulet', 1),
('ing_pain', 'assiette_kebab', 1),
('ing_pain', 'assiette_mixte', 1),
('ing_pain', 'assiette_poulet', 1),
('ing_poulet_marine', 'assiette_poulet', 1),
('ing_riz', 'assiette_kebab', 1),
('ing_riz', 'assiette_mixte', 1),
('ing_riz', 'assiette_poulet', 1),
('ing_salade', 'assiette_kebab', 1),
('ing_salade', 'assiette_mixte', 1),
('ing_salade', 'assiette_poulet', 1),
('ing_steak_100g', 'assiette_mixte', 1),
('ing_tomate', 'assiette_kebab', 1),
('ing_tomate', 'assiette_mixte', 1),
('ing_tomate', 'assiette_poulet', 1);

-- --------------------------------------------------------

--
-- Structure de la table `composer_burger`
--

CREATE TABLE `composer_burger` (
  `id_burger` varchar(50) NOT NULL,
  `id_ingredient` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `composer_burger`
--

INSERT INTO `composer_burger` (`id_burger`, `id_ingredient`, `quantite`) VALUES
('burger_americain', 'ing_cheddar', 2),
('burger_americain', 'ing_oignon_cru', 1),
('burger_americain', 'ing_salade', 1),
('burger_americain', 'ing_steak_100g', 1),
('burger_americain', 'ing_tomate', 1),
('burger_bacon', 'ing_bacon_dinde', 2),
('burger_bacon', 'ing_oignon_cru', 1),
('burger_bacon', 'ing_salade', 1),
('burger_bacon', 'ing_steak_45g', 2),
('burger_bacon', 'ing_tomate', 1),
('burger_big', 'ing_cheddar', 2),
('burger_big', 'ing_oignon_rouge', 1),
('burger_big', 'ing_salade', 1),
('burger_big', 'ing_steak_100g', 1),
('burger_big', 'ing_steak_pdt', 1),
('burger_big', 'ing_tomate', 1),
('burger_cheeseburger', 'ing_cheddar', 3),
('burger_cheeseburger', 'ing_oignon_rouge', 1),
('burger_cheeseburger', 'ing_pur_beurre', 1),
('burger_cheeseburger', 'ing_steak_100g', 2),
('burger_chef', 'ing_salade_marinee', 1),
('burger_chef', 'ing_sauce_chef', 1),
('burger_chef', 'ing_steak_150g', 2),
('burger_chef', 'ing_tomate', 1),
('burger_chicken', 'ing_cheddar', 2),
('burger_chicken', 'ing_oignon_cru', 1),
('burger_chicken', 'ing_salade', 1),
('burger_chicken', 'ing_steak_poulet', 1),
('burger_classic', 'ing_creme_fraiche', 1),
('burger_classic', 'ing_ketchup', 1),
('burger_classic', 'ing_oignon_cru', 1),
('burger_classic', 'ing_poivre', 1),
('burger_classic', 'ing_salade', 1),
('burger_classic', 'ing_sel', 1),
('burger_classic', 'ing_steak_150g', 1),
('burger_classic', 'ing_tomate', 1),
('burger_fish', 'ing_oignon_cru', 1),
('burger_fish', 'ing_salade', 1),
('burger_fish', 'ing_sauce_burger', 1),
('burger_fish', 'ing_steak_poisson', 1),
('burger_fish', 'ing_tomate', 1),
('burger_vegetarien', 'ing_oignon_cru', 1),
('burger_vegetarien', 'ing_salade', 1),
('burger_vegetarien', 'ing_sauce_burger', 1),
('burger_vegetarien', 'ing_steak_pdt', 2),
('burger_vegetarien', 'ing_tomate', 1);

-- --------------------------------------------------------

--
-- Structure de la table `composer_pizza`
--

CREATE TABLE `composer_pizza` (
  `id_pizza` varchar(50) NOT NULL,
  `id_ingredient` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `composer_pizza`
--

INSERT INTO `composer_pizza` (`id_pizza`, `id_ingredient`, `quantite`) VALUES
('pizza_4fromages', 'ing_base_sauce_tomate', 1),
('pizza_4fromages', 'ing_cheddar', 1),
('pizza_4fromages', 'ing_chevre', 1),
('pizza_4fromages', 'ing_mozzarella', 1),
('pizza_4fromages', 'ing_raclette', 1),
('pizza_4jambons', 'ing_base_sauce_tomate', 1),
('pizza_4jambons', 'ing_chorizo', 1),
('pizza_4jambons', 'ing_jambon_dinde', 1),
('pizza_4jambons', 'ing_lardons', 1),
('pizza_4jambons', 'ing_mozzarella', 1),
('pizza_4jambons', 'ing_salami', 1),
('pizza_americaine', 'ing_base_sauce_tomate', 1),
('pizza_americaine', 'ing_champignons', 1),
('pizza_americaine', 'ing_chorizo', 1),
('pizza_americaine', 'ing_jambon_dinde', 1),
('pizza_americaine', 'ing_merguez', 1),
('pizza_americaine', 'ing_mozzarella', 1),
('pizza_americaine', 'ing_oeuf', 1),
('pizza_boursalino', 'ing_base_creme_fraiche', 1),
('pizza_boursalino', 'ing_boursin', 1),
('pizza_boursalino', 'ing_mozzarella', 1),
('pizza_boursalino', 'ing_oeuf', 1),
('pizza_boursalino', 'ing_viande_hachee', 1),
('pizza_bretone', 'ing_base_sauce_barbecue', 1),
('pizza_bretone', 'ing_chevre', 1),
('pizza_bretone', 'ing_mozzarella', 1),
('pizza_bretone', 'ing_poulet', 1),
('pizza_bretone', 'ing_raclette', 1),
('pizza_calzone_oeuf', 'ing_base_sauce_tomate', 1),
('pizza_calzone_oeuf', 'ing_mozzarella', 1),
('pizza_calzone_oeuf', 'ing_oeuf', 1),
('pizza_calzone_saumon', 'ing_base_sauce_tomate', 1),
('pizza_calzone_saumon', 'ing_mozzarella', 1),
('pizza_calzone_saumon', 'ing_saumon', 1),
('pizza_calzone_viande_hachee', 'ing_base_sauce_tomate', 1),
('pizza_calzone_viande_hachee', 'ing_mozzarella', 1),
('pizza_calzone_viande_hachee', 'ing_viande_hachee', 1),
('pizza_campagnarde', 'ing_base_sauce_barbecue', 1),
('pizza_campagnarde', 'ing_merguez', 1),
('pizza_campagnarde', 'ing_mozzarella', 1),
('pizza_campagnarde', 'ing_oeuf', 1),
('pizza_campagnarde', 'ing_viande_hachee', 1),
('pizza_campione', 'ing_base_sauce_tomate', 1),
('pizza_campione', 'ing_champignons', 1),
('pizza_campione', 'ing_mozzarella', 1),
('pizza_campione', 'ing_oeuf', 1),
('pizza_campione', 'ing_viande_hachee', 1),
('pizza_chef', 'ing_base_creme_fraiche', 1),
('pizza_chef', 'ing_champignons', 1),
('pizza_chef', 'ing_cheddar', 1),
('pizza_chef', 'ing_chevre', 1),
('pizza_chef', 'ing_mozzarella', 1),
('pizza_chevre_miel', 'ing_base_creme_fraiche', 1),
('pizza_chevre_miel', 'ing_chevre', 1),
('pizza_chevre_miel', 'ing_miel', 1),
('pizza_chevre_miel', 'ing_mozzarella', 1),
('pizza_chicken', 'ing_base_sauce_tomate', 1),
('pizza_chicken', 'ing_mozzarella', 1),
('pizza_chicken', 'ing_pomme_de_terre', 1),
('pizza_chicken', 'ing_poulet', 1),
('pizza_delicieuse', 'ing_base_creme_fraiche', 1),
('pizza_delicieuse', 'ing_mozzarella', 1),
('pizza_delicieuse', 'ing_pomme_de_terre', 1),
('pizza_delicieuse', 'ing_poulet', 1),
('pizza_delicieuse', 'ing_viande_hachee', 1),
('pizza_del_kebab', 'ing_base_creme_fraiche', 1),
('pizza_del_kebab', 'ing_kebab', 1),
('pizza_del_kebab', 'ing_mozzarella', 1),
('pizza_del_kebab', 'ing_oeuf', 1),
('pizza_del_kebab', 'ing_oignon_cru', 1),
('pizza_del_kebab', 'ing_olives', 1),
('pizza_del_kebab', 'ing_poivron', 1),
('pizza_gourmande', 'ing_base_creme_fraiche', 1),
('pizza_gourmande', 'ing_cheddar', 1),
('pizza_gourmande', 'ing_mozzarella', 1),
('pizza_gourmande', 'ing_pomme_de_terre', 1),
('pizza_gourmande', 'ing_poulet', 1),
('pizza_hawai', 'ing_ananas', 1),
('pizza_hawai', 'ing_base_sauce_tomate', 1),
('pizza_hawai', 'ing_jambon_dinde', 1),
('pizza_hawai', 'ing_mozzarella', 1),
('pizza_indienne', 'ing_base_creme_fraiche', 1),
('pizza_indienne', 'ing_mozzarella', 1),
('pizza_indienne', 'ing_poulet', 1),
('pizza_indienne', 'ing_sauce_curry', 1),
('pizza_indienne', 'ing_viande_hachee', 1),
('pizza_juventus', 'ing_base_creme_fraiche', 1),
('pizza_juventus', 'ing_chorizo', 1),
('pizza_juventus', 'ing_mozzarella', 1),
('pizza_juventus', 'ing_oignon_cru', 1),
('pizza_juventus', 'ing_poulet', 1),
('pizza_juventus', 'ing_viande_hachee', 1),
('pizza_la_mama', 'ing_base_creme_fraiche', 1),
('pizza_la_mama', 'ing_champignons', 1),
('pizza_la_mama', 'ing_chevre', 1),
('pizza_la_mama', 'ing_mozzarella', 1),
('pizza_la_mama', 'ing_viande_hachee', 1),
('pizza_marina', 'ing_ail', 1),
('pizza_marina', 'ing_base_sauce_tomate', 1),
('pizza_marina', 'ing_citron', 1),
('pizza_marina', 'ing_cocktail_fruit_mer', 1),
('pizza_marina', 'ing_mozzarella', 1),
('pizza_marina', 'ing_persil', 1),
('pizza_mediterranea', 'ing_base_sauce_tomate', 1),
('pizza_mediterranea', 'ing_merguez', 1),
('pizza_mediterranea', 'ing_mozzarella', 1),
('pizza_mediterranea', 'ing_oeuf', 1),
('pizza_mediterranea', 'ing_oignon_cru', 1),
('pizza_mediterranea', 'ing_olives', 1),
('pizza_mediterranea', 'ing_poivron', 1),
('pizza_mexicaine', 'ing_base_sauce_tomate', 1),
('pizza_mexicaine', 'ing_merguez', 1),
('pizza_mexicaine', 'ing_mozzarella', 1),
('pizza_mexicaine', 'ing_oeuf', 1),
('pizza_mexicaine', 'ing_viande_hachee', 1),
('pizza_napoli', 'ing_base_sauce_tomate', 1),
('pizza_napoli', 'ing_jambon_dinde', 1),
('pizza_napoli', 'ing_mozzarella', 1),
('pizza_napoli', 'ing_pomme_de_terre', 1),
('pizza_napoli', 'ing_raclette', 1),
('pizza_napolitaine', 'ing_anchois', 1),
('pizza_napolitaine', 'ing_base_sauce_tomate', 1),
('pizza_napolitaine', 'ing_capres', 1),
('pizza_napolitaine', 'ing_mozzarella', 1),
('pizza_napolitaine', 'ing_olives', 1),
('pizza_orientale', 'ing_base_sauce_tomate', 1),
('pizza_orientale', 'ing_mozzarella', 1),
('pizza_orientale', 'ing_oeuf', 1),
('pizza_orientale', 'ing_olives', 1),
('pizza_orientale', 'ing_poivron', 1),
('pizza_orientale', 'ing_viande_hachee', 1),
('pizza_palermo', 'ing_base_creme_fraiche', 1),
('pizza_palermo', 'ing_champignons', 1),
('pizza_palermo', 'ing_chevre', 1),
('pizza_palermo', 'ing_mozzarella', 1),
('pizza_palermo', 'ing_poulet', 1),
('pizza_raclette', 'ing_base_sauce_tomate', 1),
('pizza_raclette', 'ing_creme_fraiche', 1),
('pizza_raclette', 'ing_lardons', 1),
('pizza_raclette', 'ing_mozzarella', 1),
('pizza_raclette', 'ing_pomme_de_terre', 1),
('pizza_raclette', 'ing_raclette', 1),
('pizza_regina', 'ing_base_sauce_tomate', 1),
('pizza_regina', 'ing_champignons', 1),
('pizza_regina', 'ing_jambon_dinde', 1),
('pizza_regina', 'ing_mozzarella', 1),
('pizza_rimini', 'ing_base_creme_fraiche', 1),
('pizza_rimini', 'ing_mozzarella', 1),
('pizza_rimini', 'ing_pomme_de_terre', 1),
('pizza_rimini', 'ing_poulet', 1),
('pizza_romantica', 'ing_base_sauce_tomate', 1),
('pizza_romantica', 'ing_chorizo', 1),
('pizza_romantica', 'ing_creme_fraiche', 1),
('pizza_romantica', 'ing_jambon_dinde', 1),
('pizza_romantica', 'ing_mozzarella', 1),
('pizza_romantica', 'ing_oeuf', 1),
('pizza_savoyarde', 'ing_base_creme_fraiche', 1),
('pizza_savoyarde', 'ing_jambon_dinde', 1),
('pizza_savoyarde', 'ing_mozzarella', 1),
('pizza_savoyarde', 'ing_pomme_de_terre', 1),
('pizza_savoyarde', 'ing_reblochon', 1),
('pizza_tonara', 'ing_base_sauce_tomate', 1),
('pizza_tonara', 'ing_mozzarella', 1),
('pizza_tonara', 'ing_oeuf', 1),
('pizza_tonara', 'ing_olives', 1),
('pizza_tonara', 'ing_poivron', 1),
('pizza_tonara', 'ing_thon', 1),
('pizza_torino', 'ing_base_creme_fraiche', 1),
('pizza_torino', 'ing_chevre', 1),
('pizza_torino', 'ing_mozzarella', 1),
('pizza_torino', 'ing_thon', 1),
('pizza_vegetarienne', 'ing_base_sauce_tomate', 1),
('pizza_vegetarienne', 'ing_champignons', 1),
('pizza_vegetarienne', 'ing_mozzarella', 1),
('pizza_vegetarienne', 'ing_olives', 1),
('pizza_vegetarienne', 'ing_poivron', 1),
('pizza_vegetarienne', 'ing_pomme_de_terre', 1),
('pizza_venezia', 'ing_base_creme_fraiche', 1),
('pizza_venezia', 'ing_citron', 1),
('pizza_venezia', 'ing_mozzarella', 1),
('pizza_venezia', 'ing_saumon', 1);

-- --------------------------------------------------------

--
-- Structure de la table `composer_sandwich`
--

CREATE TABLE `composer_sandwich` (
  `id_sandwich` varchar(50) NOT NULL,
  `id_ingredient` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `composer_sandwich`
--

INSERT INTO `composer_sandwich` (`id_sandwich`, `id_ingredient`, `quantite`) VALUES
('sandwich_americain', 'ing_cheddar', 2),
('sandwich_americain', 'ing_oignon_cru', 1),
('sandwich_americain', 'ing_salade', 1),
('sandwich_americain', 'ing_steak_100g', 1),
('sandwich_americain', 'ing_steak_45g', 1),
('sandwich_americain', 'ing_tomate', 1),
('sandwich_boeuf', 'ing_oignon_cru', 1),
('sandwich_boeuf', 'ing_salade', 1),
('sandwich_boeuf', 'ing_tomate', 1),
('sandwich_boeuf', 'ing_viande_hachee', 1),
('sandwich_curry', 'ing_cheddar', 1),
('sandwich_curry', 'ing_oignon_cru', 1),
('sandwich_curry', 'ing_poulet_curry', 1),
('sandwich_curry', 'ing_salade', 1),
('sandwich_curry', 'ing_tomate', 1),
('sandwich_geant', 'ing_cheddar', 3),
('sandwich_geant', 'ing_oignon_cru', 1),
('sandwich_geant', 'ing_salade', 1),
('sandwich_geant', 'ing_steak_100g', 2),
('sandwich_geant', 'ing_tomate', 1),
('sandwich_kebab', 'ing_kebab', 1),
('sandwich_kebab', 'ing_oignon_cru', 1),
('sandwich_kebab', 'ing_salade', 1),
('sandwich_kebab', 'ing_tomate', 1),
('sandwich_marine', 'ing_cheddar', 1),
('sandwich_marine', 'ing_oignon_cru', 1),
('sandwich_marine', 'ing_oignon_frits', 1),
('sandwich_marine', 'ing_poulet_marine', 1),
('sandwich_marine', 'ing_salade', 1),
('sandwich_marine', 'ing_tomate', 1),
('sandwich_merguez', 'ing_merguez', 2),
('sandwich_merguez', 'ing_oignon_cru', 1),
('sandwich_merguez', 'ing_salade', 1),
('sandwich_merguez', 'ing_tomate', 1),
('sandwich_mixte_grille', 'ing_bacon_dinde', 2),
('sandwich_mixte_grille', 'ing_oignon_cru', 1),
('sandwich_mixte_grille', 'ing_salade', 1),
('sandwich_mixte_grille', 'ing_saucisse', 1),
('sandwich_mixte_grille', 'ing_steak_45g', 2),
('sandwich_mixte_grille', 'ing_tomate', 1),
('sandwich_poulet_fromage', 'ing_cheddar', 1),
('sandwich_poulet_fromage', 'ing_emmental', 1),
('sandwich_poulet_fromage', 'ing_oignon_cru', 1),
('sandwich_poulet_fromage', 'ing_poulet', 1),
('sandwich_poulet_fromage', 'ing_salade', 1),
('sandwich_poulet_fromage', 'ing_tomate', 1),
('sandwich_triple_steak', 'ing_cheddar', 3),
('sandwich_triple_steak', 'ing_oignon_cru', 1),
('sandwich_triple_steak', 'ing_salade', 1),
('sandwich_triple_steak', 'ing_steak_45g', 3),
('sandwich_triple_steak', 'ing_tomate', 1);

-- --------------------------------------------------------

--
-- Structure de la table `composer_tacos`
--

CREATE TABLE `composer_tacos` (
  `id_tacos` varchar(50) NOT NULL,
  `id_ingredient` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `composer_texmex`
--

CREATE TABLE `composer_texmex` (
  `id_ingredient` varchar(50) NOT NULL,
  `id_texmex` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `composer_texmex`
--

INSERT INTO `composer_texmex` (`id_ingredient`, `id_texmex`, `quantite`) VALUES
('ing_wings', 'texmex_menu1', 8);

-- --------------------------------------------------------

--
-- Structure de la table `contenir_assiette`
--

CREATE TABLE `contenir_assiette` (
  `id_commande` varchar(50) NOT NULL,
  `id_assiette` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contenir_boisson`
--

CREATE TABLE `contenir_boisson` (
  `id_commande` varchar(50) NOT NULL,
  `id_boisson` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contenir_burger`
--

CREATE TABLE `contenir_burger` (
  `id_burger` varchar(50) NOT NULL,
  `id_commande` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contenir_dessert`
--

CREATE TABLE `contenir_dessert` (
  `id_commande` varchar(50) NOT NULL,
  `id_dessert` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contenir_pizza`
--

CREATE TABLE `contenir_pizza` (
  `id_pizza` varchar(50) NOT NULL,
  `id_commande` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contenir_sandwich`
--

CREATE TABLE `contenir_sandwich` (
  `id_sandwich` varchar(50) NOT NULL,
  `id_commande` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contenir_tacos`
--

CREATE TABLE `contenir_tacos` (
  `id_tacos` varchar(50) NOT NULL,
  `id_commande` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contenir_texmex`
--

CREATE TABLE `contenir_texmex` (
  `id_commande` varchar(50) NOT NULL,
  `id_texmex` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dessert`
--

CREATE TABLE `dessert` (
  `id_dessert` varchar(50) NOT NULL,
  `nom_dessert` varchar(50) NOT NULL,
  `prix_dessert` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dessert`
--

INSERT INTO `dessert` (`id_dessert`, `nom_dessert`, `prix_dessert`) VALUES
('dessert_brownie', 'BROWNIE', 2.50),
('dessert_tarteaux', 'TARTEAUX', 2.50),
('dessert_tartine', 'TARTINE', 2.50);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id_ingredient` varchar(50) NOT NULL,
  `nom_ingredient` varchar(50) NOT NULL,
  `masse_ingredient` int(11) NOT NULL,
  `id_type_ingredient` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`, `masse_ingredient`, `id_type_ingredient`) VALUES
('ing_ail', 'Ail', 10, 'type_autre'),
('ing_ananas', 'Ananas', 40, 'type_autre'),
('ing_anchois', 'Anchois', 40, 'type_mer'),
('ing_bacon_dinde', 'Bacon de dinde', 30, 'type_viande'),
('ing_base_creme_fraiche', 'Base crème fraîche', 100, 'type_base_pizza'),
('ing_base_sauce_barbecue', 'Base barbecue', 100, 'type_base_pizza'),
('ing_base_sauce_tomate', 'Base tomate', 100, 'type_base_pizza'),
('ing_boursin', 'Boursin', 30, 'type_fromage'),
('ing_capres', 'Câpres', 10, 'type_autre'),
('ing_champignons', 'Champignons', 30, 'type_legume'),
('ing_cheddar', 'Cheddar', 30, 'type_fromage'),
('ing_chevre', 'Chèvre', 30, 'type_fromage'),
('ing_chorizo', 'Chorizo', 40, 'type_viande'),
('ing_citron', 'Citron', 20, 'type_autre'),
('ing_cocktail_fruit_mer', 'Cocktail fruit de mer', 50, 'type_mer'),
('ing_cordon_bleu', 'Cordon Bleu', 50, 'type_viande'),
('ing_creme_fraiche', 'Crème fraîche', 50, 'type_autre'),
('ing_emmental', 'Emmental', 30, 'type_fromage'),
('ing_frites', 'Frites', 100, 'type_autre'),
('ing_jambon_dinde', 'Jambon de dinde', 45, 'type_viande'),
('ing_kebab', 'Kebab', 50, 'type_viande'),
('ing_ketchup', 'Ketchup', 20, 'type_autre'),
('ing_lardons', 'Lardons', 40, 'type_viande'),
('ing_merguez', 'Merguez', 50, 'type_viande'),
('ing_miel', 'Miel', 20, 'type_autre'),
('ing_mozzarella', 'Mozzarella', 30, 'type_fromage'),
('ing_nuggets', 'Nuggets', 50, 'type_viande'),
('ing_oeuf', 'Oeuf', 60, 'type_autre'),
('ing_oignon_cru', 'Oignon', 20, 'type_crudite'),
('ing_oignon_frits', 'Oignon frits', 20, 'type_legume'),
('ing_oignon_rouge', 'Oignon rouge', 20, 'type_crudite'),
('ing_olives', 'Olives', 20, 'type_legume'),
('ing_pain', 'Pain', 50, 'type_autre'),
('ing_persil', 'Persil', 5, 'type_autre'),
('ing_poivre', 'Poivre', 5, 'type_autre'),
('ing_poivron', 'Poivron', 50, 'type_legume'),
('ing_poivronade', 'Poivronade', 20, 'type_legume'),
('ing_pomme_de_terre', 'Pomme de terre', 100, 'type_legume'),
('ing_poulet', 'Poulet', 50, 'type_viande'),
('ing_poulet_curry', 'Poulet Curry', 50, 'type_viande'),
('ing_poulet_marine', 'Poulet Mariné', 50, 'type_viande'),
('ing_pur_beurre', 'Pur beurre', 20, 'type_autre'),
('ing_raclette', 'Raclette', 30, 'type_fromage'),
('ing_reblochon', 'Reblochon', 60, 'type_fromage'),
('ing_riz', 'Riz', 150, 'type_autre'),
('ing_salade', 'Salade', 30, 'type_crudite'),
('ing_salade_marinee', 'Salade marinée', 30, 'type_crudite'),
('ing_salami', 'Salami', 60, 'type_viande'),
('ing_sauce_burger', 'Sauce burger', 20, 'type_autre'),
('ing_sauce_chef', 'Sauce chef', 20, 'type_autre'),
('ing_sauce_curry', 'Sauce curry', 20, 'type_autre'),
('ing_saucisse', 'Saucisse', 50, 'type_viande'),
('ing_saumon', 'Saumon fumé', 60, 'type_mer'),
('ing_sel', 'Sel', 5, 'type_autre'),
('ing_steak_100g', 'Steak 100g', 100, 'type_viande'),
('ing_steak_150g', 'Steak 150g', 150, 'type_viande'),
('ing_steak_45g', 'Steak 45g', 45, 'type_viande'),
('ing_steak_pdt', 'Steak pomme de terre', 100, 'type_autre'),
('ing_steak_poisson', 'Steak poisson', 100, 'type_mer'),
('ing_steak_poulet', 'Steak poulet', 100, 'type_viande'),
('ing_tenders', 'Tenders', 50, 'type_viande'),
('ing_thon', 'Thon', 60, 'type_mer'),
('ing_tomate', 'Tomate', 40, 'type_crudite'),
('ing_vache_qui_rit', 'Vache qui rit', 20, 'type_fromage'),
('ing_viande_hachee', 'Viande hachée', 50, 'type_viande'),
('ing_wings', 'Wings', 70, 'type_viande');

-- --------------------------------------------------------

--
-- Structure de la table `peut_avoir`
--

CREATE TABLE `peut_avoir` (
  `id_tacos` varchar(50) NOT NULL,
  `id_supplement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pizza`
--

CREATE TABLE `pizza` (
  `id_pizza` varchar(50) NOT NULL,
  `nom_pizza` varchar(50) DEFAULT NULL,
  `id_taille_pizza` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pizza`
--

INSERT INTO `pizza` (`id_pizza`, `nom_pizza`, `id_taille_pizza`) VALUES
('pizza_4fromages', '4 FROMAGES', 'taille_junior'),
('pizza_4jambons', '4 JAMBONS', 'taille_junior'),
('pizza_americaine', 'AMERICAINE', 'taille_junior'),
('pizza_boursalino', 'BOURSALINO', 'taille_junior'),
('pizza_bretone', 'BRETONE', 'taille_junior'),
('pizza_calzone_oeuf', 'CALZONE SOUFLEE OEUF', 'taille_junior'),
('pizza_calzone_saumon', 'CALZONE SOUFLEE SAUMON', 'taille_junior'),
('pizza_calzone_viande_hachee', 'CALZONE SOUFLEE VIANDE HACHÉE', 'taille_junior'),
('pizza_campagnarde', 'CAMPAGNARDE', 'taille_junior'),
('pizza_campione', 'CAMPIONE', 'taille_junior'),
('pizza_chef', 'CHEF', 'taille_junior'),
('pizza_chevre_miel', 'CHEVRE MIEL', 'taille_junior'),
('pizza_chicken', 'CHICKEN', 'taille_junior'),
('pizza_delicieuse', 'DELICIEUSE', 'taille_junior'),
('pizza_del_kebab', 'DEL KEBAB', 'taille_junior'),
('pizza_gourmande', 'GOURMANDE', 'taille_junior'),
('pizza_hawai', 'HAWAI', 'taille_junior'),
('pizza_indienne', 'INDIENNE', 'taille_junior'),
('pizza_juventus', 'JUVENTUS', 'taille_junior'),
('pizza_la_mama', 'LA MAMA', 'taille_junior'),
('pizza_marina', 'MARINA', 'taille_junior'),
('pizza_mediterranea', 'MEDITERRANEA', 'taille_junior'),
('pizza_mexicaine', 'MEXICAINE', 'taille_junior'),
('pizza_napoli', 'DJ NAPOLI', 'taille_junior'),
('pizza_napolitaine', 'NAPOLITAINE', 'taille_junior'),
('pizza_orientale', 'ORIENTALE', 'taille_junior'),
('pizza_palermo', 'PALERMO', 'taille_junior'),
('pizza_raclette', 'RACLETTE', 'taille_junior'),
('pizza_regina', 'REGINA', 'taille_junior'),
('pizza_rimini', 'RIMINI', 'taille_junior'),
('pizza_romantica', 'ROMANTICA', 'taille_junior'),
('pizza_savoyarde', 'SAVOYARDE', 'taille_junior'),
('pizza_tonara', 'TONARA', 'taille_junior'),
('pizza_torino', 'TORINO', 'taille_junior'),
('pizza_vegetarienne', 'VEGETARIENNE', 'taille_junior'),
('pizza_venezia', 'VENEZIA', 'taille_junior');

-- --------------------------------------------------------

--
-- Structure de la table `sandwich`
--

CREATE TABLE `sandwich` (
  `id_sandwich` varchar(50) NOT NULL,
  `nom_sandwich` varchar(50) NOT NULL,
  `prix_sandwich` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sandwich`
--

INSERT INTO `sandwich` (`id_sandwich`, `nom_sandwich`, `prix_sandwich`) VALUES
('sandwich_americain', 'AMÉRICAIN', 8.00),
('sandwich_boeuf', 'BOEUF', 7.90),
('sandwich_curry', 'CURRY', 7.50),
('sandwich_geant', 'LE GÉANT', 8.90),
('sandwich_kebab', 'KEBAB', 7.20),
('sandwich_marine', 'MARINÉ', 7.50),
('sandwich_merguez', 'MERGUEZ', 7.20),
('sandwich_mixte_grille', 'MIXTE GRILLÉ', 9.00),
('sandwich_poulet_fromage', 'POULET FROMAGE', 7.90),
('sandwich_triple_steak', 'TRIPLE STEAK', 7.20);

-- --------------------------------------------------------

--
-- Structure de la table `supplement`
--

CREATE TABLE `supplement` (
  `id_supplement` varchar(50) NOT NULL,
  `nom_supplement` varchar(50) NOT NULL,
  `prix_supplement` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `supplement`
--

INSERT INTO `supplement` (`id_supplement`, `nom_supplement`, `prix_supplement`) VALUES
('supp_bacon_dinde', 'Bacon de dinde', 1.00),
('supp_blanc_poulet', 'Blanc de poulet', 1.00),
('supp_boursin', 'Boursin', 0.50),
('supp_champignons', 'Champignons', 0.50),
('supp_cheddar', 'Cheddar', 1.00),
('supp_chevre', 'Chèvre', 1.00),
('supp_frites_200g', 'Frites 200g', 0.90),
('supp_jambon_dinde', 'Jambon de dinde', 1.00),
('supp_lardons', 'Lardons', 1.00),
('supp_mozzarella', 'Mozzarella', 1.00),
('supp_oeuf', 'Oeuf', 1.00),
('supp_oignon_frits', 'Oignon frits', 0.50),
('supp_olives', 'Olives', 0.50),
('supp_poivronade', 'Poivronade', 0.50),
('supp_raclette', 'Raclette', 1.00),
('supp_vache_qui_rit', 'Vache qui rit', 0.50);

-- --------------------------------------------------------

--
-- Structure de la table `supplement_gratine`
--

CREATE TABLE `supplement_gratine` (
  `id_supplement_gratine` varchar(50) NOT NULL,
  `nom_supplement_gratine` varchar(50) NOT NULL,
  `supplement_gratine_prix` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `supplement_gratine`
--

INSERT INTO `supplement_gratine` (`id_supplement_gratine`, `nom_supplement_gratine`, `supplement_gratine_prix`) VALUES
('gratine_boursin_chevre', 'Boursin chèvre', 1.50),
('gratine_cheddar', 'Cheddar', 1.50),
('gratine_emmental', 'Emmental', 1.50),
('gratine_mozzarella', 'Mozzarella', 1.50),
('gratine_mozzarella_chevre', 'Mozzarella chèvre', 1.50),
('gratine_raclette_lardons', 'Raclette lardons', 1.50);

-- --------------------------------------------------------

--
-- Structure de la table `tacos`
--

CREATE TABLE `tacos` (
  `id_tacos` varchar(50) NOT NULL,
  `tacos_a_supplement_gratine` tinyint(1) NOT NULL,
  `id_supplement_gratine` varchar(50) DEFAULT NULL,
  `id_taille_tacos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tacos`
--

INSERT INTO `tacos` (`id_tacos`, `tacos_a_supplement_gratine`, `id_supplement_gratine`, `id_taille_tacos`) VALUES
('tacos_L', 0, NULL, 'taille_tacos_L'),
('tacos_M', 0, NULL, 'taille_tacos_M'),
('tacos_XL', 0, NULL, 'taille_tacos_XL'),
('tacos_XXL', 0, NULL, 'taille_tacos_XXL');

-- --------------------------------------------------------

--
-- Structure de la table `taille_pizza`
--

CREATE TABLE `taille_pizza` (
  `id_taille_pizza` varchar(50) NOT NULL,
  `taille_pizza` varchar(50) NOT NULL,
  `prix_taille_pizza` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `taille_pizza`
--

INSERT INTO `taille_pizza` (`id_taille_pizza`, `taille_pizza`, `prix_taille_pizza`) VALUES
('taille_junior', 'Junior', 8.00),
('taille_mega', 'Méga', 15.00),
('taille_senior', 'Senior', 12.00);

-- --------------------------------------------------------

--
-- Structure de la table `taille_tacos`
--

CREATE TABLE `taille_tacos` (
  `id_taille_tacos` varchar(50) NOT NULL,
  `taille_tacos` varchar(50) NOT NULL,
  `prix_taille_tacos` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `taille_tacos`
--

INSERT INTO `taille_tacos` (`id_taille_tacos`, `taille_tacos`, `prix_taille_tacos`) VALUES
('taille_tacos_L', 'L', 6.00),
('taille_tacos_M', 'M', 7.50),
('taille_tacos_XL', 'XL', 9.90),
('taille_tacos_XXL', 'XXL', 13.50);

-- --------------------------------------------------------

--
-- Structure de la table `texmex`
--

CREATE TABLE `texmex` (
  `id_texmex` varchar(50) NOT NULL,
  `nom_texmex` varchar(50) DEFAULT NULL,
  `prix_texmex` decimal(15,2) NOT NULL,
  `texmex_a_boisson` tinyint(1) NOT NULL,
  `id_boisson` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `texmex`
--

INSERT INTO `texmex` (`id_texmex`, `nom_texmex`, `prix_texmex`, `texmex_a_boisson`, `id_boisson`) VALUES
('texmex_menu1', 'Menu 1', 6.50, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_ingredient`
--

CREATE TABLE `type_ingredient` (
  `id_type_ingredient` varchar(50) NOT NULL,
  `type_ingredient` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_ingredient`
--

INSERT INTO `type_ingredient` (`id_type_ingredient`, `type_ingredient`) VALUES
('type_autre', 'Autre'),
('type_base_pizza', 'Base Pizza'),
('type_crudite', 'Crudité'),
('type_fromage', 'Fromage'),
('type_legume', 'Légume'),
('type_mer', 'Mer'),
('type_viande', 'Viande');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assiette`
--
ALTER TABLE `assiette`
  ADD PRIMARY KEY (`id_assiette`);

--
-- Index pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id_boisson`);

--
-- Index pour la table `burger`
--
ALTER TABLE `burger`
  ADD PRIMARY KEY (`id_burger`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`);

--
-- Index pour la table `composer_assiette`
--
ALTER TABLE `composer_assiette`
  ADD PRIMARY KEY (`id_ingredient`,`id_assiette`),
  ADD KEY `id_assiette` (`id_assiette`);

--
-- Index pour la table `composer_burger`
--
ALTER TABLE `composer_burger`
  ADD PRIMARY KEY (`id_burger`,`id_ingredient`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Index pour la table `composer_pizza`
--
ALTER TABLE `composer_pizza`
  ADD PRIMARY KEY (`id_pizza`,`id_ingredient`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Index pour la table `composer_sandwich`
--
ALTER TABLE `composer_sandwich`
  ADD PRIMARY KEY (`id_sandwich`,`id_ingredient`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Index pour la table `composer_tacos`
--
ALTER TABLE `composer_tacos`
  ADD PRIMARY KEY (`id_tacos`,`id_ingredient`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Index pour la table `composer_texmex`
--
ALTER TABLE `composer_texmex`
  ADD PRIMARY KEY (`id_ingredient`,`id_texmex`),
  ADD KEY `id_texmex` (`id_texmex`);

--
-- Index pour la table `contenir_assiette`
--
ALTER TABLE `contenir_assiette`
  ADD PRIMARY KEY (`id_commande`,`id_assiette`),
  ADD KEY `id_assiette` (`id_assiette`);

--
-- Index pour la table `contenir_boisson`
--
ALTER TABLE `contenir_boisson`
  ADD PRIMARY KEY (`id_commande`,`id_boisson`),
  ADD KEY `id_boisson` (`id_boisson`);

--
-- Index pour la table `contenir_burger`
--
ALTER TABLE `contenir_burger`
  ADD PRIMARY KEY (`id_burger`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `contenir_dessert`
--
ALTER TABLE `contenir_dessert`
  ADD PRIMARY KEY (`id_commande`,`id_dessert`),
  ADD KEY `id_dessert` (`id_dessert`);

--
-- Index pour la table `contenir_pizza`
--
ALTER TABLE `contenir_pizza`
  ADD PRIMARY KEY (`id_pizza`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `contenir_sandwich`
--
ALTER TABLE `contenir_sandwich`
  ADD PRIMARY KEY (`id_sandwich`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `contenir_tacos`
--
ALTER TABLE `contenir_tacos`
  ADD PRIMARY KEY (`id_tacos`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `contenir_texmex`
--
ALTER TABLE `contenir_texmex`
  ADD PRIMARY KEY (`id_commande`,`id_texmex`),
  ADD KEY `id_texmex` (`id_texmex`);

--
-- Index pour la table `dessert`
--
ALTER TABLE `dessert`
  ADD PRIMARY KEY (`id_dessert`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id_ingredient`),
  ADD KEY `id_type_ingredient` (`id_type_ingredient`);

--
-- Index pour la table `peut_avoir`
--
ALTER TABLE `peut_avoir`
  ADD PRIMARY KEY (`id_tacos`,`id_supplement`),
  ADD KEY `id_supplement` (`id_supplement`);

--
-- Index pour la table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id_pizza`),
  ADD KEY `id_taille_pizza` (`id_taille_pizza`);

--
-- Index pour la table `sandwich`
--
ALTER TABLE `sandwich`
  ADD PRIMARY KEY (`id_sandwich`);

--
-- Index pour la table `supplement`
--
ALTER TABLE `supplement`
  ADD PRIMARY KEY (`id_supplement`);

--
-- Index pour la table `supplement_gratine`
--
ALTER TABLE `supplement_gratine`
  ADD PRIMARY KEY (`id_supplement_gratine`);

--
-- Index pour la table `tacos`
--
ALTER TABLE `tacos`
  ADD PRIMARY KEY (`id_tacos`),
  ADD KEY `id_supplement_gratine` (`id_supplement_gratine`),
  ADD KEY `id_taille_tacos` (`id_taille_tacos`);

--
-- Index pour la table `taille_pizza`
--
ALTER TABLE `taille_pizza`
  ADD PRIMARY KEY (`id_taille_pizza`);

--
-- Index pour la table `taille_tacos`
--
ALTER TABLE `taille_tacos`
  ADD PRIMARY KEY (`id_taille_tacos`);

--
-- Index pour la table `texmex`
--
ALTER TABLE `texmex`
  ADD PRIMARY KEY (`id_texmex`),
  ADD KEY `id_boisson` (`id_boisson`);

--
-- Index pour la table `type_ingredient`
--
ALTER TABLE `type_ingredient`
  ADD PRIMARY KEY (`id_type_ingredient`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `composer_assiette`
--
ALTER TABLE `composer_assiette`
  ADD CONSTRAINT `composer_assiette_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  ADD CONSTRAINT `composer_assiette_ibfk_2` FOREIGN KEY (`id_assiette`) REFERENCES `assiette` (`id_assiette`);

--
-- Contraintes pour la table `composer_burger`
--
ALTER TABLE `composer_burger`
  ADD CONSTRAINT `composer_burger_ibfk_1` FOREIGN KEY (`id_burger`) REFERENCES `burger` (`id_burger`),
  ADD CONSTRAINT `composer_burger_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);

--
-- Contraintes pour la table `composer_pizza`
--
ALTER TABLE `composer_pizza`
  ADD CONSTRAINT `composer_pizza_ibfk_1` FOREIGN KEY (`id_pizza`) REFERENCES `pizza` (`id_pizza`),
  ADD CONSTRAINT `composer_pizza_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);

--
-- Contraintes pour la table `composer_sandwich`
--
ALTER TABLE `composer_sandwich`
  ADD CONSTRAINT `composer_sandwich_ibfk_1` FOREIGN KEY (`id_sandwich`) REFERENCES `sandwich` (`id_sandwich`),
  ADD CONSTRAINT `composer_sandwich_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);

--
-- Contraintes pour la table `composer_tacos`
--
ALTER TABLE `composer_tacos`
  ADD CONSTRAINT `composer_tacos_ibfk_1` FOREIGN KEY (`id_tacos`) REFERENCES `tacos` (`id_tacos`),
  ADD CONSTRAINT `composer_tacos_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);

--
-- Contraintes pour la table `composer_texmex`
--
ALTER TABLE `composer_texmex`
  ADD CONSTRAINT `composer_texmex_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  ADD CONSTRAINT `composer_texmex_ibfk_2` FOREIGN KEY (`id_texmex`) REFERENCES `texmex` (`id_texmex`);

--
-- Contraintes pour la table `contenir_assiette`
--
ALTER TABLE `contenir_assiette`
  ADD CONSTRAINT `contenir_assiette_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `contenir_assiette_ibfk_2` FOREIGN KEY (`id_assiette`) REFERENCES `assiette` (`id_assiette`);

--
-- Contraintes pour la table `contenir_boisson`
--
ALTER TABLE `contenir_boisson`
  ADD CONSTRAINT `contenir_boisson_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `contenir_boisson_ibfk_2` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`);

--
-- Contraintes pour la table `contenir_burger`
--
ALTER TABLE `contenir_burger`
  ADD CONSTRAINT `contenir_burger_ibfk_1` FOREIGN KEY (`id_burger`) REFERENCES `burger` (`id_burger`),
  ADD CONSTRAINT `contenir_burger_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `contenir_dessert`
--
ALTER TABLE `contenir_dessert`
  ADD CONSTRAINT `contenir_dessert_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `contenir_dessert_ibfk_2` FOREIGN KEY (`id_dessert`) REFERENCES `dessert` (`id_dessert`);

--
-- Contraintes pour la table `contenir_pizza`
--
ALTER TABLE `contenir_pizza`
  ADD CONSTRAINT `contenir_pizza_ibfk_1` FOREIGN KEY (`id_pizza`) REFERENCES `pizza` (`id_pizza`),
  ADD CONSTRAINT `contenir_pizza_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `contenir_sandwich`
--
ALTER TABLE `contenir_sandwich`
  ADD CONSTRAINT `contenir_sandwich_ibfk_1` FOREIGN KEY (`id_sandwich`) REFERENCES `sandwich` (`id_sandwich`),
  ADD CONSTRAINT `contenir_sandwich_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `contenir_tacos`
--
ALTER TABLE `contenir_tacos`
  ADD CONSTRAINT `contenir_tacos_ibfk_1` FOREIGN KEY (`id_tacos`) REFERENCES `tacos` (`id_tacos`),
  ADD CONSTRAINT `contenir_tacos_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `contenir_texmex`
--
ALTER TABLE `contenir_texmex`
  ADD CONSTRAINT `contenir_texmex_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `contenir_texmex_ibfk_2` FOREIGN KEY (`id_texmex`) REFERENCES `texmex` (`id_texmex`);

--
-- Contraintes pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`id_type_ingredient`) REFERENCES `type_ingredient` (`id_type_ingredient`);

--
-- Contraintes pour la table `peut_avoir`
--
ALTER TABLE `peut_avoir`
  ADD CONSTRAINT `peut_avoir_ibfk_1` FOREIGN KEY (`id_tacos`) REFERENCES `tacos` (`id_tacos`),
  ADD CONSTRAINT `peut_avoir_ibfk_2` FOREIGN KEY (`id_supplement`) REFERENCES `supplement` (`id_supplement`);

--
-- Contraintes pour la table `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`id_taille_pizza`) REFERENCES `taille_pizza` (`id_taille_pizza`);

--
-- Contraintes pour la table `tacos`
--
ALTER TABLE `tacos`
  ADD CONSTRAINT `tacos_ibfk_1` FOREIGN KEY (`id_supplement_gratine`) REFERENCES `supplement_gratine` (`id_supplement_gratine`),
  ADD CONSTRAINT `tacos_ibfk_2` FOREIGN KEY (`id_taille_tacos`) REFERENCES `taille_tacos` (`id_taille_tacos`);

--
-- Contraintes pour la table `texmex`
--
ALTER TABLE `texmex`
  ADD CONSTRAINT `texmex_ibfk_1` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
