-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 04:52 AM
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
-- Database: `foodies`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `alt_contact` int(11) DEFAULT NULL,
  `landmark` text NOT NULL,
  `street_name` text NOT NULL,
  `area` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `type` enum('o','h') NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `fullname`, `alt_contact`, `landmark`, `street_name`, `area`, `city`, `state`, `pincode`, `type`, `user_id`, `created_at`, `updated_at`) VALUES
(7, 'Roni saha', 91285289, 'near mayor house shivnagar', 'station road', 'khushkibagh', 'Purnea', 'Bihar', 854305, 'h', 2, '2023-12-20 00:42:12', '2023-12-20 00:42:12'),
(8, 'Yoshio Flores', 789455, 'Wynne Guthrie', 'Ariel Stevens', 'Mari Henry', 'Purnea', 'Bihar', 858596, 'h', 7, '2023-12-23 23:01:34', '2023-12-23 23:01:34'),
(9, 'David Armstrong', 785, 'Harper Tanner', 'Shad Sears', 'Eleanor Tucker', 'Purnea', 'Bihar', 55, 'h', 8, '2023-12-24 21:13:28', '2023-12-24 21:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$12$QVV1cJ6xlNTxpxygOcZFLOXfaXwtMQYADHOlJ731aL.FoHqbUxHeS', NULL, '2023-12-13 10:29:46', '2023-12-13 10:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cat_title`, `created_at`, `updated_at`) VALUES
(3, 'Snacks & Namkeen', '2023-12-08 23:26:59', '2023-12-08 23:26:59'),
(4, 'Sweets', '2023-12-08 23:27:05', '2023-12-08 23:27:05'),
(5, 'Main Course', '2023-12-08 23:27:14', '2023-12-08 23:27:14'),
(6, 'Cake & Pastry', '2023-12-08 23:28:22', '2023-12-08 23:28:22'),
(7, 'Fast Foods', '2023-12-08 23:28:32', '2023-12-08 23:28:32'),
(8, 'South Indian', '2023-12-08 23:28:43', '2023-12-08 23:28:43');

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
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2023_12_05_043355_create_categories_table', 1),
(12, '2023_12_05_043529_create_products_table', 1),
(13, '2023_12_11_145107_create_admins_table', 2),
(14, '2023_12_15_144130_create_addresses_table', 3),
(15, '2023_12_15_155946_create_orders_table', 3),
(16, '2023_12_15_156621_create_order_items_table', 3),
(17, '2023_12_21_064211_create_payments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 7, 0, '2023-12-20 00:40:24', '2023-12-26 09:10:13'),
(3, 3, NULL, 0, '2023-12-20 00:45:05', '2023-12-20 00:45:05'),
(4, 4, NULL, 0, '2023-12-20 00:49:39', '2023-12-20 00:49:39'),
(5, 6, NULL, 1, '2023-12-20 21:03:00', '2023-12-20 21:03:00'),
(6, 7, 8, 0, '2023-12-23 22:14:03', '2023-12-23 23:01:39'),
(7, 8, 9, 1, '2023-12-24 21:09:05', '2023-12-24 21:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(26, 3, 26, 1, 0, '2023-12-20 01:03:48', '2023-12-20 01:03:48'),
(27, 3, 46, 4, 0, '2023-12-20 01:04:02', '2023-12-24 21:10:02'),
(29, 4, 30, 4, 0, '2023-12-20 01:04:49', '2023-12-25 21:33:13'),
(30, 4, 49, 1, 0, '2023-12-20 01:05:16', '2023-12-20 01:05:16'),
(31, 4, 28, 2, 0, '2023-12-20 01:05:22', '2023-12-24 21:09:46'),
(32, 4, 31, 1, 0, '2023-12-20 01:05:31', '2023-12-20 01:05:31'),
(33, 5, 25, 1, 0, '2023-12-20 21:03:29', '2023-12-20 21:03:29'),
(36, 6, 42, 9, 0, '2023-12-23 23:01:04', '2023-12-24 21:10:20'),
(41, 7, 15, 1, 0, '2023-12-24 21:10:13', '2023-12-24 21:10:13'),
(47, 2, 9, 1, 1, '2023-12-27 13:43:05', '2023-12-27 13:43:05'),
(48, 2, 1, 1, 0, '2023-12-27 13:52:28', '2023-12-27 13:52:28'),
(50, 2, 26, 1, 0, '2024-01-03 02:51:35', '2024-01-03 02:51:35'),
(51, 2, 25, 1, 0, '2024-01-20 10:28:44', '2024-01-20 10:28:44');

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `BANKNAME` varchar(255) DEFAULT NULL,
  `BANKTXNID` varchar(255) DEFAULT NULL,
  `CURRENCY` varchar(255) DEFAULT NULL,
  `GATEWAYNAME` varchar(255) DEFAULT NULL,
  `MERC_UNQ_REF` varchar(255) DEFAULT NULL,
  `ORDERID` varchar(255) DEFAULT NULL,
  `PAYMENTMODE` varchar(255) DEFAULT NULL,
  `RESPCODE` varchar(255) DEFAULT NULL,
  `RESPMSG` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TXNAMOUNT` varchar(255) DEFAULT NULL,
  `TXNDATE` varchar(255) DEFAULT NULL,
  `TXNID` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `user_id`, `BANKNAME`, `BANKTXNID`, `CURRENCY`, `GATEWAYNAME`, `MERC_UNQ_REF`, `ORDERID`, `PAYMENTMODE`, `RESPCODE`, `RESPMSG`, `STATUS`, `TXNAMOUNT`, `TXNDATE`, `TXNID`, `created_at`, `updated_at`) VALUES
(1, 6, 7, NULL, NULL, NULL, NULL, NULL, '8846', NULL, NULL, NULL, NULL, '10', NULL, NULL, '2023-12-23 23:01:39', '2023-12-23 23:01:39'),
(2, 7, 8, NULL, NULL, NULL, NULL, NULL, '638', NULL, NULL, NULL, NULL, '10', NULL, NULL, '2023-12-24 21:13:37', '2023-12-24 21:13:37'),
(3, 7, 8, NULL, NULL, NULL, NULL, NULL, '9323', NULL, NULL, NULL, NULL, 'Summer Lloyd', NULL, NULL, '2023-12-24 21:14:50', '2023-12-24 21:14:50'),
(4, 2, 2, NULL, NULL, NULL, NULL, NULL, '8359', NULL, NULL, NULL, NULL, '522', NULL, NULL, '2023-12-26 09:10:13', '2023-12-26 09:10:13'),
(5, 2, 2, 'bob', '84512', 'abc', '854', '8845', '15605', 'upi', '52', 'don', 'ok', '380.4', '895', '852', '2023-12-27 13:43:10', '2023-12-27 13:43:10'),
(6, 2, 2, NULL, NULL, NULL, NULL, NULL, '65585', NULL, NULL, NULL, NULL, '684.4', NULL, NULL, '2023-12-27 13:52:36', '2023-12-27 13:52:36'),
(7, 2, 2, NULL, NULL, NULL, NULL, NULL, '23603', NULL, NULL, NULL, NULL, '814.2', NULL, NULL, '2024-01-20 10:29:05', '2024-01-20 10:29:05');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `isVeg` tinyint(1) NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount_price` double(8,2) DEFAULT NULL,
  `description` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `image`, `isVeg`, `price`, `discount_price`, `description`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Surmai Tawa Fish Fry', 'surmai tawa fish fry.jpg', 0, 400.00, 300.00, 'hgvjbhk', 3, 1, '2023-12-09 01:25:32', '2023-12-09 01:25:32'),
(2, 'Biryani', 'biryani.jpg', 0, 240.00, 220.00, 'ghkjl', 5, 1, '2023-12-08 23:29:29', '2023-12-08 23:29:29'),
(3, 'Black Forest Cake', 'black-forest-cake.jpg', 1, 540.00, 500.00, 'ghkjl', 6, 1, '2023-12-08 23:30:07', '2023-12-08 23:30:07'),
(4, 'Burger', 'burger.jpg', 1, 150.00, 120.00, 'ghkjl', 7, 1, '2023-12-08 23:30:35', '2023-12-08 23:30:35'),
(5, 'Chicken Butter Masala', 'butter.jpg', 0, 300.00, 250.00, 'ghkjl', 5, 1, '2023-12-08 23:31:21', '2023-12-08 23:31:21'),
(6, 'Chocolate Cake', 'chocolate-cake1-hotandsweets.jpg', 1, 520.00, 480.00, 'ghkjl', 6, 1, '2023-12-08 23:32:02', '2023-12-08 23:32:02'),
(7, 'Dosa', 'dosa.jpg', 1, 120.00, 100.00, 'ghkjl', 8, 1, '2023-12-08 23:32:38', '2023-12-08 23:32:38'),
(8, 'Double Stage Cake', 'double-stage-cake-hotandsweets.jpeg', 1, 800.00, 780.00, 'ghkjl', 6, 1, '2023-12-08 23:33:04', '2023-12-08 23:33:04'),
(9, 'Chicken Lolipop', 'download.jpg', 0, 320.00, 280.00, 'ghkjl', 3, 1, '2023-12-08 23:33:42', '2023-12-08 23:33:42'),
(10, 'Dahi Bhalle', 'dahi-bhalle-papdi-chat-hotandsweets.jpg', 1, 120.00, 80.00, 'ghkjl', 3, 1, '2023-12-08 23:34:24', '2023-12-08 23:34:24'),
(11, 'Idli', 'idli.jpeg', 1, 120.00, 90.00, 'ghkjl', 8, 1, '2023-12-08 23:34:46', '2023-12-08 23:34:46'),
(12, 'Kala Jamun', 'kalajamun-10-pic--hotandsweets.jpg', 1, 400.00, 340.00, 'ghkjl', 4, 1, '2023-12-08 23:35:38', '2023-12-08 23:35:38'),
(13, 'Paneer Masala', 'paneer-masala.jpg', 1, 400.00, 320.00, 'ghkjl', 5, 1, '2023-12-08 23:36:19', '2023-12-08 23:36:19'),
(14, 'Paneer Tikka Masala', 'paneer-tikka-butter-masala-hotandsweets.jpg', 1, 350.00, 250.00, 'hjk', 5, 1, '2023-12-09 00:37:16', '2023-12-09 00:37:16'),
(15, 'Rasgulla', 'rasgulla1pic.jpg', 1, 350.00, 200.00, 'hjk', 4, 1, '2023-12-09 00:37:48', '2023-12-09 00:37:48'),
(16, 'Sahi Paneer', 'sahi-paneer-hotandsweets.png', 1, 350.00, 250.00, 'hjk', 5, 1, '2023-12-09 00:38:16', '2023-12-09 00:38:16'),
(17, 'Vanilla Cake', 'vanila-cake.jpg', 1, 700.00, 600.00, 'hjk', 6, 1, '2023-12-09 00:38:51', '2023-12-09 00:38:51'),
(18, 'Paneer Biryani', 'veg-paneer-biryani-hotandsweets.jpg', 1, 300.00, 240.00, 'hjk', 5, 1, '2023-12-09 00:39:20', '2023-12-09 00:39:20'),
(19, 'Kalakand', 'kalakand500gm.jpg', 1, 300.00, 240.00, 'hjk', 4, 1, '2023-12-09 00:40:01', '2023-12-09 00:40:01'),
(20, 'Pizza', 'pizza.jpg', 1, 300.00, 200.00, 'hjk', 7, 1, '2023-12-09 00:40:29', '2023-12-09 00:40:29'),
(21, 'Mix Jelly Cake', 'mix-jelly-cake-1-pound--annapurna24.jpg', 1, 700.00, 6500.00, 'hjk', 6, 1, '2023-12-09 00:41:13', '2023-12-09 00:41:13'),
(22, 'Mushroom Spicy', 'mushroom-spicy-hotandsweets.jpg', 1, 350.00, 300.00, 'hjk', 5, 1, '2023-12-09 00:42:24', '2023-12-09 00:42:24'),
(23, 'Paneer Chowmin', 'paneer-chowmien-1-plate--annapurna24.jpg', 1, 350.00, 300.00, 'hjk', 5, 1, '2023-12-09 00:42:46', '2023-12-09 00:42:46'),
(24, 'Paneer Chowmin', 'paneer-chowmien-1-plate--annapurna24.jpg', 1, 350.00, 300.00, 'hjk', 7, 1, '2023-12-09 00:43:05', '2023-12-09 00:43:05'),
(25, 'Paneer Kulcha', 'paneer-kulcha-naan-hotandsweets.jpg', 1, 80.00, 50.00, 'hjk', 3, 1, '2023-12-09 00:43:38', '2023-12-09 00:43:38'),
(26, 'Masala Kulcha', 'masala-kulcha-hotandsweets.jpg', 1, 80.00, 60.00, 'hjk', 3, 1, '2023-12-09 00:44:08', '2023-12-09 00:44:08'),
(27, 'Kesariya Peda', 'kesariya-peda250gm.jpg', 1, 500.00, 400.00, 'hjk', 4, 1, '2023-12-09 00:44:42', '2023-12-09 00:44:42'),
(28, 'Lassi', 'lassi.jpg', 1, 90.00, 60.00, 'hjk', 4, 1, '2023-12-09 00:45:09', '2023-12-09 00:45:09'),
(29, 'Litti Chokha', 'litte.jpg', 1, 90.00, 50.00, 'hjk', 3, 1, '2023-12-09 00:45:38', '2023-12-09 00:45:38'),
(30, 'Bhujiya', 'bhujia-250gm--hotandsweets.jpg', 1, 300.00, 200.00, 'hgvjbhk', 3, 1, '2023-12-09 01:02:56', '2023-12-09 01:02:56'),
(31, 'Besan Chakki', 'besan-chakki-500-gram.jpg', 1, 300.00, 200.00, 'hgvjbhk', 4, 1, '2023-12-09 01:03:21', '2023-12-09 01:03:21'),
(32, 'Momo', 'momo1-hotandsweets.jpg', 1, 200.00, 100.00, 'hgvjbhk', 7, 1, '2023-12-09 01:03:54', '2023-12-09 01:03:54'),
(33, 'kaju katli', 'kaju-katli-500-gram.jpg', 1, 800.00, 780.00, 'hgvjbhk', 4, 1, '2023-12-09 01:04:21', '2023-12-09 01:04:21'),
(34, 'Raskadam', 'raskadam-500gm--hotandsweets.jpg', 1, 600.00, 500.00, 'hgvjbhk', 4, 1, '2023-12-09 01:04:46', '2023-12-09 01:04:46'),
(35, 'Grilled Chicken', 'Grilled chicken.jpg', 0, 400.00, 350.00, 'hgvjbhk', 5, 1, '2023-12-09 01:05:24', '2023-12-09 01:05:24'),
(36, 'Butter Paneer Dosa', 'butter-paneer-dosa-hotandsweets.jpg', 1, 200.00, 150.00, 'hgvjbhk', 8, 1, '2023-12-09 01:05:55', '2023-12-09 01:05:55'),
(37, 'Plain Laddu', 'plain-laddu500gm.jpg', 1, 400.00, 350.00, 'hgvjbhk', 4, 1, '2023-12-09 01:06:25', '2023-12-09 01:06:25'),
(38, 'Jalebi', 'jalebi-1kg--hotandsweets.jpg', 1, 200.00, 120.00, 'hgvjbhk', 4, 1, '2023-12-09 01:06:54', '2023-12-09 01:06:54'),
(39, 'Lachha Paratha', 'lachha-paratha-1pc-hotandsweets.png', 1, 200.00, 100.00, 'hgvjbhk', 3, 1, '2023-12-09 01:07:30', '2023-12-09 01:07:30'),
(40, 'Butter Masala Dosa', 'butter-masala-dosa-hotandsweets.jpg', 1, 200.00, 150.00, 'hgvjbhk', 8, 1, '2023-12-09 01:08:01', '2023-12-09 01:08:01'),
(41, 'Paneer Patties', 'paneer-patties-buy-5-get-1-free--hotandsweets.jpg', 1, 200.00, 100.00, 'hgvjbhk', 7, 1, '2023-12-09 01:08:39', '2023-12-09 01:08:39'),
(42, 'Paapri Chaat', 'paapri-chaat-1-plate--annapurna24.jpg', 1, 200.00, 150.00, 'hgvjbhk', 3, 1, '2023-12-09 01:09:18', '2023-12-09 01:09:18'),
(43, 'Paneer Uttapam', 'paneer uttapam.jpg', 1, 200.00, 180.00, 'hgvjbhk', 8, 1, '2023-12-09 01:10:02', '2023-12-09 01:10:02'),
(44, 'Peda', 'peda-250gm.jpg', 1, 400.00, 380.00, 'hgvjbhk', 4, 1, '2023-12-09 01:10:44', '2023-12-09 01:10:44'),
(45, 'Masala Fish Fry', 'fish masala fry.jpg', 0, 300.00, 250.00, 'hgvjbhk', 5, 1, '2023-12-09 01:22:26', '2023-12-09 01:22:26'),
(46, 'Fish Tawa Fry', 'fish tawa fry.webp', 0, 300.00, 280.00, 'hgvjbhk', 3, 1, '2023-12-09 01:22:53', '2023-12-09 01:22:53'),
(47, 'Mutton Curry', 'Mutton curry s.jpg', 0, 400.00, 350.00, 'hgvjbhk', 5, 1, '2023-12-09 01:23:28', '2023-12-09 01:23:28'),
(48, 'Mutton Biryani', 'mutton biryani.jpg', 0, 400.00, 300.00, 'hgvjbhk', 5, 1, '2023-12-09 01:23:56', '2023-12-09 01:23:56'),
(49, 'Spicy Pomfret Fry', 'spicy pomfret fry.jpg', 0, 300.00, 250.00, 'hgvjbhk', 3, 1, '2023-12-09 01:24:53', '2023-12-09 01:24:53'),
(51, 'Amritsari Fish Fry', 'amritsari fish fry.jpg', 0, 400.00, 300.00, 'hgvjbhk', 3, 1, '2023-12-09 01:26:35', '2023-12-09 01:26:35'),
(52, '530', 'butter-masala-dosa-hotandsweets.jpg', 0, 870.00, 711.00, '798', 6, 1, '2023-12-14 11:28:55', '2023-12-14 11:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `contact`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Roni', '123456789', 'r@gmail.com', NULL, '$2y$12$Ws57mImaGpINofKllBzH2.QnArdMg4lc6CThSm1pbya74qFvP3s16', NULL, '2023-12-20 00:40:08', '2023-12-20 00:40:08'),
(3, 'kg', '748877185', 'k@gmail.com', NULL, '$2y$12$QR6cC/FL1fFkXDK8rkx13O8LdhIS2yAR5VAlay66ao/80WaAVMdQ6', NULL, '2023-12-20 00:44:49', '2023-12-20 00:44:49'),
(4, 'prabhat', '700460094', 'p@gmail.com', NULL, '$2y$12$breV6y.q33tqDbxTEoJzzeNWd0oTuLitzQs0DnnVEb3Cj18YR8Odq', NULL, '2023-12-20 00:49:27', '2023-12-20 00:49:27'),
(6, 'rishav', '41852963', 's@gmail.com', NULL, '$2y$12$z4koPgz6.Wau/F/OTtSKZOjj1jm98GO3q1MWAlN5HWC4wUF1QKAmO', NULL, '2023-12-20 21:02:28', '2023-12-20 21:02:28'),
(7, 'Rohit', '789456123', 'rt@gmail.com', NULL, '$2y$12$CjQFvsN5FPwMDnA4lcZEcewr17pQS59yserwToPr1UjcBbftAylji', NULL, '2023-12-23 22:13:51', '2023-12-23 22:13:51'),
(8, 'rk@gmail.com', '9128528958', 'o@gmail.com', NULL, '$2y$12$gdUjxfFPEhdhdQKumUE6mOhN0qgkK4bku2avSNlA.uMG9jv.ui6R2', NULL, '2023-12-24 21:08:47', '2023-12-24 21:08:47'),
(9, 'Satyam', '9162265649', 'sa@gmail.com', NULL, '$2y$12$cHnz082c7cHOlwwEUaPHUuCHjZwiePHzWlYTk71KTYTJdFFtDmCP2', NULL, '2023-12-26 21:12:12', '2023-12-26 21:12:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

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
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
