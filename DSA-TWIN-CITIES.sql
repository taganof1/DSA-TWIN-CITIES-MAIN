-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 05, 2023 at 03:41 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DSA-TWIN-CITIES`
--

-- --------------------------------------------------------

--
-- Table structure for table `base_cities`
--

CREATE TABLE `base_cities` (
  `CityID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Population` int(11) DEFAULT NULL,
  `Latitude` decimal(9,6) DEFAULT NULL,
  `Longitude` decimal(9,6) DEFAULT NULL,
  `Language` varchar(255) DEFAULT NULL,
  `Timezone` int(11) DEFAULT NULL,
  `Currency` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `base_cities`
--

INSERT INTO `base_cities` (`CityID`, `Name`, `Country`, `Population`, `Latitude`, `Longitude`, `Language`, `Timezone`, `Currency`) VALUES
(1, 'Bath', 'England', 94092, '51.378100', '-2.359700', 'English', 0, 'Pound Sterling'),
(2, 'Aix-en-Provence', 'France', 147122, '43.529700', '5.447400', 'French', 1, 'Euro'),
(3, 'Braunschweig', 'Germany', 248823, '52.268900', '10.526800', 'German', 1, 'Euro'),
(4, 'Alkmaar', 'Netherlands', 111766, '52.632400', '4.753400', 'Dutch', 1, 'Euro'),
(5, 'Exeter', 'England', 129307, '50.726000', '-3.527500', 'English', 0, 'Pound Sterling'),
(6, 'Rennes', 'France', 222485, '48.117300', '-1.677800', 'French', 1, 'Euro'),
(7, 'Bad Homburg', 'Germany', 54996, '50.228400', '8.617800', 'German', 1, 'Euro'),
(8, 'Leeds', 'England', 536280, '53.800800', '-1.549100', 'English', 0, 'Pound Sterling'),
(9, 'Brno', 'Czech Republic', 396101, '49.195100', '16.606800', 'Czech', 1, 'Czech koruna'),
(10, 'Dortmund', 'Germany', 586852, '51.513600', '7.465300', 'German', 1, 'Euro'),
(11, 'Lille', 'France', 236234, '50.629200', '3.057300', 'French', 1, 'Euro'),
(12, 'Durban', 'South Africa', 4034678, '-29.858700', '31.021800', 'English', 2, 'Rand'),
(13, 'Newcastle Upon Tyne', 'England', 286445, '54.978300', '-1.617800', 'English', 0, 'Pound Sterling'),
(14, 'Atlanta', 'United States', 498715, '33.748800', '-84.387700', 'English', -5, 'US Dollar'),
(15, 'Bergen', 'Norway', 289330, '60.391300', '5.322100', 'Norwegian', 1, 'Euro'),
(16, 'Nancy', 'France', 104403, '48.692100', '6.184400', 'French', 1, 'Euro'),
(17, 'Gelsenkirchen', 'Germany', 260126, '51.518800', '7.083800', 'German', 1, 'Euro');

-- --------------------------------------------------------

--
-- Table structure for table `poi_data`
--

CREATE TABLE `poi_data` (
  `CityID` int(11) DEFAULT NULL,
  `PointOfInterestID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Longitude` varchar(16) DEFAULT NULL,
  `Latitude` varchar(16) DEFAULT NULL,
  `History` text,
  `Wikilink` varchar(500) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poi_data`
--

INSERT INTO `poi_data` (`CityID`, `PointOfInterestID`, `Name`, `Longitude`, `Latitude`, `History`, `Wikilink`, `Type`) VALUES
(1, 1, 'Roman Baths', '-2.359649244', '51.38118071', 'The Roman Baths are ancient bathing and socializing complex that date back to Roman times, around 70 AD. The site is well-preserved and showcases the Romans\' sophisticated plumbing and heating systems.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiYvfa11dKCAxVoX0EAHWXQCusQFnoECBoQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FRoman_Baths_(Bath)&usg=AOvVaw1OptV4qtoCA_n_wvCC7dKl&opi=89978449', 1),
(1, 2, 'Bath Abbey', '-2.358745324', '51.38156789', 'Bath Abbey, formally known as the Abbey Church of Saint Peter and Saint Paul, has a rich history dating back to the 7th century. The present Abbey was rebuilt in the 12th and 16th centuries.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwil5JqH1tKCAxU7VUEAHcGfCy8QFnoECCAQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBath_Abbey&usg=AOvVaw1mvlywm81JIWo9SVjgovx_&opi=89978449', 1),
(1, 3, 'Pulteney Bridge', '-2.357909479', '51.38311698', 'Pulteney Bridge crosses the River Avon and was completed in 1774. It is one of only a few bridges in the world with shops across its full span on both sides.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiFy4TG1tKCAxViQUEAHVvHAfkQFnoECBoQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FPulteney_Bridge&usg=AOvVaw2k4x6bvHamGkNTcazwukTm&opi=89978449', 1),
(1, 4, 'Bath Fashion Museum', '-2.36220795', '51.38635295', 'The Fashion Museum in Bath houses a world-class collection of contemporary and historic dress. It includes a diverse range of fashion and accessories, showcasing the evolution of style.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwiw8uf_1tKCAxUUWEEAHc5MD_oQFnoECBoQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FFashion_5%2C_Bath&usg=AOvVaw1ElksV4sK-JF9VrpMmlRVa&opi=89978449', 6),
(2, 5, 'Cours Mirabeau', '5.44866015', '43.5268432', 'Cours Mirabeau is a wide avenue lined with plane trees and bordered by colorful buildings. It has been a central thoroughfare in Aix-en-Provence since the 17th century and is known for its markets, cafes, and fountains.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj5odTD19KCAxXTgVwKHSChBEgQFnoECBUQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FCours_Mirabeau&usg=AOvVaw2RUi1iR4ynE4HmpPprE8if&opi=89978449', 6),
(2, 6, 'Saint-Sauveur Cathedral', '5.447084053', '43.53191283', 'The Saint-Sauveur Cathedral is a Roman Catholic cathedral with a mix of architectural styles, including Romanesque and Gothic. It dates back to the 5th century and has undergone several renovations.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiCg8uA2NKCAxUFS0EAHUSgCZEQFnoECBwQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FSaint_Sauveur_Cathedral&usg=AOvVaw14YLKsHyEFG_P9I9t8FCzH&opi=89978449', 1),
(2, 7, 'Le Grand Théâtre de Provence', '5.440253298', '43.52639703', 'The Grand Théâtre de Provence is a modern architectural gem dedicated to the performing arts. It opened in 2007 and hosts a variety of cultural events, including concerts, operas, and theater performances.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiNhqeO2NKCAxV8S0EAHatPDikQFnoECAoQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FGrand_Th%25C3%25A9%25C3%25A2tre_de_Provence&usg=AOvVaw2y8CZieXVUCpUksM_R1id9&opi=89978449', 8),
(2, 8, 'Pavillon de Vendôme', '5.44209508', '43.53136154', 'The Pavillon de Vendôme is a 17th-century mansion surrounded by a beautiful garden. It was built for Louis de Mercoeur, Duke of Vendôme, and is now a musem showcasing art and local history.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiz7KGm2NKCAxUdXEEAHcLuBhEQFnoECA4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FPavillon_Vend%25C3%25B4me&usg=AOvVaw19r5rP0Vu0CbO_AxYfkarJ&opi=89978449', 1),
(3, 9, 'Brunswick Cathedral', '10.5244616', '52.26443356', 'The Brunswick Cathedral, dedicated to St. Blaise, is a medieval cathedral with a history dating back to the 12th century. It features a mix of Romanesque and Gothic architecture and has been an important religious site in Braunschweig.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiO3fHs2NKCAxVQQ0EAHdstDcoQFnoECBgQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBrunswick_Cathedral&usg=AOvVaw1WVOCNoKdBxQIrejNDUh3_&opi=89978449', 1),
(3, 10, 'Dankwarderode Castle', '10.52423611', '52.26497013', 'Dankwarderode Castle is a medieval castle located in the Burgplatz square. Originally built in the 12th century, it has served various purposes over the centuries and now houses the Herzog Anton Ulrich Museum.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiFmtf_2NKCAxXJV0EAHQpbCdAQFnoECBQQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FDankwarderode_Castle&usg=AOvVaw17E7mgFAzNqC5dWR7FK-h6&opi=89978449', 1),
(3, 11, 'Burgplatz', '10.52345063', '52.26499004', 'Burgplatz is a historic square in the heart of Braunschweig, surrounded by significant landmarks such as Dankwarderode Castle and Brunswick Cathedral. It has been a focal point for events and gatherings throughout the city\'s history.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiwh_W82dKCAxXISUEAHf5WAa4QFnoECA4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBuurgplaatz&usg=AOvVaw0MPL0KQtOvPiEPUQN2B-0M&opi=89978449', 6),
(3, 12, 'Brunswick Lion', '10.529', '52.262', 'The Brunswick Lion is a famous medieval statue located on the Burgplatz. It was commissioned by Henry the Lion in the 12th century and is a symbol of the city\'s historical significance.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjrn6DY2dKCAxXXRUEAHdzABtAQFnoECBwQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBrunswick_Lion&usg=AOvVaw0PMDnYNCJoHkXXyAVorOm2&opi=89978449', 1),
(4, 13, 'Waagplein', '4.750564481', '52.63160939', 'Waagplein is a historic square in the center of Alkmaar, known for its traditional cheese market. The square is surrounded by picturesque buildings, and the cheese market has been a tradition since the 16th century.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwiw4_H92dKCAxUt_7sIHRR5A48QFnoECA8QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FWaag_(Alkmaar)&usg=AOvVaw2Oi_hZcaRH0udD_WiLRO3j&opi=89978449', 7),
(4, 14, 'Grote Kerk', '4.742892851', '52.63235079', 'The Grote Kerk, or Great Church, is a large medieval church that dates back to the 15th century. It is a prominent landmark in Alkmaar and features Gothic architecture.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjqh72S2tKCAxWTgv0HHeArByQQFnoECBEQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FGrote_Kerk%2C_Haarlem&usg=AOvVaw13Whwd5746tOZa-DUe7Po9&opi=89978449', 1),
(4, 15, 'Stedelijk Museum Alkmaar\n\n', '4.743622949', '52.63357734', 'The Stedelijk Museum Alkmaar is an art and cultural history museum showcasing the history and art of Alkmaar and its surroundings. The museum\'s collection includes paintings, artifacts, and exhibits from various periods.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiOxtPK2tKCAxXjTEEAHTj5DNkQFnoECBAQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FStedelijk_5_Alkmaar&usg=AOvVaw1ifCjJAEc_NUialmFP51PE&opi=89978449', 5),
(4, 16, 'Molen van Piet', '4.741864063', '52.63012932', 'Molen van Piet is a historic windmill located on the city\'s ramparts. It was built in 1769 and has served various functions over the years. Today, it stands as a symbol of Alkmaar\'s heritage.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjIw4r32tKCAxWYU0EAHc1SCdsQFnoECA0QAQ&url=https%3A%2F%2Fnl.wikipedia.org%2Fwiki%2FMolen_van_Piet&usg=AOvVaw2lkO9JlcoWlGdadGM2O8th&opi=89978449', 1),
(5, 17, 'Exeter Cathedral', '-3.529886334', '50.72265698', 'Exeter Cathedral is a stunning medieval cathedral that dates back to the 12th century. It is known for its Gothic architecture, including the longest uninterrupted medieval vaulted ceiling in the world.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj638ys29KCAxXWW0EAHYaPC0AQFnoECBoQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FExeter_Cathedral&usg=AOvVaw3-0h3C470eR2HqIJJfzrx2&opi=89978449', 1),
(5, 18, 'Exeter Quay', '-3.527913076', '50.71888771', 'Exeter Quay is a historic area along the River Exe with warehouses dating back to the 17th century. It was a vital center for Exeter\'s trade and commerce.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjYnabG29KCAxWKVEEAHQCtBTwQFnoECB0QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FExeter_Quay&usg=AOvVaw0SpTEucXePUCT2TX4nBzI2&opi=89978449', 7),
(5, 19, 'Rougemont Castle', '-3.530275725', '50.72652244', 'Rougemont Castle, also known as Exeter Castle, has a history dating back to William the Conqueror\'s time in the 11th century. The site has played various roles throughout history, including as a Norman fortress and a prison.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjUg5nk29KCAxW2TkEAHarACEwQFnoECBIQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FRougemont_Castle&usg=AOvVaw2gGwidR5O-5qEsXeDKE1At&opi=89978449', 1),
(6, 21, 'Parlement de Bretagne', '-1.677874665', '48.11324229', 'The Parlement de Bretagne is a historic courthouse dating back to the 17th century. It has played a significant role in Breton history and is known for its impressive architecture.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjG1erP3NKCAxXQX0EAHVjqDDEQFnoECA8QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FParlement_of_Rennes&usg=AOvVaw3QdJJXNny8Lc5PvZW0tnlD&opi=89978449', 1),
(6, 22, 'Rennes Cathedral', '-1.683289621', '48.1118109', 'Rennes Cathedral is a Roman Catholic cathedral with a history spanning several centuries. The current structure, primarily Gothic in style, was built between the 11th and 18th centuries.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwijwaf03NKCAxX7VUEAHV0dAuMQFnoECBMQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FRennes_Cathedral&usg=AOvVaw0BR0wOwiWZa9aQah7RzS5y&opi=89978449', 1),
(6, 23, 'Place des Lices', '-1.68313205', '48.11273299', 'Place des Lices is a historic square in Rennes, known for its Saturday morning museum. It has been a central gathering place for centuries and is surrounded by charming medieval buildings.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjH28mW3dKCAxURVEEAHdsIBWoQFnoECBcQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FPlace_des_Lices_(Saint-Tropez)&usg=AOvVaw030HMcDq-i4EOkAy_I6Kig&opi=89978449', 1),
(6, 24, 'Musée des Beaux-Arts de Rennes', '-1.674815415', '48.10986966', 'The Rennes museum of Fine Arts is housed in a neoclassical building and showcases an extensive collection of paintings, sculptures, and decorative arts from the 15th to the 21st centuries.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiBuLyn3dKCAxUKQkEAHdZMDPcQFnoECB4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2F5_of_Fine_Arts_of_Rennes&usg=AOvVaw1tYaakcTMC6CJaoane7M4J&opi=89978449', 5),
(7, 25, 'Bad Homburg Castle', '8.61046823', '50.22816428', 'Bad Homburg Castle, also known as Schloss Bad Homburg, is a historic castle that dates back to the 12th century. It has served various purposes over the centuries and is now a museum showcasing the city\'s history.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwir7pep9dKCAxVjUEEAHYnfC7sQFnoECBwQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBad_Homburg_Castle&usg=AOvVaw3ShY4bEe0ojk40WTS_Vwwu&opi=89978449', 1),
(7, 26, 'Kurpark Bad Homburg', '8.625126679', '50.22785474', 'Kurpark Bad Homburg is a picturesque spa park known for its beautiful landscapes, walking paths, and historical monuments. It has been a popular destination for relaxation and recreation.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjBi7S-9dKCAxWTU0EAHR6LCoMQFnoECA4QAQ&url=https%3A%2F%2Fde.wikipedia.org%2Fwiki%2FKur3_Bad_Homburg&usg=AOvVaw3cFhydnDnPxfHDRrAQJitG&opi=89978449', 6),
(7, 27, 'Hessenpark', '8.530949599', '50.27617383', 'Hessenpark is an open-air museum that showcases traditional half-timbered buildings from the Hesse region. Visitors can explore historical houses, farms, and workshops, providing a glimpse into rural life.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjEpcv89dKCAxVYWEEAHe07CmQQFnoECBIQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FHessen3&usg=AOvVaw2RK_FF7pBG9FXZFcizTI8j&opi=89978449', 5),
(7, 28, 'Saalburg Roman Castle and Archeological Museum', '8.566281728', '50.27189781', 'The Saalburg Roman Castle is a reconstructed Roman fort that once guarded the Limes, the ancient Roman border. The site includes an archaeological park and museum, providing insights into Roman history in the region.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiQ6tCo9tKCAxUFS0EAHW8JCCQQFnoECA8QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FSaalburg&usg=AOvVaw2Ah_VPjrppba5uzDJjicLk&opi=89978449', 5),
(8, 29, 'Leeds Town Hall', '-1.549640494', '53.80003134', 'Leeds Town Hall is a majestic civic building with Victorian architecture. It was completed in 1858 and has been a symbol of Leeds\' prosperity and civic pride. The venue hosts concerts, events, and ceremonies.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjq3cHf9tKCAxW3QEEAHV-rC9EQFnoECB4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FLeeds_Town_Hall&usg=AOvVaw0p3l-jLbpWlNe-hRvCBeF-&opi=89978449', 1),
(8, 30, 'Leeds Kirkgate Market', '-1.538777341', '53.79733385', 'Leeds Kirkgate Market is one of the largest covered 7s in Europe, dating back to the 19th century. It offers a vibrant shopping experience with a diverse range of stalls, shops, and food vendors.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi6jYn89tKCAxX7VEEAHc_nDkgQFnoECBwQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FLeeds_Kirkgate_7&usg=AOvVaw2yn2olBl-YMFeXkMqf0bF3&opi=89978449', 7),
(8, 31, 'Royal Armouries Museum', '-1.532147563', '53.79188441', 'The Royal Armouries Museum in Leeds is a national 5 showcasing a vast collection of arms, armor, and artillery. It is located at Clarence Dock and offers an immersive experience of military history.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiCjYaR99KCAxUaTEEAHVjZDbEQFnoECBEQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FRoyal_Armouries_5&usg=AOvVaw1akvZ6Fydzxi-92CelHFoP&opi=89978449', 5),
(9, 32, 'Špilberk Castle', '16.59953106', '49.19463997', 'Špilberk Castle is a historic fortress that has played a significant role in the history of Brno. Originally built in the 13th century, it has served as a fortress, prison, and now houses the Brno City Museum.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiPhdzJ99KCAxUmQ0EAHdOoAagQFnoECB4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2F%25C5%25A0pilberk_Castle&usg=AOvVaw13WnYMb9Oe4np6Jqaj3ny5&opi=89978449', 1),
(9, 33, 'Cathedral of St. Peter and Paul', '16.60743587', '49.19127076', 'The Cathedral of St. Peter and Paul is a stunning Gothic and Baroque-style cathedral that dates back to the 14th century. It is an iconic landmark in Brno, known for its impressive architecture and interior.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjs6Mfl99KCAxUSW0EAHTsMDQYQFnoECA8QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FCathedral_of_Saints_Peter_and_Paul&usg=AOvVaw18vqImyopwbuRR_cpYa3d4&opi=89978449', 1),
(9, 34, 'Villa Tugendhat', '16.61618078', '49.20727783', 'Villa Tugendhat is a modernist architectural masterpiece designed by Ludwig Mies van der Rohe. Built in the 1930s, it is recognized as a UNESCO World Heritage Site and is open to the public for tours.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjb3PT499KCAxWpVUEAHW8nBIsQFnoECBgQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FVilla_Tugendhat&usg=AOvVaw179owB1UVPJo__heYtmX4c&opi=89978449', 1),
(9, 35, 'Brno Ossuary', '16.60801456', '49.19640595', 'The Brno Ossuary is an underground crypt that houses a vast collection of skeletal remains. It is located beneath the Church of St. James and provides insights into burial practices throughout history.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwix97eR-NKCAxU3_rsIHXdJDdkQFnoECBwQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBrno_Ossuary&usg=AOvVaw38XWs0tfmmCJI3_Y_gMcZH&opi=89978449', 6),
(10, 36, 'Dortmund U-Tower', '7.453354761', '51.51506003', 'The Dortmund U-Tower is an iconic industrial building that has been repurposed as a center for the arts and creativity. Originally a brewery, it now houses cultural institutions, including the museum Ostwall and a rooftop viewing platform.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi1xp7M-NKCAxXgg_0HHVFeDrwQFnoECBsQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FDortmund_U-Tower&usg=AOvVaw2jEMBeG2npvyFG5LsVhklr&opi=89978449', 1),
(10, 37, 'Reinoldikirche', '7.467165818', '51.51475209', 'einoldikirche is a historic church in the city center, dating back to the 13th century. It is known for its Gothic architecture and is one of Dortmund\'s major landmarks.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjJn93b-NKCAxXGif0HHW60DgcQFnoECBEQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FSt._Reinold%2527s_Church%2C_Dortmund&usg=AOvVaw11dCnd0yGnj6wXSf7qX0b4&opi=89978449', 1),
(10, 38, 'Westfalenpark', '7.478626404', '51.49557778', 'Westfalenpark is a large public park that hosts the biennial Floriade horticultural exhibition. It features beautiful gardens, playgrounds, and the Florian Tower, offering panoramic views of the city.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjuooX--NKCAxWPWEEAHTHYBR0QFnoECAwQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FWestfalen3&usg=AOvVaw06x5affTkSQG0v9-dwpucS&opi=89978449', 3),
(11, 40, 'Palais des Beaux-Arts de Lille', '3.062910819', '50.63050836', 'The Palais des Beaux-Arts de Lille is one of the largest art museums in France, housing an extensive collection of paintings, sculptures, and decorative arts. It was inaugurated in 1809 and is known for its impressive architecture.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj13aHm-dKCAxXjVEEAHXRRCFAQFnoECBsQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FPalais_des_Beaux-Arts_de_Lille&usg=AOvVaw2WxlspkDhIO4lEFrXe88Yp&opi=89978449', 5),
(11, 41, 'Grand Place', '3.090192814', '50.67624903', 'Grand Place is the central square of Lille and is surrounded by colorful Flemish-style buildings. It has been a hub of social and commercial activity for centuries and is a UNESCO World Heritage Site.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi40PH6-dKCAxWaTkEAHVr6B70QFnoECBAQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FGrand-Place&usg=AOvVaw3SWqjYx1hHlN-EITBeTT0k&opi=89978449', 6),
(11, 42, 'Citadel of Lille', '3.044656308', '50.6410319', 'The Citadel of Lille is a historic fortress designed by Vauban, a military engineer. It played a significant role in the defense of the city and is now a public park with gardens and walking paths.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi63Zeg-tKCAxXFW0EAHQlKD3sQFnoECA4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FCitadel_of_Lille&usg=AOvVaw2qQkSQq-OLxvU03ZYWJCTA&opi=89978449', 1),
(11, 43, 'Hospice Comtesse Museum', '3.063372422', '50.64146058', 'The Hospice Comtesse Museum is housed in a former hospital and showcases the history of Lille. It features exhibits on art, furniture, and everyday life from the Middle Ages to the 19th century.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwia1Oa4-tKCAxVJS0EAHcjsBeEQFnoECA4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FHospice_Comtesse&usg=AOvVaw01cSyq5z7-A89ASppKy3Sp&opi=89978449', 5),
(12, 44, 'uShaka Marine World', '31.0459273', '-29.867136', 'uShaka Marine World is a marine theme park and aquarium located on Durban\'s Golden Mile. It opened in 2004 and offers a variety of attractions, including a waterpark, aquarium, and interactive marine experiences.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjiy8aK-9KCAxVN_7sIHQpEBioQFnoECBUQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FUShaka_Marine_World&usg=AOvVaw0ctAHwEZYH9YS4KmkvAQcA&opi=89978449', 2),
(12, 45, 'Moses Mabhida Stadium', '31.03012137', '-29.82649854', 'Moses Mabhida Stadium is a iconic sports stadium built for the 2010 FIFA World Cup. It has a distinctive arch that offers panoramic views of the city, and it hosts various events and activities.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiqvJSo-9KCAxXVwAIHHdF1AloQFnoECBkQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FMoses_Mabhida_Stadium&usg=AOvVaw0udmexQe4rUjHCGvLHkGZv&opi=89978449', 4),
(12, 46, 'Durban Botanic Gardens', '31.00832318', '-29.84814959', 'Durban Botanic Gardens is Africa\'s oldest surviving botanical garden, established in 1849. It features a wide variety of plants, including an extensive collection of cycads.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjv38G9-9KCAxUm3AIHHdkQB7oQFnoECB8QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FDurban_Botanic_Gardens&usg=AOvVaw1HC-TV9VtDBGXll-ERCVNs&opi=89978449', 3),
(13, 47, 'Newcastle Castle', '-1.609967698', '54.96945284', 'Newcastle Castle, also known as the Newcastle Keep, is a medieval fortress that dates back to the 12th century. It played a key role in the history of the city and offers panoramic views of Newcastle and the River Tyne.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiSotOe_NKCAxWJWkEAHRqpBOEQFnoECBAQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FThe_Castle%2C_Newcastle&usg=AOvVaw24stADvo7eTnGqXOfysRaL&opi=89978449', 1),
(13, 48, 'Quayside', '-1.601206312', '54.9706905', 'Newcastle Quayside is a vibrant area along the River Tyne, known for its historic architecture, cultural venues, and lively atmosphere. It has been a hub of trade and commerce for centuries.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiw4JC5_NKCAxX7VEEAHV1tAIoQFnoECBwQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FQuayside&usg=AOvVaw3ha_OOfJYUmQFiaDKC6DLh&opi=89978449', 6),
(13, 49, 'Grey Street', '-1.612362135', '54.9747359', 'Grey Street is a historic street in the heart of Newcastle, lined with elegant Georgian architecture. It has been named one of the most beautiful streets in Europe and is home to theaters, restaurants, and shops.', 'https://en.wikipedia.org/wiki/Grey_Street', 1),
(13, 50, 'St. Nicholas\' Cathedral', '-1.611156377', '54.97021175', 'St. Nicholas\' Cathedral is a medieval church with a rich history, dating back to the 14th century. It features a combination of Gothic and Norman architecture and is a prominent landmark in Newcastle.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiAjZns_NKCAxWPQEEAHccLCaoQFnoECBEQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FNewcastle_Cathedral&usg=AOvVaw2FMGtgEFfzI4vbiEKJAbTm&opi=89978449', 1),
(14, 51, 'Georgia Aquarium', '-84.39509907', '33.76355141', 'The Georgia Aquarium is one of the largest aquariums in the world and is home to a diverse range of marine life. It opened in 2005 and has since been a major attraction, contributing to marine conservation efforts.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjOmZat_dKCAxUZ_7sIHTA2BtYQFnoECBEQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FGeorgia_Aquarium&usg=AOvVaw1bE3xCfUPW9Wjgd8dyPkFv&opi=89978449', 2),
(14, 52, 'Centennial Olympic Park', '-84.39317966', '33.76059674', 'Centennial Olympic Park was built for the 1996 Summer Olympics and has since become a central gathering place in downtown Atlanta. The park features fountains, sculptures, and hosts events throughout the year.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjrs9vK_dKCAxX1SEEAHbR9AAoQFnoECB0QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FCentennial_Olympic_3&usg=AOvVaw1j5p3vtKGnfdfNXQqLvASJ&opi=89978449', 3),
(14, 53, 'Atlanta BeltLine', '-84.3666594', '33.75324482', 'The Atlanta BeltLine is a former railway corridor transformed into a multi-use trail encircling the city. It has become a popular space for walking, cycling, and enjoying public art installations.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjzo_bf_dKCAxVvWEEAHaP6CPQQFnoECA4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBeltLine&usg=AOvVaw0hxpjwcbIJLO2UrSKOv6eI&opi=89978449', 6),
(14, 54, 'High Museum of Art', '-84.38525159', '33.79017014', 'The High Museum of Art is an acclaimed art museum with a diverse collection spanning from classic to contemporary art. It is part of the Woodruff Arts Center and contributes to Atlanta\'s cultural scene.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjA2-b1_dKCAxXiVkEAHYSqB2YQFnoECBoQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FHigh_5_of_Art&usg=AOvVaw3Y_6_PSgt1SwIekUXxQ7Yn&opi=89978449', 5),
(15, 55, 'Bryggen Wharf', '5.324630119', '60.39761459', 'Bryggen Wharf is a UNESCO World Heritage Site, known for its colorful Hanseatic buildings lining the waterfront. These historic buildings date back to the 14th century and have been an integral part of Bergen\'s trading history.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiVmuCr_tKCAxXdVEEAHc6eBWEQFnoECB4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBryggen&usg=AOvVaw2SxfqC6k6ZyJcG5Zs5OIIW&opi=89978449', 1),
(15, 56, 'Fløyen Mountain', '5.345894942', '60.39865248', 'Fløyen is a popular mountain in Bergen, accessible by the Fløibanen funicular. The summit offers panoramic views of the city and the surrounding fjords. The funicular itself has been operating since 1918.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjH06XA_tKCAxXgWkEAHfb8APUQFnoECBcQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FFl%25C3%25B8yen&usg=AOvVaw2pXGcX2EfuVgMjmPNQvZNJ&opi=89978449', 6),
(15, 57, 'Bergenhus Fortress\n\n', '5.318605079', '60.40007124', 'Bergenhus Fortress is a historic fortress complex that includes the Rosenkrantz Tower and Håkon\'s Hall. Parts of the fortress date back to the 13th century, and it has played a crucial role in Bergen\'s history.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi4jZGR_9KCAxUSWEEAHQTqBS4QFnoECBsQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBergenhus_Fortress&usg=AOvVaw0n6uFfhiG0UB3pN1emX1jF&opi=89978449', 1),
(16, 58, 'Place Stanislas', '6.183001411', '48.6937957', 'Place Stanislas is a UNESCO World Heritage Site and a central square in Nancy. It was built in the 18th century and is known for its impressive architecture, including the statue of Stanisław I, Duke of Lorraine.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjTl87C_9KCAxURV0EAHcumIC8QFnoECB4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FPlace_Stanislas&usg=AOvVaw3qDFpHX2GxPNAbzNgic_TB&opi=89978449', 1),
(16, 59, 'Nancy Cathedral (Cathédrale Notre-Dame-de-l\'Annonciation)', '6.186018124', '48.69163886', 'Nancy Cathedral is a Gothic cathedral with a history dating back to the 11th century. It has undergone various renovations and is known for its stained glass windows and architectural features.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjlqJ3h_9KCAxXgTEEAHdDdBw8QFnoECA4QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FNancy_Cathedral&usg=AOvVaw0KmIUuOzkvvG8vf3tlw16h&opi=89978449', 1),
(16, 60, 'Musée des Beaux-Arts de Nancy', '6.182251099', '48.69356475', 'The Musée des Beaux-Arts de Nancy is an art museum housed in a beautiful building. It features an extensive collection of paintings, sculptures, and decorative arts from the Middle Ages to contemporary art.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjBrfz8_9KCAxWSNcAKHRiJDDQQFnoECA0QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2F5_of_Fine_Arts_of_Nancy&usg=AOvVaw0r0W3QNXFWd5uLLo6FGbYC&opi=89978449', 5),
(16, 61, 'Parc de la Pépinière', '6.184503019', '48.69794912', 'Parc de la Pépinière is a public park in the heart of Nancy, offering a serene environment with walking paths, gardens, and sculptures. It has been a recreational space since the 18th century.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiZ4rmOgNOCAxUKAcAKHVxnBpwQFnoECA8QAQ&url=https%3A%2F%2Ffr.wikipedia.org%2Fwiki%2FParc_de_la_P%25C3%25A9pini%25C3%25A8re&usg=AOvVaw1e575nZHBw8EvcL9Yl-mV2&opi=89978449', 3),
(17, 62, 'ZOOM Erlebniswelt Gelsenkirchen', '7.110452671', '51.54230948', 'ZOOM Erlebniswelt is a zoological park that provides a unique experience by dividing its exhibits into themed worlds, including Africa, Alaska, and Asia. It offers an immersive and educational experience for visitors.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjDyaq8gNOCAxVNS0EAHYn0AAAQFnoECBkQAQ&url=https%3A%2F%2Fde.wikipedia.org%2Fwiki%2FZoom_Erlebniswelt_Gelsenkirchen&usg=AOvVaw1FgdGlJbKOWG9_5AAAFBbk&opi=89978449', 2),
(17, 63, 'Veltins-Arena', '7.067996276', '51.55471765', 'Veltins-Arena is a multi-functional stadium and the home of FC Schalke 04. It has hosted various sporting events and concerts since its opening in 2001 and is known for its innovative design.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiR1P7OgNOCAxWyWUEAHZc9CF4QFnoECBEQAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FArena_AufSchalke&usg=AOvVaw28x_SplomnbNgj89FJmtw8&opi=89978449', 4),
(17, 64, 'Nordstern Park', '7.039258061', '51.52116937', 'Nordstern Park is a large public park that was once an industrial site. It has been transformed into a recreational space with gardens, lakes, and cultural attractions, making it a popular destination for locals.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiAq5v8gNOCAxWVZEEAHXl2CLIQFnoECA8QAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FNordstern3&usg=AOvVaw0yDEIjxcjsCAOE5qLoJCU0&opi=89978449', 3),
(17, 65, 'Schloss Berge', '7.069678514', '51.56897037', 'Schloss Berge is a historic castle surrounded by a moat. It dates back to the 13th century and has undergone various renovations. The castle complex includes a restaurant and beautiful grounds.', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi86sSOgdOCAxV6S0EAHQ74DacQFnoECBAQAQ&url=https%3A%2F%2Fde.wikipedia.org%2Fwiki%2FSchloss_Berge&usg=AOvVaw0s_ZvcTXu2wtrp2eVyFaNO&opi=89978449', 1),
(5, 67, 'Tom\'s House', '-3.8687832803', '50.91181787810', 'This is Tom\'s house', 'N/A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `twinned_data`
--

CREATE TABLE `twinned_data` (
  `base_city` int(11) NOT NULL,
  `twin_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `twinned_data`
--

INSERT INTO `twinned_data` (`base_city`, `twin_city`) VALUES
(1, 2),
(1, 3),
(1, 4),
(5, 6),
(5, 7),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(13, 14),
(13, 15),
(13, 16),
(13, 17);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `TypeID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`TypeID`, `Name`) VALUES
(1, 'Architecture'),
(2, 'Wildlife park'),
(3, 'Park'),
(4, 'Sports venue'),
(5, 'Museum'),
(6, 'Tourism'),
(7, 'Market'),
(8, 'Entertainment');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `base_cities`
--
ALTER TABLE `base_cities`
  ADD PRIMARY KEY (`CityID`);

--
-- Indexes for table `poi_data`
--
ALTER TABLE `poi_data`
  ADD PRIMARY KEY (`PointOfInterestID`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`TypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
