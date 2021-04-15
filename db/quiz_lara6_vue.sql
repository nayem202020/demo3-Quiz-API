-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2021 at 03:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_lara6_vue`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(36, '2014_10_12_000000_create_users_table', 1),
(37, '2014_10_12_100000_create_password_resets_table', 1),
(38, '2019_08_19_000000_create_failed_jobs_table', 1),
(39, '2021_04_13_100552_create_quizzes_table', 1),
(40, '2021_04_13_100838_create_sections_table', 1),
(41, '2021_04_13_101054_create_questions_table', 1),
(42, '2021_04_13_101321_create_options_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `optionText` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_correct` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `optionText`, `is_correct`, `question_id`, `created_at`, `updated_at`) VALUES
(1, 'new option 1', 'n', 1, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(2, 'new option 2', 'n', 1, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(3, 'new option 3 r', 'y', 1, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(4, 'new option 4', 'n', 1, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(5, 'option 5', 'n', 2, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(6, 'new option  6 r', 'y', 2, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(7, 'new option 7 r', 'y', 2, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(8, 'new option 8 r', 'y', 2, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(9, 'new option', 'n', 2, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(10, 'java option 9', 'n', 3, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(11, 'new option 10 r', 'y', 3, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(12, 'new option 11', 'n', 3, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(13, 'new option 12', 'n', 3, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(14, 'option 2 13  r', 'y', 4, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(15, 'new option 14 r', 'y', 4, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(16, 'new option 15', 'n', 4, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(17, 'new option 16 r', 'y', 4, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(18, 'option 1', 'n', 5, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(19, 'new option', 'n', 5, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(20, 'new option r', 'y', 5, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(21, 'new option', 'n', 5, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(22, 'option 1', 'n', 6, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(23, 'new option r', 'y', 6, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(24, 'new option r', 'y', 6, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(25, 'new option r', 'y', 6, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(26, 'option 1', 'n', 7, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(27, 'new option r', 'y', 7, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(28, 'new option', 'n', 7, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(29, 'option 1 r', 'y', 8, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(30, 'new option r', 'y', 8, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(31, 'new option r', 'y', 8, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(32, 'new option r', 'y', 8, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(33, 'new option', 'n', 8, '2021-04-14 14:47:16', '2021-04-14 14:47:16');

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
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `questionText` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `questionText`, `type`, `section_id`, `created_at`, `updated_at`) VALUES
(1, 'what is your name??', 'single', 1, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(2, 'Java Question 2', 'multiple', 1, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(3, 'Java Question 1??', 'single', 2, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(4, 'Java Question 2', 'multiple', 2, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(5, 'What does PEAR stand for?', 'single', 3, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(6, 'Question 2', 'multiple', 3, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(7, 'Question 1??', 'single', 4, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(8, 'Question 2', 'multiple', 4, '2021-04-14 14:47:16', '2021-04-14 14:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `title`, `time`, `mark`, `created_at`, `updated_at`) VALUES
(1, 'Programming Quiz', '30 min', '20', '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(2, 'New Programming Quiz', '40 min', '35', '2021-04-14 14:47:16', '2021-04-14 14:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sectionTitle` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quiz_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `sectionTitle`, `quiz_id`, `created_at`, `updated_at`) VALUES
(1, 'Php', 1, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(2, 'Java', 1, '2021-04-13 12:21:38', '2021-04-13 12:21:38'),
(3, 'Php', 2, '2021-04-14 14:47:16', '2021-04-14 14:47:16'),
(4, 'Java', 2, '2021-04-14 14:47:16', '2021-04-14 14:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hasan', 'a@a.com', NULL, '$2y$10$TMNgUCThec1YoIZgJW/gZOlL/zpcBsfr9jmYLKSdA6YV5g0j4iahq', NULL, '2021-04-14 11:15:17', '2021-04-14 11:15:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
