-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2019 at 05:36 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `housing`
--

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `is_default` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `type`, `description`, `icon`, `status`, `is_default`) VALUES
(1, 'High Speed Internet', 1, '', NULL, 1, 1),
(2, 'Appliances', 1, '', NULL, 1, 1),
(3, 'Wifi', 1, '', NULL, 1, 1),
(4, 'Roku', 1, '', NULL, 1, 0),
(6, 'Television', 1, '', NULL, 1, 0),
(8, 'Kitchen furnished', 1, '', NULL, 1, 0),
(9, 'Parking', 1, '', NULL, 1, 0),
(10, 'Washer/Dryer', 1, '', NULL, 1, 0),
(11, 'Houserules', 5, 'House Rules\r\n\r\n•	No smoking\r\n \r\n•	No parties or events\r\n \r\n \r\nPlease review the following requests:\r\n•	Please do not use candles in the rooms.\r\n•	Pease do not leave uncovered food in the room.\r\n•	Please keep cell phone conversations at a minimal volume as well as your cell phone ringer off. You are welcome to talk at full volume outside.\r\n•	Please use headphones when listening to music and/or watching TV or videos, as the walls are thin and sound carries to other rooms.\r\n\r\nLaundry is available for guests. Please limit to 4 loads per day, provide your own soap, and always make arrangements with your host, at least a day in advance, evenings preferred.\r\n\r\nYou are welcome to use the communal kitchen, as long as you leave it exactly as you found it, never leave dishes(clean or dirty )in the sink or on counter, wipe up after you prepare food or eat, push your stools back in, rinse out the sink and dry it, wring out sponge thoroughly, fold towels back up after use and replace as they were, refill water pitcher if you use the last bit, pitch in with loading and unloading the dishwasher, take out trash and recycling, etc... Always take your bulky trash like pizza boxes, shoe boxes, etc.. directly to the outside trash containers . \r\n\r\nDo not leave bulky trash in the kitchen! Always turn the exhaust fan on high when cooking. Always cover food with plastic or Tupperware before putting in fridge, stinky onions in ziplock baggies, please! There are bins in the refrigerator/freezer, as well as on the shelves in the kitchen for your groceries. \r\n\r\nPlease label your name with labels provided. The communal kitchen works really well, as long as everyone practices meticulous kitchen sharing etiquette.\r\n\r\nPlease try to walk as quietly as possible, especially in the morning and late at night. Heavy footsteps can disturb the guests downstairs. Also, try to close doors gently.\r\n\r\nWhen parking, please don’t leave any gaps between driveways or other cars, to optimize number of spaces.\r\nNo visitors, without making prior arrangements with your host or property manager.\r\n', NULL, 1, 1),
(12, 'Pets Allowed or not', 1, '', NULL, 1, 0),
(13, 'Laundry', 1, '', NULL, 1, 0),
(14, 'Kitchen ', 1, '', NULL, 1, 0),
(15, 'Guest bring towels and wash cloths ', 1, '', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `amenity_property`
--

CREATE TABLE `amenity_property` (
  `property_id` int(10) UNSIGNED NOT NULL,
  `amenity_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('22f53bab7b3514cef2c60dabcceccdec5ec654dcfe988073321970eb9e5a678c9e71de8fadb33715', 2, 1, 'MyApp', '[]', 0, '2019-07-11 01:30:52', '2019-07-11 01:30:52', '2020-07-11 07:00:52'),
('67d24c5834ec33694d9f3ff0bb1f92602fb9675bb453d04a5a79abbf1215ad9c0db37e4768d14989', 1, 1, 'MyApp', '[]', 0, '2019-07-11 03:57:57', '2019-07-11 03:57:57', '2020-07-11 09:27:57'),
('74d74c5e8cf0c39d3fff68c0bd5b08d21be0334999fac3870f9ed2a0d97e1911e09c5fd0f7e97c9c', 4, 1, 'MyApp', '[]', 0, '2019-07-11 05:24:33', '2019-07-11 05:24:33', '2020-07-11 10:54:33'),
('9358ec096f3d7d3a333bdcb6f132bbec5e5027d741417922cb9f9068c42078c1712e02a40762e140', 1, 1, 'MyApp', '[]', 0, '2019-07-11 01:09:10', '2019-07-11 01:09:10', '2020-07-11 06:39:10'),
('afcc8fd88148f71b3268e852ef65b434b7fbe6ca03bf11f62b15694ffbcd67bd9e9dd0bfedc85849', 1, 1, 'MyApp', '[]', 0, '2019-07-11 03:59:17', '2019-07-11 03:59:17', '2020-07-11 09:29:17'),
('df200543cd01fe55c82d818690a71cbc21dbee6f0a275dae54d121211ab955ef7c39270364d1f764', 1, 1, 'MyApp', '[]', 0, '2019-07-11 03:58:25', '2019-07-11 03:58:25', '2020-07-11 09:28:25'),
('f488497909c57cfe08607be8db43aeadec3be307a5134e2d2827bd7ad253b9deeba0985170492833', 1, 1, 'MyApp', '[]', 0, '2019-07-11 03:58:57', '2019-07-11 03:58:57', '2020-07-11 09:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'SjxEomnbPuI9mOKjoi2MXoxZbvYTwBIiM8NuCVbW', 'http://localhost', 1, 0, 0, '2019-07-11 00:47:11', '2019-07-11 00:47:11'),
(2, NULL, 'Laravel Password Grant Client', 'y4PgBRm0CKcTTfdpyGGhKSSWhkwA7EwouX7tuQ0c', 'http://localhost', 0, 1, 0, '2019-07-11 00:47:11', '2019-07-11 00:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-11 00:47:11', '2019-07-11 00:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proimages`
--

CREATE TABLE `proimages` (
  `id` int(10) UNSIGNED NOT NULL,
  `img_name` text COLLATE utf8_unicode_ci NOT NULL,
  `img_src` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `is_admin_approve` int(11) NOT NULL DEFAULT '0',
  `watermark` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentname` text COLLATE utf8_unicode_ci,
  `nickname` text COLLATE utf8_unicode_ci,
  `short_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `room_type` int(11) DEFAULT NULL,
  `tenant_type` int(11) NOT NULL DEFAULT '1',
  `property_type` int(11) DEFAULT NULL,
  `accomodates` int(11) NOT NULL DEFAULT '2',
  `adults_extra` float DEFAULT NULL,
  `children_extra` float DEFAULT NULL,
  `infants` int(11) DEFAULT NULL,
  `week_discount` float NOT NULL DEFAULT '0',
  `month_discount` float NOT NULL DEFAULT '0',
  `perweek` int(11) DEFAULT '0',
  `perthree` int(11) NOT NULL DEFAULT '0',
  `permonth` int(11) DEFAULT '0',
  `extra_fee_per_day` float DEFAULT '0',
  `extra_fee_per_week` float DEFAULT '0',
  `extra_fee_per_month` float DEFAULT '0',
  `extra_fee_desc` text COLLATE utf8_unicode_ci,
  `min_stay` int(11) NOT NULL DEFAULT '7',
  `max_stay` int(11) NOT NULL DEFAULT '750',
  `checkin_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkout_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_rate` int(11) DEFAULT '0',
  `bedrooms_no` int(11) DEFAULT NULL,
  `bathrooms_no` int(11) DEFAULT NULL,
  `beds_no` int(11) DEFAULT NULL,
  `bed_type` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `security_deposit` decimal(7,2) DEFAULT NULL,
  `cancellation_policy` int(11) DEFAULT '2',
  `address` text COLLATE utf8_unicode_ci,
  `lstreet_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lroute` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `llocality` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ladministrative_area_level_1` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lpostal_code` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lcountry` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_lat` decimal(9,6) DEFAULT NULL,
  `pro_lon` decimal(9,6) DEFAULT NULL,
  `detail_desc` text COLLATE utf8_unicode_ci,
  `guest_access` text COLLATE utf8_unicode_ci,
  `house_rules` text COLLATE utf8_unicode_ci,
  `default_house_rules` text COLLATE utf8_unicode_ci,
  `safety_information` text COLLATE utf8_unicode_ci,
  `why_love` text COLLATE utf8_unicode_ci,
  `suitable_for` text COLLATE utf8_unicode_ci,
  `near_by` text COLLATE utf8_unicode_ci,
  `travel_route_guide` text COLLATE utf8_unicode_ci,
  `booking_type` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `status` int(11) NOT NULL DEFAULT '0',
  `featured` int(11) NOT NULL DEFAULT '0',
  `notify_admin` int(11) NOT NULL DEFAULT '1',
  `sqft` text COLLATE utf8_unicode_ci,
  `garage` int(11) DEFAULT NULL,
  `document` text COLLATE utf8_unicode_ci,
  `document_approve` int(11) NOT NULL DEFAULT '0',
  `is_extra_guest_charge` int(11) NOT NULL DEFAULT '0',
  `extra_guest_charge_week` float NOT NULL,
  `extra_guest_charge_month` float NOT NULL,
  `extra_guest_charge_three_days` float DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `dummy` int(11) NOT NULL DEFAULT '0',
  `is_security_deposit` int(11) NOT NULL DEFAULT '0',
  `is_parent` int(11) NOT NULL DEFAULT '0',
  `availability` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_type`
--

CREATE TABLE `property_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `property_type`
--

INSERT INTO `property_type` (`id`, `name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home', '2017-07-27-10-21-17-shared_housing.png', 1, '2017-07-26 21:04:57', '2017-07-27 17:27:56'),
(2, 'Apartment', '2017-08-03-14-28-28-shared-housing.png', 1, '2017-07-27 13:47:04', '2017-08-03 21:28:28'),
(3, 'Shared Apartment', NULL, 2, '2017-07-27 13:47:23', '2017-07-27 17:27:13'),
(4, 'Hotels', '2017-09-07-11-28-57-Hotel-icon.png', 2, '2017-07-27 13:47:45', '2017-09-07 18:28:57'),
(5, 'Room for Rent', NULL, 2, '2017-07-27 13:48:11', '2017-07-27 17:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`id`, `name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ensuite-Bathroom', '2017-08-03-14-21-32-bathroom-remodeling-icon-pa.png', 1, '2017-07-27 13:59:46', '2017-08-03 21:21:32'),
(2, 'Shared-Bathroom', '2017-08-03-14-25-50-bathroom-icon-shared.jpg', 1, '2017-07-27 13:59:59', '2017-08-03 21:25:50'),
(3, 'Private Bathroom', '2017-09-13-12-09-51-private-bathroom.png', 1, '2017-09-13 19:09:51', '2017-09-13 19:09:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'suresh', 'suresh@gmail.com', '$2y$10$ja4VwGKr963nEeAwlGARweiL6K1cv8sibf1x16RMKl5gKPrBI705O', NULL, '2019-07-11 01:09:10', '2019-07-11 01:09:10'),
(2, 'suresh', 'test@gmail.com', '$2y$10$s.0Nql2g.l1b3S0IhVq5TOMZ9uCp/8GBUHA.1wthKW8uLtDN5zMP.', NULL, '2019-07-11 01:30:52', '2019-07-11 01:30:52'),
(4, 'surehs', 'sureseeh@gmail.com', '$2y$10$xVsGdP/7g6jjEIFFAntsGOnkHMnj8RYC57X8GdwsQyrgi8w5H1YUu', NULL, '2019-07-11 05:24:33', '2019-07-11 05:24:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenity_property`
--
ALTER TABLE `amenity_property`
  ADD PRIMARY KEY (`property_id`,`amenity_id`),
  ADD KEY `amenity_property_amenity_id_foreign` (`amenity_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `proimages`
--
ALTER TABLE `proimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proimages_property_id_foreign` (`property_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_user_id_foreign` (`user_id`);

--
-- Indexes for table `property_type`
--
ALTER TABLE `property_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proimages`
--
ALTER TABLE `proimages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_type`
--
ALTER TABLE `property_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
