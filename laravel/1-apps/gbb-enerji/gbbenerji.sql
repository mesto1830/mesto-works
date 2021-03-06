-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 25, 2022 at 12:51 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gbbenerji`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `joiner_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answers` enum('A','B','C','D') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `joined_quizzes`
--

CREATE TABLE `joined_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `joiner_id` bigint(20) UNSIGNED NOT NULL,
  `quizes_id` bigint(20) NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `line` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `A` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `C` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `D` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct_answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answers` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `joiners`
--

CREATE TABLE `joiners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `identity` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '2014_10_12_000000_create_users_table', 1),
(12, '2014_10_12_100000_create_password_resets_table', 1),
(13, '2019_08_19_000000_create_failed_jobs_table', 1),
(14, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(15, '2022_01_31_202238_quizes', 1),
(16, '2022_01_31_202239_questions', 1),
(17, '2022_02_03_062533_joiners', 1),
(18, '2022_02_03_131346_answers', 1),
(19, '2022_02_04_064301_results', 1),
(20, '2022_02_10_061513_joined_quiz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quizes_id` bigint(20) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `line` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `A` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `C` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `D` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct_answer` enum('A','B','C','D') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `quizes_id`, `question`, `subject`, `level`, `line`, `A`, `B`, `C`, `D`, `correct_answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'Karbon azalt??m?? yapabilece??imiz yerler neresidir?', 'Konu1', '1', '1', 'Bah??e', 'Ev', 'Ofis', 'Hepsi', 'A', '2022-02-09 07:28:32', '2022-02-09 07:28:32'),
(2, 1, 'Karbon ayak izi neyi ??l??er?', 'Konu1', '1', '2', 'CO2', 'H2O', 'O2', 'SO2', 'A', '2022-02-09 07:29:51', '2022-02-09 07:29:51'),
(3, 1, 'Karbon ayak izi nedir?', 'Konu1', '1', '3', 'Sanayide kullan??lan fosil yak??tlar??n ????kard?????? karbondioksitin ??l????s??d??r.', '??nsanlar??n do??aya b??rakt?????? at??klar??n izleridir.', 'Ara??larda kullan??lan fosil yak??tlar??n ????kard?????? karbondioksitin emisyon ??l????s??d??r.', '??nsan faaliyetleri sonucunda olu??an sera gazlar??n??n birim karbondioksit cinsinden emisyonlar??n??n ??l????s??d??r.', 'A', '2022-02-09 07:30:42', '2022-02-09 07:30:42'),
(4, 1, 'Soru baslik Belirsiz', 'Konu1', '1', '4', 'Sera gazlar??', 'Amonyak', 'Oksijen', 'K??k??rt', 'A', '2022-02-09 07:31:39', '2022-02-09 07:31:39'),
(5, 1, 'A??a????dakilerden hangisi evde yapabilece??imiz karbon azalt??mlar??ndan birisi de??ildir?', 'Konu1', '2', '1', 'Sahip oldu??umuz e??yalar?? temiz kullan??p ??mr??n?? uzatarak', '??ama????r ve bula????k makinelerini tam dolu iken ??al????t??rarak', 'Bo??ta duran prizleri fi??ten ????kararak', '??ama????rlar?? kurutma makinesi ile kurutarak', 'A', '2022-02-09 07:32:40', '2022-02-09 07:32:40'),
(6, 1, 'A??a????dakilerden hangisi ofiste yapabilece??imiz karbon azalt??mlar??ndan birisidir?', 'Konu1', '2', '2', 'Enerji verimlili??i d??????k cihazlar kullanmak', 'Yaz??c?? kullan??m??n?? artt??rarak', 'Ofiste olu??an ????pleri ayr????t??rarak geri d??n??????m??n?? yaparak', 'Online toplant?? yerine seyahat edip y??z y??ze toplant??lara kat??larak', 'A', '2022-02-09 07:35:10', '2022-02-09 07:35:10'),
(7, 1, 'A??a????dakilerden hangisi ula????mda yapabilece??imiz karbon azalt??mlar??ndan birisi de??ildir?', 'Konu1', '2', '3', 'Bisiklet kullan??m??n?? artt??rarak.', 'U??ak yolculuklar??n?? tercih ederek.', 'Elektrikli ara??lar?? tercih ederek.', 'Yak??n mesafelere y??r??yerek giderek.', 'A', '2022-02-09 07:36:05', '2022-02-09 07:36:05'),
(8, 1, 'A??a????dakilerden hangisi k??resel iklim de??i??ikli??inin olu??mas??ndaki nedenlerden birisi de??ildir?', 'Konu1', '2', '4', 'Tar??mda a????r?? g??bre kullan??m??', 'Deniz seviyesinin y??kselmesi', 'Ula????mda fosil yak??t kullan??m??', 'Termik santrallerde elektrik ??retimi', 'A', '2022-02-09 07:36:56', '2022-02-09 07:36:56'),
(9, 1, 'Hangisi kentlerde ya??ayan bireylerin iklim de??i??ikli??i ile m??cadeleyle ilgili yapabilecekleri aras??nda de??ildir?', 'Konu1', '2', '5', 'Kent i??i ula????mda toplu ta????ma kullanma', 'Geri d??n????t??r??lebilir at??klar?? di??er at??klardan ayr?? toplama', 'Ayd??nlatma i??in tasarruflu ampul kullanma', 'Bisiklet yollar??na ara?? park etme', 'A', '2022-02-09 07:37:50', '2022-02-09 07:37:50'),
(10, 1, 'Hangisi bir karbon azalt??m y??ntemi de??ildir? (Kendim)', 'Konu1', '2', '6', 'Bez ??anta kullanmak.', 'Asans??r kullanmak.', 'Metal pipet kullanmak.', '??kinci el ??r??n sat??n almak.', 'A', '2022-02-09 07:38:40', '2022-02-09 07:38:40'),
(11, 1, 'A??a????daki yak??tlardan hangisini karbon sal??m?? s??f??rd??r? (Kendim)', 'Konu1', '3', '1', 'LPG', 'Benzin', 'Motorin', 'Hidrojen', 'A', '2022-02-09 07:39:25', '2022-02-09 07:39:25'),
(12, 1, 'Hangisi karbon sal??n??m??n?? en y??ksek derecede ??nler? (Kendim)', 'Konu1', '3', '2', 'Direkt u??u??lar?? tercih etmek.', 'Toplu ta????ma kullanmak.', 'Yak??n mesafeleri ara??la gitmek.', 'Bisikletle yolculuk yapmak.', 'A', '2022-02-09 07:40:13', '2022-02-09 07:40:13'),
(13, 1, 'Fosil yak??tlar, atmosferdeki yo??unlu??u her ge??en g??n artan karbondioksitin sal??m??na sebep olmaktad??r. Hangisi fosil yak??t de??ildir?', 'Konu1', '3', '3', 'Petrol', 'K??m??r', 'Biyok??tle', 'Do??al Gaz', 'A', '2022-02-09 07:40:58', '2022-02-09 07:40:58'),
(14, 1, 'A??a????dakilerden hangisi, k??resel ??s??nmaya ba??l?? olarak ya??anabilecek olaylar aras??nda??g??sterilemez?', 'Konu1', '3', '4', 'Buzullar??n kaplad?????? alan??n azalmas??', 'Atmosferdeki su buhar??n??n azalmas??', 'Erozyon ve heyelan olaylar??n??n art???? g??stermesi', 'Havada bulunan gazlar??n oran??n??n de??i??iklik g??stermesi', 'A', '2022-02-09 07:41:44', '2022-02-09 07:41:44'),
(15, 1, 'K??resel ??s??nman??n sonucu olarak buzullar eriyecektir. Buzullar??n erimesiyle birlikte do??al olarak denizlerin seviyesi de y??kselecektir. Bu y??kselmeden en fazla deniz k??y??s??nda yer alan ve ortalama y??kseltisi az olan ??lkeler etkilenecektir.\r\nBuna g??re, a??a????daki ??lkelerden hangisinin denizlerin seviyesinin y??kselmesiyle birlikte??daha olumsuz??etkilenmesi beklenir?', 'Konu1', '3', '5', 'Hollanda', 'Fransa', '??talya', 'M??s??r', 'A', '2022-02-09 07:42:30', '2022-02-09 07:42:30'),
(16, 1, 'Bilim insanlar?? iklim ile ilgili kan??tlar?? nas??l toplar?', 'Konu1', '3', '6', 'Uzaydaki uydular?? kullanarak uzaktan alg??lamayla', 'Yerdeki s??cakl??k ve karbondioksit miktar?? ??l????mleriyle', 'A??a?? halkalar?? ve buzullardan elde edilen tarihi kay??tlarla', 'Yukar??dakilerin hepsiyle.', 'A', '2022-02-09 07:43:15', '2022-02-09 07:43:15'),
(17, 1, 'S??rd??r??lebilir Kalk??nma Ama??lar?? iklim de??i??ikli??ini de ele alan ka?? adet ama??tan olu??maktad??r?', 'Konu2', '1', '1', '9', '13', '17', '25', 'A', '2022-02-09 07:43:56', '2022-02-09 07:43:56'),
(18, 1, 'Birle??mi?? Milletler ??klim De??i??ikli??i ??er??eve S??zle??mesi??(BM??D??S) kapsam??nda iklim de??i??ikli??i ile m??cadelenin ??er??evesini ??izen Paris Anla??mas?? ka?? y??l??nda imzalanm????t??r?', 'Konu2', '1', '2', '2000', '2005', '2010', '2015', 'A', '2022-02-09 07:44:55', '2022-02-09 07:44:55'),
(19, 1, 'S??rd??r??lebilir Kalk??nma Ama??lar?? ne zaman y??r??rl????e girmi??tir?', 'Konu2', '1', '3', 'Aral??k 2018', '??ubat 2015', 'Ocak 2016', 'Eyl??l 2016', 'A', '2022-02-09 07:46:24', '2022-02-09 07:46:24'),
(20, 1, 'S??rd??r??lebilir Kalk??nma Ama??lar?? neyi ifade eder?', 'Konu2', '2', '1', '??klim de??i??ikli??ini de kapsayan 19 ana ba??l??ktan olu??maktad??rlar.', '??lkelere azalt??m yapma taahh??d?? vermeyi zorunlu k??lm????lard??r.', 'Birle??mi?? Milletler ??yesi ??lkeler taraf??ndan 2030 sonuna kadar ula????lmas?? ama??lanan hedefleri i??eren bir evrensel eylem ??a??r??s??d??r.', '??lkelerin kat??lmaya zorunlu oldu??u iklim eylemi ??a??r??s??d??r.', 'A', '2022-02-09 07:47:56', '2022-02-09 07:47:56'),
(21, 1, 'Hangisi iklim krizinin sonu??lar??ndan birisi de??ildir?', 'Konu2', '2', '2', 'K????lar??n k??sa s??rmesi.', 'Yang??nlar??n artmas??.', 'Sel felaketi sonucu tarlalar??n tahribat??.', 'Kurakl??????n son bulmas??.', 'A', '2022-02-09 07:48:42', '2022-02-09 07:48:42'),
(22, 1, 'D??nyan??n s??cakl??????n??n artmas??, iklim sistemini etkileyerek iklim de??i??ikli??ine neden olmaktad??r. ??klim de??i??ikli??inin ise do??a ve canl??lar ??zerinde farkl?? etkileri bulunmaktad??r. Hangisi iklim de??i??ikli??inin do??rudan etkilerinden birisi de??ildir?', 'Konu2', '2', '3', 'Kurakl??k', 'Deprem', 'Deniz suyunun a????r?? ??s??nmas??', 'A????r?? s??cak/ so??uk hava', 'A', '2022-02-09 07:49:29', '2022-02-09 07:49:29'),
(23, 1, 'Do??al bitki ??rt??s?? g??r orman olan bir ??lkede, orman alanlar??n??n h??zla azalmas??yla birlikte a??a????dakilerden hangisinin g??r??lmesi??beklenmez?', 'Konu2', '2', '4', 'Sel ve ta??k??n olaylar??n??n artmas??', 'Toprak kaymalar??n??n artmas??', 'Hava kirlili??inin azalmas??', 'Baz?? yabani hayvan t??rlerinin yok olma tehlikesiyle kar???? kar????ya kalmas??', 'A', '2022-02-09 07:50:16', '2022-02-09 07:50:16'),
(24, 1, 'A??a????dakilerden hangisi kurakl??????n uzun y??llar boyunca devam etmesi durumunda, do??a ??zerinde meydana gelebilecek etkilerden biri??de??ildir?', 'Konu2', '2', '5', 'Erozyon', 'Hayvan t??rlerinde azalma', 'Depremlerde azalma', 'B??cek istilalar??', 'A', '2022-02-09 07:51:00', '2022-02-09 07:51:00'),
(25, 1, 'S??rd??r??lebilir kalk??nma hedeflerinden iklim eylemi neyi ifade eder?', 'Konu2', '2', '6', '??klim de??i??ikli??iyle ilgili ??nlemlerin ulusal planlardan ayr????t??r??lmas??', '??klim de??i??ikli??i ve etkileriyle m??cadelede harekete ge??meyi', '??klim de??i??ikli??i etkilerini sadece izleme ve verileri raporlama', '??klim de??i??ikli??ini sabit tutmay?? hedefleyen hareket', 'A', '2022-02-09 07:51:45', '2022-02-09 07:51:45'),
(26, 1, '??klim de??i??ikli??inin y??k??c?? etkilerini en aza indirmek i??in yap??lan COP26 Glasgow G??r????meleri sonucunda ortalama s??cakl??klardaki art??????n ka?? derece ile s??n??rland??r??lmas?? gerekmektedir?', 'Konu2', '3', '1', '1,1', '1,5', '2,5', '2,8', 'A', '2022-02-09 07:52:32', '2022-02-09 07:52:32'),
(27, 1, 'Paris ??klim Anla??mas?? i??in a??a????dakilerden hangisi do??rudur?', 'Konu2', '3', '2', 'Birle??mi?? Milletler ??lkeleri i??in 2015 y??l??nda y??r??rl????e girmi??tir.', '??klim De??i??ikli??i ??er??eve S??zle??mesi kapsam??nda, iklim de??i??ikli??inin azalt??lmas??, adaptasyonu ve finansman?? hakk??nda imzalanm????t??r.', 'Anla??ma taraflar??n?? belli bir emisyon hedefi koymaya zorlar.', 'Her ??lke k??resel ??s??nmay?? azaltmak i??in plan yapmadan ilerlemeyi ??nerir.', 'A', '2022-02-09 07:53:22', '2022-02-09 07:53:22'),
(28, 1, 'A??a????dakilerden hangisi S??rd??r??lebilir Kalk??nma Ama??lar?? aras??nda yer almaz?', 'Konu2', '3', '3', 'Yoksullu??a Son', '??klim Eylemi', 'Karasalla??ma', 'Sanayi, Yenilik??ilik ve Altyap??', 'A', '2022-02-09 07:54:05', '2022-02-09 07:54:05'),
(29, 1, '??klim Eylemi amac?? kapsam??nda a??a????dakilerden hangisi yanl????t??r?', 'Konu2', '3', '4', '??klim de??i??ikli??iyle ilgili ??nlemlerin ulusal politikalara, stratejilere ve planlara entegre edilmesi', '??klim De??i??ikli??i ??evre S??zle??mesi kapsam??nda, iklim de??i??ikli??inin azalt??lmas??, adaptasyonu ve finansman?? hakk??nda imzalanm????t??r.', 'En az geli??mi?? ??lkelerde ve geli??mekte olan k??????k ada devletlerinde iklim de??i??ikli??iyle ilgili etkili planlama ve y??netim kapasitesini art??racak mekanizmalar??n desteklenmesi', '??klimle ilgili tehlikelere ve??do??al afetlere??kar???? dayan??kl??l??????n ve uyum kapasitesinin sabit tutulmas??.', 'A', '2022-02-09 07:54:58', '2022-02-09 07:54:58'),
(30, 1, 'K??resel ??s??nmaya ba??l?? olarak a??a????dakilerden hangisinin etkilenmesi beklenmez?', 'Konu3', '1', '1', 'Ormanl??k alanlar', 'Okyanus seviyeleri', 'Yeralt?? kaynaklar??', 'Bitki ??e??itlili??i', 'A', '2022-02-09 07:55:44', '2022-02-09 07:55:44'),
(31, 1, 'H??k??metler Aras?? ??klim De??i??ikli??i Paneli taraf??ndan ortaya konulan senaryolara g??re, k??resel s??cakl??kta 2100 y??l??na kadar ortalama 1 il?? 3,5 derecelik bir art???? olaca???? tahmin edilmektedir. Bunun anlam??, en iyimser ko??ullarda her on y??lda yakla????k 0,1 derecelik bir s??cakl??k art?????? g??r??lecektir. Bu senaryonun ger??ekle??mesi durumunda a??a????daki olaylar??ndan hangilerinin ya??anmas?? beklenir?', 'Konu3', '1', '2', 'Buzullar??n erimesi ile deniz seviyesinin y??kselmesi,', 'A????r?? hava olaylar??n?? azalmas?? ve iklimin daha stabil bir hale gelmesi,', 'B??cek t??rleri, sivrisinek ve fare gibi ??evreye kolay uyum sa??layabilen canl??lar??n say??s??n??n artmas??', 'Biyolojik ??e??itlili??in artmas??', 'A', '2022-02-09 07:56:35', '2022-02-09 07:56:35'),
(32, 1, 'A??a????daki yarg??lardan hangisi g??rseldeki slogana uygun de??ildir?', 'Konu3', '1', '3', '??ehir i??inde a??a??land??rma faaliyetleri ile ye??il alanlar art??r??lmal??d??r.', 'Geri d??n??????m ile do??al kaynaklar??n a????r?? t??ketimi azalt??lmal??d??r', 'Binalar??n ??s??t??lmas??nda fosil yak??tlar kullan??larak enerji ??retiminde iklim ko??ullar??n??n etkisi azalt??lmal??d??r.', 'Yenilenebilir alternatif enerji kaynaklar?? tercih edilerek karbon sal??m??n?? azalt??lmal??d??r.', 'A', '2022-02-09 07:57:24', '2022-02-09 07:57:24'),
(33, 1, 'Kyoto Protokol?? ka??ta imzalanm????t??r?', 'Konu3', '1', '4', '2002', '2005', '1997', '1995', 'A', '2022-02-09 07:58:04', '2022-02-09 07:58:04'),
(34, 1, 'Kyoto Protokol?? ka?? y??l??nda resmen y??r??rl????e girmi??tir?', 'Konu3', '1', '5', '2002', '2005', '1997', '1995', 'A', '2022-02-09 07:58:44', '2022-02-09 07:58:44'),
(35, 1, 'T??rkiyede elektrik ??retimi en ??ok hangi kaynaktan sa??lanmaktad??r?', 'Konu3', '1', '6', 'K??m??r', 'Do??algaz', 'Hidroelektrik', 'G??ne??', 'A', '2022-02-09 07:59:23', '2022-02-09 07:59:23'),
(36, 1, '??klim de??i??ikli??i nedeniyle y??lda ka?? ki??i ??lmektedir?', 'Konu3', '1', '7', '1500', '100.000', '150.000', '500.000', 'A', '2022-02-09 08:00:11', '2022-02-09 08:00:11'),
(37, 1, 'A??a????daki sera gazlar??ndan hangisinin k??resel ??s??nma potansiyeli en fazlad??r?', 'Konu3', '2', '1', 'Karbondioksit', 'Metan', 'K??k??rt Hekzaflor??r', 'Diazotmonoksit', 'A', '2022-02-09 08:00:51', '2022-02-09 08:00:51'),
(38, 1, 'Kyoto Protokol?? ile Paris ??klim Antla??mas?????n??n ortak amac??, Birle??mi?? Milletler ??klim De??i??ikli??i ??er??eve S??zle??mesi ??er??e??vesinde sera gazlar??n??n sal??m??n?? azaltarak k??resel iklim de??i??iminin olumsuz etkilerini ??nlemektir. A??a????daki faaliyetlerinden hangisi bu ??er??eveye uygun bir ??al????ma de??ildir?', 'Konu3', '2', '2', 'Fabrika bacalar??na filtre tak??lmas??,', 'Meralar??n yerle??im alanlar??na d??n????t??r??lmesi,', 'Fosil yak??tlar yerine alternatif enerji kaynaklar??n??n kullan??lmas??', 'Benzinli ara??lar yerine elektrikli ara??lar??n kullan??lmas??', 'A', '2022-02-09 08:01:43', '2022-02-09 08:01:43'),
(39, 1, 'A??a????dakilerden hangisi sera gaz?? de??ildir?', 'Konu3', '2', '3', 'Azot', 'Karbondioksit', 'Hidroflor??r karbonlar', 'Metan', 'A', '2022-02-09 08:02:24', '2022-02-09 08:02:24'),
(40, 1, 'K??resel iklim de??i??ikli??i, yerk??renin uzun jeoloji tarihi boyunca ya??anan iklimin do??al de??i??kenli??ine ek olarak insan et??kinliklerinin de neden oldu??u bir de??i??ikliktir. \r\n??nsanlar??n k??resel iklim de??i??ikli??ine neden olan etkinlikleri aras??nda a??a????dakilerden hangisi g??sterilemez?', 'Konu3', '2', '4', 'Sanayide fosil yak??t kullanmas??', 'Tarlalarda yapay g??bre kullanmas??', 'Motorlu ta????t kullan??m??n??n artmas??', 'R??zg??r g??c??nden elektrik ??retmesi', 'A', '2022-02-09 08:03:09', '2022-02-09 08:03:09'),
(41, 1, '??nsan??n do??ay?? yanl???? ve bilin??siz kullan??m?? sonucu gelecekte k??resel iklim sistemindeki de??i??imlerin ??nceki y??zy??llara oranla daha h??zl?? olaca????ndan s??z edilmektedir. \r\nBu duruma ba??l?? olaylardan hangilerinin gelecekte ya??anma olas??l?????? y??ksektir?', 'Konu3', '2', '5', 'Tatl?? su kaynaklar??n??n artmas??', 'Biyolojik ??e??itlili??in artmas??', 'Okyanus ve deniz seviyelerinin y??kselmesi', 'Nesli t??kenme tehlikesi olan t??rlerin say??lar??n??n artmas??', 'A', '2022-02-09 08:03:56', '2022-02-09 08:03:56'),
(42, 1, 'K??resel iklim de??i??iminin g??zlenen ve ??ng??r??len etkilerinden biri de a????r?? ya??????lar sonucu olu??an sel ve ta??k??nlard??r. \r\nBu durum sonucunda a??a????dakilerden hangisinin ya??anmas?? beklenmez?', 'Konu3', '2', '6', 'Can ve mal kay??plar??n??n', 'Ula????mda aksamalar??n', 'Toprak erozyonunun', 'Orman yang??nlar??n??n', 'A', '2022-02-09 08:04:39', '2022-02-09 08:04:39'),
(43, 1, 'Yery??z??nde ortalama s??cakl??k her ge??en g??n h??zla artmaktad??r. Bu olay k??resel ??evre sorunlar??n??n ya??anmas??na neden olmaktad??r. Buna g??re a??a????dakilerden hangisi k??resel ??evre sorunun ortaya ????kard?????? sonu??lardan biri olamaz?', 'Konu3', '3', '1', 'Yery??z??nde jeolojik k??kenli do??a olaylar??n??n ya??anma s??kl??????nda art???? ya??anmas??', 'Yery??z??nde iklim ??artlar??n??n de??i??mesine ba??l?? su sorunlar??n??n artmas??', 'K??resel s??cakl??k art??????na ba??l?? salg??n hastal??klar??n h??zla artmas??', 'K??y?? b??lgelerdeki karasal ekosistemlerin yerini su ekosistemlerine b??rakmas??', 'A', '2022-02-09 08:05:37', '2022-02-09 08:05:37'),
(44, 1, 'Sekt??rlerin, kulland??klar?? kaynaklara ve faaliyetlerine g??re sald??klar?? sera gaz?? miktar?? farkl??l??k g??stermektedir. K??resel ??l??ekte en fazla sera gaz?? sal??m??na sebep olan sekt??r hangisidir?', 'Konu3', '3', '2', 'Elektrik ve ??s?? ??retimi', 'Ula????m', 'At??k', 'Tar??m', 'A', '2022-02-09 08:06:16', '2022-02-09 08:06:16'),
(45, 1, '2014 y??l?? i??in y??ll??k toplam sera gaz?? sal??m?? en y??ksek olan ??lke hangisidir?', 'Konu3', '3', '3', '??in', 'Amerika Birle??ik Devletleri', 'Almanya', 'Rusya', 'A', '2022-02-09 08:07:00', '2022-02-17 08:16:20'),
(46, 1, '2014 y??l?? i??in y??ll??k toplam sera gaz?? sal??m?? s??ralamas??nda T??rkiye, d??nya ??lkeleri aras??nda ka????nc??d??r?', 'Konu3', '3', '4', '??lk 10', '??lk 20', '??lk 50', '??lk 100', 'A', '2022-02-09 08:07:45', '2022-02-09 08:07:45'),
(47, 1, 'T??rkiye???de sekt??rlerin sera gaz?? sal??mlar?? hangi s??ralamada ger??ekle??mektedir?', 'Konu3', '3', '5', 'Enerji>Tar??m>At??k>Sanayi', 'Tar??m>At??k>Sanayi>Enerji', 'Enerji>Sanayi>Tar??m>At??k', 'Sanayi>Enerji>Tar??m>At??k', 'A', '2022-02-09 08:08:32', '2022-02-09 08:08:32'),
(48, 1, 'Hangisi, kentlerde ya??ayan bireyler olarak iklim de??i??ikli??iyle m??cadele ve kaynak korumayla ilgili yap??labilecekler aras??nda de??ildir?', 'Konu3', '3', '6', 'Ayd??nlatma i??in tasarruflu ampul kullanma', 'Kent i??i ula????mda olabildi??ince toplu ta????ma kullanma', 'Sokak hayvan?? sahiplenme', 'Geri d??n????t??r??lebilir at??klar??, di??er at??klardan ayr?? toplama', 'A', '2022-02-09 08:09:14', '2022-02-09 08:09:14');

-- --------------------------------------------------------

--
-- Table structure for table `quizes`
--

CREATE TABLE `quizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` enum('aktif','pasif','taslak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'taslak',
  `finished_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizes`
--

INSERT INTO `quizes` (`id`, `title`, `description`, `state`, `finished_at`, `created_at`, `updated_at`) VALUES
(1, '??evre Koruma Testi', 'Aciklama', 'aktif', '2022-02-22 06:37:00', '2022-02-10 06:37:08', '2022-02-18 05:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `joiner_id` bigint(20) UNSIGNED NOT NULL,
  `quizes_id` bigint(20) UNSIGNED NOT NULL,
  `correct_count` int(11) NOT NULL,
  `wrong_count` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `diff` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@outlook.com', 'admin', NULL, '$2y$10$b/3LhRTS.y0bCkLov7hCau7vrD0SQ1cgBW1Wz/cHulYLA.N6vKZ2u', NULL, NULL, NULL),
(2, 'test2', 'test2@outlook.com', 'user', NULL, '$2y$10$orl65RaHmR/NpNuxbWULwub.lDY2Oj.LlG.QX7NxLdm.wSns/fHwy', NULL, NULL, NULL),
(3, 'test3', 'test3@outlook.com', 'user', NULL, '$2y$10$F8RYRxna5bZNAECrE9dAY.AzQNBm5TeVaONHLFBOgc1zo2Ie4ytkG', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_joiner_id_foreign` (`joiner_id`),
  ADD KEY `answers_question_id_foreign` (`question_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `joined_quizzes`
--
ALTER TABLE `joined_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `joined_quizzes_joiner_id_foreign` (`joiner_id`);

--
-- Indexes for table `joiners`
--
ALTER TABLE `joiners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_quizes_id_foreign` (`quizes_id`);

--
-- Indexes for table `quizes`
--
ALTER TABLE `quizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `results_joiner_id_foreign` (`joiner_id`),
  ADD KEY `results_quizes_id_foreign` (`quizes_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `joined_quizzes`
--
ALTER TABLE `joined_quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `joiners`
--
ALTER TABLE `joiners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `quizes`
--
ALTER TABLE `quizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_joiner_id_foreign` FOREIGN KEY (`joiner_id`) REFERENCES `joiners` (`id`),
  ADD CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `joined_quizzes`
--
ALTER TABLE `joined_quizzes`
  ADD CONSTRAINT `joined_quizzes_joiner_id_foreign` FOREIGN KEY (`joiner_id`) REFERENCES `joiners` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quizes_id`) REFERENCES `quizes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_joiner_id_foreign` FOREIGN KEY (`joiner_id`) REFERENCES `joiners` (`id`),
  ADD CONSTRAINT `results_quizes_id_foreign` FOREIGN KEY (`quizes_id`) REFERENCES `quizes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
