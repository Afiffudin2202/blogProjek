-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2023 at 10:06 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wpu_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Programming', 'programming', '2023-05-24 23:01:41', '2023-05-24 23:01:41'),
(2, 'Web Design', 'web-design', '2023-05-24 23:02:09', '2023-05-24 23:02:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_25_054923_create_posts_table', 1),
(6, '2023_05_25_055143_create_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text NOT NULL,
  `body` text NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'judul ketiga', 'judul-ketiga', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nemo non molestiae quibusdam dicta illo neque pariatur, temporibus vero rerum quisquam velit consequatur odit animi', '<p>ipsum dolor sit, amet consectetur adipisicing elit. Nemo non molestiae quibus dam dicta illo neque pariatur, temporibus vero rerum quisquam velit consequatur o it animi. Iure eum quis veritatis aperiam maxime laborum harumquam at excepturi odio? Voluptate fugiat fuga delectus omnis rerum, facere ab repellendus ipsam nihil deserunt, ullam autem aliquam accusamus laboriosam cum asperiores doloribus eaque nemo, minus iste nesciunt commodi quos.</p><p>Vero quo aliquid harum repellat, aliquam aspernatur, quasi reprehenderit, provident velit ducimus sunt adipisci dolorem! Optio id, soluta a quos enim dolorum aliquam sint consectetur asperiores cumque ad accusantium earum, quibusdam vero officia natus ab nam. Ut.</p>', NULL, '2023-05-24 22:56:57', '2023-05-24 22:56:57'),
(2, 1, 'judul pertama', 'judul-pertama', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nemo non molestiae quibusdam dicta illo neque pariatur, temporibus vero rerum quisquam velit consequatur odit animi', '<p>ipsum dolor sit, amet consectetur adipisicing elit. Nemo non molestiae quibus dam dicta illo neque pariatur, temporibus vero rerum quisquam velit consequatur o it animi. Iure eum quis veritatis aperiam maxime laborum harumquam at excepturi odio? Voluptate fugiat fuga delectus omnis rerum, facere ab repellendus ipsam nihil deserunt, ullam autem aliquam accusamus laboriosam cum asperiores doloribus eaque nemo, minus iste nesciunt commodi quos.</p><p>Vero quo aliquid harum repellat, aliquam aspernatur, quasi reprehenderit, provident velit ducimus sunt adipisci dolorem! Optio id, soluta a quos enim dolorum aliquam sint consectetur asperiores cumque ad accusantium earum, quibusdam vero officia natus ab nam. Ut.</p>', NULL, '2023-05-24 22:57:42', '2023-05-24 22:57:42'),
(3, 1, 'judul kedua', 'judul-kedua', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nemo non molestiae quibusdam dicta illo neque pariatur, temporibus vero rerum quisquam velit consequatur odit animi', '<p>ipsum dolor sit, amet consectetur adipisicing elit. Nemo non molestiae quibus dam dicta illo neque pariatur, temporibus vero rerum quisquam velit consequatur o it animi. Iure eum quis veritatis aperiam maxime laborum harumquam at excepturi odio? Voluptate fugiat fuga delectus omnis rerum, facere ab repellendus ipsam nihil deserunt, ullam autem aliquam accusamus laboriosam cum asperiores doloribus eaque nemo, minus iste nesciunt commodi quos.</p><p>Vero quo aliquid harum repellat, aliquam aspernatur, quasi reprehenderit, provident velit ducimus sunt adipisci dolorem! Optio id, soluta a quos enim dolorum aliquam sint consectetur asperiores cumque ad accusantium earum, quibusdam vero officia natus ab nam. Ut.</p>', NULL, '2023-05-24 22:58:07', '2023-05-24 22:58:07'),
(4, 2, 'judul ke-empat', 'judul-empat', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nemo non molestiae quibusdam dicta illo neque pariatur, temporibus vero rerum quisquam velit consequatur odit animi', '<p>ipsum dolor sit, amet consectetur adipisicing elit. Nemo non molestiae quibus dam dicta illo neque pariatur, temporibus vero rerum quisquam velit consequatur o it animi. Iure eum quis veritatis aperiam maxime laborum harumquam at excepturi odio? Voluptate fugiat fuga delectus omnis rerum, facere ab repellendus ipsam nihil deserunt, ullam autem aliquam accusamus laboriosam cum asperiores doloribus eaque nemo, minus iste nesciunt commodi quos.</p><p>Vero quo aliquid harum repellat, aliquam aspernatur, quasi reprehenderit, provident velit ducimus sunt adipisci dolorem! Optio id, soluta a quos enim dolorum aliquam sint consectetur asperiores cumque ad accusantium earum, quibusdam vero officia natus ab nam. Ut.</p>', NULL, '2023-05-25 00:14:39', '2023-05-25 00:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
