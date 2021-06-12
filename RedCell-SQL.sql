/*
--- Blood Types ---
O positive: 35%
O negative: 13%
A positive: 30%
A negative: 8%
B positive: 8%
B negative: 2%
AB positive: 2%
AB negative: 1%
*/



CREATE USER RedCell IDENTIFIED BY RedCell;
GRANT ALL PRIVILEGES TO RedCell;


DROP TABLE Donneur;
DROP TABLE GroupeSanguin;
DROP TABLE Ville;
DROP TABLE Region;


CREATE TABLE Region
(
  id_region NUMBER PRIMARY KEY,
  region VARCHAR2(40) NOT NULL
);
INSERT INTO Region VALUES(1, 'Tanger-Tetouan-Al Hoceima');
INSERT INTO Region VALUES(2, 'l''Oriental');
INSERT INTO Region VALUES(3, 'Fes-Meknes');
INSERT INTO Region VALUES(4, 'Rabat-Sale-Kenitra');
INSERT INTO Region VALUES(5, 'Beni Mellal-Khenifra');
INSERT INTO Region VALUES(6, 'Casablanca-Settat');
INSERT INTO Region VALUES(7, 'Marrakech-Safi');
INSERT INTO Region VALUES(8, 'Draa-Tafilalet');
INSERT INTO Region VALUES(9, 'Souss-Massa');
INSERT INTO Region VALUES(10, 'Guelmim-Oued Noun');
INSERT INTO Region VALUES(11, 'Laayoune-Sakia El Hamra');
INSERT INTO Region VALUES(12, 'Dakhla-Oued Ed Dahab');


CREATE TABLE Ville
(
  id_ville NUMBER PRIMARY KEY,
  ville VARCHAR2(40) NOT NULL,
  id_region NUMBER,

  CONSTRAINT VFK_id_region FOREIGN KEY(id_region) REFERENCES Region(id_region) ON DELETE CASCADE
);
INSERT INTO Ville VALUES(1, 'Ain Harrouda', 6);
INSERT INTO Ville VALUES(2, 'Ben Yakhlef', 6);
INSERT INTO Ville VALUES(3, 'Bouskoura', 6);
INSERT INTO Ville VALUES(4, 'Casablanca', 6);
INSERT INTO Ville VALUES(5, 'Mediouna', 6);
INSERT INTO Ville VALUES(6, 'Mohammadia', 6);
INSERT INTO Ville VALUES(7, 'Tit Mellil', 6);
INSERT INTO Ville VALUES(8, 'Ben Yakhlef', 6);
INSERT INTO Ville VALUES(9, 'Bejaad', 5);
INSERT INTO Ville VALUES(10, 'Ben Ahmed', 6);
INSERT INTO Ville VALUES(11, 'Benslimane', 6);
INSERT INTO Ville VALUES(12, 'Berrechid', 6);
INSERT INTO Ville VALUES(13, 'Boujniba', 5);
INSERT INTO Ville VALUES(14, 'Boulanouare', 5);
INSERT INTO Ville VALUES(15, 'Bouznika', 6);
INSERT INTO Ville VALUES(16, 'Deroua', 6);
INSERT INTO Ville VALUES(17, 'El Borouj', 6);
INSERT INTO Ville VALUES(18, 'El Gara', 6);
INSERT INTO Ville VALUES(19, 'Guisser', 6);
INSERT INTO Ville VALUES(20, 'Hattane', 5);
INSERT INTO Ville VALUES(21, 'Khouribga', 5);
INSERT INTO Ville VALUES(22, 'Loulad', 6);
INSERT INTO Ville VALUES(23, 'Oued Zem', 5);
INSERT INTO Ville VALUES(24, 'Oulad Abbou', 6);
INSERT INTO Ville VALUES(25, 'Oulad H''Riz Sahel', 6);
INSERT INTO Ville VALUES(26, 'Oulad M''rah', 6);
INSERT INTO Ville VALUES(27, 'Oulad Said', 6);
INSERT INTO Ville VALUES(28, 'Oulad Sidi Ben Daoud', 6);
INSERT INTO Ville VALUES(29, 'Ras El Ain', 6);
INSERT INTO Ville VALUES(30, 'Settat', 6);
INSERT INTO Ville VALUES(31, 'Sidi Rahhal Chatai', 6);
INSERT INTO Ville VALUES(32, 'Soualem', 6);
INSERT INTO Ville VALUES(33, 'Azemmour', 6);
INSERT INTO Ville VALUES(34, 'Bir Jdid', 6);
INSERT INTO Ville VALUES(35, 'Bouguedra', 7);
INSERT INTO Ville VALUES(36, 'Echemmaia', 7);
INSERT INTO Ville VALUES(37, 'El Jadida', 6);
INSERT INTO Ville VALUES(38, 'Hrara', 7);
INSERT INTO Ville VALUES(39, 'Ighoud', 7);
INSERT INTO Ville VALUES(40, 'Jamaat Shaim', 7);
INSERT INTO Ville VALUES(41, 'Jorf Lasfar', 6);
INSERT INTO Ville VALUES(42, 'Khemis Zemamra', 6);
INSERT INTO Ville VALUES(43, 'Laaounate', 6);
INSERT INTO Ville VALUES(44, 'Moulay Abdallah', 6);
INSERT INTO Ville VALUES(45, 'Oualidia', 6);
INSERT INTO Ville VALUES(46, 'Oulad Amrane', 6);
INSERT INTO Ville VALUES(47, 'Oulad Frej', 6);
INSERT INTO Ville VALUES(48, 'Oulad Ghadbane', 6);
INSERT INTO Ville VALUES(49, 'Safi', 7);
INSERT INTO Ville VALUES(50, 'Sebt El Maarif', 6);
INSERT INTO Ville VALUES(51, 'Sebt Gzoula', 7);
INSERT INTO Ville VALUES(52, 'Sidi Ahmed', 7);
INSERT INTO Ville VALUES(53, 'Sidi Ali Ban Hamdouche', 6);
INSERT INTO Ville VALUES(54, 'Sidi Bennour', 6);
INSERT INTO Ville VALUES(55, 'Sidi Bouzid', 6);
INSERT INTO Ville VALUES(56, 'Sidi Smail', 6);
INSERT INTO Ville VALUES(57, 'Youssoufia', 7);
INSERT INTO Ville VALUES(58, 'Fes', 3);
INSERT INTO Ville VALUES(59, 'Ain Cheggag', 3);
INSERT INTO Ville VALUES(60, 'Bhalil', 3);
INSERT INTO Ville VALUES(61, 'Boulemane', 3);
INSERT INTO Ville VALUES(62, 'El Menzel', 3);
INSERT INTO Ville VALUES(63, 'Guigou', 3);
INSERT INTO Ville VALUES(64, 'Imouzzer Kandar', 3);
INSERT INTO Ville VALUES(65, 'Imouzzer Marmoucha', 3);
INSERT INTO Ville VALUES(66, 'Missour', 3);
INSERT INTO Ville VALUES(67, 'Moulay Yaacoub', 3);
INSERT INTO Ville VALUES(68, 'Ouled Tayeb', 3);
INSERT INTO Ville VALUES(69, 'Outat El Haj', 3);
INSERT INTO Ville VALUES(70, 'Ribate El Kheir', 3);
INSERT INTO Ville VALUES(71, 'Sefrou', 3);
INSERT INTO Ville VALUES(72, 'Skhinate', 3);
INSERT INTO Ville VALUES(73, 'Tafajight', 3);
INSERT INTO Ville VALUES(74, 'Arbaoua', 4);
INSERT INTO Ville VALUES(75, 'Ain Dorij', 1);
INSERT INTO Ville VALUES(76, 'Dar Gueddari', 4);
INSERT INTO Ville VALUES(77, 'Had Kourt', 4);
INSERT INTO Ville VALUES(78, 'Jorf El Melha', 4);
INSERT INTO Ville VALUES(79, 'Kenitra', 4);
INSERT INTO Ville VALUES(80, 'Khenichet', 4);
INSERT INTO Ville VALUES(81, 'Lalla Mimouna', 4);
INSERT INTO Ville VALUES(82, 'Mechra Bel Ksiri', 4);
INSERT INTO Ville VALUES(83, 'Mehdia', 4);
INSERT INTO Ville VALUES(84, 'Moulay Bousselham', 4);
INSERT INTO Ville VALUES(85, 'Sidi Allal Tazi', 4);
INSERT INTO Ville VALUES(86, 'Sidi Kacem', 4);
INSERT INTO Ville VALUES(87, 'Sidi Slimane', 4);
INSERT INTO Ville VALUES(88, 'Sidi Taibi', 4);
INSERT INTO Ville VALUES(89, 'Sidi Yahya El Gharb', 4);
INSERT INTO Ville VALUES(90, 'Souk El Arbaa', 4);
INSERT INTO Ville VALUES(91, 'Akka', 9);
INSERT INTO Ville VALUES(92, 'Assa', 10);
INSERT INTO Ville VALUES(93, 'Bouizakarne', 10);
INSERT INTO Ville VALUES(94, 'El Ouatia', 10);
INSERT INTO Ville VALUES(95, 'Es-Semara', 11);
INSERT INTO Ville VALUES(96, 'Fam El Hisn', 9);
INSERT INTO Ville VALUES(97, 'Foum Zguid', 9);
INSERT INTO Ville VALUES(98, 'Guelmim', 10);
INSERT INTO Ville VALUES(99, 'Taghjijt', 10);
INSERT INTO Ville VALUES(100, 'Tan-Tan', 10);
INSERT INTO Ville VALUES(101, 'Tata', 9);
INSERT INTO Ville VALUES(102, 'Zag', 10);
INSERT INTO Ville VALUES(103, 'Marrakech', 7);
INSERT INTO Ville VALUES(104, 'Ait Daoud', 7);
INSERT INTO Ville VALUES(115, 'Amizmiz', 7);
INSERT INTO Ville VALUES(116, 'Assahrij', 7);
INSERT INTO Ville VALUES(117, 'Ait Ourir', 7);
INSERT INTO Ville VALUES(118, 'Ben Guerir', 7);
INSERT INTO Ville VALUES(119, 'Chichaoua', 7);
INSERT INTO Ville VALUES(120, 'El Hanchane', 7);
INSERT INTO Ville VALUES(121, 'El Kelaa des Sraghna', 7);
INSERT INTO Ville VALUES(122, 'Essaouira', 7);
INSERT INTO Ville VALUES(123, 'Fraita', 7);
INSERT INTO Ville VALUES(124, 'Ghmate', 7);
INSERT INTO Ville VALUES(125, 'Ighounane', 8);
INSERT INTO Ville VALUES(126, 'Imintanoute', 7);
INSERT INTO Ville VALUES(127, 'Kattara', 7);
INSERT INTO Ville VALUES(128, 'Lalla Takerkoust', 7);
INSERT INTO Ville VALUES(129, 'Loudaya', 7);
INSERT INTO Ville VALUES(130, 'Laattaouia', 7);
INSERT INTO Ville VALUES(131, 'Moulay Brahim', 7);
INSERT INTO Ville VALUES(132, 'Mzouda', 7);
INSERT INTO Ville VALUES(133, 'Ounagha', 7);
INSERT INTO Ville VALUES(134, 'Sid L''Mokhtar', 7);
INSERT INTO Ville VALUES(135, 'Sid Zouin', 7);
INSERT INTO Ville VALUES(136, 'Sidi Abdallah Ghiat', 7);
INSERT INTO Ville VALUES(137, 'Sidi Bou Othmane', 7);
INSERT INTO Ville VALUES(138, 'Sidi Rahhal', 7);
INSERT INTO Ville VALUES(139, 'Skhour Rehamna', 7);
INSERT INTO Ville VALUES(140, 'Smimou', 7);
INSERT INTO Ville VALUES(141, 'Tafetachte', 7);
INSERT INTO Ville VALUES(142, 'Tahannaout', 7);
INSERT INTO Ville VALUES(143, 'Talmest', 7);
INSERT INTO Ville VALUES(144, 'Tamallalt', 7);
INSERT INTO Ville VALUES(145, 'Tamanar', 7);
INSERT INTO Ville VALUES(146, 'Tamansourt', 7);
INSERT INTO Ville VALUES(147, 'Tameslouht', 7);
INSERT INTO Ville VALUES(148, 'Tanalt', 9);
INSERT INTO Ville VALUES(149, 'Zeubelemok', 7);
INSERT INTO Ville VALUES(150, 'Meknes', 3);
INSERT INTO Ville VALUES(151, 'Khenifra', 5);
INSERT INTO Ville VALUES(152, 'Agourai', 3);
INSERT INTO Ville VALUES(153, 'Ain Taoujdate', 3);
INSERT INTO Ville VALUES(154, 'MyAliCherif', 8);
INSERT INTO Ville VALUES(155, 'Rissani', 8);
INSERT INTO Ville VALUES(156, 'Amalou Ighriben', 5);
INSERT INTO Ville VALUES(157, 'Aoufous', 8);
INSERT INTO Ville VALUES(158, 'Arfoud', 8);
INSERT INTO Ville VALUES(159, 'Azrou', 3);
INSERT INTO Ville VALUES(160, 'Ain Jemaa', 3);
INSERT INTO Ville VALUES(161, 'Ain Karma', 3);
INSERT INTO Ville VALUES(162, 'Ain Leuh', 3);
INSERT INTO Ville VALUES(163, 'Ait Boubidmane', 3);
INSERT INTO Ville VALUES(164, 'Ait Ishaq', 5);
INSERT INTO Ville VALUES(165, 'Boudnib', 8);
INSERT INTO Ville VALUES(166, 'Boufakrane', 3);
INSERT INTO Ville VALUES(167, 'Boumia', 8);
INSERT INTO Ville VALUES(168, 'El Hajeb', 3);
INSERT INTO Ville VALUES(169, 'Elkbab', 5);
INSERT INTO Ville VALUES(170, 'Er-Rich', 5);
INSERT INTO Ville VALUES(171, 'Errachidia', 8);
INSERT INTO Ville VALUES(172, 'Gardmit', 8);
INSERT INTO Ville VALUES(173, 'Goulmima', 8);
INSERT INTO Ville VALUES(174, 'Gourrama', 8);
INSERT INTO Ville VALUES(175, 'Had Bouhssoussen', 5);
INSERT INTO Ville VALUES(176, 'Haj Kaddour', 3);
INSERT INTO Ville VALUES(177, 'Ifrane', 3);
INSERT INTO Ville VALUES(178, 'Itzer', 8);
INSERT INTO Ville VALUES(179, 'Jorf', 8);
INSERT INTO Ville VALUES(180, 'Kehf Nsour', 5);
INSERT INTO Ville VALUES(181, 'Kerrouchen', 5);
INSERT INTO Ville VALUES(182, 'M''haya', 3);
INSERT INTO Ville VALUES(183, 'M''rirt', 5);
INSERT INTO Ville VALUES(184, 'Midelt', 8);
INSERT INTO Ville VALUES(185, 'Moulay Ali Cherif', 8);
INSERT INTO Ville VALUES(186, 'Moulay Bouazza', 5);
INSERT INTO Ville VALUES(187, 'Moulay Idriss Zerhoun', 3);
INSERT INTO Ville VALUES(188, 'Moussaoua', 3);
INSERT INTO Ville VALUES(189, 'N''Zalat Bni Amar', 3);
INSERT INTO Ville VALUES(190, 'Ouaoumana', 5);
INSERT INTO Ville VALUES(191, 'Oued Ifrane', 3);
INSERT INTO Ville VALUES(192, 'Sabaa Aiyoun', 3);
INSERT INTO Ville VALUES(193, 'Sebt Jahjouh', 3);
INSERT INTO Ville VALUES(194, 'Sidi Addi', 3);
INSERT INTO Ville VALUES(195, 'Tichoute', 8);
INSERT INTO Ville VALUES(196, 'Tighassaline', 5);
INSERT INTO Ville VALUES(197, 'Tighza', 5);
INSERT INTO Ville VALUES(198, 'Timahdite', 3);
INSERT INTO Ville VALUES(199, 'Tinejdad', 8);
INSERT INTO Ville VALUES(200, 'Tizguite', 3);
INSERT INTO Ville VALUES(201, 'Toulal', 3);
INSERT INTO Ville VALUES(202, 'Tounfite', 8);
INSERT INTO Ville VALUES(203, 'Zaouia d''Ifrane', 3);
INSERT INTO Ville VALUES(204, 'Zaida', 8);
INSERT INTO Ville VALUES(205, 'Ahfir', 2);
INSERT INTO Ville VALUES(206, 'Aklim', 2);
INSERT INTO Ville VALUES(207, 'Al Aroui', 2);
INSERT INTO Ville VALUES(208, 'Ain Bni Mathar', 2);
INSERT INTO Ville VALUES(209, 'Ain Erreggada', 2);
INSERT INTO Ville VALUES(210, 'Ben Taieb', 2);
INSERT INTO Ville VALUES(211, 'Berkane', 2);
INSERT INTO Ville VALUES(212, 'Bni Ansar', 2);
INSERT INTO Ville VALUES(213, 'Bni Chiker', 2);
INSERT INTO Ville VALUES(214, 'Bni Drar', 2);
INSERT INTO Ville VALUES(215, 'Bni Tadjite', 2);
INSERT INTO Ville VALUES(216, 'Bouanane', 2);
INSERT INTO Ville VALUES(217, 'Bouarfa', 2);
INSERT INTO Ville VALUES(218, 'Bouhdila', 2);
INSERT INTO Ville VALUES(219, 'Dar El Kebdani', 2);
INSERT INTO Ville VALUES(220, 'Debdou', 2);
INSERT INTO Ville VALUES(221, 'Douar Kannine', 2);
INSERT INTO Ville VALUES(222, 'Driouch', 2);
INSERT INTO Ville VALUES(223, 'El Aioun Sidi Mellouk', 2);
INSERT INTO Ville VALUES(224, 'Farkhana', 2);
INSERT INTO Ville VALUES(225, 'Figuig', 2);
INSERT INTO Ville VALUES(226, 'Ihddaden', 2);
INSERT INTO Ville VALUES(227, 'Jaadar', 2);
INSERT INTO Ville VALUES(228, 'Jerada', 2);
INSERT INTO Ville VALUES(229, 'Kariat Arekmane', 2);
INSERT INTO Ville VALUES(230, 'Kassita', 2);
INSERT INTO Ville VALUES(231, 'Kerouna', 2);
INSERT INTO Ville VALUES(232, 'Laatamna', 2);
INSERT INTO Ville VALUES(233, 'Madagh', 2);
INSERT INTO Ville VALUES(234, 'Midar', 2);
INSERT INTO Ville VALUES(235, 'Nador', 2);
INSERT INTO Ville VALUES(236, 'Naima', 2);
INSERT INTO Ville VALUES(237, 'Oued Heimer', 2);
INSERT INTO Ville VALUES(238, 'Oujda', 2);
INSERT INTO Ville VALUES(239, 'Ras El Ma', 2);
INSERT INTO Ville VALUES(240, 'Saidia', 2);
INSERT INTO Ville VALUES(241, 'Selouane', 2);
INSERT INTO Ville VALUES(242, 'Sidi Boubker', 2);
INSERT INTO Ville VALUES(243, 'Sidi Slimane Echcharaa', 2);
INSERT INTO Ville VALUES(244, 'Talsint', 2);
INSERT INTO Ville VALUES(245, 'Taourirt', 2);
INSERT INTO Ville VALUES(246, 'Tendrara', 2);
INSERT INTO Ville VALUES(247, 'Tiztoutine', 2);
INSERT INTO Ville VALUES(248, 'Touima', 2);
INSERT INTO Ville VALUES(249, 'Touissit', 2);
INSERT INTO Ville VALUES(250, 'Zaio', 2);
INSERT INTO Ville VALUES(251, 'Zeghanghane', 2);
INSERT INTO Ville VALUES(252, 'Rabat', 4);
INSERT INTO Ville VALUES(253, 'Sale', 4);
INSERT INTO Ville VALUES(254, 'Ain El Aouda', 4);
INSERT INTO Ville VALUES(255, 'Harhoura', 4);
INSERT INTO Ville VALUES(256, 'Khemisset', 4);
INSERT INTO Ville VALUES(257, 'Oulmes', 4);
INSERT INTO Ville VALUES(258, 'Rommani', 4);
INSERT INTO Ville VALUES(259, 'Sidi Allal El Bahraoui', 4);
INSERT INTO Ville VALUES(260, 'Sidi Bouknadel', 4);
INSERT INTO Ville VALUES(261, 'Skhirate', 4);
INSERT INTO Ville VALUES(262, 'Tamesna', 4);
INSERT INTO Ville VALUES(263, 'Temara', 4);
INSERT INTO Ville VALUES(264, 'Tiddas', 4);
INSERT INTO Ville VALUES(265, 'Tiflet', 4);
INSERT INTO Ville VALUES(266, 'Touarga', 4);
INSERT INTO Ville VALUES(267, 'Agadir', 9);
INSERT INTO Ville VALUES(268, 'Agdz', 8);
INSERT INTO Ville VALUES(269, 'Agni Izimmer', 9);
INSERT INTO Ville VALUES(270, 'Ait Melloul', 9);
INSERT INTO Ville VALUES(271, 'Alnif', 8);
INSERT INTO Ville VALUES(272, 'Anzi', 9);
INSERT INTO Ville VALUES(273, 'Aoulouz', 9);
INSERT INTO Ville VALUES(274, 'Aourir', 9);
INSERT INTO Ville VALUES(275, 'Arazane', 9);
INSERT INTO Ville VALUES(276, 'Ait Baha', 9);
INSERT INTO Ville VALUES(277, 'Ait Iaaza', 9);
INSERT INTO Ville VALUES(278, 'Ait Yalla', 8);
INSERT INTO Ville VALUES(279, 'Ben Sergao', 9);
INSERT INTO Ville VALUES(280, 'Biougra', 9);
INSERT INTO Ville VALUES(281, 'Boumalne-Dades', 8);
INSERT INTO Ville VALUES(282, 'Dcheira El Jihadia', 9);
INSERT INTO Ville VALUES(283, 'Drargua', 9);
INSERT INTO Ville VALUES(284, 'El Guerdane', 9);
INSERT INTO Ville VALUES(285, 'Harte Lyamine', 8);
INSERT INTO Ville VALUES(286, 'Ida Ougnidif', 9);
INSERT INTO Ville VALUES(287, 'Ifri', 8);
INSERT INTO Ville VALUES(288, 'Igdamen', 9);
INSERT INTO Ville VALUES(289, 'Ighil n''Oumgoun', 8);
INSERT INTO Ville VALUES(290, 'Imassine', 8);
INSERT INTO Ville VALUES(291, 'Inezgane', 9);
INSERT INTO Ville VALUES(292, 'Irherm', 9);
INSERT INTO Ville VALUES(293, 'Kelaat-M''Gouna', 8);
INSERT INTO Ville VALUES(294, 'Lakhsas', 9);
INSERT INTO Ville VALUES(295, 'Lakhsass', 9);
INSERT INTO Ville VALUES(296, 'Lqliaa', 9);
INSERT INTO Ville VALUES(297, 'M''semrir', 8);
INSERT INTO Ville VALUES(298, 'Massa (Maroc)', 9);
INSERT INTO Ville VALUES(299, 'Megousse', 9);
INSERT INTO Ville VALUES(300, 'Ouarzazate', 8);
INSERT INTO Ville VALUES(301, 'Oulad Berhil', 9);
INSERT INTO Ville VALUES(302, 'Oulad Teima', 9);
INSERT INTO Ville VALUES(303, 'Sarghine', 8);
INSERT INTO Ville VALUES(304, 'Sidi Ifni', 10);
INSERT INTO Ville VALUES(305, 'Skoura', 8);
INSERT INTO Ville VALUES(306, 'Tabounte', 8);
INSERT INTO Ville VALUES(307, 'Tafraout', 9);
INSERT INTO Ville VALUES(308, 'Taghzout', 1);
INSERT INTO Ville VALUES(309, 'Tagzen', 9);
INSERT INTO Ville VALUES(310, 'Taliouine', 9);
INSERT INTO Ville VALUES(311, 'Tamegroute', 8);
INSERT INTO Ville VALUES(312, 'Tamraght', 9);
INSERT INTO Ville VALUES(313, 'Tanoumrite Nkob Zagora', 8);
INSERT INTO Ville VALUES(314, 'Taourirt ait zaghar', 8);
INSERT INTO Ville VALUES(315, 'Taroudannt', 9);
INSERT INTO Ville VALUES(316, 'Temsia', 9);
INSERT INTO Ville VALUES(317, 'Tifnit', 9);
INSERT INTO Ville VALUES(318, 'Tisgdal', 9);
INSERT INTO Ville VALUES(319, 'Tiznit', 9);
INSERT INTO Ville VALUES(320, 'Toundoute', 8);
INSERT INTO Ville VALUES(321, 'Zagora', 8);
INSERT INTO Ville VALUES(322, 'Afourar', 5);
INSERT INTO Ville VALUES(323, 'Aghbala', 5);
INSERT INTO Ville VALUES(324, 'Azilal', 5);
INSERT INTO Ville VALUES(325, 'Ait Majden', 5);
INSERT INTO Ville VALUES(326, 'Beni Ayat', 5);
INSERT INTO Ville VALUES(327, 'Beni Mellal', 5);
INSERT INTO Ville VALUES(328, 'Bin elouidane', 5);
INSERT INTO Ville VALUES(329, 'Bradia', 5);
INSERT INTO Ville VALUES(330, 'Bzou', 5);
INSERT INTO Ville VALUES(331, 'Dar Oulad Zidouh', 5);
INSERT INTO Ville VALUES(332, 'Demnate', 5);
INSERT INTO Ville VALUES(333, 'Dra''a', 8);
INSERT INTO Ville VALUES(334, 'El Ksiba', 5);
INSERT INTO Ville VALUES(335, 'Foum Jamaa', 5);
INSERT INTO Ville VALUES(336, 'Fquih Ben Salah', 5);
INSERT INTO Ville VALUES(337, 'Kasba Tadla', 5);
INSERT INTO Ville VALUES(338, 'Ouaouizeght', 5);
INSERT INTO Ville VALUES(339, 'Oulad Ayad', 5);
INSERT INTO Ville VALUES(340, 'Oulad M''Barek', 5);
INSERT INTO Ville VALUES(341, 'Oulad Yaich', 5);
INSERT INTO Ville VALUES(342, 'Sidi Jaber', 5);
INSERT INTO Ville VALUES(343, 'Souk Sebt Oulad Nemma', 5);
INSERT INTO Ville VALUES(344, 'Zaouiat Cheikh', 5);
INSERT INTO Ville VALUES(345, 'Tanger', 1);
INSERT INTO Ville VALUES(346, 'Tetouan', 1);
INSERT INTO Ville VALUES(347, 'Akchour', 1);
INSERT INTO Ville VALUES(348, 'Assilah', 1);
INSERT INTO Ville VALUES(349, 'Bab Berred', 1);
INSERT INTO Ville VALUES(350, 'Bab Taza', 1);
INSERT INTO Ville VALUES(351, 'Brikcha', 1);
INSERT INTO Ville VALUES(352, 'Chefchaouen', 1);
INSERT INTO Ville VALUES(353, 'Dar Bni Karrich', 1);
INSERT INTO Ville VALUES(354, 'Dar Chaoui', 1);
INSERT INTO Ville VALUES(355, 'Fnideq', 1);
INSERT INTO Ville VALUES(356, 'Gueznaia', 1);
INSERT INTO Ville VALUES(357, 'Jebha', 1);
INSERT INTO Ville VALUES(358, 'Karia', 3);
INSERT INTO Ville VALUES(359, 'Khemis Sahel', 1);
INSERT INTO Ville VALUES(360, 'Ksar El Kebir', 1);
INSERT INTO Ville VALUES(361, 'Larache', 1);
INSERT INTO Ville VALUES(362, 'M''diq', 1);
INSERT INTO Ville VALUES(363, 'Martil', 1);
INSERT INTO Ville VALUES(364, 'Moqrisset', 1);
INSERT INTO Ville VALUES(365, 'Oued Laou', 1);
INSERT INTO Ville VALUES(366, 'Oued Rmel', 1);
INSERT INTO Ville VALUES(367, 'Ouazzane', 1);
INSERT INTO Ville VALUES(368, 'Point Cires', 1);
INSERT INTO Ville VALUES(369, 'Sidi Lyamani', 1);
INSERT INTO Ville VALUES(370, 'Sidi Mohamed ben Abdallah el-Raisuni', 1);
INSERT INTO Ville VALUES(371, 'Zinat', 1);
INSERT INTO Ville VALUES(372, 'Ajdir', 1);
INSERT INTO Ville VALUES(373, 'Aknoul', 3);
INSERT INTO Ville VALUES(374, 'Al Hoceima', 1);
INSERT INTO Ville VALUES(375, 'Ait Hichem', 1);
INSERT INTO Ville VALUES(376, 'Bni Bouayach', 1);
INSERT INTO Ville VALUES(377, 'Bni Hadifa', 1);
INSERT INTO Ville VALUES(378, 'Ghafsai', 3);
INSERT INTO Ville VALUES(379, 'Guercif', 2);
INSERT INTO Ville VALUES(380, 'Imzouren', 1);
INSERT INTO Ville VALUES(381, 'Inahnahen', 1);
INSERT INTO Ville VALUES(382, 'Issaguen (Ketama)', 1);
INSERT INTO Ville VALUES(383, 'Karia (El Jadida)', 6);
INSERT INTO Ville VALUES(384, 'Karia Ba Mohamed', 3);
INSERT INTO Ville VALUES(385, 'Oued Amlil', 3);
INSERT INTO Ville VALUES(386, 'Oulad Zbair', 3);
INSERT INTO Ville VALUES(387, 'Tahla', 3);
INSERT INTO Ville VALUES(388, 'Tala Tazegwaght', 1);
INSERT INTO Ville VALUES(389, 'Tamassint', 1);
INSERT INTO Ville VALUES(390, 'Taounate', 3);
INSERT INTO Ville VALUES(391, 'Targuist', 1);
INSERT INTO Ville VALUES(392, 'Taza', 3);
INSERT INTO Ville VALUES(393, 'Tainaste', 3);
INSERT INTO Ville VALUES(394, 'Thar Es-Souk', 3);
INSERT INTO Ville VALUES(395, 'Tissa', 3);
INSERT INTO Ville VALUES(396, 'Tizi Ouasli', 3);
INSERT INTO Ville VALUES(397, 'Laayoune', 11);
INSERT INTO Ville VALUES(398, 'El Marsa', 11);
INSERT INTO Ville VALUES(399, 'Tarfaya', 11);
INSERT INTO Ville VALUES(400, 'Boujdour', 11);
INSERT INTO Ville VALUES(401, 'Awsard', 12);
INSERT INTO Ville VALUES(402, 'Oued-Eddahab', 12);
INSERT INTO Ville VALUES(403, 'Stehat', 1);
INSERT INTO Ville VALUES(404, 'Ait Attab', 5);


CREATE TABLE GroupeSanguin
(
    id_groupe_sanguin  NUMBER PRIMARY KEY,
    groupe_sanguin VARCHAR2(3) NOT NULL,
    
    CONSTRAINT GCHECK_group_sanguin CHECK(UPPER(groupe_sanguin) IN ('A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'))
);
INSERT INTO GroupeSanguin VALUES(1, 'O+');
INSERT INTO GroupeSanguin VALUES(2, 'O-');
INSERT INTO GroupeSanguin VALUES(3, 'A+');
INSERT INTO GroupeSanguin VALUES(4, 'A-');
INSERT INTO GroupeSanguin VALUES(5, 'B+');
INSERT INTO GroupeSanguin VALUES(6, 'B-');
INSERT INTO GroupeSanguin VALUES(7, 'AB+');
INSERT INTO GroupeSanguin VALUES(8, 'AB-');


CREATE TABLE Donneur
(
    id_donneur NUMBER PRIMARY KEY,
    prenom VARCHAR2(20) NOT NULL,
    nom VARCHAR2(20) NOT NULL,
    id_ville NUMBER NOT NULL,
    id_groupe_sanguin  NUMBER NOT NULL,
    date_naissance DATE NOT NULL,
    telephone VARCHAR2(15) NOT NULL UNIQUE,
    email VARCHAR2(128) NOT NULL UNIQUE,
    password VARCHAR2(256) NOT NULL,
    disponible VARCHAR2(3) DEFAULT 'oui',
    
    -- FOREIGN KEYS --
    CONSTRAINT DFK_id_ville FOREIGN KEY(id_ville) REFERENCES Ville(id_ville) ON DELETE CASCADE,
    CONSTRAINT DFK_id_groupe_sanguin FOREIGN KEY(id_groupe_sanguin) REFERENCES GroupeSanguin(id_groupe_sanguin) ON DELETE CASCADE,
    
    -- CHECKS --
    CONSTRAINT DCHECK_prenom CHECK(LENGTH(prenom) > 3 AND LENGTH(prenom) < 20),
    CONSTRAINT DCHECK_nom CHECK(LENGTH(nom) > 3 AND LENGTH(nom) < 20),
    CONSTRAINT DCHECK_password CHECK(LENGTH(password) >= 3),
    CONSTRAINT DCHECK_email CHECK(REGEXP_LIKE(email, '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')),
    CONSTRAINT DCHECK_telephone CHECK(REGEXP_LIKE(telephone, '^(\+[0-9]{1,3}|0)([ \-_/]*)(\d[ \-_/]*){9}$')),
    CONSTRAINT DCHECK_disponible CHECK(lower(disponible) in ('oui', 'non'))
);


DROP SEQUENCE ID_COUNTER;
CREATE SEQUENCE ID_COUNTER START WITH 1 INCREMENT BY 1;



--https://www.generatedata.com/
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Rana','Hadassah',387,4,TO_DATE('1989/12/14', 'yyyy/mm/dd'),'0683838395','adipiscing.ligula.Aenean@necmollisvitae.ca',33199445,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Shelly','Eaton',169,5,TO_DATE('1965/07/20', 'yyyy/mm/dd'),'0632546039','eros@egetvolutpatornare.edu',4516894,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ciara','Chester',13,5,TO_DATE('1975/07/29', 'yyyy/mm/dd'),'+212313114792','est.mauris.rhoncus@congueelitsed.ca',16504477,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Alden','Azalia',95,5,TO_DATE('1992/09/04', 'yyyy/mm/dd'),'0666448320','tellus@Classaptenttaciti.edu',121644397,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Althea','April',68,7,TO_DATE('1995/02/14', 'yyyy/mm/dd'),'0695756263','sed.turpis@Praesenteunulla.edu',80103092,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Hector','Zeph',365,7,TO_DATE('1991/05/01', 'yyyy/mm/dd'),'0643387686','consequat@eleifendnondapibus.ca',47790478,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Simon','Octavia',141,3,TO_DATE('1997/05/15', 'yyyy/mm/dd'),'0680223219','aliquet.metus.urna@montesnascetur.edu',60363068,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Quincy','Jennifer',167,7,TO_DATE('1961/02/19', 'yyyy/mm/dd'),'0641745290','in.consequat@mollisDuis.org',37678643,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Jarrod','TaShya',297,4,TO_DATE('1999/03/06', 'yyyy/mm/dd'),'+212226682067','aliquam@arcuetpede.co.uk',37555089,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Cheyenne','Vivien',104,8,TO_DATE('1994/03/16', 'yyyy/mm/dd'),'0649496885','non.bibendum.sed@dolor.net',6861762,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Lareina','Kyle',83,6,TO_DATE('1973/08/04', 'yyyy/mm/dd'),'+212546113066','sed.sem@tristiquepellentesquetellus.net',80786224,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Drake','Brennan',172,7,TO_DATE('1975/09/08', 'yyyy/mm/dd'),'+212131430181','libero.et@aclibero.edu',37088057,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ivana','Shoshana',164,2,TO_DATE('1967/03/12', 'yyyy/mm/dd'),'+212286127082','porttitor@lectusquis.ca',8168697,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Erica','Nayda',63,8,TO_DATE('1970/12/05', 'yyyy/mm/dd'),'0654464696','eget@non.ca',82567638,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Owen','Skyler',89,8,TO_DATE('1963/12/12', 'yyyy/mm/dd'),'0601770542','leo.elementum.sem@vehiculaetrutrum.ca',28224176,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Channing','Dolan',208,1,TO_DATE('1967/06/22', 'yyyy/mm/dd'),'0692681106','est.arcu@Donecporttitor.edu',118583251,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Quintessa','Russell',257,6,TO_DATE('1979/02/02', 'yyyy/mm/dd'),'+212936510622','quis.turpis.vitae@CuraePhasellus.ca',102945766,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Damon','Castor',296,2,TO_DATE('1981/10/26', 'yyyy/mm/dd'),'+212817152730','scelerisque.scelerisque.dui@nisiCumsociis.org',87314306,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Kelly','Lewis',68,3,TO_DATE('1981/05/27', 'yyyy/mm/dd'),'+212654564039','eget.volutpat.ornare@atvelit.org',78837915,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Karina','Priscilla',38,3,TO_DATE('1972/11/07', 'yyyy/mm/dd'),'+212534173238','dapibus@elit.ca',70858537,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Keefe','Nichole',149,7,TO_DATE('1984/03/06', 'yyyy/mm/dd'),'+212527548883','rutrum@loremDonec.co.uk',36253188,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Donovan','Chaim',364,5,TO_DATE('1971/06/30', 'yyyy/mm/dd'),'0612489855','ut@sed.ca',58713040,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ronan','Bradley',54,4,TO_DATE('1997/01/23', 'yyyy/mm/dd'),'+212437302929','sagittis@blanditviverraDonec.ca',53971087,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Griffith','Cara',306,8,TO_DATE('1987/04/12', 'yyyy/mm/dd'),'0675004738','mauris.id.sapien@pedeultricesa.com',13296535,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Aidan','Callum',325,6,TO_DATE('1987/05/15', 'yyyy/mm/dd'),'+212161722314','dui.Suspendisse.ac@Duis.edu',26944141,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Shana','Byron',209,8,TO_DATE('1966/06/21', 'yyyy/mm/dd'),'+212481544100','aliquet@quam.co.uk',85094424,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Bevis','Naomi',175,1,TO_DATE('1976/12/28', 'yyyy/mm/dd'),'+212528206548','Integer@iaculisquis.net',76934337,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Nina','Lunea',279,5,TO_DATE('2001/01/06', 'yyyy/mm/dd'),'+212610811483','quis@consectetuer.org',57181815,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Paul','Noelle',96,1,TO_DATE('1992/02/27', 'yyyy/mm/dd'),'0619637196','mauris.elit.dictum@semperauctor.com',57363909,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Gage','Burke',225,8,TO_DATE('2002/05/25', 'yyyy/mm/dd'),'0670738055','sit.amet.luctus@lacusNulla.edu',14748021,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Susan','Jerry',324,3,TO_DATE('1995/03/23', 'yyyy/mm/dd'),'0647767430','sagittis@mauriseu.org',103366975,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Brock','Emerald',361,3,TO_DATE('1989/11/07', 'yyyy/mm/dd'),'+212213171853','in@adipiscing.com',62269427,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Cameron','Shellie',250,1,TO_DATE('1961/08/02', 'yyyy/mm/dd'),'+212113743576','nibh.Donec@acnulla.ca',2840139,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Michael','Autumn',40,3,TO_DATE('1987/09/15', 'yyyy/mm/dd'),'0628312935','dolor.sit@dictummagna.net',47876380,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Dieter','Kane',62,7,TO_DATE('1973/05/23', 'yyyy/mm/dd'),'+212754254861','ultrices.posuere.cubilia@mipedenonummy.co.uk',54581378,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Denton','Emerson',137,6,TO_DATE('1971/03/05', 'yyyy/mm/dd'),'+212400694464','vel@Fuscealiquet.org',93817824,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Stella','Blaze',247,1,TO_DATE('1972/10/15', 'yyyy/mm/dd'),'+212914042665','diam.Pellentesque.habitant@semper.ca',12709093,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ivan','Yolanda',158,8,TO_DATE('1988/03/16', 'yyyy/mm/dd'),'0646287078','nibh.Aliquam@loremvehicula.com',6366529,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Aurelia','Wallace',144,2,TO_DATE('1962/11/13', 'yyyy/mm/dd'),'+212799298375','libero@Pellentesque.edu',13237133,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Edan','Mollie',286,3,TO_DATE('1997/12/22', 'yyyy/mm/dd'),'+212458507200','sit.amet.consectetuer@egestasSedpharetra.ca',36492847,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Chancellor','Kaitlin',215,8,TO_DATE('1987/12/30', 'yyyy/mm/dd'),'+212417652869','Duis.dignissim.tempor@enim.org',118313852,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Graiden','Marvin',36,1,TO_DATE('1998/11/10', 'yyyy/mm/dd'),'+212223447853','aliquam.arcu.Aliquam@nondapibus.edu',110357789,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Timothy','Ivana',337,5,TO_DATE('2001/07/24', 'yyyy/mm/dd'),'0685523720','ac@porttitorscelerisqueneque.edu',79132454,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Aidan','Debra',282,6,TO_DATE('1984/08/22', 'yyyy/mm/dd'),'+212518122892','aliquet.diam.Sed@Maurisvel.org',32284105,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Lillian','Oscar',213,2,TO_DATE('1974/09/18', 'yyyy/mm/dd'),'+212894759551','at.augue.id@vitaealiquameros.edu',92360439,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Neve','Gannon',388,6,TO_DATE('1979/04/05', 'yyyy/mm/dd'),'0665008028','lacus@risus.co.uk',114922236,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Quail','Ronan',142,2,TO_DATE('1963/10/18', 'yyyy/mm/dd'),'0659479820','Sed.neque@maurissagittis.ca',31266239,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Malik','Venus',121,5,TO_DATE('1988/08/22', 'yyyy/mm/dd'),'0667228789','mauris.id.sapien@cursus.net',106121538,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Dillon','Hammett',343,8,TO_DATE('1988/05/21', 'yyyy/mm/dd'),'+212542711647','tempus.scelerisque@adipiscing.co.uk',6399168,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Chaney','Haley',127,1,TO_DATE('1986/03/11', 'yyyy/mm/dd'),'+212968755589','Aliquam@aceleifend.com',52888515,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Indira','Chadwick',217,4,TO_DATE('1960/01/11', 'yyyy/mm/dd'),'0627516203','vehicula.Pellentesque@Curabitur.com',114030413,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Lyle','MacKenzie',37,3,TO_DATE('1988/07/19', 'yyyy/mm/dd'),'+212212018444','Curae.Phasellus@Nuncullamcorpervelit.com',68704737,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Linda','Boris',36,4,TO_DATE('1960/10/06', 'yyyy/mm/dd'),'+212324973676','vitae@orci.edu',30815368,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Harper','Keith',354,3,TO_DATE('1966/07/23', 'yyyy/mm/dd'),'0684334009','at.iaculis.quis@leoMorbi.net',60605536,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Christen','Elijah',32,5,TO_DATE('1994/05/07', 'yyyy/mm/dd'),'+212734456444','et@et.ca',78423237,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Imelda','Quyn',348,7,TO_DATE('1988/02/27', 'yyyy/mm/dd'),'+212360022544','ultricies.dignissim@eget.net',12726769,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Bree','Rylee',43,7,TO_DATE('1998/02/22', 'yyyy/mm/dd'),'+212592158009','Nam@ac.ca',46379081,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Demetrius','Amal',404,2,TO_DATE('1983/10/20', 'yyyy/mm/dd'),'+212367861088','eget@nequesed.org',29618963,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Lane','Joelle',191,4,TO_DATE('1978/09/01', 'yyyy/mm/dd'),'0698142829','nec.enim@ideratEtiam.ca',55965577,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Erin','Calvin',241,4,TO_DATE('1990/10/12', 'yyyy/mm/dd'),'+212387095720','enim.nisl.elementum@ipsumporta.net',75925534,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Darrel','Grace',139,8,TO_DATE('1983/06/03', 'yyyy/mm/dd'),'0670121726','Cras.interdum@et.co.uk',63012842,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Channing','Ivor',134,8,TO_DATE('1992/01/19', 'yyyy/mm/dd'),'+212795604095','malesuada.vel.venenatis@egestasSedpharetra.co.uk',108632047,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Emily','Stacey',329,5,TO_DATE('1983/12/18', 'yyyy/mm/dd'),'0629976295','rhoncus@aliquet.co.uk',8032726,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Bruno','Sophia',392,1,TO_DATE('1989/03/09', 'yyyy/mm/dd'),'0683600394','dictum.cursus@ametrisus.edu',32962204,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Dexter','Timon',193,4,TO_DATE('1991/03/21', 'yyyy/mm/dd'),'0647619092','dictum.eu.eleifend@sapienimperdietornare.com',117410985,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Orson','Simon',99,2,TO_DATE('1986/05/18', 'yyyy/mm/dd'),'0684510454','dolor.sit@Duisvolutpatnunc.com',7506967,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Hall','Alana',103,6,TO_DATE('1987/12/30', 'yyyy/mm/dd'),'0626736200','Cum@eratsemperrutrum.org',34398439,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Audrey','Vincent',322,8,TO_DATE('1970/06/08', 'yyyy/mm/dd'),'+212998696970','Duis.risus@velit.com',18730623,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Cole','Laura',356,8,TO_DATE('1963/04/13', 'yyyy/mm/dd'),'+212046686699','Praesent@magnaCrasconvallis.org',33532704,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Damon','Ferris',5,5,TO_DATE('1966/09/05', 'yyyy/mm/dd'),'+212214347245','nec.luctus@sempertellusid.org',74510775,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Hanna','Belle',191,6,TO_DATE('1967/01/14', 'yyyy/mm/dd'),'0634395823','a.nunc@Aeneanegestashendrerit.com',2767261,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Simon','Tanya',317,4,TO_DATE('1985/03/17', 'yyyy/mm/dd'),'+212421287796','cursus@a.com',76187546,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Lane','Dora',308,3,TO_DATE('1976/10/23', 'yyyy/mm/dd'),'0607685995','sodales@necorci.co.uk',9044925,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Chester','Karly',389,7,TO_DATE('1971/12/01', 'yyyy/mm/dd'),'0623391122','non.enim.commodo@id.edu',89269057,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Lydia','Mary',293,4,TO_DATE('1986/02/26', 'yyyy/mm/dd'),'+212363976864','aliquet.diam.Sed@adipiscing.com',38311091,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Keith','James',212,8,TO_DATE('1966/02/04', 'yyyy/mm/dd'),'+212585924229','quis.pede.Praesent@Utsagittislobortis.org',63924495,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ronan','Callie',36,5,TO_DATE('1999/04/28', 'yyyy/mm/dd'),'+212912095810','ac.mattis.semper@Proinsedturpis.com',83967424,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Alea','Joshua',246,1,TO_DATE('1977/07/06', 'yyyy/mm/dd'),'0639474341','Suspendisse.dui@vel.ca',98577056,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Laura','Rahim',135,8,TO_DATE('1970/07/14', 'yyyy/mm/dd'),'+212110647025','Quisque.porttitor@Quisque.org',39377465,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Wallace','Acton',227,2,TO_DATE('1978/06/22', 'yyyy/mm/dd'),'+212768278349','Cras.dolor@nonsollicitudin.ca',73484048,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Kadeem','Belle',228,7,TO_DATE('1970/07/05', 'yyyy/mm/dd'),'0681054257','Phasellus.elit.pede@id.com',66101413,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ralph','Mannix',9,5,TO_DATE('1980/10/02', 'yyyy/mm/dd'),'0614631763','rutrum.lorem.ac@mifelis.com',85419669,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'September','Yoshio',357,5,TO_DATE('1991/01/28', 'yyyy/mm/dd'),'+212165372703','risus@antelectusconvallis.org',120915508,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Hedy','Glenna',131,5,TO_DATE('1985/05/31', 'yyyy/mm/dd'),'0694649575','faucibus.id@convallisante.net',110051438,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Melinda','Armand',162,7,TO_DATE('1976/08/09', 'yyyy/mm/dd'),'0652026117','erat.Vivamus.nisi@erosNam.com',17157207,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Chloe','Colton',248,7,TO_DATE('1978/04/16', 'yyyy/mm/dd'),'+212718519692','gravida@tellus.edu',83236497,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Dahlia','Donna',218,2,TO_DATE('1964/02/01', 'yyyy/mm/dd'),'+212742265974','justo.sit.amet@morbitristiquesenectus.com',45234822,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Richard','Candace',359,2,TO_DATE('1960/06/13', 'yyyy/mm/dd'),'0648172385','augue.id@magnaPraesentinterdum.com',42689483,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Kennedy','Tarik',64,8,TO_DATE('1984/12/05', 'yyyy/mm/dd'),'+212074598644','lacinia@utsem.com',48995072,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Fulton','Lucy',256,6,TO_DATE('1961/12/16', 'yyyy/mm/dd'),'0651453496','Donec@Fusce.ca',86381214,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Kenyon','Erin',322,7,TO_DATE('1963/03/22', 'yyyy/mm/dd'),'0635751960','et.rutrum.eu@hendreritnequeIn.co.uk',7295698,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Evelyn','Sydney',217,5,TO_DATE('1994/04/03', 'yyyy/mm/dd'),'+212183262187','mi@quam.net',34533444,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Benjamin','Hiroko',38,3,TO_DATE('1996/02/05', 'yyyy/mm/dd'),'+212974608726','amet@necluctusfelis.org',16468795,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Erasmus','Meghan',244,2,TO_DATE('1995/02/28', 'yyyy/mm/dd'),'+212570298590','mi@facilisi.ca',61177421,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Kiayada','Indigo',289,7,TO_DATE('1994/06/10', 'yyyy/mm/dd'),'0619033327','Mauris.ut.quam@parturientmontes.org',66316043,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Tallulah','Shea',218,7,TO_DATE('1978/12/05', 'yyyy/mm/dd'),'0646892750','vitae.mauris.sit@CurabiturdictumPhasellus.com',104449375,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Amelia','Aphrodite',213,6,TO_DATE('1974/05/10', 'yyyy/mm/dd'),'0696509662','sociosqu.ad@Integer.net',6147761,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Buffy','Reese',181,3,TO_DATE('1983/06/04', 'yyyy/mm/dd'),'0685527558','lacus.Quisque@consectetuercursuset.com',15004505,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Mariam','Maris',117,8,TO_DATE('1963/12/01', 'yyyy/mm/dd'),'0658138810','sit@malesuadafames.ca',59500997,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Evangeline','Hamish',195,2,TO_DATE('2000/11/03', 'yyyy/mm/dd'),'0661307803','sem@pulvinararcuet.co.uk',68833351,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Teegan','Haviva',26,1,TO_DATE('1992/11/24', 'yyyy/mm/dd'),'+212561339730','elit.Aliquam.auctor@adipiscingelitEtiam.co.uk',64518998,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Nicholas','Lawrence',347,3,TO_DATE('2000/02/11', 'yyyy/mm/dd'),'0634978908','nec@Vestibulum.co.uk',97819490,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Kenyon','Shea',359,8,TO_DATE('1964/10/25', 'yyyy/mm/dd'),'0693580541','diam.dictum@acmieleifend.edu',66444337,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Lael','Galena',254,6,TO_DATE('1992/09/29', 'yyyy/mm/dd'),'0692947785','semper@maurissitamet.co.uk',22564888,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Hiroko','Gray',255,5,TO_DATE('1960/09/17', 'yyyy/mm/dd'),'+212172022987','lorem.ac.risus@rutrum.net',40744340,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Rhea','Alexander',307,8,TO_DATE('1990/01/26', 'yyyy/mm/dd'),'+212636315610','commodo.tincidunt@justofaucibus.org',62000435,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Lesley','Maris',69,3,TO_DATE('1995/05/17', 'yyyy/mm/dd'),'0685399099','ante@rhoncusNullam.co.uk',119323995,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Roary','Elizabeth',352,5,TO_DATE('1966/08/09', 'yyyy/mm/dd'),'+212558134703','elit@elitdictum.ca',37498448,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Farrah','Marah',173,2,TO_DATE('1972/01/30', 'yyyy/mm/dd'),'0691832039','Duis.sit@risus.org',81530349,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ayanna','Quamar',345,3,TO_DATE('1973/03/24', 'yyyy/mm/dd'),'0631543251','accumsan.interdum@consequatpurus.ca',106494332,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Harlan','Logan',97,3,TO_DATE('1986/05/18', 'yyyy/mm/dd'),'+212173656906','id.risus.quis@In.net',12734361,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Hermione','Melinda',20,5,TO_DATE('1984/07/08', 'yyyy/mm/dd'),'+212794082102','Integer.aliquam.adipiscing@enim.co.uk',104265857,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ronan','Hasad',263,6,TO_DATE('1973/03/03', 'yyyy/mm/dd'),'+212418942727','montes.nascetur.ridiculus@Sed.com',43809723,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Wendy','Duncan',298,4,TO_DATE('2001/01/05', 'yyyy/mm/dd'),'0626293184','urna.Vivamus@Nullaeget.co.uk',81686530,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Rebecca','Megan',340,4,TO_DATE('1969/01/10', 'yyyy/mm/dd'),'0601336103','dapibus.quam@sedleo.edu',113587959,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Keane','Fallon',274,3,TO_DATE('1988/11/11', 'yyyy/mm/dd'),'0636183769','Cras.vehicula@eteuismodet.net',27243000,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Jelani','Laura',225,8,TO_DATE('1984/11/21', 'yyyy/mm/dd'),'0675347354','luctus@duilectusrutrum.edu',112399569,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Garrett','Marcia',384,2,TO_DATE('1967/08/28', 'yyyy/mm/dd'),'0656858615','Donec.est@temporeratneque.net',120096196,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Juliet','Rigel',140,1,TO_DATE('1966/09/04', 'yyyy/mm/dd'),'+212163244847','Aliquam.auctor.velit@ametmassaQuisque.net',21134613,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Alice','Zenia',4,5,TO_DATE('1969/06/12', 'yyyy/mm/dd'),'+212311464583','magna@semperrutrum.co.uk',27808983,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Sarah','Reed',266,5,TO_DATE('1967/06/05', 'yyyy/mm/dd'),'+212444015975','conubia.nostra.per@mi.edu',14616435,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Abdul','Adara',220,5,TO_DATE('1966/10/09', 'yyyy/mm/dd'),'+212303560582','Etiam.bibendum@arcu.co.uk',9497049,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Gwendolyn','Lawrence',141,1,TO_DATE('1983/06/30', 'yyyy/mm/dd'),'0680758946','sem.ut@sapienimperdiet.ca',122694184,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Karly','Inez',256,3,TO_DATE('1979/04/19', 'yyyy/mm/dd'),'0695028977','ac.risus@idnuncinterdum.org',48849970,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Emerson','Austin',140,4,TO_DATE('1968/03/16', 'yyyy/mm/dd'),'0653952009','Sed.diam.lorem@vitaevelit.com',65249754,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Daryl','Aidan',182,2,TO_DATE('2000/03/25', 'yyyy/mm/dd'),'+212579358618','Donec.est.Nunc@malesuada.net',105345361,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Flynn','Libby',314,6,TO_DATE('1993/10/08', 'yyyy/mm/dd'),'0658959862','vel.mauris@euismodetcommodo.co.uk',53928228,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Oliver','Declan',157,1,TO_DATE('1972/02/24', 'yyyy/mm/dd'),'+212435851317','molestie.in@vel.net',32433930,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Marshall','Miranda',33,6,TO_DATE('1965/07/23', 'yyyy/mm/dd'),'+212660468840','lectus.pede@InfaucibusMorbi.ca',84988104,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Macey','Ursa',121,1,TO_DATE('1999/03/29', 'yyyy/mm/dd'),'+212844064598','tempor.lorem@antedictumcursus.net',47637265,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Moses','Patience',54,4,TO_DATE('1977/11/19', 'yyyy/mm/dd'),'0656290907','arcu.eu.odio@esttemporbibendum.com',13105749,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Shelby','Rafael',307,1,TO_DATE('1965/06/19', 'yyyy/mm/dd'),'+212027881194','Curabitur@magna.co.uk',10599598,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Unity','Maxwell',198,4,TO_DATE('1979/04/14', 'yyyy/mm/dd'),'+212509000353','tellus@ligula.net',51812016,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Chandler','Harrison',55,4,TO_DATE('1982/08/21', 'yyyy/mm/dd'),'+212357304887','quis@vestibulum.edu',25678011,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Hayley','Sage',316,1,TO_DATE('1990/08/28', 'yyyy/mm/dd'),'0685820164','quam@odiovel.com',62637559,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Kylan','Leandra',92,3,TO_DATE('1967/10/24', 'yyyy/mm/dd'),'0660331023','auctor.velit@a.edu',8294849,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Alvin','Kelly',9,5,TO_DATE('1967/08/31', 'yyyy/mm/dd'),'+212063300194','Curabitur.ut.odio@In.co.uk',40297800,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Price','Josiah',65,8,TO_DATE('2001/08/01', 'yyyy/mm/dd'),'0677290654','cubilia@magnis.edu',49091424,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Grace','Blake',357,6,TO_DATE('1982/05/28', 'yyyy/mm/dd'),'0618471189','urna@magnaaneque.edu',123425510,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Carol','Flavia',74,4,TO_DATE('1997/07/07', 'yyyy/mm/dd'),'+212202866492','laoreet.libero@urna.net',8937000,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Selma','Wynne',287,5,TO_DATE('1999/10/08', 'yyyy/mm/dd'),'+212923387154','aliquam.eros.turpis@vestibulum.org',80510608,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Orla','Rowan',10,3,TO_DATE('1963/01/18', 'yyyy/mm/dd'),'+212956553553','malesuada.fames@ligula.co.uk',51580770,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Kenyon','Sandra',124,3,TO_DATE('1995/11/22', 'yyyy/mm/dd'),'0613550933','auctor.Mauris.vel@magnaet.com',25996594,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Stuart','Lamar',56,3,TO_DATE('1960/09/09', 'yyyy/mm/dd'),'+212175785263','Curae.Phasellus.ornare@est.co.uk',122724446,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ezekiel','Amber',205,4,TO_DATE('1985/10/01', 'yyyy/mm/dd'),'0606680515','pellentesque.Sed@loremac.com',66300625,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Kalia','Shad',312,1,TO_DATE('1984/07/16', 'yyyy/mm/dd'),'+212979104480','fermentum.arcu@semper.co.uk',52806880,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Phelan','Plato',324,8,TO_DATE('1996/08/18', 'yyyy/mm/dd'),'0691860542','Proin@facilisis.net',62915391,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Brynn','Charles',324,4,TO_DATE('1982/11/22', 'yyyy/mm/dd'),'0612747688','rutrum.lorem@malesuadavelconvallis.edu',23633346,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Katelyn','Germaine',150,5,TO_DATE('1973/03/30', 'yyyy/mm/dd'),'0631329246','posuere.cubilia@cursusa.co.uk',106302126,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Garth','Seth',100,8,TO_DATE('1973/03/30', 'yyyy/mm/dd'),'+212796096489','vestibulum@volutpat.net',69874490,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Solomon','Bell',138,4,TO_DATE('1993/06/20', 'yyyy/mm/dd'),'0621498240','penatibus@euerosNam.co.uk',54824671,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Lance','Lucian',103,3,TO_DATE('1978/01/03', 'yyyy/mm/dd'),'+212130329702','dictum.magna@sedliberoProin.co.uk',4673283,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Henry','Ignacia',374,2,TO_DATE('1990/09/26', 'yyyy/mm/dd'),'+212793753051','sociis.natoque@idmagnaet.com',66186651,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Yetta','Lucius',377,8,TO_DATE('1985/01/11', 'yyyy/mm/dd'),'+212799276856','eros.Proin.ultrices@acrisus.com',98141565,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Vielka','Jameson',368,8,TO_DATE('1983/10/09', 'yyyy/mm/dd'),'+212250393871','fringilla@Lorem.net',23618264,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Felicia','Lamar',74,1,TO_DATE('1986/12/28', 'yyyy/mm/dd'),'0616978144','neque@venenatislacusEtiam.co.uk',53786894,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Adara','Chase',353,3,TO_DATE('1986/07/24', 'yyyy/mm/dd'),'+212827193951','quis.pede@anteipsumprimis.org',67696364,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Thomas','Paula',260,3,TO_DATE('1984/09/06', 'yyyy/mm/dd'),'+212450180769','Donec.dignissim@congueIn.edu',30879005,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Abdul','Giselle',54,8,TO_DATE('1969/08/04', 'yyyy/mm/dd'),'+212329880620','Suspendisse.ac@enim.ca',59311530,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Imogene','Luke',57,5,TO_DATE('1990/10/21', 'yyyy/mm/dd'),'+212461591058','id@vulputateposuere.org',73470746,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Irma','Erin',217,5,TO_DATE('1995/04/22', 'yyyy/mm/dd'),'+212375791068','purus@elitsed.co.uk',9731107,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Candice','Molly',75,7,TO_DATE('1962/08/15', 'yyyy/mm/dd'),'0684964448','vulputate@Pellentesque.org',118377780,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Avye','Raphael',318,4,TO_DATE('2000/07/09', 'yyyy/mm/dd'),'0694355972','eu.turpis.Nulla@aaliquetvel.org',78755794,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Graham','Rina',292,6,TO_DATE('1965/11/17', 'yyyy/mm/dd'),'0642552806','mauris.Morbi@enimEtiam.com',10116389,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Bruno','Keegan',30,3,TO_DATE('1963/12/07', 'yyyy/mm/dd'),'0657013648','urna.Nunc@Nullamutnisi.org',43088283,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Burton','Josiah',78,1,TO_DATE('1963/10/27', 'yyyy/mm/dd'),'0608042571','Aenean.euismod.mauris@erosnonenim.co.uk',1583806,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Simon','Maxwell',230,3,TO_DATE('1977/09/13', 'yyyy/mm/dd'),'+212628957359','augue@fringillaDonecfeugiat.org',13637063,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Karyn','Brock',104,6,TO_DATE('1961/05/18', 'yyyy/mm/dd'),'0644103647','dictum.sapien@tinciduntpede.edu',79255198,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Beatrice','Hermione',178,5,TO_DATE('1993/10/15', 'yyyy/mm/dd'),'0612981115','rhoncus.Nullam@Sednunc.org',120826386,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Clayton','Chandler',140,4,TO_DATE('2001/06/11', 'yyyy/mm/dd'),'0681300120','non.dapibus@faucibusorci.edu',35804346,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Irma','Juliet',343,2,TO_DATE('1962/09/16', 'yyyy/mm/dd'),'0652640156','dolor@aliquam.edu',66751393,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Maggie','Willow',74,3,TO_DATE('1960/03/10', 'yyyy/mm/dd'),'0666529449','nec.ante.blandit@laoreetipsum.co.uk',59663216,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Ciara','Melanie',188,1,TO_DATE('1982/05/14', 'yyyy/mm/dd'),'0647708291','Duis.gravida@Suspendissedui.org',87231232,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Mohammad','Jorden',179,7,TO_DATE('1965/06/07', 'yyyy/mm/dd'),'+212204460018','Nam.ligula@hendreritconsectetuercursus.co.uk',45053667,'non');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'TaShya','Mark',75,4,TO_DATE('1969/06/21', 'yyyy/mm/dd'),'0696338125','et@risusNunc.co.uk',17180816,'oui');
INSERT INTO Donneur VALUES (ID_COUNTER.nextval, 'Frances','Arthur',12,2,TO_DATE('1997/12/15', 'yyyy/mm/dd'),'+212974630300','euismod@Classaptenttaciti.edu',57336835,'oui');
COMMIT;

select count(*) from Donneur;