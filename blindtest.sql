-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 01 mai 2023 à 15:29
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blindtest`
--

-- --------------------------------------------------------

--
-- Structure de la table `alternatif`
--

CREATE TABLE `alternatif` (
  `id` int(11) NOT NULL,
  `origine_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `alternatif`
--

INSERT INTO `alternatif` (`id`, `origine_id`, `name`) VALUES
(1, 1, 'Shingeki no Kyojin'),
(2, 1, 'Attack on Titan'),
(3, 2, 'Kimetsu no Yaiba'),
(4, 4, 'Boku no Hero Academia'),
(5, 10, 'Hagane no Renkinjutsushi'),
(6, 12, 'Yakusoku no Neverland'),
(7, 13, 'Ansatsu Kyoushitsu'),
(8, 15, 'Shigatsu wa Kimi no Uso'),
(9, 16, 'Boku dake ga Inai Machi'),
(10, 21, 'Seikatsu'),
(11, 25, 'Seishun Buta Yarou wa Bunny Girl Senpai no Yume wo Minai'),
(12, 26, 'Nanatsu no Taizai'),
(13, 32, 'Kono Subarashii Sekai ni Shukufuku wo!'),
(14, 34, 'Kiseijuu: Sei no Kakuritsu'),
(15, 35, 'Ao no Exorcist'),
(16, 39, 'JoJo no Kimyou na Bouken'),
(17, 42, 'The Future Diary'),
(18, 43, 'Shin Seiki Evangelion'),
(19, 46, 'Enen no Shouboutai'),
(20, 48, 'Tate no Yuusha no Nariagari'),
(21, 52, 'Shokugeki no Souma'),
(22, 54, 'Hataraku Maou-sama!'),
(23, 55, 'Ano Hi Mita Hana no Namae wo Bokutachi wa Mada Shiranai'),
(24, 59, 'Tensei Shitara Slime Datta Ken'),
(25, 60, 'Dungeon ni Deai wo Motomeru no wa Machigatteiru Darou ka'),
(26, 60, 'Danmachi'),
(27, 63, 'Youkoso Jitsuryoku Shijou Shugi no Kyoushitsu e'),
(28, 65, 'Yahari Ore no Seishun Love Come wa Machigatteiru'),
(29, 65, 'Oregairu'),
(30, 80, 'Chuunibyou demo Koi ga Shitai!'),
(31, 81, 'Kobayashi-san Chi no Maidragon');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(0, 'opening');

-- --------------------------------------------------------

--
-- Structure de la table `origine`
--

CREATE TABLE `origine` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `annee` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`id`, `categorie_id`, `name`, `annee`) VALUES
(1, 0, 'Attaque des Titans', '2013'),
(2, 0, 'Demon Slayer', '2019'),
(3, 0, 'Death Note', '2006'),
(4, 0, 'My Hero Academia', '2016'),
(5, 0, 'Hunter x Hunter', '2011'),
(6, 0, 'Jujutsu Kaisen', '2020'),
(7, 0, 'One Punch Man', '2015'),
(8, 0, 'Tokyo Ghoul', '2014'),
(9, 0, 'Sword Art Online', '2012'),
(10, 0, 'Fullmetal Alchemist: Brotherhood', '2009'),
(11, 0, 'Naruto', '2002'),
(12, 0, 'The Promised Neverland', '2019'),
(13, 0, 'Assassination Classroom', '2015'),
(14, 0, 'One Piece', '2000'),
(15, 0, 'Your lie in April', '2014'),
(16, 0, 'Erased', '2016'),
(17, 0, 'HAIKYU!!', '2014'),
(18, 0, 'Naruto Shippuden', '2007'),
(19, 0, 'Mob Psycho 100', '2016'),
(20, 0, 'Steins Gate', '2011'),
(21, 0, 'Re ZERO', '2016'),
(22, 0, 'Noragami', '2014'),
(23, 0, 'No Game No Life', '2014'),
(24, 0, 'Toradora!', '2008'),
(25, 0, 'Rascal Does Not Dream of Bunny Girl Senpai', '2018'),
(26, 0, 'The Seven Deadly Sins', '2014'),
(27, 0, 'Kaguya-sama: Love is War', '2019'),
(28, 0, 'Akame ga Kill!', '2014'),
(29, 0, 'Black Clover', '2017'),
(30, 0, 'Violet Evergarden', '2018'),
(31, 0, 'Dr. STONE', '2019'),
(32, 0, 'KONOSUBA God\'s blessing on this wonderful world!', '2016'),
(33, 0, 'DARLING in the FRANXX', '2018'),
(34, 0, 'Parasyte the maxim', '2014'),
(35, 0, 'Blue Exorcist', '2011'),
(36, 0, 'Death Parade', '2015'),
(37, 0, 'Angel Beats!', '2010'),
(38, 0, 'Kakegurui', '2017'),
(39, 0, 'JoJo\'s Bizarre Adventure', '2012'),
(40, 0, 'Code Geass', '2006'),
(41, 0, 'Cowboy Bebop', '1998'),
(42, 0, 'Mirai Nikki', '2011'),
(43, 0, 'Neon Genesis Evangelion', '1995'),
(44, 0, 'Horimiya', '2021'),
(45, 0, 'Vinland Saga', '2019'),
(46, 0, 'Fire Force', '2019'),
(47, 0, 'Kill la Kill', '2013'),
(48, 0, 'The Rising of the Shield Hero', '2019'),
(49, 0, 'Tokyo Revengers', '2021'),
(50, 0, 'Bleach', '2004'),
(51, 0, 'SPY x FAMILY', '2022'),
(52, 0, 'Food Wars!', '2015'),
(53, 0, 'Charlotte', '2015'),
(54, 0, 'The Devil is a Part-Timer!', '2013'),
(55, 0, 'Anohana: The Flower We Saw That Day', '2011'),
(56, 0, 'Bungo Stray Dogs', '2016'),
(57, 0, 'Chainsaw Man', '2022'),
(58, 0, 'Another', '2012'),
(59, 0, 'That Time I Got Reincarnated as a Slime', '2018'),
(60, 0, 'Is It Wrong to Try to Pick Up Girls in a Dungeon?', '2015'),
(61, 0, 'Made in Abyss', '2017'),
(62, 0, 'Fairy Tail', '2009'),
(63, 0, 'Classroom of the Elite', '2017'),
(64, 0, 'Overlord', '2015'),
(65, 0, 'My Teen Romantic Comedy SNAFU', '2013'),
(66, 0, 'Soul Eater', '2008'),
(68, 0, 'PSYCHO-PASS', '2012'),
(70, 0, 'Samurai Champloo', '2004'),
(71, 0, 'Dragon Ball', '1986'),
(72, 0, 'Dragon Ball Z', '1989'),
(73, 0, 'Dragon Ball GT', '1996'),
(74, 0, 'Dragon Ball Super', '2015'),
(75, 0, 'GTO: Great Teacher Onizuka', '1999'),
(76, 0, 'Gurren Lagann', '2007'),
(77, 0, 'Fullmetal Alchemist', '2003'),
(78, 0, 'Gintama', '2006'),
(79, 0, 'Dororo', '2019'),
(80, 0, 'Love, Chunibyo & Other Delusions', '2012'),
(81, 0, 'Miss Kobayashi\'s Dragon Maid', '2017'),
(82, 0, 'Devilman Crybaby', '2018');

-- --------------------------------------------------------

--
-- Structure de la table `proposition`
--

CREATE TABLE `proposition` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id_question` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `level` int(11) NOT NULL,
  `target` varchar(128) NOT NULL,
  `appear` int(11) NOT NULL DEFAULT 0,
  `point` int(11) NOT NULL DEFAULT 1,
  `chance` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id_question`, `categorie_id`, `question`, `level`, `target`, `appear`, `point`, `chance`) VALUES
(1, 0, 'De quel anime est tiré ce générique ?', 0, 'name', 3, 1, 0),
(2, 0, 'Quel est le numéro de l\'opening ?', 1, 'number', 0, 2, 1),
(3, 0, 'Quel est le titre de l\'opening ?', 1, 'title', 1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `score`
--

CREATE TABLE `score` (
  `id_score` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `len` int(11) NOT NULL,
  `parameters` varchar(1000) NOT NULL,
  `date_score` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `score`
--

INSERT INTO `score` (`id_score`, `user_id`, `categorie_id`, `score`, `len`, `parameters`, `date_score`) VALUES
(9, 1, 0, 26, 10, 'top100,', '2023-04-28 21:9');

-- --------------------------------------------------------

--
-- Structure de la table `score_invite`
--

CREATE TABLE `score_invite` (
  `id_score_invite` int(11) NOT NULL,
  `invite_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `len` int(11) NOT NULL,
  `parameters` varchar(1000) NOT NULL,
  `date_score` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `sound`
--

CREATE TABLE `sound` (
  `id_sound` int(11) NOT NULL,
  `origine_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `number` int(11) NOT NULL,
  `top100` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sound`
--

INSERT INTO `sound` (`id_sound`, `origine_id`, `title`, `number`, `top100`) VALUES
(1, 1, 'Guren no Yumiya', 1, 1),
(2, 1, 'Jiyuu no Tsubasa', 2, 1),
(3, 1, 'Shinzou wo Sasageyo!', 3, 1),
(4, 1, 'Red Swan', 4, 1),
(5, 1, 'Shoukei to Shikabane no Michi', 5, 0),
(6, 1, 'Boku no Sensou', 6, 1),
(7, 1, 'The Rumbling', 7, 1),
(8, 2, 'Gurenge', 1, 1),
(9, 2, 'Akeboshi', 2, 0),
(10, 2, 'Zankyou Sanka', 3, 0),
(11, 3, 'the WORLD', 1, 1),
(12, 3, 'What\'s up, people?!', 2, 1),
(13, 4, 'The Day', 1, 1),
(14, 4, 'Peace Sign', 2, 0),
(15, 4, 'Sora ni Utaeba', 3, 0),
(16, 4, 'ODD FUTURE', 4, 1),
(17, 4, 'Make my story', 5, 0),
(18, 4, 'Polaris', 6, 0),
(19, 4, 'Star Marker', 7, 0),
(20, 4, 'No.1', 8, 0),
(21, 4, 'Merry-Go-Round', 9, 0),
(22, 4, 'Hitamuki', 10, 0),
(23, 4, 'Bokurano', 11, 0),
(24, 5, 'departure!', 1, 1),
(25, 6, 'Kaikai Kitan', 1, 1),
(26, 6, 'Vivid Vice', 2, 0),
(27, 7, 'THE HERO!!', 1, 1),
(28, 7, 'Seijaku no Apostle', 2, 0),
(29, 8, 'Unravel', 1, 1),
(30, 8, 'Munou', 2, 0),
(31, 8, 'Asphyxia', 3, 1),
(32, 8, 'Katharsis', 4, 0),
(33, 9, 'Crossing Field', 1, 1),
(34, 9, 'Innocence', 2, 1),
(35, 9, 'Ignite', 3, 1),
(36, 9, 'Courage', 4, 1),
(37, 9, 'ADAMAS', 5, 0),
(38, 9, 'Resister', 6, 0),
(39, 9, 'Resolution', 7, 0),
(40, 9, 'Anima', 8, 0),
(41, 10, 'Again', 1, 1),
(42, 10, 'Hologram', 2, 0),
(43, 10, 'Golden Time Lover', 3, 0),
(44, 10, 'Period', 4, 0),
(45, 10, 'Rain', 5, 0),
(46, 11, 'Rocks', 1, 0),
(47, 11, 'Haruka Kanata', 2, 1),
(48, 11, 'Kanashimi Wo Yasashisa Ni', 3, 0),
(49, 11, 'GO!!!', 4, 0),
(50, 11, 'Seishun Kyousoukyoku', 5, 1),
(51, 11, 'No Boy, No Cry', 6, 0),
(52, 11, 'Namikaze Satellite', 7, 0),
(53, 11, 'Re:member', 8, 0),
(54, 11, 'Yura Yura', 9, 0),
(55, 12, 'Touch off', 1, 0),
(56, 13, 'Ansatsu Kyoushitsu', 1, 1),
(57, 13, 'Jiriki Hongan Revolution', 2, 1),
(58, 13, 'Question', 3, 1),
(59, 13, 'Bye bye Yesterday', 4, 1),
(60, 14, 'We Are!', 1, 1),
(61, 14, 'Believe', 2, 0),
(62, 14, 'Hikari e', 3, 0),
(63, 14, 'Bon Voyage!', 4, 0),
(64, 14, 'Kokoro no Chizu', 5, 0),
(65, 14, 'BRAND NEW WORLD', 6, 0),
(66, 14, 'We Are! (Straw Hat version)', 7, 0),
(67, 14, 'Crazy Rainbow', 8, 0),
(68, 14, 'Jungle P', 9, 0),
(69, 14, 'We are! (remix)', 10, 0),
(70, 14, 'Share the World', 11, 0),
(71, 14, 'Kaze wo Sagashite', 12, 0),
(72, 14, 'One day', 13, 0),
(73, 14, 'Fight Together', 14, 0),
(74, 14, 'We Go!', 15, 0),
(75, 14, 'Hands Up!', 16, 0),
(76, 14, 'Wake up!', 17, 0),
(77, 14, 'Hard Knock Days', 18, 0),
(78, 14, 'We Can!', 19, 0),
(79, 14, 'Hope', 20, 1),
(80, 14, 'Super Powers', 21, 0),
(81, 14, 'OVER THE TOP', 22, 0),
(82, 14, 'DREAMIN\' ON', 23, 0),
(83, 14, 'PAINT', 24, 0),
(84, 15, 'Hikaru nara', 1, 1),
(85, 15, 'Nanairo Symphony', 2, 0),
(86, 16, 'Re:Re:', 1, 1),
(87, 17, 'Imagination', 1, 1),
(88, 17, 'Ah Yeah!!', 2, 0),
(89, 17, 'I\'m A Believer', 3, 0),
(90, 17, 'FLY HIGH!!', 4, 0),
(91, 17, 'Hikari Are (By: BURNOUT SYNDROMES)', 5, 1),
(92, 17, 'Phoenix', 6, 0),
(93, 17, 'Toppakou', 7, 0),
(94, 18, 'Hero\'s Come Back!!', 1, 1),
(95, 18, 'Distance ', 2, 1),
(96, 18, 'Blue Bird', 3, 1),
(97, 18, 'Closer ', 4, 1),
(98, 18, 'Hotaru no Hikari', 5, 0),
(99, 18, 'Sign', 6, 1),
(100, 18, 'Toumei Datta Sekai', 7, 0),
(101, 18, 'Diver', 8, 1),
(102, 18, 'Lovers', 9, 1),
(103, 18, 'Newsong', 10, 0),
(104, 18, 'Totsugeki Rock', 11, 0),
(105, 18, 'Moshimo', 12, 0),
(106, 18, 'Niwaka Ame ni mo Makezu', 13, 0),
(107, 18, 'Tsuki no Ookisa', 14, 0),
(108, 18, 'Guren', 15, 0),
(109, 18, 'Silhouette', 16, 1),
(110, 18, 'Kaze', 17, 0),
(111, 18, 'LINE', 18, 0),
(112, 18, 'Blood Circulator', 19, 1),
(113, 18, 'Kara no Kokoro', 20, 0),
(114, 19, '99', 1, 1),
(115, 19, '99.9', 2, 0),
(116, 19, '1', 3, 0),
(117, 20, 'Hacking to the Gate', 1, 1),
(118, 21, 'Redo', 1, 1),
(119, 21, 'Paradisus-Paradoxum', 2, 0),
(120, 21, 'Realize', 3, 0),
(121, 21, 'Long shot', 4, 0),
(122, 22, 'Goya wa Machiawase', 1, 1),
(123, 22, 'Kyoran Hey Kids!!', 2, 0),
(124, 23, 'This game', 1, 1),
(125, 24, 'Pre-Parade', 1, 0),
(126, 24, 'Silky Heart', 2, 0),
(127, 25, 'Kimi no Sei', 1, 0),
(128, 26, 'Netsujo No Spectrum', 1, 1),
(129, 26, 'Seven Deadly Sins', 2, 0),
(130, 26, 'Howling', 3, 0),
(131, 26, 'Ame ga Furu kara Niji ga Deru', 4, 0),
(132, 26, 'ROB THE FRONTIER', 5, 0),
(133, 26, 'delete', 6, 0),
(134, 26, 'Hikari Are (By: Akihito Okano)', 7, 0),
(135, 26, 'Eien No Aria', 8, 0),
(136, 27, 'Love Dramatic', 1, 0),
(137, 27, 'DADDY! DADDY! DO!', 2, 1),
(138, 27, 'GIRI GIRI', 3, 0),
(139, 28, 'Skyreach', 1, 0),
(140, 28, 'Liar Mask', 2, 1),
(141, 29, 'Haruka Mirai', 1, 1),
(142, 29, 'PAiNT it BLACK', 2, 0),
(143, 29, 'Black Rover', 3, 1),
(144, 29, 'Guess Who Is Back', 4, 1),
(145, 29, 'Gamushara', 5, 0),
(146, 29, 'Rakugaki Peiji', 6, 0),
(147, 29, 'JUSTadICE', 7, 0),
(148, 29, 'Sky & Blue', 8, 0),
(149, 29, 'Right now', 9, 0),
(150, 29, 'Black Catcher', 10, 1),
(151, 29, 'Stories', 11, 0),
(152, 29, 'Eien ni Hikare', 12, 0),
(153, 29, 'Grandeur', 13, 0),
(154, 30, 'Sincerely', 1, 1),
(155, 31, 'Good Morning World!', 1, 1),
(156, 31, 'Sangenshoku', 2, 0),
(157, 31, 'Rakuen', 3, 0),
(158, 32, 'Fantastic Dreamer', 1, 0),
(159, 32, 'Tomorrow', 2, 0),
(160, 33, 'KISS OF DEATH', 1, 1),
(161, 34, 'Let Me Hear', 1, 1),
(162, 35, 'CORE PRIDE', 1, 0),
(163, 35, 'IN MY WORLD', 2, 1),
(164, 35, 'Itteki no Eikyou', 3, 0),
(165, 36, 'Flyers', 1, 1),
(166, 37, 'My Soul, Your Beats!', 1, 1),
(167, 38, 'Deal with the devil', 1, 0),
(168, 38, 'Kono Yubi Tomare', 2, 1),
(169, 39, 'Sono Chi no Sadame', 1, 1),
(170, 39, 'BLOODY STREAM', 2, 1),
(171, 39, 'STAND PROUD', 3, 0),
(172, 39, 'Sono Chi no Kioku ~end of THE WORLD', 4, 0),
(173, 39, 'Crazy Noisy Bizarre Town', 5, 0),
(174, 39, 'chase', 6, 0),
(175, 39, 'Great Days', 7, 0),
(176, 39, 'Fighting Gold', 8, 1),
(177, 39, 'Uragirimono no Requiem', 9, 0),
(178, 39, 'Stone Ocean', 10, 0),
(179, 39, 'Heaven\'s Falling Down', 11, 0),
(180, 40, 'COLORS', 1, 1),
(181, 40, 'Kaidoku Funou', 2, 0),
(182, 40, 'Hitomino Tsubasa', 3, 0),
(183, 40, 'O2', 4, 0),
(184, 40, 'World\'s End', 5, 0),
(185, 41, 'Tank!', 1, 1),
(186, 42, 'Kuusou Mesorogiwi', 1, 1),
(187, 42, 'Dead END', 2, 0),
(188, 43, 'Zankoku na Tenshi no Thesis', 1, 1),
(189, 44, 'Iro Kousui', 1, 0),
(190, 45, 'MUKANJYO', 1, 0),
(191, 45, 'Dark Crow', 2, 0),
(192, 45, 'River', 3, 0),
(193, 46, 'Inferno', 1, 1),
(194, 46, 'MAYDAY', 2, 0),
(195, 46, 'SPARK-AGAIN', 3, 0),
(196, 46, 'Torch Of Liberty', 4, 0),
(197, 47, 'Sirius', 1, 0),
(198, 47, 'ambiguous', 2, 0),
(199, 48, 'RISE', 1, 0),
(200, 48, 'FAITH', 2, 0),
(201, 48, 'Bring Back', 3, 0),
(202, 49, 'Cry Baby', 1, 1),
(203, 49, 'White Noise', 2, 0),
(204, 50, 'Asterisk', 1, 1),
(205, 50, 'D-tecnoLife', 2, 1),
(206, 50, 'Ichirin no Hana', 3, 0),
(207, 50, 'TONIGHT, TONIGHT, TONIGHT', 4, 0),
(208, 50, 'Rolling star', 5, 0),
(209, 50, 'ALONES', 6, 0),
(210, 50, 'After Dark', 7, 0),
(211, 50, 'CHU-BURA', 8, 0),
(212, 50, 'Velonica', 9, 0),
(213, 50, 'Shoujo S', 10, 0),
(214, 50, 'Anima Rossa', 11, 0),
(215, 50, 'chAngE', 12, 1),
(216, 50, 'Ranbu no Melody', 13, 1),
(217, 50, 'BLUE', 14, 0),
(218, 50, 'HARUKAZE', 15, 0),
(219, 50, 'Scar', 16, 0),
(220, 51, 'Mixed Nuts', 1, 0),
(221, 51, 'Souvenir', 2, 0),
(222, 52, 'Kibou no Uta', 1, 1),
(223, 52, 'Rising Rainbow', 2, 0),
(224, 52, 'Rough Diamonds', 3, 0),
(225, 52, 'Braver', 4, 0),
(226, 52, 'Symbol', 5, 0),
(227, 52, 'Chronos', 6, 0),
(228, 52, 'Last Chapter', 7, 0),
(229, 53, 'Bravely You', 1, 0),
(230, 54, 'ZERO!!', 1, 0),
(231, 54, 'WITH', 2, 0),
(232, 55, 'Aoi Shiori', 1, 1),
(233, 56, 'TRASH CANDY', 1, 0),
(234, 56, 'Reason Living', 2, 0),
(235, 56, 'Setsuna no Ai', 3, 0),
(236, 56, 'TRUE STORY', 4, 0),
(237, 57, 'KICK BACK', 1, 1),
(238, 58, 'Kyoumu Densen', 1, 0),
(239, 59, 'Nameless story', 1, 0),
(240, 59, 'Meguru Mono', 2, 0),
(241, 59, 'Storyteller', 3, 0),
(242, 59, 'Like Flames', 4, 0),
(243, 60, 'Hey World', 1, 0),
(244, 60, 'HELLO to DREAM', 2, 0),
(245, 60, 'Over And Over', 3, 0),
(246, 60, 'Tentou', 4, 0),
(247, 60, 'Shiko', 5, 0),
(248, 61, 'Made in Abyss', 1, 0),
(249, 61, 'Katachi', 2, 0),
(250, 62, 'Snow fairy', 1, 1),
(251, 62, 'Sense Of Wonder', 2, 0),
(252, 62, 'ft.', 3, 0),
(253, 62, 'Rockin\' Playing Game', 4, 0),
(254, 62, 'Egao no Mahou', 5, 0),
(255, 62, 'Fiesta', 6, 0),
(256, 62, 'Evidence', 7, 0),
(257, 62, 'The Rock City Boy', 8, 0),
(258, 62, 'Towa no Kizuna feat. Another Infinity', 9, 0),
(259, 62, 'I Wish', 10, 0),
(260, 62, 'Hajimari no Sora', 11, 0),
(261, 62, 'Tenohira', 12, 0),
(262, 62, 'Breakthrough', 13, 0),
(263, 62, 'Yakusoku no Hi', 14, 0),
(264, 62, 'MASAYUME CHASING', 15, 0),
(265, 62, 'STRIKE BACK', 16, 0),
(266, 62, 'Mysterious Magic', 17, 0),
(267, 62, 'BREAK OUT', 18, 0),
(268, 62, 'Yumeiro Graffiti', 19, 0),
(269, 62, 'NEVER-END TALE', 20, 0),
(270, 62, 'Believe in Myself', 21, 0),
(271, 62, 'power of the dream', 22, 0),
(272, 62, 'DOWN BY LAW', 23, 0),
(273, 62, 'NO-LIMIT', 24, 0),
(274, 62, 'MORE THAN LiKE', 25, 0),
(275, 63, 'Caste Room', 1, 0),
(276, 63, 'Dance in the Game', 2, 0),
(277, 64, 'Clattanoia', 1, 1),
(278, 64, 'Go Cry Go', 2, 0),
(279, 64, 'VORACITY', 3, 0),
(280, 64, 'HOLLOW HUNGER', 4, 0),
(281, 65, 'Yukitoki', 1, 0),
(282, 65, 'Harumodoki', 2, 0),
(283, 65, 'Megumi no Ame', 3, 0),
(284, 66, 'Resonance', 1, 1),
(285, 66, 'Papermoon', 2, 1),
(287, 68, 'Abnormalize', 1, 0),
(288, 68, 'Out of Control', 2, 0),
(289, 68, 'Enigmatic Feeling', 3, 0),
(290, 68, 'Q-vism', 4, 0),
(291, 70, 'Battlecry', 1, 0),
(292, 71, 'Makafushigi Adventure', 1, 0),
(293, 72, 'CHA-LA HEAD-CHA-LA', 1, 1),
(294, 72, 'WE GOTTA POWER', 2, 0),
(295, 73, 'Dan Dan Kokoro Hikareteku', 1, 0),
(296, 74, 'Chouzetsu Dynamic!', 1, 0),
(297, 74, 'Limit Break X Survivor', 2, 0),
(298, 75, 'Driver\'s High', 1, 0),
(299, 75, 'Hitori no Yoru', 2, 0),
(300, 76, 'Sorairo Days', 1, 0),
(301, 77, 'Melissa', 1, 0),
(302, 77, 'READY STEADY GO', 2, 0),
(303, 77, 'UNDO', 3, 0),
(304, 77, 'Rewrite', 4, 1),
(305, 78, 'Pray', 1, 0),
(306, 78, 'Tooi Nioi', 2, 0),
(307, 78, 'Gin Iro No Sora', 3, 0),
(308, 78, 'Kasanarukage', 4, 0),
(309, 78, 'A Cloudy Sky', 5, 0),
(310, 78, 'MAGIC', 6, 0),
(311, 78, 'Stairway Generation', 7, 0),
(312, 78, 'Light Infection', 8, 0),
(313, 78, 'Tougenkyou Alien', 9, 0),
(314, 78, 'Dilemma', 10, 0),
(315, 78, 'Wonderland', 11, 0),
(316, 78, 'LET\'S GO OUT', 12, 0),
(317, 78, 'Sakuramitsutsuki', 13, 0),
(318, 78, 'DAYxDAY', 14, 0),
(319, 78, 'Pride Kakumei', 15, 0),
(320, 78, 'Beautiful Days', 16, 0),
(321, 78, 'Know Know Know', 17, 0),
(322, 78, 'Kagerou', 18, 0),
(323, 78, 'VS', 19, 0),
(324, 78, 'Katte ni MY SOUL', 20, 0),
(325, 78, 'I Wanna Be', 21, 0),
(326, 79, 'Kaen', 1, 0),
(327, 79, 'Dororo', 2, 0),
(328, 80, 'Sparkling Daydream', 1, 0),
(329, 80, 'Voice', 2, 0),
(330, 81, 'Blue Sky Rhapsody', 1, 0),
(331, 81, 'Ai no Supreme!', 2, 0),
(332, 82, 'MAN HUMAN', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `picture` varchar(100) NOT NULL DEFAULT '0.png',
  `bio` text NOT NULL,
  `discord` varchar(100) NOT NULL,
  `anilist` varchar(100) NOT NULL,
  `twitter` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `admin`, `picture`, `bio`, `discord`, `anilist`, `twitter`) VALUES
(1, 'Tom', 'tom@mail.com', '$2y$10$0RnmfJE6sLdPqpqlFAHce.lhNW3lwJVc0yjnE/8.bvb2ZlQxPuqem', 1, '1.jpg', 'Tom, créateur et modérateur sur le site Blindtest.', 'Playxids#3030', 'Playxids', '@playxids'),
(4, 'Playxids_', 'playxids2003@gmail.com', '$2y$10$cg8lqzNQI1OAqdH9mUT7NORCoEd918UI1diSGDDig6m6teSXXt3Om', 0, '0.png', '', '', '', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `KF_origine2` (`origine_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `origine`
--
ALTER TABLE `origine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `KF_categorie` (`categorie_id`);

--
-- Index pour la table `proposition`
--
ALTER TABLE `proposition`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `KF_categorie_question` (`categorie_id`);

--
-- Index pour la table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id_score`),
  ADD KEY `KF_score_user` (`user_id`),
  ADD KEY `KF_score_categorie` (`categorie_id`);

--
-- Index pour la table `score_invite`
--
ALTER TABLE `score_invite`
  ADD PRIMARY KEY (`id_score_invite`);

--
-- Index pour la table `sound`
--
ALTER TABLE `sound`
  ADD PRIMARY KEY (`id_sound`),
  ADD KEY `KF_origine` (`origine_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `origine`
--
ALTER TABLE `origine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `proposition`
--
ALTER TABLE `proposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `score`
--
ALTER TABLE `score`
  MODIFY `id_score` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `score_invite`
--
ALTER TABLE `score_invite`
  MODIFY `id_score_invite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `sound`
--
ALTER TABLE `sound`
  MODIFY `id_sound` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alternatif`
--
ALTER TABLE `alternatif`
  ADD CONSTRAINT `KF_origine2` FOREIGN KEY (`origine_id`) REFERENCES `origine` (`id`);

--
-- Contraintes pour la table `origine`
--
ALTER TABLE `origine`
  ADD CONSTRAINT `KF_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `KF_categorie_question` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `KF_score_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `KF_score_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Contraintes pour la table `sound`
--
ALTER TABLE `sound`
  ADD CONSTRAINT `KF_origine` FOREIGN KEY (`origine_id`) REFERENCES `origine` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
