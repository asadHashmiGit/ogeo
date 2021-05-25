-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Mar 31, 2021 at 11:51 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ogeo`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(78, 'default', 'created', 81, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"Manager\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-03 08:36:53', '2020-08-03 08:36:53'),
(79, 'default', 'created', 23, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":23,\"purchase_enquiry_group_id\":10,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":5,\"item_description\":null,\"service_description\":null,\"quantity\":15,\"u_o_m\":null,\"latitude\":\"55.52878495234375\",\"longitude\":\"25.03707362062512\",\"location_name\":\"Store 1\",\"underlying_transaction\":\"Sales Order #12245\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"Yes\",\"retention_percentage\":5,\"retention_days\":23,\"retention_released\":\"No\",\"notes\":\"please ensure the supporting docs are submitted with the products\",\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"4a51833d-aedb-480b-ae63-9953159abb80\",\"required_documents\":\"Material Catalogue,Country of Origin Certificate,Customers Testimonials\",\"po_vendor_id\":null,\"created_at\":\"03.Aug.2020 - (09:08:02)\",\"updated_at\":\"03.Aug.2020 - (09:08:02)\"}}', '2020-08-03 09:08:02', '2020-08-03 09:08:02'),
(80, 'default', 'created', 24, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":24,\"purchase_enquiry_group_id\":10,\"purchase_enquiry_ingroup_id\":2,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":36,\"item_description\":\"Montre Suisse\",\"service_description\":null,\"quantity\":20,\"u_o_m\":\"Pieces\",\"latitude\":\"55.52878495234375\",\"longitude\":\"25.03707362062512\",\"location_name\":\"Store 1\",\"underlying_transaction\":\"Sales Order #12245\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"Yes\",\"retention_percentage\":5,\"retention_days\":23,\"retention_released\":\"No\",\"notes\":\"please ensure the supporting docs are submitted with the products\",\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"4a51833d-aedb-480b-ae63-9953159abb80\",\"required_documents\":\"Material Catalogue,Country of Origin Certificate,Customers Testimonials\",\"po_vendor_id\":null,\"created_at\":\"03.Aug.2020 - (09:08:02)\",\"updated_at\":\"03.Aug.2020 - (09:08:02)\"}}', '2020-08-03 09:08:02', '2020-08-03 09:08:02'),
(81, 'default', 'updated', 21, 'App\\PurchaseEnquiry', 5, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"approval_level\":\"2\",\"updated_at\":\"03.Aug.2020 - (09:13:41)\"},\"old\":{\"status\":\"Created and Assigned to Level 1\",\"approval_level\":\"1\",\"updated_at\":\"21.Jul.2020 - (06:02:35)\"}}', '2020-08-03 09:13:41', '2020-08-03 09:13:41'),
(82, 'default', 'updated', 22, 'App\\PurchaseEnquiry', 5, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Rejected By Level 1 and Assigned back to the Originator\",\"approval_level\":\"0\",\"updated_at\":\"03.Aug.2020 - (09:14:37)\"},\"old\":{\"status\":\"Created and Assigned to Level 1\",\"approval_level\":\"1\",\"updated_at\":\"21.Jul.2020 - (06:02:35)\"}}', '2020-08-03 09:14:37', '2020-08-03 09:14:37'),
(83, 'default', 'created', 82, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 18:45:31', '2020-08-26 18:45:31'),
(84, 'default', 'created', 83, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 18:47:18', '2020-08-26 18:47:18'),
(85, 'default', 'created', 84, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 18:51:44', '2020-08-26 18:51:44'),
(86, 'default', 'created', 85, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 18:52:33', '2020-08-26 18:52:33'),
(87, 'default', 'created', 86, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 18:55:38', '2020-08-26 18:55:38'),
(88, 'default', 'created', 87, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 18:57:09', '2020-08-26 18:57:09'),
(91, 'default', 'created', 90, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:03:36', '2020-08-26 19:03:36'),
(92, 'default', 'created', 91, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:04:38', '2020-08-26 19:04:38'),
(93, 'default', 'created', 92, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:05:27', '2020-08-26 19:05:27'),
(94, 'default', 'created', 93, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:06:04', '2020-08-26 19:06:04'),
(95, 'default', 'created', 94, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:07:04', '2020-08-26 19:07:04'),
(96, 'default', 'created', 95, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:07:50', '2020-08-26 19:07:50'),
(97, 'default', 'created', 96, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:09:39', '2020-08-26 19:09:39'),
(98, 'default', 'created', 97, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:11:24', '2020-08-26 19:11:24'),
(99, 'default', 'created', 98, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:12:56', '2020-08-26 19:12:56'),
(100, 'default', 'created', 99, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:13:58', '2020-08-26 19:13:58'),
(101, 'default', 'created', 100, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:14:29', '2020-08-26 19:14:29'),
(102, 'default', 'created', 101, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:15:07', '2020-08-26 19:15:07'),
(103, 'default', 'created', 102, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 19:17:41', '2020-08-26 19:17:41'),
(104, 'default', 'created', 103, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 21:07:25', '2020-08-26 21:07:25'),
(105, 'default', 'created', 104, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-08-26 21:26:52', '2020-08-26 21:26:52'),
(106, 'default', 'updated', 5, 'App\\User', 5, 'App\\User', '{\"attributes\":{\"picture\":\"159911175640imgk.jpg\"},\"old\":{\"picture\":\"1565079497photo-PEV1.jpg\"}}', '2020-09-02 19:42:36', '2020-09-02 19:42:36'),
(107, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 20:56:08', '2020-09-02 20:56:08'),
(108, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 21:09:22', '2020-09-02 21:09:22'),
(109, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 21:24:45', '2020-09-02 21:24:45'),
(110, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 21:40:36', '2020-09-02 21:40:36'),
(111, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 21:42:26', '2020-09-02 21:42:26'),
(112, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 21:43:32', '2020-09-02 21:43:32'),
(113, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 21:44:28', '2020-09-02 21:44:28'),
(114, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 21:58:04', '2020-09-02 21:58:04'),
(115, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 23:29:44', '2020-09-02 23:29:44'),
(116, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 23:38:56', '2020-09-02 23:38:56'),
(117, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 23:53:42', '2020-09-02 23:53:42'),
(118, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 23:56:19', '2020-09-02 23:56:19'),
(119, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-02 23:58:22', '2020-09-02 23:58:22'),
(120, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-03 00:02:45', '2020-09-03 00:02:45'),
(121, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-03 00:05:56', '2020-09-03 00:05:56'),
(122, 'default', 'created', 105, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"dd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-04 21:55:36', '2020-09-04 21:55:36'),
(123, 'default', 'created', 106, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"dd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-04 21:58:52', '2020-09-04 21:58:52'),
(124, 'default', 'created', 107, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"dd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-04 22:01:23', '2020-09-04 22:01:23'),
(125, 'default', 'created', 108, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"dd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-04 22:03:50', '2020-09-04 22:03:50'),
(126, 'default', 'created', 109, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"dd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-04 22:05:33', '2020-09-04 22:05:33'),
(127, 'default', 'created', 110, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"dd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-04 22:08:34', '2020-09-04 22:08:34'),
(128, 'default', 'created', 111, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"dd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-04 23:18:18', '2020-09-04 23:18:18'),
(129, 'default', 'created', 112, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-04 23:25:18', '2020-09-04 23:25:18'),
(130, 'default', 'created', 113, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"deve\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-04 23:32:45', '2020-09-04 23:32:45'),
(131, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-04 23:35:48', '2020-09-04 23:35:48'),
(132, 'default', 'created', 114, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"developer\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-05 01:49:52', '2020-09-05 01:49:52'),
(133, 'default', 'created', 115, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"vela\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-06 18:57:45', '2020-09-06 18:57:45'),
(134, 'default', 'created', 116, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"dd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-08 21:16:39', '2020-09-08 21:16:39'),
(135, 'default', 'updated', 4, 'App\\User', 4, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-10 21:29:50', '2020-09-10 21:29:50'),
(136, 'default', 'created', 117, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"sdad\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:28:20', '2020-09-11 02:28:20'),
(137, 'default', 'created', 118, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"sadasd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:36:31', '2020-09-11 02:36:31'),
(138, 'default', 'created', 119, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"ddd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:40:13', '2020-09-11 02:40:13'),
(139, 'default', 'created', 120, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"sadasd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:41:03', '2020-09-11 02:41:03'),
(140, 'default', 'created', 121, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"ddd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:41:25', '2020-09-11 02:41:25'),
(141, 'default', 'created', 122, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"ddd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:47:51', '2020-09-11 02:47:51'),
(142, 'default', 'created', 123, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"ddd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:48:30', '2020-09-11 02:48:30'),
(143, 'default', 'created', 124, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"ddd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:49:34', '2020-09-11 02:49:34'),
(144, 'default', 'created', 125, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"ddd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:52:04', '2020-09-11 02:52:04'),
(145, 'default', 'created', 126, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"ddd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-11 02:52:54', '2020-09-11 02:52:54'),
(146, 'default', 'updated', 1, 'App\\VendorUser', 1, 'App\\VendorUser', '{\"attributes\":[],\"old\":[]}', '2020-09-14 23:33:33', '2020-09-14 23:33:33'),
(147, 'default', 'updated', 1, 'App\\VendorUser', 1, 'App\\VendorUser', '{\"attributes\":[],\"old\":[]}', '2020-09-14 23:47:35', '2020-09-14 23:47:35'),
(148, 'default', 'updated', 1, 'App\\VendorUser', 1, 'App\\VendorUser', '{\"attributes\":[],\"old\":[]}', '2020-09-14 23:53:53', '2020-09-14 23:53:53'),
(149, 'default', 'updated', 1, 'App\\VendorUser', 1, 'App\\VendorUser', '{\"attributes\":[],\"old\":[]}', '2020-09-14 23:57:27', '2020-09-14 23:57:27'),
(150, 'default', 'updated', 1, 'App\\VendorUser', 1, 'App\\VendorUser', '{\"attributes\":[],\"old\":[]}', '2020-09-14 23:59:55', '2020-09-14 23:59:55'),
(151, 'default', 'updated', 1, 'App\\VendorUser', 1, 'App\\VendorUser', '{\"attributes\":[],\"old\":[]}', '2020-09-15 00:19:51', '2020-09-15 00:19:51'),
(152, 'default', 'created', 25, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":25,\"purchase_enquiry_group_id\":11,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"descipritonssss\",\"quantity\":null,\"u_o_m\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":10,\"retention_days\":7,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"ebee54c6-f8d7-4756-8f84-05c480dd08a4\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (00:04:47)\",\"updated_at\":\"19.Sep.2020 - (00:04:47)\"}}', '2020-09-18 19:04:47', '2020-09-18 19:04:47'),
(153, 'default', 'created', 26, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":26,\"purchase_enquiry_group_id\":12,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"this is description\",\"quantity\":null,\"u_o_m\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":10,\"retention_days\":9,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"632f12b4-bdc0-4c72-b597-cb29efeaf07b\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (00:14:58)\",\"updated_at\":\"19.Sep.2020 - (00:14:58)\"}}', '2020-09-18 19:14:58', '2020-09-18 19:14:58'),
(154, 'default', 'created', 27, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":27,\"purchase_enquiry_group_id\":13,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"this is descriptions\",\"quantity\":null,\"u_o_m\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":10,\"retention_days\":10,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"865b3b35-cf94-4f15-b9cf-3714b9e78880\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (00:20:32)\",\"updated_at\":\"19.Sep.2020 - (00:20:32)\"}}', '2020-09-18 19:20:32', '2020-09-18 19:20:32'),
(155, 'default', 'created', 28, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":28,\"purchase_enquiry_group_id\":14,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"descsffksdflksdfskdfn\",\"quantity\":null,\"u_o_m\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":10,\"retention_days\":12,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"31af7db5-32ad-43a6-8747-d3c14e2057cf\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (00:23:25)\",\"updated_at\":\"19.Sep.2020 - (00:23:25)\"}}', '2020-09-18 19:23:25', '2020-09-18 19:23:25'),
(156, 'default', 'created', 29, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":29,\"purchase_enquiry_group_id\":15,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"desc1122\",\"quantity\":null,\"u_o_m\":null,\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":10,\"retention_days\":18,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"907969e1-20fd-4fac-87ee-5a2c7319d311\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (01:12:54)\",\"updated_at\":\"19.Sep.2020 - (01:12:54)\"}}', '2020-09-18 20:12:54', '2020-09-18 20:12:54'),
(157, 'default', 'created', 30, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":30,\"purchase_enquiry_group_id\":16,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"this desc1122\",\"quantity\":null,\"u_o_m\":null,\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":10,\"retention_days\":20,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"812b80d1-b18b-4e9a-9fce-57c57ef16aa5\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (01:15:10)\",\"updated_at\":\"19.Sep.2020 - (01:15:10)\"}}', '2020-09-18 20:15:11', '2020-09-18 20:15:11'),
(158, 'default', 'created', 31, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":31,\"purchase_enquiry_group_id\":17,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"ffffggg\",\"quantity\":null,\"u_o_m\":null,\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"123050c4-a79f-4165-932a-50343c133aa9\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (02:09:10)\",\"updated_at\":\"19.Sep.2020 - (02:09:10)\"}}', '2020-09-18 21:09:10', '2020-09-18 21:09:10'),
(159, 'default', 'created', 32, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":32,\"purchase_enquiry_group_id\":18,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"helo\",\"quantity\":null,\"u_o_m\":null,\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":10,\"retention_days\":16,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"80948358-1d1f-4e7b-b299-59ad511162f2\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (02:15:48)\",\"updated_at\":\"19.Sep.2020 - (02:15:48)\"}}', '2020-09-18 21:15:49', '2020-09-18 21:15:49'),
(160, 'default', 'created', 33, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":33,\"purchase_enquiry_group_id\":19,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"asdasd\",\"quantity\":null,\"u_o_m\":null,\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"4a8cfdfb-09c2-406a-928a-179cda2724db\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (02:17:22)\",\"updated_at\":\"19.Sep.2020 - (02:17:22)\"}}', '2020-09-18 21:17:22', '2020-09-18 21:17:22'),
(161, 'default', 'created', 34, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":34,\"purchase_enquiry_group_id\":20,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"abc def\",\"quantity\":null,\"u_o_m\":null,\"images\":\"hi\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"3e0d527b-7d26-463e-8c3a-2a3ffc477330\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (02:20:25)\",\"updated_at\":\"19.Sep.2020 - (02:20:25)\"}}', '2020-09-18 21:20:25', '2020-09-18 21:20:25'),
(162, 'default', 'created', 35, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":35,\"purchase_enquiry_group_id\":21,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"imgs\",\"quantity\":null,\"u_o_m\":null,\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"94a36ff0-b488-4c51-b816-18a3d632cdef\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (02:33:13)\",\"updated_at\":\"19.Sep.2020 - (02:33:13)\"}}', '2020-09-18 21:33:13', '2020-09-18 21:33:13'),
(163, 'default', 'created', 36, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":36,\"purchase_enquiry_group_id\":22,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"desceeee\",\"quantity\":null,\"u_o_m\":null,\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"66d1851f-0a4a-4e20-acb4-fa8ce4219a02\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (02:40:25)\",\"updated_at\":\"19.Sep.2020 - (02:40:25)\"}}', '2020-09-18 21:40:25', '2020-09-18 21:40:25'),
(164, 'default', 'created', 37, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":37,\"purchase_enquiry_group_id\":23,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":37,\"item_description\":\"abcd\",\"service_description\":\"hello\",\"quantity\":0,\"u_o_m\":\"kg\",\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":\"Pakistan\",\"underlying_transaction\":\"abcd1234\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"Yes\",\"retention_percentage\":10,\"retention_days\":12,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"9aa967e6-abac-441f-a275-9251b56c9579\",\"required_documents\":\"Material Catalogue,Warranty Certificate,Customers Testimonials\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (08:36:23)\",\"updated_at\":\"19.Sep.2020 - (08:36:23)\"}}', '2020-09-19 03:36:24', '2020-09-19 03:36:24'),
(165, 'default', 'created', 38, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":38,\"purchase_enquiry_group_id\":24,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"hello\",\"quantity\":null,\"u_o_m\":null,\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"88400d0a-f5fd-434f-a0e5-9e96dfa82a90\",\"required_documents\":\"None\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (08:38:00)\",\"updated_at\":\"19.Sep.2020 - (08:38:00)\"}}', '2020-09-19 03:38:00', '2020-09-19 03:38:00'),
(166, 'default', 'created', 39, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":39,\"purchase_enquiry_group_id\":25,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":38,\"item_description\":\"descrit\",\"service_description\":null,\"quantity\":20,\"u_o_m\":\"kg\",\"images\":null,\"latitude\":null,\"longitude\":null,\"location_name\":\"abc\",\"underlying_transaction\":\"pe#123123231\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":\"asdasda\",\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"0b9ac945-bda9-4a72-91a9-35b66005c16b\",\"required_documents\":\"Testing Certificate\",\"po_vendor_id\":null,\"created_at\":\"19.Sep.2020 - (08:49:05)\",\"updated_at\":\"19.Sep.2020 - (08:49:05)\"}}', '2020-09-19 03:49:05', '2020-09-19 03:49:05'),
(167, 'default', 'updated', 17, 'App\\PurchaseEnquiry', 5, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"approval_level\":\"2\",\"updated_at\":\"21.Sep.2020 - (00:17:11)\"},\"old\":{\"status\":\"Created and Assigned to Level 1\",\"approval_level\":\"1\",\"updated_at\":\"02.Jul.2020 - (09:32:32)\"}}', '2020-09-20 19:17:12', '2020-09-20 19:17:12'),
(168, 'default', 'updated', 20, 'App\\PurchaseEnquiry', 5, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"approval_level\":\"2\",\"updated_at\":\"21.Sep.2020 - (00:18:54)\"},\"old\":{\"status\":\"Created and Assigned to Level 1\",\"approval_level\":\"1\",\"updated_at\":\"20.Jul.2020 - (12:27:24)\"}}', '2020-09-20 19:18:54', '2020-09-20 19:18:54'),
(169, 'default', 'updated', 18, 'App\\PurchaseEnquiry', 5, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"approval_level\":\"2\",\"updated_at\":\"21.Sep.2020 - (00:20:22)\"},\"old\":{\"status\":\"Created and Assigned to Level 1\",\"approval_level\":\"1\",\"updated_at\":\"02.Jul.2020 - (09:32:32)\"}}', '2020-09-20 19:20:22', '2020-09-20 19:20:22'),
(170, 'default', 'updated', 11, 'App\\PurchaseEnquiry', 6, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Fully Approved and Sent for Request For Proposal\",\"updated_at\":\"21.Sep.2020 - (00:21:20)\"},\"old\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"updated_at\":\"25.Feb.2020 - (16:44:33)\"}}', '2020-09-20 19:21:20', '2020-09-20 19:21:20'),
(171, 'default', 'updated', 15, 'App\\PurchaseEnquiry', 6, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Fully Approved and Sent for Request For Proposal\",\"updated_at\":\"21.Sep.2020 - (00:21:35)\"},\"old\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"updated_at\":\"29.Jun.2020 - (08:25:06)\"}}', '2020-09-20 19:21:36', '2020-09-20 19:21:36'),
(172, 'default', 'updated', 17, 'App\\PurchaseEnquiry', 6, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Fully Approved and Sent for Request For Proposal\",\"updated_at\":\"21.Sep.2020 - (00:22:27)\"},\"old\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"updated_at\":\"21.Sep.2020 - (00:17:11)\"}}', '2020-09-20 19:22:27', '2020-09-20 19:22:27'),
(173, 'default', 'updated', 12, 'App\\PurchaseEnquiry', 6, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Fully Approved and Sent for Request For Proposal\",\"updated_at\":\"21.Sep.2020 - (00:23:58)\"},\"old\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"updated_at\":\"25.Feb.2020 - (16:44:46)\"}}', '2020-09-20 19:23:58', '2020-09-20 19:23:58'),
(174, 'default', 'updated', 16, 'App\\PurchaseEnquiry', 6, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Fully Approved and Sent for Request For Proposal\",\"updated_at\":\"21.Sep.2020 - (00:25:56)\"},\"old\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"updated_at\":\"29.Jun.2020 - (08:25:49)\"}}', '2020-09-20 19:25:56', '2020-09-20 19:25:56'),
(175, 'default', 'updated', 18, 'App\\PurchaseEnquiry', 6, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Fully Approved and Sent for Request For Proposal\",\"updated_at\":\"21.Sep.2020 - (00:27:23)\"},\"old\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"updated_at\":\"21.Sep.2020 - (00:20:22)\"}}', '2020-09-20 19:27:23', '2020-09-20 19:27:23'),
(176, 'default', 'updated', 33, 'App\\User', 33, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-28 20:02:33', '2020-09-28 20:02:33'),
(177, 'default', 'updated', 33, 'App\\User', 33, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-28 21:00:09', '2020-09-28 21:00:09'),
(178, 'default', 'created', 127, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 19:43:33', '2020-09-29 19:43:33'),
(183, 'default', 'deleted', 129, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 19:54:08', '2020-09-29 19:54:08'),
(185, 'default', 'deleted', 130, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:00:27', '2020-09-29 20:00:27'),
(186, 'default', 'created', 131, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:44', '2020-09-29 20:01:44'),
(187, 'default', 'created', 132, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:44', '2020-09-29 20:01:44'),
(188, 'default', 'created', 133, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:44', '2020-09-29 20:01:44'),
(189, 'default', 'created', 134, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:44', '2020-09-29 20:01:44'),
(190, 'default', 'created', 135, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:45', '2020-09-29 20:01:45'),
(191, 'default', 'created', 136, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:45', '2020-09-29 20:01:45'),
(192, 'default', 'created', 137, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:45', '2020-09-29 20:01:45'),
(193, 'default', 'created', 138, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:45', '2020-09-29 20:01:45'),
(194, 'default', 'created', 139, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:45', '2020-09-29 20:01:45'),
(195, 'default', 'created', 140, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:45', '2020-09-29 20:01:45'),
(196, 'default', 'created', 141, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:45', '2020-09-29 20:01:45'),
(197, 'default', 'created', 142, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:45', '2020-09-29 20:01:45'),
(198, 'default', 'created', 143, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:46', '2020-09-29 20:01:46'),
(199, 'default', 'created', 144, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:46', '2020-09-29 20:01:46'),
(200, 'default', 'created', 145, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:46', '2020-09-29 20:01:46'),
(201, 'default', 'created', 146, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:46', '2020-09-29 20:01:46'),
(202, 'default', 'created', 147, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:46', '2020-09-29 20:01:46'),
(203, 'default', 'created', 148, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:46', '2020-09-29 20:01:46'),
(204, 'default', 'created', 149, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:01:47', '2020-09-29 20:01:47'),
(225, 'default', 'deleted', 150, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:46', '2020-09-29 20:02:46'),
(226, 'default', 'created', 151, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:46', '2020-09-29 20:02:46'),
(227, 'default', 'created', 152, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:46', '2020-09-29 20:02:46'),
(228, 'default', 'created', 153, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:46', '2020-09-29 20:02:46'),
(229, 'default', 'created', 154, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:46', '2020-09-29 20:02:46'),
(230, 'default', 'created', 155, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:46', '2020-09-29 20:02:46'),
(231, 'default', 'created', 156, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:47', '2020-09-29 20:02:47'),
(232, 'default', 'created', 157, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:47', '2020-09-29 20:02:47'),
(233, 'default', 'created', 158, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:47', '2020-09-29 20:02:47'),
(234, 'default', 'created', 159, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:47', '2020-09-29 20:02:47'),
(235, 'default', 'created', 160, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:47', '2020-09-29 20:02:47'),
(236, 'default', 'created', 161, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:47', '2020-09-29 20:02:47'),
(237, 'default', 'created', 162, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:47', '2020-09-29 20:02:47'),
(238, 'default', 'created', 163, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:47', '2020-09-29 20:02:47'),
(239, 'default', 'created', 164, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:48', '2020-09-29 20:02:48'),
(240, 'default', 'created', 165, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:48', '2020-09-29 20:02:48'),
(241, 'default', 'created', 166, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:48', '2020-09-29 20:02:48'),
(242, 'default', 'created', 167, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:48', '2020-09-29 20:02:48'),
(243, 'default', 'created', 168, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:48', '2020-09-29 20:02:48'),
(244, 'default', 'created', 169, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:02:48', '2020-09-29 20:02:48'),
(271, 'default', 'deleted', 173, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:48', '2020-09-29 20:17:48'),
(272, 'default', 'created', 174, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:48', '2020-09-29 20:17:48'),
(273, 'default', 'created', 175, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:48', '2020-09-29 20:17:48'),
(274, 'default', 'created', 176, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:49', '2020-09-29 20:17:49'),
(275, 'default', 'created', 177, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:49', '2020-09-29 20:17:49'),
(276, 'default', 'created', 178, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:49', '2020-09-29 20:17:49'),
(277, 'default', 'created', 179, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:49', '2020-09-29 20:17:49'),
(278, 'default', 'created', 180, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:49', '2020-09-29 20:17:49'),
(279, 'default', 'created', 181, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:49', '2020-09-29 20:17:49'),
(280, 'default', 'created', 182, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:49', '2020-09-29 20:17:49'),
(281, 'default', 'created', 183, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:50', '2020-09-29 20:17:50'),
(282, 'default', 'created', 184, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:50', '2020-09-29 20:17:50'),
(283, 'default', 'created', 185, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:50', '2020-09-29 20:17:50'),
(284, 'default', 'created', 186, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:50', '2020-09-29 20:17:50'),
(285, 'default', 'created', 187, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:50', '2020-09-29 20:17:50'),
(286, 'default', 'created', 188, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:50', '2020-09-29 20:17:50'),
(287, 'default', 'created', 189, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:50', '2020-09-29 20:17:50'),
(288, 'default', 'created', 190, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:51', '2020-09-29 20:17:51'),
(289, 'default', 'created', 191, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:51', '2020-09-29 20:17:51'),
(290, 'default', 'created', 192, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 20:17:51', '2020-09-29 20:17:51'),
(291, 'default', 'deleted', 192, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(292, 'default', 'deleted', 191, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(293, 'default', 'deleted', 190, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(294, 'default', 'deleted', 189, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(295, 'default', 'deleted', 188, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(296, 'default', 'deleted', 187, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(297, 'default', 'deleted', 186, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(298, 'default', 'deleted', 185, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(299, 'default', 'deleted', 183, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(300, 'default', 'deleted', 184, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(301, 'default', 'deleted', 182, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(302, 'default', 'deleted', 181, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(303, 'default', 'deleted', 180, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(304, 'default', 'deleted', 179, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(305, 'default', 'deleted', 176, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(306, 'default', 'deleted', 177, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(307, 'default', 'deleted', 178, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(308, 'default', 'deleted', 175, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(309, 'default', 'deleted', 174, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:52', '2020-09-29 22:17:52'),
(310, 'default', 'created', 193, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:53', '2020-09-29 22:17:53'),
(311, 'default', 'created', 194, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:53', '2020-09-29 22:17:53'),
(312, 'default', 'created', 195, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:53', '2020-09-29 22:17:53'),
(313, 'default', 'created', 196, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:53', '2020-09-29 22:17:53'),
(314, 'default', 'created', 197, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:53', '2020-09-29 22:17:53'),
(315, 'default', 'created', 198, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:53', '2020-09-29 22:17:53'),
(316, 'default', 'created', 199, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:53', '2020-09-29 22:17:53'),
(317, 'default', 'created', 200, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:53', '2020-09-29 22:17:53'),
(318, 'default', 'created', 201, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:54', '2020-09-29 22:17:54'),
(319, 'default', 'created', 202, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:54', '2020-09-29 22:17:54'),
(320, 'default', 'created', 203, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:54', '2020-09-29 22:17:54'),
(321, 'default', 'created', 204, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:54', '2020-09-29 22:17:54'),
(322, 'default', 'created', 205, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:54', '2020-09-29 22:17:54'),
(323, 'default', 'created', 206, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:54', '2020-09-29 22:17:54'),
(324, 'default', 'created', 207, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:54', '2020-09-29 22:17:54'),
(325, 'default', 'created', 208, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:55', '2020-09-29 22:17:55'),
(326, 'default', 'created', 209, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:55', '2020-09-29 22:17:55'),
(327, 'default', 'created', 210, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:55', '2020-09-29 22:17:55'),
(328, 'default', 'created', 211, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 22:17:55', '2020-09-29 22:17:55'),
(329, 'default', 'deleted', 211, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(330, 'default', 'deleted', 209, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(331, 'default', 'deleted', 210, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(332, 'default', 'deleted', 208, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(333, 'default', 'deleted', 206, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(334, 'default', 'deleted', 207, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(335, 'default', 'deleted', 205, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(336, 'default', 'deleted', 204, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(337, 'default', 'deleted', 203, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(338, 'default', 'deleted', 202, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(339, 'default', 'deleted', 201, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(340, 'default', 'deleted', 200, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(341, 'default', 'deleted', 199, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(342, 'default', 'deleted', 197, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(343, 'default', 'deleted', 195, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(344, 'default', 'deleted', 196, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(345, 'default', 'deleted', 198, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(346, 'default', 'deleted', 193, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(347, 'default', 'deleted', 194, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(348, 'default', 'created', 212, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(349, 'default', 'created', 213, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(350, 'default', 'created', 214, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(351, 'default', 'created', 215, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:50', '2020-09-29 23:23:50'),
(352, 'default', 'created', 216, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:51', '2020-09-29 23:23:51'),
(353, 'default', 'created', 217, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:51', '2020-09-29 23:23:51'),
(354, 'default', 'created', 218, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:51', '2020-09-29 23:23:51'),
(355, 'default', 'created', 219, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:51', '2020-09-29 23:23:51'),
(356, 'default', 'created', 220, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:51', '2020-09-29 23:23:51'),
(357, 'default', 'created', 221, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:51', '2020-09-29 23:23:51'),
(358, 'default', 'created', 222, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:52', '2020-09-29 23:23:52'),
(359, 'default', 'created', 223, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:52', '2020-09-29 23:23:52'),
(360, 'default', 'created', 224, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:52', '2020-09-29 23:23:52'),
(361, 'default', 'created', 225, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:52', '2020-09-29 23:23:52'),
(362, 'default', 'created', 226, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:52', '2020-09-29 23:23:52'),
(363, 'default', 'created', 227, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:52', '2020-09-29 23:23:52'),
(364, 'default', 'created', 228, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:52', '2020-09-29 23:23:52'),
(365, 'default', 'created', 229, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-29 23:23:52', '2020-09-29 23:23:52'),
(366, 'default', 'deleted', 227, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(367, 'default', 'deleted', 228, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(368, 'default', 'deleted', 229, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(369, 'default', 'deleted', 226, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(370, 'default', 'deleted', 225, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(371, 'default', 'deleted', 224, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(372, 'default', 'deleted', 223, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(373, 'default', 'deleted', 221, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(374, 'default', 'deleted', 222, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(375, 'default', 'deleted', 220, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(376, 'default', 'deleted', 218, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(377, 'default', 'deleted', 219, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(378, 'default', 'deleted', 212, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(379, 'default', 'deleted', 213, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(380, 'default', 'deleted', 214, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(381, 'default', 'deleted', 217, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(382, 'default', 'deleted', 215, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(383, 'default', 'deleted', 216, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:34', '2020-09-30 21:55:34'),
(384, 'default', 'created', 230, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:35', '2020-09-30 21:55:35'),
(385, 'default', 'created', 231, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:35', '2020-09-30 21:55:35'),
(386, 'default', 'created', 232, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:35', '2020-09-30 21:55:35'),
(387, 'default', 'created', 233, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:35', '2020-09-30 21:55:35'),
(388, 'default', 'created', 234, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:35', '2020-09-30 21:55:35'),
(389, 'default', 'created', 235, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:36', '2020-09-30 21:55:36'),
(390, 'default', 'created', 236, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:36', '2020-09-30 21:55:36'),
(391, 'default', 'created', 237, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:36', '2020-09-30 21:55:36'),
(392, 'default', 'created', 238, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:36', '2020-09-30 21:55:36'),
(393, 'default', 'created', 239, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:36', '2020-09-30 21:55:36'),
(394, 'default', 'created', 240, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:36', '2020-09-30 21:55:36'),
(395, 'default', 'created', 241, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:36', '2020-09-30 21:55:36'),
(396, 'default', 'created', 242, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:37', '2020-09-30 21:55:37'),
(397, 'default', 'created', 243, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:37', '2020-09-30 21:55:37'),
(398, 'default', 'created', 244, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:37', '2020-09-30 21:55:37'),
(399, 'default', 'created', 245, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:37', '2020-09-30 21:55:37'),
(400, 'default', 'created', 246, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:37', '2020-09-30 21:55:37'),
(401, 'default', 'created', 247, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 21:55:37', '2020-09-30 21:55:37'),
(402, 'default', 'deleted', 246, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(403, 'default', 'deleted', 247, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(404, 'default', 'deleted', 244, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(405, 'default', 'deleted', 245, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(406, 'default', 'deleted', 243, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(407, 'default', 'deleted', 242, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(408, 'default', 'deleted', 241, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(409, 'default', 'deleted', 240, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(410, 'default', 'deleted', 239, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(411, 'default', 'deleted', 238, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(412, 'default', 'deleted', 233, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(413, 'default', 'deleted', 234, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(414, 'default', 'deleted', 235, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(415, 'default', 'deleted', 236, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(416, 'default', 'deleted', 237, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(417, 'default', 'deleted', 230, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(418, 'default', 'deleted', 231, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(419, 'default', 'deleted', 232, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:50', '2020-09-30 22:27:50'),
(420, 'default', 'created', 248, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:51', '2020-09-30 22:27:51'),
(421, 'default', 'created', 249, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:51', '2020-09-30 22:27:51'),
(422, 'default', 'created', 250, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:51', '2020-09-30 22:27:51'),
(423, 'default', 'created', 251, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:51', '2020-09-30 22:27:51'),
(424, 'default', 'created', 252, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:51', '2020-09-30 22:27:51'),
(425, 'default', 'created', 253, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:51', '2020-09-30 22:27:51'),
(426, 'default', 'created', 254, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:51', '2020-09-30 22:27:51'),
(427, 'default', 'created', 255, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:52', '2020-09-30 22:27:52'),
(428, 'default', 'created', 256, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:52', '2020-09-30 22:27:52'),
(429, 'default', 'created', 257, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:52', '2020-09-30 22:27:52'),
(430, 'default', 'created', 258, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:52', '2020-09-30 22:27:52'),
(431, 'default', 'created', 259, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:52', '2020-09-30 22:27:52'),
(432, 'default', 'created', 260, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:53', '2020-09-30 22:27:53'),
(433, 'default', 'created', 261, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:53', '2020-09-30 22:27:53'),
(434, 'default', 'created', 262, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:53', '2020-09-30 22:27:53'),
(435, 'default', 'created', 263, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:53', '2020-09-30 22:27:53'),
(436, 'default', 'created', 264, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:53', '2020-09-30 22:27:53'),
(437, 'default', 'created', 265, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:27:53', '2020-09-30 22:27:53'),
(438, 'default', 'deleted', 262, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(439, 'default', 'deleted', 263, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(440, 'default', 'deleted', 265, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(441, 'default', 'deleted', 264, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(442, 'default', 'deleted', 261, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(443, 'default', 'deleted', 260, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(444, 'default', 'deleted', 259, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(445, 'default', 'deleted', 258, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(446, 'default', 'deleted', 257, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(447, 'default', 'deleted', 256, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(448, 'default', 'deleted', 248, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(449, 'default', 'deleted', 249, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(450, 'default', 'deleted', 250, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(451, 'default', 'deleted', 251, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(452, 'default', 'deleted', 252, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(453, 'default', 'deleted', 255, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(454, 'default', 'deleted', 254, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(455, 'default', 'deleted', 253, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(456, 'default', 'created', 266, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(457, 'default', 'created', 267, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(458, 'default', 'created', 268, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:24', '2020-09-30 22:29:24'),
(459, 'default', 'created', 269, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:25', '2020-09-30 22:29:25'),
(460, 'default', 'created', 270, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:25', '2020-09-30 22:29:25'),
(461, 'default', 'created', 271, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:25', '2020-09-30 22:29:25'),
(462, 'default', 'created', 272, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:25', '2020-09-30 22:29:25'),
(463, 'default', 'created', 273, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:25', '2020-09-30 22:29:25'),
(464, 'default', 'created', 274, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:25', '2020-09-30 22:29:25'),
(465, 'default', 'created', 275, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:25', '2020-09-30 22:29:25'),
(466, 'default', 'created', 276, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:26', '2020-09-30 22:29:26'),
(467, 'default', 'created', 277, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:26', '2020-09-30 22:29:26'),
(468, 'default', 'created', 278, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:26', '2020-09-30 22:29:26'),
(469, 'default', 'created', 279, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:26', '2020-09-30 22:29:26'),
(470, 'default', 'created', 280, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:26', '2020-09-30 22:29:26'),
(471, 'default', 'created', 281, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:27', '2020-09-30 22:29:27'),
(472, 'default', 'created', 282, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:27', '2020-09-30 22:29:27'),
(473, 'default', 'created', 283, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:29:27', '2020-09-30 22:29:27'),
(474, 'default', 'deleted', 280, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(475, 'default', 'deleted', 281, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(476, 'default', 'deleted', 282, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(477, 'default', 'deleted', 283, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(478, 'default', 'deleted', 279, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(479, 'default', 'deleted', 278, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(480, 'default', 'deleted', 277, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(481, 'default', 'deleted', 276, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(482, 'default', 'deleted', 275, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(483, 'default', 'deleted', 274, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(484, 'default', 'deleted', 273, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(485, 'default', 'deleted', 272, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(486, 'default', 'deleted', 271, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(487, 'default', 'deleted', 270, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(488, 'default', 'deleted', 269, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(489, 'default', 'deleted', 268, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(490, 'default', 'deleted', 266, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(491, 'default', 'deleted', 267, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(492, 'default', 'created', 284, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(493, 'default', 'created', 285, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:22', '2020-09-30 22:32:22'),
(494, 'default', 'created', 286, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:23', '2020-09-30 22:32:23'),
(495, 'default', 'created', 287, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:23', '2020-09-30 22:32:23'),
(496, 'default', 'created', 288, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:23', '2020-09-30 22:32:23'),
(497, 'default', 'created', 289, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:23', '2020-09-30 22:32:23'),
(498, 'default', 'created', 290, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:23', '2020-09-30 22:32:23'),
(499, 'default', 'created', 291, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:23', '2020-09-30 22:32:23'),
(500, 'default', 'created', 292, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:24', '2020-09-30 22:32:24'),
(501, 'default', 'created', 293, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:24', '2020-09-30 22:32:24'),
(502, 'default', 'created', 294, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:24', '2020-09-30 22:32:24'),
(503, 'default', 'created', 295, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:24', '2020-09-30 22:32:24'),
(504, 'default', 'created', 296, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:24', '2020-09-30 22:32:24'),
(505, 'default', 'created', 297, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:24', '2020-09-30 22:32:24'),
(506, 'default', 'created', 298, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:24', '2020-09-30 22:32:24'),
(507, 'default', 'created', 299, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:24', '2020-09-30 22:32:24'),
(508, 'default', 'created', 300, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:25', '2020-09-30 22:32:25'),
(509, 'default', 'created', 301, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:32:25', '2020-09-30 22:32:25'),
(510, 'default', 'deleted', 298, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(511, 'default', 'deleted', 299, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(512, 'default', 'deleted', 300, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(513, 'default', 'deleted', 301, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(514, 'default', 'deleted', 297, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(515, 'default', 'deleted', 296, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(516, 'default', 'deleted', 295, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(517, 'default', 'deleted', 294, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(518, 'default', 'deleted', 293, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(519, 'default', 'deleted', 292, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(520, 'default', 'deleted', 287, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(521, 'default', 'deleted', 288, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(522, 'default', 'deleted', 289, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(523, 'default', 'deleted', 290, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(524, 'default', 'deleted', 291, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(525, 'default', 'deleted', 284, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(526, 'default', 'deleted', 286, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(527, 'default', 'deleted', 285, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(528, 'default', 'created', 302, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"adminstrator\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(529, 'default', 'created', 303, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STM\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(530, 'default', 'created', 304, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(531, 'default', 'created', 305, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(532, 'default', 'created', 306, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(533, 'default', 'created', 307, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"LMV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(534, 'default', 'created', 308, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RPA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(535, 'default', 'created', 309, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(536, 'default', 'created', 310, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"POV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(537, 'default', 'created', 311, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"RNo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(538, 'default', 'created', 312, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"PNV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(539, 'default', 'created', 313, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"VQA\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(540, 'default', 'created', 314, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(541, 'default', 'created', 315, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SICR\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(542, 'default', 'created', 316, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STMRO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(543, 'default', 'created', 317, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"STRV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(544, 'default', 'created', 318, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"ITURO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(545, 'default', 'created', 319, 'App\\User', 33, 'App\\User', '{\"attributes\":{\"designation\":\"SITURV\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(546, 'default', 'updated', 33, 'App\\User', 33, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-30 22:56:02', '2020-09-30 22:56:02'),
(547, 'default', 'created', 320, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"ceo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 23:22:46', '2020-09-30 23:22:46'),
(548, 'default', 'updated', 320, 'App\\User', 320, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-30 23:46:43', '2020-09-30 23:46:43'),
(549, 'default', 'created', 321, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"ceo\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-09-30 23:54:24', '2020-09-30 23:54:24'),
(550, 'default', 'updated', 321, 'App\\User', 321, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-30 23:54:27', '2020-09-30 23:54:27'),
(551, 'default', 'updated', 321, 'App\\User', 321, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-09-30 23:58:31', '2020-09-30 23:58:31'),
(552, 'default', 'updated', 321, 'App\\User', 321, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 00:05:13', '2020-10-01 00:05:13'),
(553, 'default', 'updated', 321, 'App\\User', 321, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 00:05:13', '2020-10-01 00:05:13'),
(554, 'default', 'created', 322, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"CEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-01 00:19:20', '2020-10-01 00:19:20'),
(555, 'default', 'updated', 322, 'App\\User', 322, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 00:20:08', '2020-10-01 00:20:08'),
(556, 'default', 'updated', 322, 'App\\User', 322, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 00:20:08', '2020-10-01 00:20:08'),
(557, 'default', 'created', 323, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"CEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-01 00:49:55', '2020-10-01 00:49:55'),
(558, 'default', 'updated', 323, 'App\\User', 323, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 00:50:22', '2020-10-01 00:50:22'),
(559, 'default', 'updated', 323, 'App\\User', 323, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 00:50:22', '2020-10-01 00:50:22'),
(560, 'default', 'updated', 323, 'App\\User', 323, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 00:50:57', '2020-10-01 00:50:57'),
(561, 'default', 'updated', 323, 'App\\User', 323, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 00:51:45', '2020-10-01 00:51:45'),
(562, 'default', 'updated', 5, 'App\\User', NULL, NULL, '{\"attributes\":[],\"old\":[]}', '2020-10-01 21:57:12', '2020-10-01 21:57:12'),
(563, 'default', 'updated', 6, 'App\\User', NULL, NULL, '{\"attributes\":[],\"old\":[]}', '2020-10-01 21:57:47', '2020-10-01 21:57:47'),
(564, 'default', 'updated', 6, 'App\\User', 6, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 23:19:18', '2020-10-01 23:19:18'),
(565, 'default', 'updated', 5, 'App\\User', NULL, NULL, '{\"attributes\":[],\"old\":[]}', '2020-10-01 23:20:12', '2020-10-01 23:20:12'),
(566, 'default', 'updated', 5, 'App\\User', 5, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-01 23:37:36', '2020-10-01 23:37:36'),
(567, 'default', 'updated', 3, 'App\\User', 3, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-05 05:40:08', '2020-10-05 05:40:08'),
(568, 'default', 'updated', 7, 'App\\User', NULL, NULL, '{\"attributes\":[],\"old\":[]}', '2020-10-05 05:40:29', '2020-10-05 05:40:29'),
(569, 'default', 'created', 324, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"CEO\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 22:51:58', '2020-10-06 22:51:58'),
(570, 'default', 'updated', 324, 'App\\User', 324, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-06 22:52:48', '2020-10-06 22:52:48'),
(571, 'default', 'updated', 324, 'App\\User', 324, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-06 22:52:48', '2020-10-06 22:52:48'),
(572, 'default', 'updated', 324, 'App\\User', 324, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-06 22:53:15', '2020-10-06 22:53:15'),
(573, 'default', 'updated', 324, 'App\\User', 324, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-06 22:55:14', '2020-10-06 22:55:14'),
(574, 'default', 'updated', 324, 'App\\User', 324, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-06 23:03:27', '2020-10-06 23:03:27'),
(575, 'default', 'created', 325, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"apa\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:03:28', '2020-10-06 23:03:28'),
(576, 'default', 'created', 326, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"ssdd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:03:28', '2020-10-06 23:03:28'),
(577, 'default', 'created', 327, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"jkjk\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:03:29', '2020-10-06 23:03:29'),
(578, 'default', 'created', 328, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"tyuty\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:03:30', '2020-10-06 23:03:30'),
(579, 'default', 'created', 329, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"ghj\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:03:31', '2020-10-06 23:03:31'),
(580, 'default', 'created', 330, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"asdaz\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:03:31', '2020-10-06 23:03:31'),
(581, 'default', 'created', 331, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"erw\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:03:31', '2020-10-06 23:03:31'),
(582, 'default', 'deleted', 325, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"apa\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(583, 'default', 'deleted', 326, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"ssdd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(584, 'default', 'deleted', 327, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"jkjk\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(585, 'default', 'deleted', 328, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"tyuty\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(586, 'default', 'deleted', 329, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"ghj\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(587, 'default', 'deleted', 330, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"asdaz\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(588, 'default', 'deleted', 331, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"erw\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(589, 'default', 'created', 332, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"apa\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(590, 'default', 'created', 333, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"ssdd\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(591, 'default', 'created', 334, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"jkjk\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(592, 'default', 'created', 335, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"tyuty\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:39', '2020-10-06 23:04:39'),
(593, 'default', 'created', 336, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"ghj\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:39', '2020-10-06 23:04:39'),
(594, 'default', 'created', 337, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"asdaz\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:39', '2020-10-06 23:04:39'),
(595, 'default', 'created', 338, 'App\\User', 324, 'App\\User', '{\"attributes\":{\"designation\":\"erw\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(596, 'default', 'updated', 324, 'App\\User', 324, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-10-06 23:04:42', '2020-10-06 23:04:42'),
(597, 'default', 'created', 40, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":40,\"purchase_enquiry_group_id\":25,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":43,\"item_description\":\"dfsdfs\",\"service_description\":null,\"quantity\":2,\"u_o_m\":\"Dozen\",\"images\":null,\"p_images\":\"[\\\"profilefb89705ae6d743bf1e848c206e16a1d7307.jpeg\\\",\\\"profile55b37c5c270e5d84c793e486d798c01d897.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"PE#12312312\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"c63f465e-c61a-4991-a441-21ab255d38d2\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"17.Oct.2020 - (05:50:10)\",\"updated_at\":\"17.Oct.2020 - (05:50:10)\"}}', '2020-10-17 00:50:10', '2020-10-17 00:50:10'),
(598, 'default', 'created', 41, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":41,\"purchase_enquiry_group_id\":26,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":44,\"item_description\":\"asdasdas\",\"service_description\":null,\"quantity\":3,\"u_o_m\":\"Dozen\",\"images\":null,\"p_images\":\"[\\\"profileb5dc4e5d9b495d0196f61d45b26ef33e266.jpeg\\\",\\\"profile6da9003b743b65f4c0ccd295cc484e57650.jpeg\\\",\\\"profile58a2fc6ed39fd083f55d4182bf88826d147.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"PE#12312321\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"afef49ec-36e1-4c7d-89f6-1f9c6c7deab7\",\"required_documents\":\"Customers Testimonials\",\"po_vendor_id\":null,\"created_at\":\"17.Oct.2020 - (05:55:32)\",\"updated_at\":\"17.Oct.2020 - (05:55:32)\"}}', '2020-10-17 00:55:32', '2020-10-17 00:55:32'),
(599, 'default', 'created', 42, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":42,\"purchase_enquiry_group_id\":26,\"purchase_enquiry_ingroup_id\":2,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":45,\"item_description\":\"asdasdas\",\"service_description\":null,\"quantity\":2,\"u_o_m\":\"kilo\",\"images\":null,\"p_images\":\"[\\\"profile96b9bff013acedfb1d140579e2fbeb63288.jpeg\\\",\\\"profile85fc37b18c57097425b52fc7afbb6969177.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"PE#123123234\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"afef49ec-36e1-4c7d-89f6-1f9c6c7deab7\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"17.Oct.2020 - (05:55:32)\",\"updated_at\":\"17.Oct.2020 - (05:55:32)\"}}', '2020-10-17 00:55:32', '2020-10-17 00:55:32'),
(600, 'default', 'created', 43, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":43,\"purchase_enquiry_group_id\":27,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Service\",\"store_item_request\":\"No\",\"item_id\":null,\"item_description\":null,\"service_description\":\"dsadasdasdasdasd\",\"quantity\":null,\"u_o_m\":null,\"images\":null,\"p_images\":\"[\\\"profilea760880003e7ddedfef56acb3b09697f836.jpeg\\\",\\\"profilee820a45f1dfc7b95282d10b6087e11c0711.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":null,\"sourcing_priority\":\"Standard\",\"advanced_payment\":null,\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"9a13d5fd-7f3e-4e98-b461-da2cafb05d58\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"17.Oct.2020 - (05:56:31)\",\"updated_at\":\"17.Oct.2020 - (05:56:31)\"}}', '2020-10-17 00:56:31', '2020-10-17 00:56:31'),
(601, 'default', 'created', 44, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":44,\"purchase_enquiry_group_id\":28,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":6,\"item_description\":null,\"service_description\":null,\"quantity\":2,\"u_o_m\":null,\"images\":null,\"p_images\":\"[]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"PE#1232131245\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"15ffd073-527d-4f09-b306-d136752b24a0\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"17.Oct.2020 - (06:15:38)\",\"updated_at\":\"17.Oct.2020 - (06:15:38)\"}}', '2020-10-17 01:15:39', '2020-10-17 01:15:39'),
(602, 'default', 'created', 45, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":45,\"purchase_enquiry_group_id\":29,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":46,\"item_description\":\"asdasdasdatrtyt\",\"service_description\":null,\"quantity\":2,\"u_o_m\":\"Liter\",\"images\":null,\"p_images\":\"[\\\"profilec75b6f114c23a4d7ea11331e7c00e73c161.jpeg\\\",\\\"profile0e01938fc48a2cfb5f2217fbfb00722d241.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"PE#25453443\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"2deb97b1-efdd-4da4-b937-68db4186d8e0\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"17.Oct.2020 - (06:31:39)\",\"updated_at\":\"17.Oct.2020 - (06:31:39)\"}}', '2020-10-17 01:31:39', '2020-10-17 01:31:39'),
(603, 'default', 'created', 46, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":46,\"purchase_enquiry_group_id\":30,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":47,\"item_description\":\"sdfsdfdsfs\",\"service_description\":null,\"quantity\":4,\"u_o_m\":\"Dozen\",\"images\":null,\"p_images\":\"[\\\"profilecf004fdc76fa1a4f25f62e0eb5261ca3198.jpeg\\\",\\\"profile65658fde58ab3c2b6e5132a39fae7cb9610.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"PE#1231\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"4431130f-f627-44e7-8e0a-b3ef09ffb0c2\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"17.Oct.2020 - (06:38:56)\",\"updated_at\":\"17.Oct.2020 - (06:38:56)\"}}', '2020-10-17 01:38:56', '2020-10-17 01:38:56'),
(604, 'default', 'created', 47, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":47,\"purchase_enquiry_group_id\":31,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":48,\"item_description\":\"hhhhjjjkk\",\"service_description\":null,\"quantity\":5,\"u_o_m\":\"Liters\",\"images\":null,\"p_images\":\"[\\\"profile98d6f58ab0dafbb86b083a001561bb34885.jpeg\\\",\\\"profile060ad92489947d410d897474079c1477973.jpeg\\\",\\\"profilee4bb4c5173c2ce17fd8fcd40041c068f917.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"PE#42424242\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"6970319c-1355-47e1-b140-3757474cefbf\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"17.Oct.2020 - (06:41:41)\",\"updated_at\":\"17.Oct.2020 - (06:41:41)\"}}', '2020-10-17 01:41:41', '2020-10-17 01:41:41'),
(605, 'default', 'created', 48, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":48,\"purchase_enquiry_group_id\":32,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":49,\"item_description\":\"dfsdfdsfsf\",\"service_description\":null,\"quantity\":5,\"u_o_m\":\"Liters\",\"images\":null,\"p_images\":\"[\\\"profile89f0fd5c927d466d6ec9a21b9ac34ffa351.jpeg\\\",\\\"profile7504adad8bb96320eb3afdd4df6e1f60938.jpeg\\\",\\\"profile5ef059938ba799aaa845e1c2e8a762bd383.jpeg\\\",\\\"profile142949df56ea8ae0be8b5306971900a4660.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"PE#575757\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"a8a69fd8-1a25-4a6c-b42e-e5e9e081a160\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"17.Oct.2020 - (06:45:40)\",\"updated_at\":\"17.Oct.2020 - (06:45:40)\"}}', '2020-10-17 01:45:40', '2020-10-17 01:45:40'),
(606, 'default', 'updated', 339, 'App\\User', 339, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-11-27 06:59:00', '2020-11-27 06:59:00'),
(607, 'default', 'created', 49, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":49,\"purchase_enquiry_group_id\":33,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":50,\"item_description\":\"sadfgdj\",\"service_description\":null,\"quantity\":5,\"u_o_m\":\"kg\",\"images\":null,\"p_images\":\"[\\\"profile287e03db1d99e0ec2edb90d079e142f3472.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"123\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"Yes\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"4d57ec07-a600-4c95-8e82-12695fc8a5d2\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"27.Nov.2020 - (07:09:04)\",\"updated_at\":\"27.Nov.2020 - (07:09:04)\"}}', '2020-11-27 07:09:04', '2020-11-27 07:09:04'),
(608, 'default', 'updated', 340, 'App\\User', 340, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-12-08 13:29:16', '2020-12-08 13:29:16'),
(609, 'default', 'updated', 341, 'App\\User', 341, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-12-08 13:31:02', '2020-12-08 13:31:02'),
(610, 'default', 'created', 343, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"abc\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-12-08 14:37:30', '2020-12-08 14:37:30'),
(611, 'default', 'updated', 343, 'App\\User', 343, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-12-08 14:38:22', '2020-12-08 14:38:22'),
(612, 'default', 'updated', 343, 'App\\User', 343, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-12-08 14:38:22', '2020-12-08 14:38:22'),
(613, 'default', 'updated', 343, 'App\\User', 343, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-12-08 14:39:01', '2020-12-08 14:39:01'),
(614, 'default', 'updated', 343, 'App\\User', 343, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2020-12-09 20:36:04', '2020-12-09 20:36:04'),
(615, 'default', 'created', 344, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"admin\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2020-12-10 12:02:08', '2020-12-10 12:02:08'),
(616, 'default', 'created', 50, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":50,\"purchase_enquiry_group_id\":34,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":51,\"item_description\":\"wwww\",\"service_description\":null,\"quantity\":1,\"u_o_m\":\"1\",\"images\":null,\"p_images\":\"[\\\"profilef57a2f557b098c43f11ab969efe1504b939.jpeg\\\",\\\"profile38b3eff8baf56627478ec76a704e9b52865.jpeg\\\",\\\"profile7f5d04d189dfb634e6a85bb9d9adf21e441.jpeg\\\",\\\"profile4f4adcbf8c6f66dcfc8a3282ac2bf10a866.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"1\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"b021f968-69e6-4153-a42b-30e4257cc5a8\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"11.Dec.2020 - (05:48:05)\",\"updated_at\":\"11.Dec.2020 - (05:48:05)\"}}', '2020-12-11 13:48:06', '2020-12-11 13:48:06'),
(617, 'default', 'updated', 50, 'App\\PurchaseEnquiry', 5, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"approval_level\":\"2\",\"updated_at\":\"11.Dec.2020 - (05:55:12)\"},\"old\":{\"status\":\"Created and Assigned to Level 1\",\"approval_level\":\"1\",\"updated_at\":\"11.Dec.2020 - (05:48:05)\"}}', '2020-12-11 13:55:12', '2020-12-11 13:55:12'),
(618, 'default', 'updated', 50, 'App\\PurchaseEnquiry', 6, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Fully Approved and Sent for Request For Proposal\",\"updated_at\":\"11.Dec.2020 - (05:58:24)\"},\"old\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"updated_at\":\"11.Dec.2020 - (05:55:12)\"}}', '2020-12-11 13:58:24', '2020-12-11 13:58:24'),
(619, 'default', 'updated', 50, 'App\\PurchaseEnquiry', 12, 'App\\User', '{\"attributes\":{\"status\":\"Send for a New Request for Proposals\",\"updated_at\":\"11.Dec.2020 - (06:24:18)\"},\"old\":{\"status\":\"Request for Proposals Floated\",\"updated_at\":\"11.Dec.2020 - (06:21:47)\"}}', '2020-12-11 14:24:18', '2020-12-11 14:24:18'),
(620, 'default', 'updated', 15, 'App\\PurchaseEnquiry', 12, 'App\\User', '{\"attributes\":{\"status\":\"Send for a New Request for Proposals\",\"updated_at\":\"11.Dec.2020 - (06:24:18)\"},\"old\":{\"status\":\"Request for Proposals Floated\",\"updated_at\":\"11.Dec.2020 - (06:21:47)\"}}', '2020-12-11 14:24:18', '2020-12-11 14:24:18'),
(621, 'default', 'updated', 13, 'App\\PurchaseEnquiry', 12, 'App\\User', '{\"attributes\":{\"status\":\"Send for a New Request for Proposals\",\"updated_at\":\"11.Dec.2020 - (06:24:18)\"},\"old\":{\"status\":\"Request for Proposals Floated\",\"updated_at\":\"11.Dec.2020 - (06:21:47)\"}}', '2020-12-11 14:24:18', '2020-12-11 14:24:18'),
(622, 'default', 'created', 51, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":51,\"purchase_enquiry_group_id\":35,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":52,\"item_description\":\"qwert\",\"service_description\":null,\"quantity\":1,\"u_o_m\":\"1\",\"images\":null,\"p_images\":\"[\\\"profile2050e03ca119580f74cca14cc6e97462919.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"1\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"Yes\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"e2034f3f-5363-4c8d-9e63-8808e674c14d\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"11.Dec.2020 - (07:09:16)\",\"updated_at\":\"11.Dec.2020 - (07:09:16)\"}}', '2020-12-11 15:09:16', '2020-12-11 15:09:16'),
(623, 'default', 'updated', 51, 'App\\PurchaseEnquiry', 5, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"approval_level\":\"2\",\"updated_at\":\"11.Dec.2020 - (07:10:05)\"},\"old\":{\"status\":\"Created and Assigned to Level 1\",\"approval_level\":\"1\",\"updated_at\":\"11.Dec.2020 - (07:09:16)\"}}', '2020-12-11 15:10:05', '2020-12-11 15:10:05'),
(624, 'default', 'updated', 51, 'App\\PurchaseEnquiry', 6, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Fully Approved and Sent for Request For Proposal\",\"updated_at\":\"11.Dec.2020 - (07:10:43)\"},\"old\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"updated_at\":\"11.Dec.2020 - (07:10:05)\"}}', '2020-12-11 15:10:43', '2020-12-11 15:10:43'),
(625, 'default', 'updated', 2, 'App\\User', NULL, NULL, '{\"attributes\":[],\"old\":[]}', '2020-12-14 12:41:00', '2020-12-14 12:41:00'),
(626, 'default', 'updated', 344, 'App\\User', 344, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-14 09:31:31', '2021-01-14 09:31:31'),
(627, 'default', 'updated', 344, 'App\\User', 344, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-14 09:31:31', '2021-01-14 09:31:31'),
(628, 'default', 'updated', 344, 'App\\User', 344, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-14 09:31:58', '2021-01-14 09:31:58'),
(629, 'default', 'updated', 344, 'App\\User', 344, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-16 06:40:16', '2021-01-16 06:40:16'),
(630, 'default', 'updated', 344, 'App\\User', 344, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-16 06:50:41', '2021-01-16 06:50:41'),
(631, 'default', 'updated', 344, 'App\\User', 344, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-16 08:03:19', '2021-01-16 08:03:19'),
(632, 'default', 'updated', 344, 'App\\User', 344, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-16 08:03:31', '2021-01-16 08:03:31'),
(634, 'default', 'created', 345, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"asdf\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:04', '2021-01-16 09:12:04'),
(635, 'default', 'created', 346, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"fa\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(636, 'default', 'created', 347, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"ads\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(637, 'default', 'created', 348, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"sdf\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(638, 'default', 'created', 349, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"d\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(639, 'default', 'created', 350, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"samad\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(640, 'default', 'created', 351, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"ali\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(641, 'default', 'created', 352, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"asdf\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(642, 'default', 'created', 353, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"sdf\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(643, 'default', 'created', 354, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"asdf\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(644, 'default', 'created', 355, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"fa\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(645, 'default', 'created', 356, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"asdf\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(646, 'default', 'created', 357, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"df\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(647, 'default', 'created', 358, 'App\\User', 344, 'App\\User', '{\"attributes\":{\"designation\":\"asdf\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(648, 'default', 'updated', 344, 'App\\User', 344, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-16 09:12:48', '2021-01-16 09:12:48'),
(649, 'default', 'created', 359, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"abc\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-22 11:03:16', '2021-01-22 11:03:16'),
(650, 'default', 'updated', 359, 'App\\User', 359, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-22 11:04:12', '2021-01-22 11:04:12'),
(651, 'default', 'updated', 359, 'App\\User', 359, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-22 11:04:12', '2021-01-22 11:04:12'),
(652, 'default', 'updated', 359, 'App\\User', 359, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-22 11:04:34', '2021-01-22 11:04:34'),
(653, 'default', 'updated', 359, 'App\\User', 359, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-22 11:57:42', '2021-01-22 11:57:42'),
(654, 'default', 'created', 360, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"Director\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-01-30 11:24:23', '2021-01-30 11:24:23'),
(655, 'default', 'updated', 360, 'App\\User', 360, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-30 11:26:31', '2021-01-30 11:26:31'),
(656, 'default', 'updated', 360, 'App\\User', 360, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-30 11:26:31', '2021-01-30 11:26:31'),
(657, 'default', 'updated', 360, 'App\\User', 360, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-30 11:29:47', '2021-01-30 11:29:47'),
(658, 'default', 'updated', 360, 'App\\User', 360, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-30 12:24:46', '2021-01-30 12:24:46'),
(660, 'default', 'updated', 360, 'App\\User', 360, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-30 16:55:01', '2021-01-30 16:55:01'),
(661, 'default', 'updated', 339, 'App\\User', 339, 'App\\User', '{\"attributes\":{\"picture\":\"1612011587Napo.JPG\"},\"old\":{\"picture\":\"user_image.png\"}}', '2021-01-30 16:59:47', '2021-01-30 16:59:47'),
(662, 'default', 'updated', 339, 'App\\User', 339, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-30 17:01:01', '2021-01-30 17:01:01'),
(663, 'default', 'updated', 339, 'App\\User', 339, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-01-30 17:01:48', '2021-01-30 17:01:48'),
(664, 'default', 'updated', 339, 'App\\User', 339, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-02-03 22:02:50', '2021-02-03 22:02:50'),
(665, 'default', 'updated', 340, 'App\\User', 340, 'App\\User', '{\"attributes\":{\"picture\":\"1612375564Logo.JPG\"},\"old\":{\"picture\":\"user_image.png\"}}', '2021-02-03 22:06:04', '2021-02-03 22:06:04'),
(666, 'default', 'created', 361, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"Manager\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-02-03 22:16:24', '2021-02-03 22:16:24'),
(667, 'default', 'updated', 361, 'App\\User', 361, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-02-03 22:18:27', '2021-02-03 22:18:27'),
(668, 'default', 'updated', 361, 'App\\User', 361, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-02-03 22:18:28', '2021-02-03 22:18:28'),
(669, 'default', 'updated', 361, 'App\\User', 361, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-02-03 22:19:14', '2021-02-03 22:19:14'),
(670, 'default', 'updated', 361, 'App\\User', 361, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-02-03 22:26:18', '2021-02-03 22:26:18'),
(671, 'default', 'created', 52, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":52,\"enquiry_from_item_master\":\"Yes\",\"purchase_enquiry_group_id\":36,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":7,\"item_description\":null,\"service_description\":null,\"quantity\":14,\"u_o_m\":null,\"images\":null,\"p_images\":\"[]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"12\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"Yes\",\"retention_percentage\":0,\"retention_days\":0,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"83b79d8d-f0a3-4bb7-a9d0-afc3e7c80d80\",\"required_documents\":\"\",\"po_vendor_id\":null,\"created_at\":\"27.Feb.2021 - (11:58:07)\",\"updated_at\":\"27.Feb.2021 - (11:58:07)\"}}', '2021-02-27 11:58:09', '2021-02-27 11:58:09'),
(672, 'default', 'created', 53, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":53,\"enquiry_from_item_master\":\"Yes\",\"purchase_enquiry_group_id\":37,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":6,\"item_description\":null,\"service_description\":null,\"quantity\":45,\"u_o_m\":null,\"images\":null,\"p_images\":\"[]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"SO-2021\\/45-167\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"Yes\",\"retention_percentage\":5,\"retention_days\":19,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"251d7d08-1454-43b4-b412-3e353281a0aa\",\"required_documents\":\"Material Catalogue,Testing Certificate,Customers Testimonials\",\"po_vendor_id\":null,\"created_at\":\"27.Feb.2021 - (17:54:20)\",\"updated_at\":\"27.Feb.2021 - (17:54:20)\"}}', '2021-02-27 17:54:20', '2021-02-27 17:54:20'),
(673, 'default', 'created', 54, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":54,\"enquiry_from_item_master\":\"Yes\",\"purchase_enquiry_group_id\":38,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":5,\"item_description\":null,\"service_description\":null,\"quantity\":6,\"u_o_m\":null,\"images\":null,\"p_images\":\"[]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"Sales Order - 18\\/2021\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"Yes\",\"retention_percentage\":16,\"retention_days\":16,\"retention_released\":\"No\",\"notes\":\"Good to go\",\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"cb254a50-d3df-4e1a-8c35-3bc49bcd20bb\",\"required_documents\":\"Liability Insurance Certificate,Testing Certificate,MSDS - Material Safety Data Sheet\",\"po_vendor_id\":null,\"created_at\":\"03.Mar.2021 - (10:32:03)\",\"updated_at\":\"03.Mar.2021 - (10:32:03)\"}}', '2021-03-03 10:32:03', '2021-03-03 10:32:03'),
(674, 'default', 'updated', 54, 'App\\PurchaseEnquiry', 5, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Rejected By Level 1 and Assigned back to the Originator\",\"approval_level\":\"0\",\"updated_at\":\"03.Mar.2021 - (10:36:56)\"},\"old\":{\"status\":\"Created and Assigned to Level 1\",\"approval_level\":\"1\",\"updated_at\":\"03.Mar.2021 - (10:32:03)\"}}', '2021-03-03 10:36:56', '2021-03-03 10:36:56'),
(675, 'default', 'updated', 54, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Cancelled by Originator\",\"updated_at\":\"03.Mar.2021 - (10:40:24)\"},\"old\":{\"status\":\"Purchase Enquiry Line Rejected By Level 1 and Assigned back to the Originator\",\"updated_at\":\"03.Mar.2021 - (10:36:56)\"}}', '2021-03-03 10:40:24', '2021-03-03 10:40:24'),
(676, 'default', 'updated', 53, 'App\\PurchaseEnquiry', 5, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"approval_level\":\"2\",\"updated_at\":\"03.Mar.2021 - (11:06:55)\"},\"old\":{\"status\":\"Created and Assigned to Level 1\",\"approval_level\":\"1\",\"updated_at\":\"27.Feb.2021 - (17:54:20)\"}}', '2021-03-03 11:06:55', '2021-03-03 11:06:55'),
(677, 'default', 'updated', 53, 'App\\PurchaseEnquiry', 6, 'App\\User', '{\"attributes\":{\"status\":\"Purchase Enquiry Line Fully Approved and Sent for Request For Proposal\",\"updated_at\":\"03.Mar.2021 - (11:11:32)\"},\"old\":{\"status\":\"Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval\",\"updated_at\":\"03.Mar.2021 - (11:06:55)\"}}', '2021-03-03 11:11:32', '2021-03-03 11:11:32'),
(678, 'default', 'created', 55, 'App\\PurchaseEnquiry', 4, 'App\\User', '{\"attributes\":{\"id\":55,\"enquiry_from_item_master\":\"No\",\"purchase_enquiry_group_id\":39,\"purchase_enquiry_ingroup_id\":1,\"created_by\":4,\"company_id\":1,\"project_id\":1,\"enquiry_type\":\"Materials\",\"store_item_request\":\"No\",\"item_id\":53,\"item_description\":\"Superman\",\"service_description\":null,\"quantity\":56,\"u_o_m\":\"cartons of 12 bottles\",\"images\":null,\"p_images\":\"[\\\"profile109a0ca3bc27f3e96597370d5c8cf03d830.jpeg\\\"]\",\"latitude\":null,\"longitude\":null,\"location_name\":null,\"underlying_transaction\":\"SO-67854\",\"sourcing_priority\":\"Standard\",\"advanced_payment\":\"No\",\"retention_percentage\":6,\"retention_days\":10,\"retention_released\":\"No\",\"notes\":null,\"status\":\"Created and Assigned to Level 1\",\"active\":\"Yes\",\"approval_level\":\"1\",\"grouping_id\":\"3b113177-b60d-4f2c-b1a4-0bb44fa11335\",\"required_documents\":\"Material Catalogue,Testing Certificate\",\"po_vendor_id\":null,\"created_at\":\"03.Mar.2021 - (13:09:11)\",\"updated_at\":\"03.Mar.2021 - (13:09:11)\"}}', '2021-03-03 13:09:11', '2021-03-03 13:09:11'),
(679, 'default', 'created', 362, 'App\\User', NULL, NULL, '{\"attributes\":{\"designation\":\"user\",\"phone_number\":null,\"address\":null,\"picture\":\"user_image.png\"}}', '2021-03-05 14:57:47', '2021-03-05 14:57:47'),
(680, 'default', 'updated', 362, 'App\\User', 362, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-03-05 15:00:34', '2021-03-05 15:00:34'),
(681, 'default', 'updated', 362, 'App\\User', 362, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-03-05 15:00:34', '2021-03-05 15:00:34'),
(682, 'default', 'updated', 362, 'App\\User', 362, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-03-05 15:01:21', '2021-03-05 15:01:21'),
(683, 'default', 'updated', 362, 'App\\User', 362, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-03-05 15:02:34', '2021-03-05 15:02:34'),
(685, 'default', 'updated', 362, 'App\\User', 362, 'App\\User', '{\"attributes\":[],\"old\":[]}', '2021-03-05 16:17:35', '2021-03-05 16:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `budget_master`
--

CREATE TABLE `budget_master` (
  `id` int(255) NOT NULL,
  `budget_group_id` varchar(255) DEFAULT NULL,
  `budget_ingroup_id` varchar(255) DEFAULT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `project_id` int(255) DEFAULT NULL,
  `template_id` int(255) DEFAULT NULL,
  `creation_request_id` int(255) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `description` text,
  `u_o_m` varchar(45) DEFAULT NULL,
  `field_1` int(11) DEFAULT NULL,
  `field_2` int(11) DEFAULT NULL,
  `field_3` int(11) DEFAULT NULL,
  `field_4` int(11) DEFAULT NULL,
  `field_5` int(11) DEFAULT NULL,
  `field_6` int(11) DEFAULT NULL,
  `field_7` int(11) DEFAULT NULL,
  `field_8` int(11) DEFAULT NULL,
  `field_9` int(11) DEFAULT NULL,
  `field_10` int(11) DEFAULT NULL,
  `field_11` int(11) DEFAULT NULL,
  `field_12` int(11) DEFAULT NULL,
  `field_13` int(11) DEFAULT NULL,
  `field_14` int(11) DEFAULT NULL,
  `field_15` int(11) DEFAULT NULL,
  `field_16` int(11) DEFAULT NULL,
  `field_17` int(11) DEFAULT NULL,
  `field_18` int(11) DEFAULT NULL,
  `field_19` int(11) DEFAULT NULL,
  `field_20` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT 'image_not_available.png',
  `images` text,
  `status` varchar(255) NOT NULL DEFAULT '	Pending Level 1 Approval',
  `approval_level` varchar(255) DEFAULT '1',
  `active` varchar(255) NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `budget_master`
--

INSERT INTO `budget_master` (`id`, `budget_group_id`, `budget_ingroup_id`, `created_by`, `company_id`, `project_id`, `template_id`, `creation_request_id`, `prefix`, `description`, `u_o_m`, `field_1`, `field_2`, `field_3`, `field_4`, `field_5`, `field_6`, `field_7`, `field_8`, `field_9`, `field_10`, `field_11`, `field_12`, `field_13`, `field_14`, `field_15`, `field_16`, `field_17`, `field_18`, `field_19`, `field_20`, `picture`, `images`, `status`, `approval_level`, `active`, `created_at`, `updated_at`) VALUES
(1, NULL, '1', 339, 11, NULL, NULL, 1, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-22 16:25:19', '2021-02-22 16:29:29'),
(2, NULL, '', 339, 11, NULL, NULL, 2, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-22 16:36:30', '2021-02-22 16:40:04'),
(3, NULL, '', 339, 11, NULL, NULL, 3, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '	Pending Level 1 Approval', '1', 'No', '2021-02-22 21:00:38', '2021-02-22 21:00:38'),
(4, NULL, '2', 339, 11, NULL, NULL, 4, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-22 22:40:35', '2021-02-22 22:47:13'),
(5, NULL, '3', 339, 11, NULL, NULL, 5, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 14:42:39', '2021-02-24 14:49:15'),
(6, NULL, '4', 339, 11, NULL, NULL, 6, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 14:51:30', '2021-02-24 14:57:56'),
(7, NULL, '5', 339, 11, NULL, NULL, 7, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 15:54:13', '2021-02-24 16:20:41'),
(8, NULL, '6', 339, 11, NULL, NULL, 8, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 16:22:18', '2021-02-24 16:27:21'),
(9, NULL, '7', 339, 11, NULL, NULL, 9, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 16:28:41', '2021-02-24 16:31:00'),
(10, NULL, '8', 339, 11, NULL, NULL, 10, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 16:32:47', '2021-02-24 16:34:27'),
(11, NULL, '9', 339, 11, NULL, NULL, 11, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 16:35:40', '2021-02-24 16:38:14'),
(12, NULL, '', 339, 11, NULL, NULL, 12, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Rejected By Validator at Level 1', '1', 'No', '2021-02-24 16:39:45', '2021-02-24 16:40:59'),
(13, NULL, '10', 339, 11, NULL, NULL, 13, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-03-03 10:45:17', '2021-03-03 10:48:17'),
(14, NULL, '', 339, 11, NULL, NULL, 14, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Rejected By Validator at Level 2', '1', 'No', '2021-03-03 10:51:25', '2021-03-03 10:57:17'),
(15, NULL, '', 339, 11, NULL, NULL, 15, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '	Pending Level 1 Approval', '1', 'No', '2021-03-03 11:00:02', '2021-03-03 11:00:02'),
(16, NULL, '', 339, 11, NULL, NULL, 16, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '	Pending Level 1 Approval', '1', 'No', '2021-03-03 13:11:20', '2021-03-03 13:11:20'),
(17, NULL, '', 339, 11, NULL, NULL, 17, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '	Pending Level 1 Approval', '1', 'No', '2021-03-03 14:01:14', '2021-03-03 14:01:14'),
(18, NULL, '11', 339, 11, NULL, NULL, 18, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-03-05 21:20:57', '2021-03-05 22:13:42'),
(19, NULL, '12', 339, 11, NULL, NULL, 19, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-03-05 22:24:57', '2021-03-05 22:29:19'),
(20, NULL, '', 339, 11, NULL, NULL, 20, NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '	Pending Level 1 Approval', '1', 'No', '2021-03-06 17:54:10', '2021-03-06 17:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `budget_master_setup`
--

CREATE TABLE `budget_master_setup` (
  `id` int(255) UNSIGNED NOT NULL,
  `template_group_id` int(255) DEFAULT NULL,
  `template_ingroup_id` int(255) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `company_id` int(255) DEFAULT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `u_o_m` varchar(255) DEFAULT 'Unit Of Measure',
  `field_1` text,
  `field_1_required` varchar(255) DEFAULT NULL,
  `field_2` text,
  `field_2_required` varchar(255) DEFAULT NULL,
  `field_3` text,
  `field_3_required` varchar(255) DEFAULT NULL,
  `field_4` text,
  `field_4_required` varchar(255) DEFAULT NULL,
  `field_5` text,
  `field_5_required` varchar(255) DEFAULT NULL,
  `field_6` text,
  `field_6_required` varchar(255) DEFAULT NULL,
  `field_7` text,
  `field_7_required` varchar(255) DEFAULT NULL,
  `field_8` text,
  `field_8_required` varchar(255) DEFAULT NULL,
  `field_9` text,
  `field_9_required` varchar(255) DEFAULT NULL,
  `field_10` text,
  `field_10_required` varchar(255) DEFAULT NULL,
  `field_11` text,
  `field_11_required` varchar(255) DEFAULT NULL,
  `field_12` text,
  `field_12_required` varchar(255) DEFAULT NULL,
  `field_13` text,
  `field_13_required` varchar(255) DEFAULT NULL,
  `field_14` text,
  `field_14_required` varchar(255) DEFAULT NULL,
  `field_15` text,
  `field_15_required` varchar(255) DEFAULT NULL,
  `field_16` text,
  `field_16_required` varchar(255) DEFAULT NULL,
  `field_17` text,
  `field_17_required` varchar(255) DEFAULT NULL,
  `field_18` text,
  `field_18_required` varchar(255) DEFAULT NULL,
  `field_19` text,
  `field_19_required` varchar(255) DEFAULT NULL,
  `field_20` text,
  `field_20_required` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `charts`
--

CREATE TABLE `charts` (
  `id` int(255) UNSIGNED NOT NULL,
  `created_by` int(255) NOT NULL,
  `sql_query` text NOT NULL,
  `filteration_variables` text NOT NULL,
  `chart_col_width` text NOT NULL,
  `company_id` int(255) DEFAULT NULL,
  `chart_options` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(255) NOT NULL,
  `created_by` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `company_time` varchar(255) DEFAULT NULL,
  `setup_mode` varchar(255) NOT NULL,
  `employees_range` varchar(255) NOT NULL,
  `industry` text NOT NULL,
  `cities` text NOT NULL,
  `pe_prefix` varchar(255) DEFAULT NULL,
  `rfq_prefix` varchar(255) DEFAULT NULL,
  `rn_prefix` varchar(255) DEFAULT NULL,
  `po_prefix` varchar(255) DEFAULT NULL,
  `ce_prefix` varchar(255) DEFAULT NULL,
  `additional_required_1` varchar(255) NOT NULL DEFAULT 'No',
  `additional_required_store` varchar(255) NOT NULL DEFAULT 'No',
  `lom_manditory` varchar(255) DEFAULT NULL,
  `lom_prefix` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `created_by`, `name`, `company_time`, `setup_mode`, `employees_range`, `industry`, `cities`, `pe_prefix`, `rfq_prefix`, `rn_prefix`, `po_prefix`, `ce_prefix`, `additional_required_1`, `additional_required_store`, `lom_manditory`, `lom_prefix`, `logo`, `active`, `created_at`, `updated_at`) VALUES
(1, 2, 'Alfresco Inc', NULL, 'Project Wise', '51 - 100', 'Building Materials', 'Dubai', 'PE', 'RfP', 'RN', 'PO', 'CE', 'Yes', 'Yes', 'LibrariesNFreeText', '', '1561818369Logo. Alfresco.png', 'Yes', '2019-06-29 09:26:09', '2019-08-05 01:50:02'),
(2, 34, 'Alfresco', NULL, 'Project Wise', '11 - 50', 'Retail', 'Hayat,Baghdad', 'PE', 'RfP', 'RN', 'PO', 'CE', 'Yes', 'Yes', 'Libraries', '', '1562441282Logo. Alfresco.png', 'Yes', '2019-07-06 14:28:02', '2019-07-06 14:28:02'),
(3, 34, 'Alfresco', NULL, 'Project Wise', '11 - 50', 'Retail', 'Hayat,Baghdad', 'PE', 'RfP', 'RN', 'PO', 'CE', 'Yes', 'Yes', 'Libraries', '', '1562441288Logo. Alfresco.png', 'Yes', '2019-07-06 14:28:08', '2019-07-06 14:28:08'),
(4, 58, 'ITT', NULL, 'Project Wise', '6 - 10', 'Banking', 'Djelfa', 'PE', 'RfQ', 'RN', 'PO', 'CE', 'Yes', 'Yes', 'LibrariesNFreeText', '', '1567843857arkham.jpg', 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(5, 74, 'Breez', NULL, 'Project Wise', '51 - 100', 'Banking', 'Casablanca', 'PE', 'RfP', 'RN', 'PO', 'CE', 'Yes', 'Yes', 'Libraries', '', '1594828434Advansale Logo.JPG', 'Yes', '2020-07-15 10:53:54', '2020-07-15 10:53:54'),
(7, 33, 'sony', 'Antarctica/Palmer', 'Project Wise', '11 - 50', 'Aviation & Aerospace,Biotechnology', 'Djelfa', 'pe', 'rr', 'rn', 'po', 'ce', 'Yes', 'No', 'Libraries', '', '1601362809Untitled-q1.jpg', 'Yes', '2020-09-28 21:00:09', '2020-09-28 23:54:21'),
(8, 321, 'myorg', 'Antarctica/Troll', 'Project Wise', '6 - 10', 'Building Materials,Business Supplies & Equipment', 'Draria', NULL, NULL, NULL, NULL, NULL, 'No', 'No', NULL, NULL, '1601546713Untitled-q1.jpg', 'Yes', '2020-10-01 00:05:13', '2020-10-01 00:05:13'),
(9, 322, 'myorg2', 'America/Argentina/Salta', 'Project Wise', '6 - 10', 'Chemicals,Capital Markets', 'El Tarf', NULL, NULL, NULL, NULL, NULL, 'No', 'No', NULL, NULL, '1601547608Untitled-q1.jpg', 'Yes', '2020-10-01 00:20:08', '2020-10-01 00:20:08'),
(10, 323, 'orgy', 'Antarctica/Rothera', 'Project Wise', '6 - 10', 'Biotechnology,Banking', 'Constantine', 'ecp', 'ecp', 'ecp', 'ecp', 'ecp', 'Yes', 'No', 'Libraries', NULL, '1601549422Untitled-q1.jpg', 'Yes', '2020-10-01 00:50:22', '2020-10-01 00:51:45'),
(11, 324, 'test67', 'Antarctica/Mawson', 'Project Wise', '11 - 50', 'Broadcast Media,Business Supplies & Equipment', 'Bougara', 't67', 't67', 't67', 't67', 't67', 'No', 'Yes', 'Libraries', NULL, '1605517606construction-helmet.jpg', 'Yes', '2020-10-06 22:52:48', '2020-10-06 22:55:14'),
(12, 343, 'qadsf', 'Antarctica/Vostok', 'Project Wise', '6 - 10', 'Capital Markets', 'El Tarf', 'klas', 'jjj', 'jj', 'jj', 'jj', 'No', 'Yes', 'Libraries', NULL, '1607431102firvrr_website.png', 'Yes', '2020-12-08 14:38:22', '2020-12-09 20:36:04'),
(13, 344, 'this is', 'Europe/Andorra', 'Project Wise', '', 'Accounting', 'Dubai', 'qwer', 'qwer', 'werr', 'wer', 'werr', 'Yes', 'Yes', 'Libraries', NULL, '1610620291WhatsApp Image 2021-01-12 at 3.30.21 PM.jpeg', 'Yes', '2021-01-14 09:31:31', '2021-01-16 06:40:16'),
(14, 359, 'abc', 'Asia/Dubai', 'Project Wise', '11 - 50', 'Chemicals,Civil Engineering', 'Dubai', 'abc', 'abc', 'abc', 'abc', 'abc', 'Yes', 'Yes', 'Libraries', NULL, '1611317052ogeo_logo_transparent.png', 'Yes', '2021-01-22 11:04:12', '2021-01-22 11:57:42'),
(15, 360, 'Tester', 'America/Argentina/Salta', 'Project Wise', '51 - 100', 'Biotechnology', 'Dubai', 'PE', 'RfP', 'RN', 'PO', 'CE', 'Yes', 'Yes', 'LibrariesNFreeText', NULL, '1611991591Logo.JPG', 'Yes', '2021-01-30 11:26:31', '2021-01-30 12:24:46'),
(16, 361, 'Zesty Edibles Inc.', 'Antarctica/Rothera', 'Project Wise', '51 - 100', 'Automotive', 'Sharif', 'PE', 'RfP', 'RN', 'PO', 'CE', 'Yes', 'Yes', 'LibrariesNFreeText', '', '1612376307Logo.JPG', 'Yes', '2021-02-03 22:18:28', '2021-02-03 22:26:18'),
(17, 362, 'test', 'Asia/Tokyo', 'Project Wise', '11 - 50', 'Banking,Biotechnology', 'Bougara', 'werw', 'were', 'werr', 'werr', 'werw', 'Yes', 'Yes', 'FreeText', '', '1614942034Screenshot from 2021-03-05 15-58-38.png', 'Yes', '2021-03-05 15:00:34', '2021-03-05 15:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `excel_tamplate`
--

CREATE TABLE `excel_tamplate` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `Template_Name` varchar(255) DEFAULT NULL,
  `Field_1_Header` varchar(255) DEFAULT NULL,
  `Field_2_Header` varchar(255) DEFAULT NULL,
  `Field_3_Header` varchar(255) DEFAULT NULL,
  `Field_4_Header` varchar(255) DEFAULT NULL,
  `Field_5_Header` varchar(255) DEFAULT NULL,
  `Field_6_Header` varchar(255) DEFAULT NULL,
  `Field_7_Header` varchar(255) DEFAULT NULL,
  `Field_8_Header` varchar(255) DEFAULT NULL,
  `Field_9_Header` varchar(255) DEFAULT NULL,
  `Field_10_Header` varchar(255) DEFAULT NULL,
  `Field_11_Header` varchar(255) DEFAULT NULL,
  `Field_12_Header` varchar(255) DEFAULT NULL,
  `Field_13_Header` varchar(255) DEFAULT NULL,
  `Field_14_Header` varchar(255) DEFAULT NULL,
  `Field_15_Header` varchar(255) DEFAULT NULL,
  `Field_16_Header` varchar(255) DEFAULT NULL,
  `Field_17_Header` varchar(255) DEFAULT NULL,
  `Field_18_Header` varchar(255) DEFAULT NULL,
  `Field_19_Header` varchar(255) DEFAULT NULL,
  `Field_20_Header` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `excel_user`
--

CREATE TABLE `excel_user` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `employee_email` varchar(255) DEFAULT NULL,
  `employee_designation` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(255) UNSIGNED NOT NULL,
  `question_category` varchar(255) NOT NULL,
  `question_title` varchar(255) NOT NULL,
  `question_description` text NOT NULL,
  `image_1` varchar(255) DEFAULT NULL,
  `image_2` varchar(255) DEFAULT NULL,
  `image_3` varchar(255) DEFAULT NULL,
  `image_4` varchar(255) DEFAULT NULL,
  `image_5` varchar(255) DEFAULT NULL,
  `image_6` varchar(255) DEFAULT NULL,
  `image_7` varchar(255) DEFAULT NULL,
  `image_8` varchar(255) DEFAULT NULL,
  `image_9` varchar(255) DEFAULT NULL,
  `image_10` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question_category`, `question_title`, `question_description`, `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `image_7`, `image_8`, `image_9`, `image_10`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Purchase Enquiry FAQs', 'What is a Purchase Enquiry (PE)?', 'A Purchase Enquiry (PE), either for materials or services, is raised  on Ogéo when one wishes to obtain commercial and technical proposals (bids) for the supply of such materials or services. A PE is generally followed by a Request for Proposals (RfP), so that a bidding process can start. Both the RfPs and the bidding processes are handled through Ogéo.<br>When the proposals are obtained and evaluated, the decision can then be made to buy or not. When it\'s the former,  a Purchase Order (PO) needs to be raised and assigned to the selected vendor, through Ogéo.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-07-22 14:56:05', '2018-08-18 08:53:31'),
(2, 'Item Master FAQs', 'What is the Library of Materials?', 'The Library of Materials is a repertory of all materials that a client is likely to ever need to source. Ogéo provides its clients\' users with the ability to create a large number of user-friendly templates that will be used to describe each of the categories of materials. These templates are subsequently used to capture the information that our clients see needed to describe each material. <br><br>NOTE: It is always recommended that Ogéo is configured by the clients in such a way that the items for which Purchase Enquiry (PE) are needed, are  strictly extracted from the clients\' Library of Materials: Even though Ogéo can be configured to enable the use of free texts to describe the materials for which a PE is needed, generating meaningful data that will ultimately benefit the clients and help them make data-driven decisions can only be achieved when there is consistent way of describing the materials for which PEs are needed. The use of the Library of Materials makes it easy to achieve such consistency.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-07-22 15:11:58', '2019-04-09 06:46:40'),
(3, 'Process FAQs', 'How is the procurement process handled through Ogéo?', 'On Ogéo, sourcing Materials and Services will always start with the creation of a Purchase Enquiry (PE).  The PE is then approved, on Ogéo, as per the client\'s chain of approvals, before being converted into a Request for Proposals (RfP). <br>The RfP is then sent, through Ogéo (no emails, no faxes...), to any vendors selected by the client\'s users, so that a bidding process can start. Ogéo is then used to source commercial proposals under any one of these bidding processes: Sealed Bid, Live Reverse Auction and Live Japanese Auction. Once a suitable offer is selected by the client following a commercial evaluation of the bids conducted on Ogéo, the platform is then used to create a PO (Purchase Order). The PO follows the clients\' approved  Delegation of Authority (DoA) before being awarded to the the winner of the bidding process (again no emails and no faxes.... the winner of the bidding process receives the award directly on Ogéo.)<br>Ogéo is then used by the winner of the bidding process to notify the client about the start of the delivery process. In a similar fashion, the client\'s users shall use Ogéo to confirm that the subject of the PO (Materials or Services) were received. <br>This confirmation shall enable the winner of the bidding process to raise his invoice through Ogéo.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-07-22 15:52:38', '2018-08-17 17:36:47'),
(4, 'Quotations FAQs', 'What is a Request for Proposals (RfP)?', 'When a Purchase Enquiry (PE) is fully documented, created and approved on Ogéo, it automatically gets assigned to the client\'s users responsible for creating the needed Request for Proposals (RfP) that shall be sent, through Ogéo, to different qualified bidders (selected from the list of approved vendors) to source commercial and technical proposals. <br>The answers to any RfP can take any one of the following forms: Sealed Bid, Live Reverse Auction and Live Japanese Auction. These answers are directly uploaded onto Ogéo by the clients\' qualified bidders as they all have the necessary credentials to use Ogéo to submit their offers/proposals.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-07-22 16:24:02', '2018-08-17 19:43:19'),
(5, 'Process FAQs', 'What roles are available on Ogéo?', 'Ogéo enables each of its clients to assign a large number of roles to their respective users. Depending on the choice of the client, these roles can be either company-wide or project-wide.  There are no limitations to the numbers of users for which each client can assign roles. Additionally, while most of these roles are held by the client\'s users, some are held by the client\'s vendors users.<br>Role#1- Ogéo enables the client to select the user(s) who will be tasked with originating Purchase Enquiry (PE). <br>Role#2- Ogéo enables the client to select the user(s) who will be tasked with approving the PEs created by those holding role#1. While doing so, the client can upload its PE\'s chain of approvals. (Ogéo can accommodate as much as 9 levels of approvals).<br>Role#3- Ogéo enables the client to select the user(s) who will be tasked with creating Request for Proposals (RfP) and assigning them to the bidding vendors. <br>Role#4- Ogéo enables the client to select the user(s) who will be tasked with suggesting that new materials are added to the client\'s Library of Material. <br>Role#5- Ogéo enables the client to select the user(s) who will be tasked with reviewing the suggestions created by those holding role#4 and formalizing the requests to add new materials to the clients\'s Library of Materials.<br>Role#6- Ogéo enables the client to select the user(s) who will be tasked with approving the requests created by those holding role#5.<br>Role#7- Ogéo enables the client to select the user(s) who will be tasked with originating Purchase Orders (PO). <br>Role#8- Ogéo enables the client to select the user(s) who will be tasked with approving the POs created by those holding role#7. While doing so, the client will be asked to upload its DoA (Delegation of Authority) for approving POs (Ogéo can accommodate as much as 9 levels of approvals), as well as its approval levels (unit rate value, PO line value, PO total value).<br>Role#9- Ogéo enables the client to select the user(s) who will be tasked with originating Receipt Notes (RN). <br>Role#10- Ogéo enables the client to select the user(s) who will be tasked with approving the RNs created by those holding role#9. While doing so, the client will be asked to upload its DoA (Delegation of Authority) for approving RNs (Ogéo can accommodate as much as 9 levels of approvals), as well as its approval levels (unit rate value, PO line value, PO total value).<br>Role#11- Ogéo enables the client to select the user(s) who will be tasked with suggesting the creation of Rates Contracts (RC)<br>Role#12- Ogéo enables the client to select the user(s) who will be tasked with originating the creation of RCs. <br>Role#13- Ogéo enables the client to select the user(s) who will be tasked with approving the creation of RCs that were initiated those holding Role#12.<br>Role#14- Ogéo enables the client to select the user(s) who will be tasked with qualifying/approving vendors and enlisting them (adding them to the client\'s list of approved vendors).<br>Role#15- Ogéo enables the client\'s vendors to select the user(s) who will be tasked with submitting bids/proposals in responses to the request for Proposals (RfP) raised by the client.<br>Role#16- Ogéo enables the client\'s vendors to select the user(s) who will be tasked with raising invoices to the client.<br>Role#17- Ogéo enables the client\'s vendors to select the user(s) who will be tasked with sending Dispatch Early Notifications (DEN) to the client.<br><br>NOTE 1: In addition to the above roles, a client\'s user will hold the role of an administrator to manage the client\'s account. The administrator will have the ability to configure the client’s Ogéo account setting, including but not limited to, creating the above roles.<br>NOTE 2: a client\'s user can hold more than one role at any given moment. Client are advised to exercise caution to ensure that their Ogéo setup enforce governance.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-07-22 17:19:38', '2018-08-17 19:16:27'),
(6, 'Process FAQs', 'What is Ogéo?', 'Ogéo is a web-based, cost effective, true Pay As You Go procurement management platform. It enables clients to:<br>                              1/ Create and approve Purchase Enquiry (PE); <br>                             2/ Float Requests for Proposals (RfP);<br>                             3/ Create, approve and aaward Purchase Orders (PO);<br>                             4/ Create and approve Receipt Notes (RN);<br>                             5/ Receive invoices from the vendors;<br>                             6/ Create and manage Rate Contracts (RC);<br>                             7/ Obtain fully tailored (role-wise) reports and dashboards.<br><br>To deliver the above results, Ogéo allows each client to:<br>                                1/ Assign specific roles to its employees (This can be done either company-wide or be project specific);<br>                               2/ Implement its own chain of approvals\' hierarchy for Purchase Enquiries (PE) (This can be done either company-wide or be project specific);<br>                               3/ Implement its own Delegations of Authority (DoA) for both the Purchase Orders (PO) and the Receipt Notes (RNs) (This can be done either company-wide or be project specific);<br>                               4/ Create its specific Library of Materials (LoM);<br>                               5/ Set up its vendor management platform through which the client interacts with its vendors for:<br>                                       a. Qualifying/approving and enlisting vendors (The vendors are provided with their own access credentials to Ogéo)<br>                                       b. Assigning Requests for Proposals,<br>                                       c. Receiving proposals (sealed bids, Live Reverse Auctions, Japanese Reverse Auctions),<br>                                       d. Awarding Purchase Orders (PO) to the selected vendors,<br>                                       e. Receiving Dispatches Early notifications (DEN),<br>                                       f.  Receiving invoices.<br>NOTE 1: While Ogéo is a cloud-based solution in essence, on-premise deployments are a possibility.<br>NOTE 2: While the clients\' data is hosted on Amazon Web Services (AWS), Ogéo itself is hosted on Cloudways®, a US based managed cloud hosting platform. Many of the datacenters available inside Cloudways Platform have nearly 100% uptime in the last 365 days.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-07-25 05:37:05', '2018-08-18 08:16:59'),
(7, 'Process FAQs', 'How much does it actually cost to use Ogéo?', 'The short answer is: Not much.<br>Ogéo offers a true pay-as-you-go model: A client (once the grace period has elapsed) is purely charged on the number of Purchase Enquiry (PE) lines* that he has created in any given month. The flat rate is set at 0.95 US$ per PE line (VAT included), for the month\'s first hundred PE lines. The flat rate drops to 0.90 US$ per PE line (VAT included), for the month\'s second hundred PE lines. the flat rate further drops to 0.85 US$ per PE line (VAT included), for the month\'s balance of PE lines**. <br><br>Additionally, clients face no lock-in period, nor any long-term commitments to Ogéo. <br><br>Finally, unlike other platforms, Ogéo\'s charging mechanism isn\'t dependent on the number of users. Actually, clients can create roles for each one of their employees, without restrictions, if they wish to do so. Simultaneously, there is no restriction on the number of vendors that the clients want to enlist onto Ogéo.<br><br><br><br>* while Purchase Enquiries for Services can only have 1 line, those for Materials can have 1 or more lines, depending on the choice of the client. <br><br>** For example, should a client create 350 PE lines in a month, his monthly bill for that particular month will be 312.5 US$.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-07-25 06:26:24', '2018-08-18 08:46:21'),
(8, 'Purchase Orders FAQs', 'What is a Purchase Order (PO)?', 'A Purchase Order (PO) is initiated on Ogéo whenever the decision to award is taken. Such decision is usually taken when commercial and a technical proposals (bids), submitted by a vendor, is found to be adequate by the client. The awardee is always a vendor who has submit his successful bid to the client through Ogéo. Once initiated, the PO is then escalated internally, as per the client\'s approved Delegation of Authority (DoA), for review and approval on Ogéo.<br>A PO is always preceded by a Purchase Enquiry (PE) and a Request for Proposal (RfP) when the subject of the PE isn\'t covered by a valid Rate Contract (RC). When the subject of the PE is actually covered by a valid RC, the user, after creating the PE, can create the PO without the need of a RfP.<br>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-08-17 19:29:09', '2018-08-17 20:01:56'),
(9, 'Receipt Notes FAQs', 'What is a Receipt Note (RN)?', 'A Receipt Note (RN) is created on Ogéo by the client\'s user(s) to document the fact that the Materials or Services that were ordered were actually satisfactorily delivered by the vendor who was awarded the PO. The RN is executed on the basis of quantities not on monetary figures. Once the RN is created, it is then escalated internally, as per the client\'s approved Delegation of Authority (DoA), for review and approval. Once formally approved on Ogéo, the RN is then used as a trigger to enable the vendor raise his invoice through Ogéo.<br>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-08-17 19:58:08', '2018-08-17 19:58:08'),
(10, 'Rate Contract FAQs', 'What is a Rate Contract (RC)?', 'A Rate Contract (RC) is a supply agreement that a client can enter with his vendors for the sake of freezing unit rates over any period of time. RCs are usually very effective is reducing the souring time. while they are mostly used for Materials that are frequently needed by the client, they can be used for all sort of Materials and Services.<br>Ogéo enables its client to create a library of terms and conditions that will form part of the RC he enters.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-08-17 20:10:19', '2018-08-17 20:10:19'),
(11, 'Rate Contract FAQs', 'How are Rate Contracts (RC) created on Ogéo?', 'User(s) that are tasked with recommending the establishment of Rate Contracts (RC) shall list the Materials and/or Services that need to be covered with such contracts. Once again, the use of the Library of Materials is highly recommended to ease the creation of such suggested RCs. <br>Once this recommendation is made on Ogéo, its then escalated for approval before being assigned to the user(s) that are tasked with floating Request for Proposals for Rate Contracts (RfP-RC). As it is the case for a simple Purchase Enquiry (PE), commercial and technical proposals are sourced for each of the materials and /or services that were listed in the approved recommendation. The selection of the adequate bids will automatically lead to the establishment of different Rate Contracts. A material can be covered with more than one Rate Contracts. Once their creation on Ogéo is approved, the RCs can then be used on Ogéo whenever there is a need to create a Purchase Enquiry (PE) for a material and or a service that is covered by one or more RCs.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-08-17 20:24:27', '2018-08-17 20:24:27'),
(12, 'Process FAQs', 'Who should use Ogéo?', 'All organizations looking for a cost effective procurement solution should consider Ogéo as a very valuable option. SMEs, in particular, will appreciate the value for money that Ogéo delivers: they will have an end-to-end procurement solution that includes a vendor management platform, without the need to acquire an overly expensive IT infrastructure on which a costly procurement solution needs to be deployed. The fact that Ogéo is a cloud-based solution implies that these SMEs can avoid any maintenance/support costs that are usually attached to servers, on-premise solutions,....', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-08-18 07:26:12', '2018-08-18 07:26:12'),
(13, 'Process FAQs', 'Where will the clients\' data be stored?', 'Security in the cloud is recognized as better than on-premises. Broad security certification and accreditation, data encryption at rest and in-transit, hardware security modules and strong physical security all contribute to a more secure way to manage business’ IT infrastructure. <br>Therefore, all the data generated by the clients while using Ogéo will be stored on the US servers operated by Amazon Web Services (AWS).  <br>AWS is a secure cloud services platform, offering compute power, database storage, content delivery and other functionality to help our clients\' businesses scale and grow. Millions of customers, such as those working for Pfizer, Unilever, Johnson & Johnson,.....are currently using AWS.<br>AWS, as per the Service Level Agreement, will use commercially reasonable efforts to make its servers accessible with a Monthly Uptime Percentage of at least 99.99%, during any monthly billing cycle.<br><br>NOTE:<br>Monthly Uptime Percentage is calculated by subtracting from 100% the percentage of minutes during the month in which access to the servers wasn\'t possible.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2018-08-18 08:14:15', '2018-08-18 08:21:32');

-- --------------------------------------------------------

--
-- Table structure for table `financial_limits`
--

CREATE TABLE `financial_limits` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) UNSIGNED NOT NULL,
  `project_id` int(255) UNSIGNED NOT NULL,
  `limit_type` varchar(45) NOT NULL,
  `level` int(255) UNSIGNED NOT NULL,
  `currency` varchar(45) NOT NULL,
  `limit` float NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `financial_limits`
--

INSERT INTO `financial_limits` (`id`, `company_id`, `project_id`, `limit_type`, `level`, `currency`, `limit`, `active`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'POV', 1, 'AED', 1000, 'Yes', '2019-07-06 14:28:02', '2019-07-06 14:28:02'),
(2, 2, 2, 'RNV', 1, 'AED', 500, 'Yes', '2019-07-06 14:28:02', '2019-07-06 14:28:02'),
(3, 2, 2, 'RCV', 1, 'AED', 15000, 'Yes', '2019-07-06 14:28:02', '2019-07-06 14:28:02'),
(4, 2, 3, 'POV', 1, 'USD', 1000, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(5, 2, 3, 'RNV', 1, 'USD', 500, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(6, 2, 3, 'RCV', 1, 'USD', 15000, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(7, 3, 4, 'POV', 1, 'AED', 1000, 'Yes', '2019-07-06 14:28:08', '2019-07-06 14:28:08'),
(8, 3, 4, 'RNV', 1, 'AED', 500, 'Yes', '2019-07-06 14:28:08', '2019-07-06 14:28:08'),
(9, 3, 4, 'RCV', 1, 'AED', 15000, 'Yes', '2019-07-06 14:28:08', '2019-07-06 14:28:08'),
(10, 3, 5, 'POV', 1, 'USD', 1000, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(11, 3, 5, 'RNV', 1, 'USD', 500, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(12, 3, 5, 'RCV', 1, 'USD', 15000, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10');

-- --------------------------------------------------------

--
-- Table structure for table `health_checks`
--

CREATE TABLE `health_checks` (
  `id` int(10) UNSIGNED NOT NULL,
  `resource_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_display` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `healthy` tinyint(1) NOT NULL,
  `error_message` text COLLATE utf8mb4_unicode_ci,
  `runtime` double(8,2) NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_human` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `histories_budgetcreationrequest`
--

CREATE TABLE `histories_budgetcreationrequest` (
  `id` int(255) UNSIGNED NOT NULL,
  `budget_request_group_id` text,
  `budget_request_ingroup_id` text,
  `budget_creation_request_id` text,
  `project_id` int(255) DEFAULT NULL,
  `requester_id` int(255) DEFAULT NULL,
  `budget_description` text,
  `budget_link` text,
  `file1` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `histories_budgetcreationrequest`
--

INSERT INTO `histories_budgetcreationrequest` (`id`, `budget_request_group_id`, `budget_request_ingroup_id`, `budget_creation_request_id`, `project_id`, `requester_id`, `budget_description`, `budget_link`, `file1`, `file2`, `file3`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '1', 37, 339, 'rrtt', NULL, '', '', '', NULL, NULL, '2021-02-22 16:25:14', '2021-02-22 16:25:14'),
(2, '1', '1', '1', 37, 339, 'rrtt', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-22 16:28:29', '2021-02-22 16:28:29'),
(3, '1', '1', '1', 37, 339, 'rrtt', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-22 16:29:29', '2021-02-22 16:29:29'),
(4, '2', '2', '2', 37, 339, 'no need', NULL, '', '', '', NULL, NULL, '2021-02-22 16:36:24', '2021-02-22 16:36:24'),
(5, '2', '2', '2', 37, 339, 'no need', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-22 16:40:04', '2021-02-22 16:40:04'),
(6, '3', '3', '3', 37, 339, 'dhdtf gvy', NULL, '', '', '', NULL, NULL, '2021-02-22 21:00:23', '2021-02-22 21:00:23'),
(7, '4', '4', '4', 37, 339, 'ggg uuj ljjk', NULL, '', '', '', NULL, NULL, '2021-02-22 22:40:29', '2021-02-22 22:40:29'),
(8, '4', '4', '4', 37, 339, 'ggg uuj ljjk', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-22 22:42:36', '2021-02-22 22:42:36'),
(9, '4', '4', '4', 37, 339, 'ggg uuj ljjk', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-22 22:47:15', '2021-02-22 22:47:15'),
(10, '5', '5', '5', 37, 339, 'gtv2', NULL, '', '', '', NULL, NULL, '2021-02-24 14:42:24', '2021-02-24 14:42:24'),
(11, '5', '5', '5', 37, 339, 'gtv2', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-24 14:45:35', '2021-02-24 14:45:35'),
(12, '5', '5', '5', 37, 339, 'gtv2', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 14:49:15', '2021-02-24 14:49:15'),
(13, '6', '6', '6', 37, 339, 'GTV3', NULL, '', '', '', NULL, NULL, '2021-02-24 14:51:24', '2021-02-24 14:51:24'),
(14, '6', '6', '6', 37, 339, 'GTV3', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-24 14:54:55', '2021-02-24 14:54:55'),
(15, '6', '6', '6', 37, 339, 'GTV3', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 14:57:56', '2021-02-24 14:57:56'),
(16, '7', '7', '7', 37, 339, 'GTV4', NULL, '', '', '', NULL, NULL, '2021-02-24 15:54:05', '2021-02-24 15:54:05'),
(17, '7', '7', '7', 37, 339, 'GTV4', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-24 16:18:24', '2021-02-24 16:18:24'),
(18, '7', '7', '7', 37, 339, 'GTV4', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 16:20:41', '2021-02-24 16:20:41'),
(19, '8', '8', '8', 37, 339, 'gtv3', NULL, '', '', '', NULL, NULL, '2021-02-24 16:22:13', '2021-02-24 16:22:13'),
(20, '8', '8', '8', 37, 339, 'gtv3', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-24 16:26:07', '2021-02-24 16:26:07'),
(21, '8', '8', '8', 37, 339, 'gtv3', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 16:27:22', '2021-02-24 16:27:22'),
(22, '9', '9', '9', 37, 339, 'ark', NULL, '', '', '', NULL, NULL, '2021-02-24 16:28:36', '2021-02-24 16:28:36'),
(23, '9', '9', '9', 37, 339, 'ark', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-24 16:29:54', '2021-02-24 16:29:54'),
(24, '9', '9', '9', 37, 339, 'ark', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 16:31:00', '2021-02-24 16:31:00'),
(25, '10', '10', '10', 37, 339, 'rak', NULL, '', '', '', NULL, NULL, '2021-02-24 16:32:39', '2021-02-24 16:32:39'),
(26, '10', '10', '10', 37, 339, 'rak', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-24 16:33:48', '2021-02-24 16:33:48'),
(27, '10', '10', '10', 37, 339, 'rak', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 16:34:28', '2021-02-24 16:34:28'),
(28, '11', '11', '11', 37, 339, 'HJK', NULL, '', '', '', NULL, NULL, '2021-02-24 16:35:34', '2021-02-24 16:35:34'),
(29, '11', '11', '11', 37, 339, 'HJK', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-24 16:37:21', '2021-02-24 16:37:21'),
(30, '11', '11', '11', 37, 339, 'HJK', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 16:38:14', '2021-02-24 16:38:14'),
(31, '12', '12', '12', 37, 339, 'TDC', NULL, '', '', '', NULL, NULL, '2021-02-24 16:39:39', '2021-02-24 16:39:39'),
(32, '12', '12', '12', 37, 339, 'TDC', NULL, '', '', '', 'Rejected By Validator at Level 1', 'yes', '2021-02-24 16:40:59', '2021-02-24 16:40:59'),
(33, '13', '13', '13', 37, 339, 'urgently needed', NULL, '', '', '', NULL, NULL, '2021-03-03 10:45:03', '2021-03-03 10:45:03'),
(34, '13', '13', '13', 37, 339, 'urgently needed', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-03-03 10:47:22', '2021-03-03 10:47:22'),
(35, '13', '13', '13', 37, 339, 'urgently needed', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-03-03 10:48:17', '2021-03-03 10:48:17'),
(36, '14', '14', '14', 37, 339, 'Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you.', NULL, '', '', '', NULL, NULL, '2021-03-03 10:51:20', '2021-03-03 10:51:20'),
(37, '14', '14', '14', 37, 339, 'Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you.', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-03-03 10:55:18', '2021-03-03 10:55:18'),
(38, '14', '14', '14', 37, 339, 'Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you.', NULL, '', '', '', 'Rejected By Validator at Level 2', 'yes', '2021-03-03 10:57:17', '2021-03-03 10:57:17'),
(39, '14', '14', '14', 37, 339, 'Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you.', NULL, '', '', '', 'Request Cancelled By Originator', 'yes', '2021-03-03 10:58:32', '2021-03-03 10:58:32'),
(40, '15', '15', '15', 37, 339, 'Please review and approve', NULL, '', '', '', NULL, NULL, '2021-03-03 10:59:56', '2021-03-03 10:59:56'),
(41, '16', '16', '16', 37, 339, 'Pls amend the Set-up information', NULL, '', '', '', NULL, NULL, '2021-03-03 13:11:04', '2021-03-03 13:11:04'),
(42, '17', '17', '17', 37, 339, 'note', NULL, '', '', '', NULL, NULL, '2021-03-03 14:01:07', '2021-03-03 14:01:07'),
(43, '18', '18', '18', 37, 339, 'Pls do this', NULL, '', '', '', NULL, NULL, '2021-03-05 21:20:36', '2021-03-05 21:20:36'),
(44, '18', '18', '18', 37, 339, 'Pls do this', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-03-05 22:11:17', '2021-03-05 22:11:17'),
(45, '18', '18', '18', 37, 339, 'Pls do this', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-03-05 22:13:42', '2021-03-05 22:13:42'),
(46, '19', '19', '19', 37, 339, 'xyzt', NULL, '', '', '', NULL, NULL, '2021-03-05 22:24:50', '2021-03-05 22:24:50'),
(47, '19', '19', '19', 37, 339, 'xyzt', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-03-05 22:27:57', '2021-03-05 22:27:57'),
(48, '19', '19', '19', 37, 339, 'xyzt', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-03-05 22:29:19', '2021-03-05 22:29:19'),
(49, '20', '20', '20', 37, 339, 'test12', NULL, '', '', '', NULL, NULL, '2021-03-06 17:53:54', '2021-03-06 17:53:54');

-- --------------------------------------------------------

--
-- Table structure for table `histories_budgetmaster`
--

CREATE TABLE `histories_budgetmaster` (
  `id` int(255) UNSIGNED NOT NULL,
  `budget_master_id` text,
  `budget_group_id` text,
  `budget_ingroup_id` text,
  `created_by` text,
  `company_id` text,
  `project_id` text,
  `creation_request_id` text,
  `prefix` text,
  `description` text,
  `field_1` text,
  `field_2` text,
  `field_3` text,
  `field_4` text,
  `field_5` text,
  `field_6` text,
  `field_7` text,
  `field_8` text,
  `field_9` text,
  `field_10` text,
  `picture` text,
  `status` text,
  `approval_level` text,
  `active` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `histories_budgetMastercol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `histories_budgetmaster`
--

INSERT INTO `histories_budgetmaster` (`id`, `budget_master_id`, `budget_group_id`, `budget_ingroup_id`, `created_by`, `company_id`, `project_id`, `creation_request_id`, `prefix`, `description`, `field_1`, `field_2`, `field_3`, `field_4`, `field_5`, `field_6`, `field_7`, `field_8`, `field_9`, `field_10`, `picture`, `status`, `approval_level`, `active`, `created_at`, `updated_at`, `histories_budgetMastercol`) VALUES
(1, '1', NULL, '', '339', '11', NULL, '1', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-22 16:25:19', '2021-02-22 16:25:19', NULL),
(2, '1', NULL, '', '339', '11', NULL, '1', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-22 16:28:29', '2021-02-22 16:28:29', NULL),
(3, '1', NULL, '1', '339', '11', NULL, '1', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-22 16:29:29', '2021-02-22 16:29:29', NULL),
(4, '2', NULL, '', '339', '11', NULL, '2', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-22 16:36:30', '2021-02-22 16:36:30', NULL),
(5, '2', NULL, '', '339', '11', NULL, '2', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-22 16:40:04', '2021-02-22 16:40:04', NULL),
(6, '3', NULL, '', '339', '11', NULL, '3', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-22 21:00:38', '2021-02-22 21:00:38', NULL),
(7, '4', NULL, '', '339', '11', NULL, '4', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-22 22:40:35', '2021-02-22 22:40:35', NULL),
(8, '4', NULL, '', '339', '11', NULL, '4', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-22 22:42:36', '2021-02-22 22:42:36', NULL),
(9, '4', NULL, '2', '339', '11', NULL, '4', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-22 22:47:15', '2021-02-22 22:47:15', NULL),
(10, '5', NULL, '', '339', '11', NULL, '5', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-24 14:42:39', '2021-02-24 14:42:39', NULL),
(11, '5', NULL, '', '339', '11', NULL, '5', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-24 14:45:35', '2021-02-24 14:45:35', NULL),
(12, '5', NULL, '3', '339', '11', NULL, '5', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 14:49:15', '2021-02-24 14:49:15', NULL),
(13, '6', NULL, '', '339', '11', NULL, '6', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-24 14:51:30', '2021-02-24 14:51:30', NULL),
(14, '6', NULL, '', '339', '11', NULL, '6', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-24 14:54:55', '2021-02-24 14:54:55', NULL),
(15, '6', NULL, '4', '339', '11', NULL, '6', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 14:57:56', '2021-02-24 14:57:56', NULL),
(16, '7', NULL, '', '339', '11', NULL, '7', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-24 15:54:13', '2021-02-24 15:54:13', NULL),
(17, '7', NULL, '', '339', '11', NULL, '7', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-24 16:18:24', '2021-02-24 16:18:24', NULL),
(18, '7', NULL, '5', '339', '11', NULL, '7', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 16:20:41', '2021-02-24 16:20:41', NULL),
(19, '8', NULL, '', '339', '11', NULL, '8', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-24 16:22:18', '2021-02-24 16:22:18', NULL),
(20, '8', NULL, '', '339', '11', NULL, '8', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-24 16:26:07', '2021-02-24 16:26:07', NULL),
(21, '8', NULL, '6', '339', '11', NULL, '8', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 16:27:21', '2021-02-24 16:27:21', NULL),
(22, '9', NULL, '', '339', '11', NULL, '9', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-24 16:28:41', '2021-02-24 16:28:41', NULL),
(23, '9', NULL, '', '339', '11', NULL, '9', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-24 16:29:54', '2021-02-24 16:29:54', NULL),
(24, '9', NULL, '7', '339', '11', NULL, '9', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 16:31:00', '2021-02-24 16:31:00', NULL),
(25, '10', NULL, '', '339', '11', NULL, '10', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-24 16:32:47', '2021-02-24 16:32:47', NULL),
(26, '10', NULL, '', '339', '11', NULL, '10', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-24 16:33:47', '2021-02-24 16:33:47', NULL),
(27, '10', NULL, '8', '339', '11', NULL, '10', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 16:34:27', '2021-02-24 16:34:27', NULL),
(28, '11', NULL, '', '339', '11', NULL, '11', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-24 16:35:40', '2021-02-24 16:35:40', NULL),
(29, '11', NULL, '', '339', '11', NULL, '11', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-02-24 16:37:21', '2021-02-24 16:37:21', NULL),
(30, '11', NULL, '9', '339', '11', NULL, '11', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-02-24 16:38:14', '2021-02-24 16:38:14', NULL),
(31, '12', NULL, '', '339', '11', NULL, '12', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-02-24 16:39:45', '2021-02-24 16:39:45', NULL),
(32, '12', NULL, '', '339', '11', NULL, '12', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Rejected By Validator at Level 1', '1', 'No', '2021-02-24 16:40:59', '2021-02-24 16:40:59', NULL),
(33, '13', NULL, '', '339', '11', NULL, '13', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-03-03 10:45:17', '2021-03-03 10:45:17', NULL),
(34, '13', NULL, '', '339', '11', NULL, '13', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-03-03 10:47:22', '2021-03-03 10:47:22', NULL),
(35, '13', NULL, '10', '339', '11', NULL, '13', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-03-03 10:48:17', '2021-03-03 10:48:17', NULL),
(36, '14', NULL, '', '339', '11', NULL, '14', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-03-03 10:51:25', '2021-03-03 10:51:25', NULL),
(37, '14', NULL, '', '339', '11', NULL, '14', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-03-03 10:55:18', '2021-03-03 10:55:18', NULL),
(38, '14', NULL, '', '339', '11', NULL, '14', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Rejected By Validator at Level 2', '1', 'No', '2021-03-03 10:57:17', '2021-03-03 10:57:17', NULL),
(39, '15', NULL, '', '339', '11', NULL, '15', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-03-03 11:00:02', '2021-03-03 11:00:02', NULL),
(40, '16', NULL, '', '339', '11', NULL, '16', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-03-03 13:11:20', '2021-03-03 13:11:20', NULL),
(41, '17', NULL, '', '339', '11', NULL, '17', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-03-03 14:01:14', '2021-03-03 14:01:14', NULL),
(42, '18', NULL, '', '339', '11', NULL, '18', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-03-05 21:20:57', '2021-03-05 21:20:57', NULL),
(43, '18', NULL, '', '339', '11', NULL, '18', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-03-05 22:11:17', '2021-03-05 22:11:17', NULL),
(44, '18', NULL, '11', '339', '11', NULL, '18', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-03-05 22:13:42', '2021-03-05 22:13:42', NULL),
(45, '19', NULL, '', '339', '11', NULL, '19', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-03-05 22:24:57', '2021-03-05 22:24:57', NULL),
(46, '19', NULL, '', '339', '11', NULL, '19', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', '2', 'No', '2021-03-05 22:27:57', '2021-03-05 22:27:57', NULL),
(47, '19', NULL, '12', '339', '11', NULL, '19', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Fully Approved by Validator Level 2', '2', 'Yes', '2021-03-05 22:29:19', '2021-03-05 22:29:19', NULL),
(48, '20', NULL, '', '339', '11', NULL, '20', NULL, ' |', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2021-03-06 17:54:10', '2021-03-06 17:54:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `histories_itemcreationrequest`
--

CREATE TABLE `histories_itemcreationrequest` (
  `id` int(255) UNSIGNED NOT NULL,
  `item_request_group_id` text,
  `item_request_ingroup_id` text,
  `item_creation_request_id` text,
  `project_id` int(255) DEFAULT NULL,
  `requester_id` int(255) DEFAULT NULL,
  `item_description` text,
  `item_link` text,
  `file1` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `histories_itemmaster`
--

CREATE TABLE `histories_itemmaster` (
  `id` int(255) UNSIGNED NOT NULL,
  `item_master_id` text,
  `item_group_id` text,
  `item_ingroup_id` text,
  `created_by` text,
  `company_id` text,
  `project_id` text,
  `creation_request_id` text,
  `prefix` text,
  `description` text,
  `field_1` text,
  `field_2` text,
  `field_3` text,
  `field_4` text,
  `field_5` text,
  `field_6` text,
  `field_7` text,
  `field_8` text,
  `field_9` text,
  `field_10` text,
  `picture` text,
  `status` text,
  `approval_level` text,
  `active` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `histories_ItemMastercol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `histories_itemmaster`
--

INSERT INTO `histories_itemmaster` (`id`, `item_master_id`, `item_group_id`, `item_ingroup_id`, `created_by`, `company_id`, `project_id`, `creation_request_id`, `prefix`, `description`, `field_1`, `field_2`, `field_3`, `field_4`, `field_5`, `field_6`, `field_7`, `field_8`, `field_9`, `field_10`, `picture`, `status`, `approval_level`, `active`, `created_at`, `updated_at`, `histories_ItemMastercol`) VALUES
(1, '31', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'Lenovo notebook. ThinkPad X1 Carbon. 16GB, i7 processor. 512 GB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2019-11-02 05:05:48', '2019-11-02 05:05:48', NULL),
(2, '32', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'HP Printer Laserjet. B&W. 15 pages per minute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2019-11-05 13:11:05', '2019-11-05 13:11:05', NULL),
(3, '33', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'ACER Printer Laserjet. B&W. 25 pages per minute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2019-11-05 13:11:05', '2019-11-05 13:11:05', NULL),
(4, '34', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'GRUNDIG Printer Laserjet. B&W. 25 pages per minute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2019-11-05 13:11:05', '2019-11-05 13:11:05', NULL),
(5, '35', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'SHARP Printer Laserjet. B&W. 25 pages per minute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2019-11-05 13:11:05', '2019-11-05 13:11:05', NULL),
(6, '36', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'Montre Suisse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-08-03 09:08:02', '2020-08-03 09:08:02', NULL),
(7, '37', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'abcd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-09-19 03:36:23', '2020-09-19 03:36:23', NULL),
(8, '38', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'descrit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-09-19 03:49:05', '2020-09-19 03:49:05', NULL),
(9, '39', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'dsadasdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-10-17 00:31:31', '2020-10-17 00:31:31', NULL),
(10, '40', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'fsdfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-10-17 00:36:11', '2020-10-17 00:36:11', NULL),
(13, '43', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'dfsdfs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-10-17 00:50:09', '2020-10-17 00:50:09', NULL),
(14, '44', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'asdasdas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-10-17 00:55:32', '2020-10-17 00:55:32', NULL),
(15, '45', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'asdasdas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-10-17 00:55:32', '2020-10-17 00:55:32', NULL),
(16, '46', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'asdasdasdatrtyt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-10-17 01:31:39', '2020-10-17 01:31:39', NULL),
(17, '47', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'sdfsdfdsfs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-10-17 01:38:56', '2020-10-17 01:38:56', NULL),
(18, '48', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'hhhhjjjkk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-10-17 01:41:41', '2020-10-17 01:41:41', NULL),
(19, '49', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'dfsdfdsfsf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-10-17 01:45:40', '2020-10-17 01:45:40', NULL),
(20, '50', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'sadfgdj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-11-27 07:09:04', '2020-11-27 07:09:04', NULL),
(21, '51', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'wwww', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-12-11 13:48:05', '2020-12-11 13:48:05', NULL),
(22, '52', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'qwert', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2020-12-11 15:09:16', '2020-12-11 15:09:16', NULL),
(23, '53', 'N/A', 'N/A', '4', '1', '1', NULL, NULL, 'Superman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pre Approved by Level (System) As LOM is Not Required', NULL, 'Yes', '2021-03-03 13:09:11', '2021-03-03 13:09:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `histories_purchaseenquiry`
--

CREATE TABLE `histories_purchaseenquiry` (
  `id` int(255) UNSIGNED NOT NULL,
  `purchase_enquiry_id` int(255) DEFAULT NULL,
  `purchase_enquiry_group_id` text,
  `purchase_enquiry_ingroup_id` text,
  `created_by` text,
  `company_id` text,
  `project_id` text,
  `enquiry_type` text,
  `store_item_request` text,
  `item_id` text,
  `item_description` text,
  `service_description` text,
  `quantity` text,
  `u_o_m` text,
  `latitude` text,
  `longitude` text,
  `underlying_transaction` text,
  `sourcing_priority` text,
  `advanced_payment` text,
  `retention_percentage` text,
  `retention_days` text,
  `retention_released` text,
  `notes` text,
  `status` text,
  `active` text,
  `grouping_id` text,
  `required_documents` text,
  `created_at` text,
  `updated_at` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `histories_purchaseenquiry`
--

INSERT INTO `histories_purchaseenquiry` (`id`, `purchase_enquiry_id`, `purchase_enquiry_group_id`, `purchase_enquiry_ingroup_id`, `created_by`, `company_id`, `project_id`, `enquiry_type`, `store_item_request`, `item_id`, `item_description`, `service_description`, `quantity`, `u_o_m`, `latitude`, `longitude`, `underlying_transaction`, `sourcing_priority`, `advanced_payment`, `retention_percentage`, `retention_days`, `retention_released`, `notes`, `status`, `active`, `grouping_id`, `required_documents`, `created_at`, `updated_at`) VALUES
(1, 1, '1', '1', '4', '1', '1', 'Materials', 'No', '16', NULL, NULL, '134', NULL, '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Standard', 'Yes', '8', '23', NULL, 'Please deliver the docs with the item.', NULL, NULL, '550235a5-6089-4cb0-a734-20d05805ecba', 'Material Catalogue,Warranty Certificate,Customers Testimonials', '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
(2, 2, '1', '2', '4', '1', '1', 'Materials', 'No', '15', NULL, NULL, '105', NULL, '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Urgent', 'Yes', '10', '30', NULL, 'Please deliver the docs with the item.', NULL, NULL, '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials', '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
(3, 3, '1', '3', '4', '1', '1', 'Materials', 'No', '14', NULL, NULL, '67', NULL, '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Urgent', 'No', '7', '18', NULL, 'Please deliver the docs with the item.', NULL, NULL, '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials', '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
(4, 4, '1', '4', '4', '1', '1', 'Materials', 'No', '31', 'Lenovo notebook. ThinkPad X1 Carbon. 16GB, i7 processor. 512 GB', NULL, '35', 'box of 3 laptops', '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Urgent', 'Yes', '17', '22', NULL, 'Please deliver the docs with the item.', NULL, NULL, '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials,Liability Insurance Certificate', '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
(5, 1, '1', '1', '4', '1', '1', 'Materials', 'No', '16', NULL, NULL, '134', NULL, '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Standard', 'Yes', '8', '23', 'No', 'Please deliver the docs with the item.', 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '550235a5-6089-4cb0-a734-20d05805ecba', 'Material Catalogue,Warranty Certificate,Customers Testimonials', '2019-11-02 05:08:16', '2019-11-02 05:08:16'),
(6, 2, '1', '2', '4', '1', '1', 'Materials', 'No', '15', NULL, NULL, '105', NULL, '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Urgent', 'Yes', '10', '30', 'No', 'Please deliver the docs with the item.', 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials', '2019-11-02 05:08:32', '2019-11-02 05:08:32'),
(7, 3, '1', '3', '4', '1', '1', 'Materials', 'No', '14', NULL, NULL, '67', NULL, '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Urgent', 'No', '7', '18', 'No', 'Please deliver the docs with the item.', 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials', '2019-11-02 05:08:43', '2019-11-02 05:08:43'),
(8, 4, '1', '4', '4', '1', '1', 'Materials', 'No', '31', 'Lenovo notebook. ThinkPad X1 Carbon. 16GB, i7 processor. 512 GB', NULL, '35', 'box of 3 laptops', '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Urgent', 'Yes', '17', '22', 'No', 'Please deliver the docs with the item.', 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials,Liability Insurance Certificate', '2019-11-02 05:08:52', '2019-11-02 05:08:52'),
(9, 1, '1', '1', '4', '1', '1', 'Materials', 'No', '16', NULL, NULL, '134', NULL, '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Standard', 'Yes', '8', '23', 'No', 'Please deliver the docs with the item.', 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '550235a5-6089-4cb0-a734-20d05805ecba', 'Material Catalogue,Warranty Certificate,Customers Testimonials', '2019-11-02 05:09:50', '2019-11-02 05:09:50'),
(10, 2, '1', '2', '4', '1', '1', 'Materials', 'No', '15', NULL, NULL, '105', NULL, '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Urgent', 'Yes', '10', '30', 'No', 'Please deliver the docs with the item.', 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials', '2019-11-02 05:09:57', '2019-11-02 05:09:57'),
(11, 3, '1', '3', '4', '1', '1', 'Materials', 'No', '14', NULL, NULL, '67', NULL, '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Urgent', 'No', '7', '18', 'No', 'Please deliver the docs with the item.', 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials', '2019-11-02 05:10:09', '2019-11-02 05:10:09'),
(12, 4, '1', '4', '4', '1', '1', 'Materials', 'No', '31', 'Lenovo notebook. ThinkPad X1 Carbon. 16GB, i7 processor. 512 GB', NULL, '35', 'box of 3 laptops', '55.18820878046881', '25.007208021762118', 'Sales\' Order 1188-2019', 'Urgent', 'Yes', '17', '22', 'No', 'Please deliver the docs with the item.', 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials,Liability Insurance Certificate', '2019-11-02 05:10:29', '2019-11-02 05:10:29'),
(13, 5, '2', '1', '4', '1', '1', 'Materials', 'No', '13', NULL, NULL, '150', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '17', NULL, NULL, NULL, NULL, 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 11:57:03', '2019-11-05 11:57:03'),
(14, 6, '2', '2', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '90', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '20', NULL, NULL, NULL, NULL, 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 11:57:03', '2019-11-05 11:57:03'),
(15, 5, '2', '1', '4', '1', '1', 'Materials', 'No', '13', NULL, NULL, '150', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '17', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 11:58:06', '2019-11-05 11:58:06'),
(16, 6, '2', '2', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '90', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '20', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 11:58:13', '2019-11-05 11:58:13'),
(17, 5, '2', '1', '4', '1', '1', 'Materials', 'No', '13', NULL, NULL, '150', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '17', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 11:58:53', '2019-11-05 11:58:53'),
(18, 6, '2', '2', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '90', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '20', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 11:59:00', '2019-11-05 11:59:00'),
(19, 5, '2', '1', '4', '1', '1', 'Materials', 'No', '13', NULL, NULL, '150', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '17', 'No', NULL, 'Send for a New Request for Proposals', 'Yes', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 12:12:21', '2019-11-05 12:12:21'),
(20, 6, '2', '2', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '90', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '20', 'No', NULL, 'Commercial Evaluation submitted', 'Yes', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 12:12:21', '2019-11-05 12:12:21'),
(21, 5, '2', '1', '4', '1', '1', 'Materials', 'No', '13', NULL, NULL, '150', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '17', 'No', NULL, 'Commercial Evaluation submitted', 'Yes', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 12:49:04', '2019-11-05 12:49:04'),
(22, 6, '2', '2', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '90', NULL, '55.38458939570319', '25.12787010564089', 'SO-19918-2019', 'Standard', 'Yes', '7', '20', 'No', NULL, 'Commercial Evaluation submitted', 'Yes', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', '2019-11-05 12:49:04', '2019-11-05 12:49:04'),
(23, 7, '3', '1', '4', '1', '1', 'Materials', 'No', '32', 'HP Printer Laserjet. B&W. 15 pages per minute', NULL, '19', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '15', '21', NULL, NULL, NULL, NULL, '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(24, 8, '3', '2', '4', '1', '1', 'Materials', 'No', '33', 'ACER Printer Laserjet. B&W. 25 pages per minute', NULL, '45', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '12', '21', NULL, NULL, NULL, NULL, '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(25, 9, '3', '3', '4', '1', '1', 'Materials', 'No', '34', 'GRUNDIG Printer Laserjet. B&W. 25 pages per minute', NULL, '65', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '43', '35', NULL, NULL, NULL, NULL, '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(26, 10, '3', '4', '4', '1', '1', 'Materials', 'No', '35', 'SHARP Printer Laserjet. B&W. 25 pages per minute', NULL, '98', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '43', '26', NULL, NULL, NULL, NULL, '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(27, 7, '3', '1', '4', '1', '1', 'Materials', 'No', '32', 'HP Printer Laserjet. B&W. 15 pages per minute', NULL, '19', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '15', '21', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:13:55', '2019-11-05 13:13:55'),
(28, 8, '3', '2', '4', '1', '1', 'Materials', 'No', '33', 'ACER Printer Laserjet. B&W. 25 pages per minute', NULL, '45', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '12', '21', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:14:15', '2019-11-05 13:14:15'),
(29, 9, '3', '3', '4', '1', '1', 'Materials', 'No', '34', 'GRUNDIG Printer Laserjet. B&W. 25 pages per minute', NULL, '65', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '43', '35', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:14:41', '2019-11-05 13:14:41'),
(30, 10, '3', '4', '4', '1', '1', 'Materials', 'No', '35', 'SHARP Printer Laserjet. B&W. 25 pages per minute', NULL, '98', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '43', '26', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:14:56', '2019-11-05 13:14:56'),
(31, 7, '3', '1', '4', '1', '1', 'Materials', 'No', '32', 'HP Printer Laserjet. B&W. 15 pages per minute', NULL, '19', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '15', '21', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:16:41', '2019-11-05 13:16:41'),
(32, 8, '3', '2', '4', '1', '1', 'Materials', 'No', '33', 'ACER Printer Laserjet. B&W. 25 pages per minute', NULL, '45', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '12', '21', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:16:57', '2019-11-05 13:16:57'),
(33, 9, '3', '3', '4', '1', '1', 'Materials', 'No', '34', 'GRUNDIG Printer Laserjet. B&W. 25 pages per minute', NULL, '65', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '43', '35', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:17:05', '2019-11-05 13:17:05'),
(34, 10, '3', '4', '4', '1', '1', 'Materials', 'No', '35', 'SHARP Printer Laserjet. B&W. 25 pages per minute', NULL, '98', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '43', '26', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:17:17', '2019-11-05 13:17:17'),
(35, 7, '3', '1', '4', '1', '1', 'Materials', 'No', '32', 'HP Printer Laserjet. B&W. 15 pages per minute', NULL, '19', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '15', '21', 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:28:06', '2019-11-05 13:28:06'),
(36, 8, '3', '2', '4', '1', '1', 'Materials', 'No', '33', 'ACER Printer Laserjet. B&W. 25 pages per minute', NULL, '45', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '12', '21', 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:28:06', '2019-11-05 13:28:06'),
(37, 9, '3', '3', '4', '1', '1', 'Materials', 'No', '34', 'GRUNDIG Printer Laserjet. B&W. 25 pages per minute', NULL, '65', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '43', '35', 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:28:06', '2019-11-05 13:28:06'),
(38, 10, '3', '4', '4', '1', '1', 'Materials', 'No', '35', 'SHARP Printer Laserjet. B&W. 25 pages per minute', NULL, '98', 'printers', '55.42304154414069', '25.34277573891741', 'SO-90-2019', 'Standard', 'Yes', '43', '26', 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', '2019-11-05 13:28:06', '2019-11-05 13:28:06'),
(39, 11, '4', '1', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '5', NULL, '55.648261270703124', '25.09056463370194', 'Work Order 12346', 'Standard', 'Yes', '12', '15', NULL, 'Please ensure that the docs are brought along with the goods', NULL, NULL, '59b3b5fb-7570-47ca-86c7-a7c81f3e8da7', 'Testing Certificate,Warranty Certificate,Country of Origin Certificate', '2020-02-25 11:42:32', '2020-02-25 11:42:32'),
(40, 12, '4', '2', '4', '1', '1', 'Materials', 'No', '11', NULL, NULL, '15', NULL, '55.648261270703124', '25.09056463370194', 'Work Order 12346', 'Standard', 'Yes', '12', '15', NULL, 'Please ensure that the docs are brought along with the goods', NULL, NULL, '59b3b5fb-7570-47ca-86c7-a7c81f3e8da7', 'Testing Certificate,Warranty Certificate,Country of Origin Certificate', '2020-02-25 11:42:32', '2020-02-25 11:42:32'),
(41, 11, '4', '1', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '5', NULL, '55.648261270703124', '25.09056463370194', 'Work Order 12346', 'Standard', 'Yes', '12', '15', 'No', 'Please ensure that the docs are brought along with the goods', 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '59b3b5fb-7570-47ca-86c7-a7c81f3e8da7', 'Testing Certificate,Warranty Certificate,Country of Origin Certificate', '2020-02-25 11:44:33', '2020-02-25 11:44:33'),
(42, 12, '4', '2', '4', '1', '1', 'Materials', 'No', '11', NULL, NULL, '15', NULL, '55.648261270703124', '25.09056463370194', 'Work Order 12346', 'Standard', 'Yes', '12', '15', 'No', 'Please ensure that the docs are brought along with the goods', 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '59b3b5fb-7570-47ca-86c7-a7c81f3e8da7', 'Testing Certificate,Warranty Certificate,Country of Origin Certificate', '2020-02-25 11:44:46', '2020-02-25 11:44:46'),
(43, 13, '5', '1', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '12', NULL, '55.29807206171875', '25.208659540914415', 'WO#123', 'Urgent', 'Yes', '5', '20', NULL, 'Please send the docs with the material', NULL, NULL, '34efc062-6548-4d08-bb72-9a50a00f6582', 'Material Catalogue,Warranty Certificate,Testing Certificate', '2020-05-15 07:34:36', '2020-05-15 07:34:36'),
(44, 14, '5', '2', '4', '1', '1', 'Materials', 'No', '7', NULL, NULL, '10', NULL, '55.29807206171875', '25.208659540914415', 'WO#123', 'Urgent', 'No', '0', '0', NULL, 'Please send the docs with the material', NULL, NULL, '34efc062-6548-4d08-bb72-9a50a00f6582', 'Material Catalogue,Warranty Certificate', '2020-05-15 07:34:36', '2020-05-15 07:34:36'),
(45, 13, '5', '1', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '12', NULL, '55.29807206171875', '25.208659540914415', 'WO#123', 'Urgent', 'Yes', '5', '20', 'No', 'Please send the docs with the material', 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '34efc062-6548-4d08-bb72-9a50a00f6582', 'Material Catalogue,Warranty Certificate,Testing Certificate', '2020-05-15 07:40:34', '2020-05-15 07:40:34'),
(46, 14, '5', '2', '4', '1', '1', 'Materials', 'No', '7', NULL, NULL, '10', NULL, '55.29807206171875', '25.208659540914415', 'WO#123', 'Urgent', 'No', '0', '0', 'No', 'Please send the docs with the material', 'Purchase Enquiry Line Rejected By Level 1 and Assigned back to the Originator', 'Yes', '34efc062-6548-4d08-bb72-9a50a00f6582', 'Material Catalogue,Warranty Certificate', '2020-05-15 07:41:48', '2020-05-15 07:41:48'),
(47, 13, '5', '1', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '12', NULL, '55.29807206171875', '25.208659540914415', 'WO#123', 'Urgent', 'Yes', '5', '20', 'No', 'Please send the docs with the material', 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '34efc062-6548-4d08-bb72-9a50a00f6582', 'Material Catalogue,Warranty Certificate,Testing Certificate', '2020-05-15 07:43:50', '2020-05-15 07:43:50'),
(48, 15, '6', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '50', NULL, '55.931159219921874', '25.122896700481537', 'Sales Order #1223456', 'Standard', 'Yes', '5', '15', NULL, 'Please ensure the product comes with the documents', NULL, NULL, '25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8', 'Country of Origin Certificate,Material Catalogue,Liability Insurance Certificate', '2020-06-29 03:21:27', '2020-06-29 03:21:27'),
(49, 16, '6', '2', '4', '1', '1', 'Materials', 'No', '16', NULL, NULL, '20', NULL, '55.931159219921874', '25.122896700481537', 'Sales Order #1223456', 'Standard', 'Yes', '10', '20', NULL, 'Please ensure the product comes with the documents', NULL, NULL, '25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8', 'Country of Origin Certificate,Material Catalogue', '2020-06-29 03:21:27', '2020-06-29 03:21:27'),
(50, 15, '6', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '50', NULL, '55.931159219921874', '25.122896700481537', 'Sales Order #1223456', 'Standard', 'Yes', '5', '15', 'No', 'Please ensure the product comes with the documents', 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8', 'Country of Origin Certificate,Material Catalogue,Liability Insurance Certificate', '2020-06-29 03:25:06', '2020-06-29 03:25:06'),
(51, 16, '6', '2', '4', '1', '1', 'Materials', 'No', '16', NULL, NULL, '20', NULL, '55.931159219921874', '25.122896700481537', 'Sales Order #1223456', 'Standard', 'Yes', '10', '20', 'No', 'Please ensure the product comes with the documents', 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8', 'Country of Origin Certificate,Material Catalogue', '2020-06-29 03:25:49', '2020-06-29 03:25:49'),
(52, 17, '7', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '46', NULL, '55.593329630078124', '25.091808332793462', 'Sales Order #12124', 'Standard', 'Yes', '5', '19', NULL, NULL, NULL, NULL, 'bd50f6a0-0693-4484-b50a-fcad54dd268b', 'Material Catalogue,Country of Origin Certificate,Liability Insurance Certificate', '2020-07-02 04:32:32', '2020-07-02 04:32:32'),
(53, 18, '7', '2', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '46', NULL, '55.1305305578125', '25.117923092879085', 'Sales Order #12124', 'Standard', 'Yes', '5', '19', NULL, NULL, NULL, NULL, 'bd50f6a0-0693-4484-b50a-fcad54dd268b', 'Material Catalogue,Country of Origin Certificate,Liability Insurance Certificate', '2020-07-02 04:32:32', '2020-07-02 04:32:32'),
(54, 19, '8', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '12', NULL, '55.486212930859374', '25.15397716023664', 'Work Order 12345', 'Standard', 'Yes', '5', '20', NULL, NULL, NULL, NULL, '8511045d-01f7-4a17-89aa-dc0348654887', 'Warranty Certificate,Country of Origin Certificate,Customers Testimonials,Testing Certificate', '2020-07-20 07:27:24', '2020-07-20 07:27:24'),
(55, 20, '8', '2', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '120', NULL, '55.486212930859374', '25.15397716023664', 'Work Order 12345', 'Urgent', 'No', '0', '0', NULL, NULL, NULL, NULL, '8511045d-01f7-4a17-89aa-dc0348654887', 'Warranty Certificate,Country of Origin Certificate,Customers Testimonials', '2020-07-20 07:27:24', '2020-07-20 07:27:24'),
(56, 21, '9', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '12', NULL, '55.76499100703125', '25.194991246402765', 'Sales Order 123', 'Standard', 'No', '5', '20', NULL, NULL, NULL, NULL, '1ff53d69-d606-4e97-b879-ee927957f059', 'Country of Origin Certificate,Warranty Certificate,Material Catalogue', '2020-07-21 06:02:35', '2020-07-21 06:02:35'),
(57, 22, '9', '2', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '25', NULL, '55.76499100703125', '25.194991246402765', 'Sales Order 11', 'Urgent', 'Yes', '10', '20', NULL, NULL, NULL, NULL, '1ff53d69-d606-4e97-b879-ee927957f059', 'Country of Origin Certificate,Warranty Certificate', '2020-07-21 06:02:35', '2020-07-21 06:02:35'),
(58, 23, '10', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '15', NULL, '55.52878495234375', '25.03707362062512', 'Sales Order #12245', 'Standard', 'Yes', '5', '23', NULL, 'please ensure the supporting docs are submitted with the products', NULL, NULL, '4a51833d-aedb-480b-ae63-9953159abb80', 'Material Catalogue,Country of Origin Certificate,Customers Testimonials', '2020-08-03 09:08:02', '2020-08-03 09:08:02'),
(59, 24, '10', '2', '4', '1', '1', 'Materials', 'No', '36', 'Montre Suisse', NULL, '20', 'Pieces', '55.52878495234375', '25.03707362062512', 'Sales Order #12245', 'Standard', 'Yes', '5', '23', NULL, 'please ensure the supporting docs are submitted with the products', NULL, NULL, '4a51833d-aedb-480b-ae63-9953159abb80', 'Material Catalogue,Country of Origin Certificate,Customers Testimonials', '2020-08-03 09:08:02', '2020-08-03 09:08:02'),
(60, 21, '9', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '12', NULL, '55.76499100703125', '25.194991246402765', 'Sales Order 123', 'Standard', 'No', '5', '20', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '1ff53d69-d606-4e97-b879-ee927957f059', 'Country of Origin Certificate,Warranty Certificate,Material Catalogue', '2020-08-03 09:13:41', '2020-08-03 09:13:41'),
(61, 22, '9', '2', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '25', NULL, '55.76499100703125', '25.194991246402765', 'Sales Order 11', 'Urgent', 'Yes', '10', '20', 'No', NULL, 'Purchase Enquiry Line Rejected By Level 1 and Assigned back to the Originator', 'Yes', '1ff53d69-d606-4e97-b879-ee927957f059', 'Country of Origin Certificate,Warranty Certificate', '2020-08-03 09:14:37', '2020-08-03 09:14:37'),
(62, 25, '11', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'descipritonssss', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '10', '7', NULL, NULL, NULL, NULL, 'ebee54c6-f8d7-4756-8f84-05c480dd08a4', '', '2020-09-19 00:04:47', '2020-09-19 00:04:47'),
(63, 26, '12', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'this is description', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '10', '9', NULL, NULL, NULL, NULL, '632f12b4-bdc0-4c72-b597-cb29efeaf07b', 'None', '2020-09-19 00:14:58', '2020-09-19 00:14:58'),
(64, 27, '13', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'this is descriptions', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '10', '10', NULL, NULL, NULL, NULL, '865b3b35-cf94-4f15-b9cf-3714b9e78880', 'None', '2020-09-19 00:20:32', '2020-09-19 00:20:32'),
(65, 28, '14', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'descsffksdflksdfskdfn', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '10', '12', NULL, NULL, NULL, NULL, '31af7db5-32ad-43a6-8747-d3c14e2057cf', 'None', '2020-09-19 00:23:25', '2020-09-19 00:23:25'),
(66, 29, '15', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'desc1122', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '10', '18', NULL, NULL, NULL, NULL, '907969e1-20fd-4fac-87ee-5a2c7319d311', 'None', '2020-09-19 01:12:54', '2020-09-19 01:12:54'),
(67, 30, '16', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'this desc1122', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '10', '20', NULL, NULL, NULL, NULL, '812b80d1-b18b-4e9a-9fce-57c57ef16aa5', 'None', '2020-09-19 01:15:11', '2020-09-19 01:15:11'),
(68, 31, '17', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'ffffggg', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '0', '0', NULL, NULL, NULL, NULL, '123050c4-a79f-4165-932a-50343c133aa9', 'None', '2020-09-19 02:09:10', '2020-09-19 02:09:10'),
(69, 32, '18', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'helo', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '10', '16', NULL, NULL, NULL, NULL, '80948358-1d1f-4e7b-b299-59ad511162f2', 'None', '2020-09-19 02:15:49', '2020-09-19 02:15:49'),
(70, 33, '19', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'asdasd', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '0', '0', NULL, NULL, NULL, NULL, '4a8cfdfb-09c2-406a-928a-179cda2724db', 'None', '2020-09-19 02:17:22', '2020-09-19 02:17:22'),
(71, 34, '20', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'abc def', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '0', '0', NULL, NULL, NULL, NULL, '3e0d527b-7d26-463e-8c3a-2a3ffc477330', 'None', '2020-09-19 02:20:25', '2020-09-19 02:20:25'),
(72, 35, '21', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'imgs', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '0', '0', NULL, NULL, NULL, NULL, '94a36ff0-b488-4c51-b816-18a3d632cdef', 'None', '2020-09-19 02:33:13', '2020-09-19 02:33:13'),
(73, 36, '22', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'desceeee', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '0', '0', NULL, NULL, NULL, NULL, '66d1851f-0a4a-4e20-acb4-fa8ce4219a02', 'None', '2020-09-19 02:40:25', '2020-09-19 02:40:25'),
(74, 37, '23', '1', '4', '1', '1', 'Service', 'No', '37', 'abcd', 'hello', '0.0001', 'kg', NULL, NULL, 'abcd1234', 'Standard', 'Yes', '10', '12', NULL, NULL, NULL, NULL, '9aa967e6-abac-441f-a275-9251b56c9579', 'Material Catalogue,Warranty Certificate,Customers Testimonials', '2020-09-19 08:36:23', '2020-09-19 08:36:23'),
(75, 38, '24', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'hello', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '0', '0', NULL, NULL, NULL, NULL, '88400d0a-f5fd-434f-a0e5-9e96dfa82a90', 'None', '2020-09-19 08:38:00', '2020-09-19 08:38:00'),
(76, 39, '25', '1', '4', '1', '1', 'Materials', 'No', '38', 'descrit', NULL, '20', 'kg', NULL, NULL, 'pe#123123231', 'Standard', 'No', '0', '0', NULL, 'asdasda', NULL, NULL, '0b9ac945-bda9-4a72-91a9-35b66005c16b', 'Testing Certificate', '2020-09-19 08:49:05', '2020-09-19 08:49:05'),
(77, 17, '7', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '46', NULL, '55.593329630078124', '25.091808332793462', 'Sales Order #12124', 'Standard', 'Yes', '5', '19', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', 'bd50f6a0-0693-4484-b50a-fcad54dd268b', 'Material Catalogue,Country of Origin Certificate,Liability Insurance Certificate', '2020-09-21 00:17:11', '2020-09-21 00:17:11'),
(78, 20, '8', '2', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '120', NULL, '55.486212930859374', '25.15397716023664', 'Work Order 12345', 'Urgent', 'No', '0', '0', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '8511045d-01f7-4a17-89aa-dc0348654887', 'Warranty Certificate,Country of Origin Certificate,Customers Testimonials', '2020-09-21 00:18:54', '2020-09-21 00:18:54'),
(79, 18, '7', '2', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '46', NULL, '55.1305305578125', '25.117923092879085', 'Sales Order #12124', 'Standard', 'Yes', '5', '19', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', 'bd50f6a0-0693-4484-b50a-fcad54dd268b', 'Material Catalogue,Country of Origin Certificate,Liability Insurance Certificate', '2020-09-21 00:20:22', '2020-09-21 00:20:22'),
(80, 11, '4', '1', '4', '1', '1', 'Materials', 'No', '12', NULL, NULL, '5', NULL, '55.648261270703124', '25.09056463370194', 'Work Order 12346', 'Standard', 'Yes', '12', '15', 'No', 'Please ensure that the docs are brought along with the goods', 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '59b3b5fb-7570-47ca-86c7-a7c81f3e8da7', 'Testing Certificate,Warranty Certificate,Country of Origin Certificate', '2020-09-21 00:21:20', '2020-09-21 00:21:20'),
(81, 15, '6', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '50', NULL, '55.931159219921874', '25.122896700481537', 'Sales Order #1223456', 'Standard', 'Yes', '5', '15', 'No', 'Please ensure the product comes with the documents', 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8', 'Country of Origin Certificate,Material Catalogue,Liability Insurance Certificate', '2020-09-21 00:21:35', '2020-09-21 00:21:35'),
(82, 17, '7', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '46', NULL, '55.593329630078124', '25.091808332793462', 'Sales Order #12124', 'Standard', 'Yes', '5', '19', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', 'bd50f6a0-0693-4484-b50a-fcad54dd268b', 'Material Catalogue,Country of Origin Certificate,Liability Insurance Certificate', '2020-09-21 00:22:27', '2020-09-21 00:22:27'),
(83, 12, '4', '2', '4', '1', '1', 'Materials', 'No', '11', NULL, NULL, '15', NULL, '55.648261270703124', '25.09056463370194', 'Work Order 12346', 'Standard', 'Yes', '12', '15', 'No', 'Please ensure that the docs are brought along with the goods', 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '59b3b5fb-7570-47ca-86c7-a7c81f3e8da7', 'Testing Certificate,Warranty Certificate,Country of Origin Certificate', '2020-09-21 00:23:58', '2020-09-21 00:23:58'),
(84, 16, '6', '2', '4', '1', '1', 'Materials', 'No', '16', NULL, NULL, '20', NULL, '55.931159219921874', '25.122896700481537', 'Sales Order #1223456', 'Standard', 'Yes', '10', '20', 'No', 'Please ensure the product comes with the documents', 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8', 'Country of Origin Certificate,Material Catalogue', '2020-09-21 00:25:56', '2020-09-21 00:25:56'),
(85, 18, '7', '2', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '46', NULL, '55.1305305578125', '25.117923092879085', 'Sales Order #12124', 'Standard', 'Yes', '5', '19', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', 'bd50f6a0-0693-4484-b50a-fcad54dd268b', 'Material Catalogue,Country of Origin Certificate,Liability Insurance Certificate', '2020-09-21 00:27:23', '2020-09-21 00:27:23'),
(86, 40, '25', '1', '4', '1', '1', 'Materials', 'No', '43', 'dfsdfs', NULL, '2', 'Dozen', NULL, NULL, 'PE#12312312', 'Standard', 'No', '0', '0', NULL, NULL, NULL, NULL, 'c63f465e-c61a-4991-a441-21ab255d38d2', '', '2020-10-17 05:50:10', '2020-10-17 05:50:10'),
(87, 41, '26', '1', '4', '1', '1', 'Materials', 'No', '44', 'asdasdas', NULL, '3', 'Dozen', NULL, NULL, 'PE#12312321', 'Standard', 'No', '0', '0', NULL, NULL, NULL, NULL, 'afef49ec-36e1-4c7d-89f6-1f9c6c7deab7', 'Customers Testimonials', '2020-10-17 05:55:32', '2020-10-17 05:55:32'),
(88, 42, '26', '2', '4', '1', '1', 'Materials', 'No', '45', 'asdasdas', NULL, '2', 'kilo', NULL, NULL, 'PE#123123234', 'Standard', 'No', '0', '0', NULL, NULL, NULL, NULL, 'afef49ec-36e1-4c7d-89f6-1f9c6c7deab7', '', '2020-10-17 05:55:32', '2020-10-17 05:55:32'),
(89, 43, '27', '1', '4', '1', '1', 'Service', 'No', NULL, NULL, 'dsadasdasdasdasd', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, '0', '0', NULL, NULL, NULL, NULL, '9a13d5fd-7f3e-4e98-b461-da2cafb05d58', '', '2020-10-17 05:56:31', '2020-10-17 05:56:31'),
(90, 44, '28', '1', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '2', NULL, NULL, NULL, 'PE#1232131245', 'Standard', 'No', '0', '0', NULL, NULL, NULL, NULL, '15ffd073-527d-4f09-b306-d136752b24a0', '', '2020-10-17 06:15:38', '2020-10-17 06:15:38'),
(91, 45, '29', '1', '4', '1', '1', 'Materials', 'No', '46', 'asdasdasdatrtyt', NULL, '2', 'Liter', NULL, NULL, 'PE#25453443', 'Standard', 'No', '0', '0', NULL, NULL, NULL, NULL, '2deb97b1-efdd-4da4-b937-68db4186d8e0', '', '2020-10-17 06:31:39', '2020-10-17 06:31:39'),
(92, 46, '30', '1', '4', '1', '1', 'Materials', 'No', '47', 'sdfsdfdsfs', NULL, '4', 'Dozen', NULL, NULL, 'PE#1231', 'Standard', 'No', '0', '0', NULL, NULL, NULL, NULL, '4431130f-f627-44e7-8e0a-b3ef09ffb0c2', '', '2020-10-17 06:38:56', '2020-10-17 06:38:56'),
(93, 47, '31', '1', '4', '1', '1', 'Materials', 'No', '48', 'hhhhjjjkk', NULL, '5', 'Liters', NULL, NULL, 'PE#42424242', 'Standard', 'No', '0', '0', NULL, NULL, NULL, NULL, '6970319c-1355-47e1-b140-3757474cefbf', '', '2020-10-17 06:41:41', '2020-10-17 06:41:41'),
(94, 48, '32', '1', '4', '1', '1', 'Materials', 'No', '49', 'dfsdfdsfsf', NULL, '5', 'Liters', NULL, NULL, 'PE#575757', 'Standard', 'No', '0', '0', NULL, NULL, NULL, NULL, 'a8a69fd8-1a25-4a6c-b42e-e5e9e081a160', '', '2020-10-17 06:45:40', '2020-10-17 06:45:40'),
(95, 49, '33', '1', '4', '1', '1', 'Materials', 'No', '50', 'sadfgdj', NULL, '5.0001', 'kg', NULL, NULL, '123', 'Standard', 'Yes', '0', '0', NULL, NULL, NULL, NULL, '4d57ec07-a600-4c95-8e82-12695fc8a5d2', '', '2020-11-27 07:09:04', '2020-11-27 07:09:04'),
(96, 50, '34', '1', '4', '1', '1', 'Materials', 'No', '51', 'wwww', NULL, '1', '1', NULL, NULL, '1', 'Standard', 'No', '0', '0', NULL, NULL, NULL, NULL, 'b021f968-69e6-4153-a42b-30e4257cc5a8', '', '2020-12-11 05:48:06', '2020-12-11 05:48:06'),
(97, 50, '34', '1', '4', '1', '1', 'Materials', 'No', '51', 'wwww', NULL, '1', '1', NULL, NULL, '1', 'Standard', 'No', '0', '0', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', 'b021f968-69e6-4153-a42b-30e4257cc5a8', '', '2020-12-11 05:55:12', '2020-12-11 05:55:12'),
(98, 50, '34', '1', '4', '1', '1', 'Materials', 'No', '51', 'wwww', NULL, '1', '1', NULL, NULL, '1', 'Standard', 'No', '0', '0', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', 'b021f968-69e6-4153-a42b-30e4257cc5a8', '', '2020-12-11 05:58:24', '2020-12-11 05:58:24'),
(99, 50, '34', '1', '4', '1', '1', 'Materials', 'No', '51', 'wwww', NULL, '1', '1', NULL, NULL, '1', 'Standard', 'No', '0', '0', 'No', NULL, 'Send for a New Request for Proposals', 'Yes', 'b021f968-69e6-4153-a42b-30e4257cc5a8', '', '2020-12-11 06:24:18', '2020-12-11 06:24:18'),
(100, 15, '6', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '50', NULL, '55.931159219921874', '25.122896700481537', 'Sales Order #1223456', 'Standard', 'Yes', '5', '15', 'No', 'Please ensure the product comes with the documents', 'Send for a New Request for Proposals', 'Yes', '25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8', 'Country of Origin Certificate,Material Catalogue,Liability Insurance Certificate', '2020-12-11 06:24:18', '2020-12-11 06:24:18'),
(101, 13, '5', '1', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '12', NULL, '55.29807206171875', '25.208659540914415', 'WO#123', 'Urgent', 'Yes', '5', '20', 'No', 'Please send the docs with the material', 'Send for a New Request for Proposals', 'Yes', '34efc062-6548-4d08-bb72-9a50a00f6582', 'Material Catalogue,Warranty Certificate,Testing Certificate', '2020-12-11 06:24:18', '2020-12-11 06:24:18'),
(102, 51, '35', '1', '4', '1', '1', 'Materials', 'No', '52', 'qwert', NULL, '1', '1', NULL, NULL, '1', 'Standard', 'Yes', '0', '0', NULL, NULL, NULL, NULL, 'e2034f3f-5363-4c8d-9e63-8808e674c14d', '', '2020-12-11 07:09:16', '2020-12-11 07:09:16'),
(103, 51, '35', '1', '4', '1', '1', 'Materials', 'No', '52', 'qwert', NULL, '1', '1', NULL, NULL, '1', 'Standard', 'Yes', '0', '0', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', 'e2034f3f-5363-4c8d-9e63-8808e674c14d', '', '2020-12-11 07:10:05', '2020-12-11 07:10:05'),
(104, 51, '35', '1', '4', '1', '1', 'Materials', 'No', '52', 'qwert', NULL, '1', '1', NULL, NULL, '1', 'Standard', 'Yes', '0', '0', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', 'e2034f3f-5363-4c8d-9e63-8808e674c14d', '', '2020-12-11 07:10:43', '2020-12-11 07:10:43'),
(105, 52, '36', '1', '4', '1', '1', 'Materials', 'No', '7', NULL, NULL, '14.0001', NULL, NULL, NULL, '12', 'Standard', 'Yes', '0', '0', NULL, NULL, NULL, NULL, '83b79d8d-f0a3-4bb7-a9d0-afc3e7c80d80', '', '2021-02-27 11:58:09', '2021-02-27 11:58:09'),
(106, 53, '37', '1', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '45', NULL, NULL, NULL, 'SO-2021/45-167', 'Standard', 'Yes', '5', '19', NULL, NULL, NULL, NULL, '251d7d08-1454-43b4-b412-3e353281a0aa', 'Material Catalogue,Testing Certificate,Customers Testimonials', '2021-02-27 17:54:20', '2021-02-27 17:54:20'),
(107, 54, '38', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '6', NULL, NULL, NULL, 'Sales Order - 18/2021', 'Standard', 'Yes', '16', '16', NULL, 'Good to go', NULL, NULL, 'cb254a50-d3df-4e1a-8c35-3bc49bcd20bb', 'Liability Insurance Certificate,Testing Certificate,MSDS - Material Safety Data Sheet', '2021-03-03 10:32:03', '2021-03-03 10:32:03'),
(108, 54, '38', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '6', NULL, NULL, NULL, 'Sales Order - 18/2021', 'Standard', 'Yes', '16', '16', 'No', 'Good to go', 'Purchase Enquiry Line Rejected By Level 1 and Assigned back to the Originator', 'Yes', 'cb254a50-d3df-4e1a-8c35-3bc49bcd20bb', 'Liability Insurance Certificate,Testing Certificate,MSDS - Material Safety Data Sheet', '2021-03-03 10:36:56', '2021-03-03 10:36:56'),
(109, 54, '38', '1', '4', '1', '1', 'Materials', 'No', '5', NULL, NULL, '6', NULL, NULL, NULL, 'Sales Order - 18/2021', 'Standard', 'Yes', '16', '16', 'No', 'Good to go', 'Purchase Enquiry Line Cancelled by Originator', 'Yes', 'cb254a50-d3df-4e1a-8c35-3bc49bcd20bb', 'Liability Insurance Certificate,Testing Certificate,MSDS - Material Safety Data Sheet', '2021-03-03 10:40:24', '2021-03-03 10:40:24'),
(110, 53, '37', '1', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '45', NULL, NULL, NULL, 'SO-2021/45-167', 'Standard', 'Yes', '5', '19', 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '251d7d08-1454-43b4-b412-3e353281a0aa', 'Material Catalogue,Testing Certificate,Customers Testimonials', '2021-03-03 11:06:55', '2021-03-03 11:06:55'),
(111, 53, '37', '1', '4', '1', '1', 'Materials', 'No', '6', NULL, NULL, '45', NULL, NULL, NULL, 'SO-2021/45-167', 'Standard', 'Yes', '5', '19', 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '251d7d08-1454-43b4-b412-3e353281a0aa', 'Material Catalogue,Testing Certificate,Customers Testimonials', '2021-03-03 11:11:32', '2021-03-03 11:11:32'),
(112, 55, '39', '1', '4', '1', '1', 'Materials', 'No', '53', 'Superman', NULL, '56', 'cartons of 12 bottles', NULL, NULL, 'SO-67854', 'Standard', 'No', '6', '10', NULL, NULL, NULL, NULL, '3b113177-b60d-4f2c-b1a4-0bb44fa11335', 'Material Catalogue,Testing Certificate', '2021-03-03 13:09:11', '2021-03-03 13:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `histories_ratecontractrequest`
--

CREATE TABLE `histories_ratecontractrequest` (
  `id` int(255) UNSIGNED NOT NULL,
  `rate_contract_request_id` int(255) DEFAULT NULL,
  `rate_contract_request_group_id` text,
  `rate_contract_request_ingroup_id` text,
  `created_by` text,
  `company_id` text,
  `project_id` text,
  `item_id` text,
  `item_description` text,
  `rc_start_period` datetime DEFAULT NULL,
  `rc_end_period` datetime DEFAULT NULL,
  `quantity` text,
  `u_o_m` text,
  `latitude` text,
  `longitude` text,
  `advanced_payment` text,
  `notes` text,
  `status` text,
  `active` text,
  `grouping_id` text,
  `required_documents` text,
  `created_at` text,
  `updated_at` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `histories_stockitem`
--

CREATE TABLE `histories_stockitem` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_item_id` int(255) DEFAULT NULL,
  `stock_item_group_id` text,
  `stock_item_ingroup_id` text,
  `created_by` text,
  `company_id` text,
  `project_id` text,
  `bin` text,
  `shelf` text,
  `rack` text,
  `area` text,
  `alley` text,
  `item_id` text,
  `pe_generation_type` text,
  `replenish_level` text,
  `replenish_quantity` text,
  `stock_level` text,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `notes` text,
  `approval_level` text,
  `status` text,
  `active` text,
  `created_at` text,
  `updated_at` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `histories_stockitemrequest`
--

CREATE TABLE `histories_stockitemrequest` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_item_request_id` int(255) DEFAULT NULL,
  `stock_item_request_group_id` text,
  `stock_item_request_ingroup_id` text,
  `created_by` text,
  `company_id` text,
  `project_id` text,
  `item_id` text,
  `item_description` text,
  `si_start_period` datetime DEFAULT NULL,
  `si_end_period` datetime DEFAULT NULL,
  `consumption_frequency` text,
  `quantity` text,
  `u_o_m` text,
  `notes` text,
  `status` text,
  `active` text,
  `grouping_id` text,
  `created_at` text,
  `updated_at` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `histories_vendor`
--

CREATE TABLE `histories_vendor` (
  `id` int(255) UNSIGNED NOT NULL,
  `vendor_id` text NOT NULL,
  `created_by` text NOT NULL,
  `name` text NOT NULL,
  `rep_name` text NOT NULL,
  `rep_title` text,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `po_box` text,
  `phone` text,
  `mobile` text,
  `url` text,
  `lic_num` text,
  `lic_expiry_date` datetime DEFAULT NULL,
  `officer_name` varchar(255) DEFAULT NULL,
  `officer_phone` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_iban` varchar(255) DEFAULT NULL,
  `turnover` varchar(255) DEFAULT NULL,
  `open_since` varchar(255) DEFAULT NULL,
  `sold_brands` text,
  `exculsive_brands` text,
  `vendor_type` varchar(255) DEFAULT NULL,
  `vendor_score` varchar(45) DEFAULT NULL,
  `provided_service` text,
  `linked_item_templates` text,
  `notes` text,
  `status` varchar(45) NOT NULL DEFAULT 'Good Standing',
  `active` varchar(45) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_budget_master`
--

CREATE TABLE `history_budget_master` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `budget_request_id` text,
  `budget_id` text,
  `current_action_description` text,
  `current_action_owner_id` text,
  `current_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `next_action_description` text,
  `next_action_owners` text,
  `next_approval_level` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history_budget_master`
--

INSERT INTO `history_budget_master` (`id`, `company_id`, `budget_request_id`, `budget_id`, `current_action_description`, `current_action_owner_id`, `current_approval_level`, `decision`, `decision_notes`, `next_action_description`, `next_action_owners`, `next_approval_level`, `created_at`, `updated_at`) VALUES
(1, 11, '1', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-22 16:25:14', '2021-02-22 16:25:14'),
(2, 11, NULL, '1', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-22 16:25:19', '2021-02-22 16:25:19'),
(3, 11, '1', '1', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-22 16:28:34', '2021-02-22 16:28:34'),
(4, 11, '1', '1', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-02-22 16:29:29', '2021-02-22 16:29:29'),
(5, 11, '2', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-22 16:36:24', '2021-02-22 16:36:24'),
(6, 11, NULL, '2', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-22 16:36:30', '2021-02-22 16:36:30'),
(7, 11, '2', '2', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-22 16:40:10', '2021-02-22 16:40:10'),
(8, 11, '3', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-22 21:00:23', '2021-02-22 21:00:23'),
(9, 11, '', '3', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-22 21:00:38', '2021-02-22 21:00:38'),
(10, 11, '4', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-22 22:40:29', '2021-02-22 22:40:29'),
(11, 11, '', '4', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-22 22:40:35', '2021-02-22 22:40:35'),
(12, 11, '4', '4', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-22 22:42:42', '2021-02-22 22:42:42'),
(13, 11, '4', '4', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-02-22 22:47:15', '2021-02-22 22:47:15'),
(14, 11, '5', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-24 14:42:24', '2021-02-24 14:42:24'),
(15, 11, '', '5', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-24 14:42:39', '2021-02-24 14:42:39'),
(16, 11, '5', '5', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-24 14:45:41', '2021-02-24 14:45:41'),
(17, 11, '5', '5', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-02-24 14:49:15', '2021-02-24 14:49:15'),
(18, 11, '6', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-24 14:51:24', '2021-02-24 14:51:24'),
(19, 11, '', '6', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-24 14:51:30', '2021-02-24 14:51:30'),
(20, 11, '6', '6', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-24 14:55:01', '2021-02-24 14:55:01'),
(21, 11, '6', '6', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-02-24 14:57:56', '2021-02-24 14:57:56'),
(22, 11, '7', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-24 15:54:05', '2021-02-24 15:54:05'),
(23, 11, '', '7', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-24 15:54:13', '2021-02-24 15:54:13'),
(24, 11, '7', '7', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-24 16:18:30', '2021-02-24 16:18:30'),
(25, 11, '7', '7', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-02-24 16:20:41', '2021-02-24 16:20:41'),
(26, 11, '8', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-24 16:22:13', '2021-02-24 16:22:13'),
(27, 11, NULL, '8', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-24 16:22:18', '2021-02-24 16:22:18'),
(28, 11, '8', '8', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-24 16:26:13', '2021-02-24 16:26:13'),
(29, 11, '8', '8', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-02-24 16:27:22', '2021-02-24 16:27:22'),
(30, 11, '9', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-24 16:28:36', '2021-02-24 16:28:36'),
(31, 11, NULL, '9', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-24 16:28:41', '2021-02-24 16:28:41'),
(32, 11, '9', '9', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-24 16:30:02', '2021-02-24 16:30:02'),
(33, 11, '9', '9', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-02-24 16:31:00', '2021-02-24 16:31:00'),
(34, 11, '10', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-24 16:32:39', '2021-02-24 16:32:39'),
(35, 11, NULL, '10', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-24 16:32:47', '2021-02-24 16:32:47'),
(36, 11, '10', '10', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-24 16:33:53', '2021-02-24 16:33:53'),
(37, 11, '10', '10', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-02-24 16:34:28', '2021-02-24 16:34:28'),
(38, 11, '11', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-24 16:35:34', '2021-02-24 16:35:34'),
(39, 11, NULL, '11', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-24 16:35:40', '2021-02-24 16:35:40'),
(40, 11, '11', '11', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-02-24 16:37:26', '2021-02-24 16:37:26'),
(41, 11, '11', '11', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-02-24 16:38:14', '2021-02-24 16:38:14'),
(42, 11, '12', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-02-24 16:39:39', '2021-02-24 16:39:39'),
(43, 11, NULL, '12', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-02-24 16:39:45', '2021-02-24 16:39:45'),
(44, 11, '12', '12', 'Request Under Review By the Validator Level 1', '340', '1', 'Rejected', 'This change to the budget isn\'t needed', 'Request Under Review By The Originator', 'John SUBO', 'N/A', '2021-02-24 16:40:59', '2021-02-24 16:40:59'),
(45, 11, '13', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-03-03 10:45:03', '2021-03-03 10:45:03'),
(46, 11, NULL, '13', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-03-03 10:45:17', '2021-03-03 10:45:17'),
(47, 11, '13', '13', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-03-03 10:47:27', '2021-03-03 10:47:27'),
(48, 11, '13', '13', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-03-03 10:48:17', '2021-03-03 10:48:17'),
(49, 11, '14', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-03-03 10:51:20', '2021-03-03 10:51:20'),
(50, 11, NULL, '14', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-03-03 10:51:25', '2021-03-03 10:51:25'),
(51, 11, '14', '14', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-03-03 10:55:22', '2021-03-03 10:55:22'),
(52, 11, '14', '14', 'Request Under Review By the Validator Level 2', '341', '2', 'Rejected', 'Please review the end date.', 'Request Under Review By The Originator', 'John SUBO', 'N/A', '2021-03-03 10:57:17', '2021-03-03 10:57:17'),
(53, 11, '14', 'Not Created', 'Request Under Review By The Originator', '339', 'N/A', 'Cancelled', 'N/A', 'N/A', 'N/A', 'N/A', '2021-03-03 10:58:32', '2021-03-03 10:58:32'),
(54, 11, '15', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-03-03 10:59:56', '2021-03-03 10:59:56'),
(55, 11, NULL, '15', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-03-03 11:00:02', '2021-03-03 11:00:02'),
(56, 11, '16', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-03-03 13:11:06', '2021-03-03 13:11:06'),
(57, 11, '16', '16', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-03-03 13:11:20', '2021-03-03 13:11:20'),
(58, 11, '17', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-03-03 14:01:07', '2021-03-03 14:01:07'),
(59, 11, '17', '17', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-03-03 14:01:14', '2021-03-03 14:01:14'),
(60, 11, '18', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-03-05 21:20:36', '2021-03-05 21:20:36'),
(61, 11, '18', '18', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-03-05 21:20:57', '2021-03-05 21:20:57'),
(62, 11, '18', '18', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-03-05 22:11:24', '2021-03-05 22:11:24'),
(63, 11, '18', '18', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-03-05 22:13:42', '2021-03-05 22:13:42'),
(64, 11, '19', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-03-05 22:24:50', '2021-03-05 22:24:50'),
(65, 11, '19', '19', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-03-05 22:24:57', '2021-03-05 22:24:57'),
(66, 11, '19', '19', 'Request Under Review By the Validator Level 1', '340', '1', 'Approved', NULL, 'Request Under Review By the Validator Level 2', 'John SUBV2', '2', '2021-03-05 22:28:02', '2021-03-05 22:28:02'),
(67, 11, '19', '19', 'Request Under Review By the Validator Level 2', '341', '2', 'Approved', NULL, 'Request is Fully Approved and the Set-up Budget is Updated', 'N/A', 'N/A', '2021-03-05 22:29:19', '2021-03-05 22:29:19'),
(68, 11, '20', 'Not Yet Created', 'Request To Update The Set-Up Budget Raised', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By The Validator', 'John SUBV1', '1', '2021-03-06 17:53:54', '2021-03-06 17:53:54'),
(69, 11, '20', '20', 'Request Under Review By The Validator', '339', 'N/A', 'N/A', 'N/A', 'Request Under Review By the Validator Level 1', 'John SUBV1', '1', '2021-03-06 17:54:10', '2021-03-06 17:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `history_item_master`
--

CREATE TABLE `history_item_master` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `item_request_id` text,
  `item_id` text,
  `current_action_description` text,
  `current_action_owner_id` text,
  `current_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `next_action_description` text,
  `next_action_owners` text,
  `next_approval_level` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_purchase_enquiry`
--

CREATE TABLE `history_purchase_enquiry` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `purchase_enquiry_id` int(255) NOT NULL,
  `current_action_description` text,
  `current_action_owner_id` text,
  `current_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `next_action_description` text,
  `next_action_owners` text,
  `next_approval_level` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_purchase_enquiry`
--

INSERT INTO `history_purchase_enquiry` (`id`, `company_id`, `purchase_enquiry_id`, `current_action_description`, `current_action_owner_id`, `current_approval_level`, `decision`, `decision_notes`, `next_action_description`, `next_action_owners`, `next_approval_level`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
(2, 1, 2, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
(3, 1, 3, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
(4, 1, 4, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
(5, 1, 1, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-02 05:08:16', '2019-11-02 05:08:16'),
(6, 1, 2, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-02 05:08:32', '2019-11-02 05:08:32'),
(7, 1, 3, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-02 05:08:43', '2019-11-02 05:08:43'),
(8, 1, 4, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-02 05:08:52', '2019-11-02 05:08:52'),
(9, 1, 1, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-02 05:09:50', '2019-11-02 05:09:50'),
(10, 1, 2, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-02 05:09:57', '2019-11-02 05:09:57'),
(11, 1, 3, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-02 05:10:09', '2019-11-02 05:10:09'),
(12, 1, 4, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-02 05:10:29', '2019-11-02 05:10:29'),
(13, 1, 1, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-02 05:12:29', '2019-11-02 05:12:29'),
(14, 1, 2, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-02 05:12:29', '2019-11-02 05:12:29'),
(15, 1, 3, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-02 05:12:29', '2019-11-02 05:12:29'),
(16, 1, 4, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-02 05:12:29', '2019-11-02 05:12:29'),
(17, 1, 1, 'RfI Timeframe has been modified to 03.Nov.2019 - (23:59:59)', '12', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '2019-11-02 05:16:27', '2019-11-02 05:16:27'),
(18, 1, 2, 'RfI Timeframe has been modified to 03.Nov.2019 - (23:59:59)', '12', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '2019-11-02 05:16:27', '2019-11-02 05:16:27'),
(19, 1, 3, 'RfI Timeframe has been modified to 03.Nov.2019 - (23:59:59)', '12', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '2019-11-02 05:16:27', '2019-11-02 05:16:27'),
(20, 1, 4, 'RfI Timeframe has been modified to 03.Nov.2019 - (23:59:59)', '12', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '2019-11-02 05:16:27', '2019-11-02 05:16:27'),
(21, 1, 1, 'RfI Timeframe has been modified to 07.Nov.2019 - (23:59:59)', '12', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '2019-11-02 05:17:03', '2019-11-02 05:17:03'),
(22, 1, 2, 'RfI Timeframe has been modified to 07.Nov.2019 - (23:59:59)', '12', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '2019-11-02 05:17:03', '2019-11-02 05:17:03'),
(23, 1, 3, 'RfI Timeframe has been modified to 07.Nov.2019 - (23:59:59)', '12', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '2019-11-02 05:17:03', '2019-11-02 05:17:03'),
(24, 1, 4, 'RfI Timeframe has been modified to 07.Nov.2019 - (23:59:59)', '12', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '2019-11-02 05:17:03', '2019-11-02 05:17:03'),
(25, 1, 5, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-05 11:57:03', '2019-11-05 11:57:03'),
(26, 1, 6, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-05 11:57:03', '2019-11-05 11:57:03'),
(27, 1, 5, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-05 11:58:06', '2019-11-05 11:58:06'),
(28, 1, 6, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-05 11:58:13', '2019-11-05 11:58:13'),
(29, 1, 5, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-05 11:58:53', '2019-11-05 11:58:53'),
(30, 1, 6, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-05 11:59:00', '2019-11-05 11:59:00'),
(31, 1, 5, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-05 12:04:44', '2019-11-05 12:04:44'),
(32, 1, 6, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-05 12:04:44', '2019-11-05 12:04:44'),
(33, 1, 6, 'Purchase Enquiry line send for new Request for Proposals', '13', 'N/A', 'Rejected', 'Let\'s retender this', 'Purchase Enquiry line under review by the Request For Proposal administrator', 'Request For Proposal administrator(s)', 'N/A', '2019-11-05 12:17:44', '2019-11-05 12:17:44'),
(34, 1, 5, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-05 12:21:50', '2019-11-05 12:21:50'),
(35, 1, 6, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-05 12:21:50', '2019-11-05 12:21:50'),
(36, 1, 7, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(37, 1, 8, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(38, 1, 9, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(39, 1, 10, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(40, 1, 7, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-05 13:13:55', '2019-11-05 13:13:55'),
(41, 1, 8, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-05 13:14:15', '2019-11-05 13:14:15'),
(42, 1, 9, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-05 13:14:42', '2019-11-05 13:14:42'),
(43, 1, 10, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2019-11-05 13:14:56', '2019-11-05 13:14:56'),
(44, 1, 7, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-05 13:16:41', '2019-11-05 13:16:41'),
(45, 1, 8, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-05 13:16:57', '2019-11-05 13:16:57'),
(46, 1, 9, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-05 13:17:05', '2019-11-05 13:17:05'),
(47, 1, 10, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2019-11-05 13:17:17', '2019-11-05 13:17:17'),
(48, 1, 7, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-05 13:20:06', '2019-11-05 13:20:06'),
(49, 1, 8, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-05 13:20:06', '2019-11-05 13:20:06'),
(50, 1, 9, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-05 13:20:06', '2019-11-05 13:20:06'),
(51, 1, 10, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2019-11-05 13:20:06', '2019-11-05 13:20:06'),
(52, 1, 11, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-02-25 11:42:32', '2020-02-25 11:42:32'),
(53, 1, 12, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-02-25 11:42:32', '2020-02-25 11:42:32'),
(54, 1, 11, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2020-02-25 11:44:33', '2020-02-25 11:44:33'),
(55, 1, 12, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2020-02-25 11:44:46', '2020-02-25 11:44:46'),
(56, 1, 13, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-05-15 07:34:36', '2020-05-15 07:34:36'),
(57, 1, 14, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-05-15 07:34:36', '2020-05-15 07:34:36'),
(58, 1, 13, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2020-05-15 07:40:34', '2020-05-15 07:40:34'),
(59, 1, 14, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '5', '1', 'Rejected', 'We don\'t actually need this product. Please cancel this PE', 'Purchase Enquiry line Under correction By The Purchase Enquiry Originator', 'John PEO', 'N/A', '2020-05-15 07:41:48', '2020-05-15 07:41:48'),
(60, 1, 13, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2020-05-15 07:43:50', '2020-05-15 07:43:50'),
(61, 1, 15, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-06-29 03:21:27', '2020-06-29 03:21:27'),
(62, 1, 16, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-06-29 03:21:27', '2020-06-29 03:21:27'),
(63, 1, 15, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2020-06-29 03:25:06', '2020-06-29 03:25:06'),
(64, 1, 16, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2020-06-29 03:25:49', '2020-06-29 03:25:49'),
(65, 1, 17, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-07-02 04:32:32', '2020-07-02 04:32:32'),
(66, 1, 18, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-07-02 04:32:32', '2020-07-02 04:32:32'),
(67, 1, 19, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-07-20 07:27:24', '2020-07-20 07:27:24'),
(68, 1, 20, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-07-20 07:27:24', '2020-07-20 07:27:24'),
(69, 1, 21, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-07-21 06:02:35', '2020-07-21 06:02:35'),
(70, 1, 22, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-07-21 06:02:35', '2020-07-21 06:02:35'),
(71, 1, 23, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-08-03 09:08:02', '2020-08-03 09:08:02'),
(72, 1, 24, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-08-03 09:08:02', '2020-08-03 09:08:02'),
(73, 1, 21, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '6', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2020-08-03 09:13:41', '2020-08-03 09:13:41'),
(74, 1, 22, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '5', '1', 'Rejected', 'Not Required', 'Purchase Enquiry line Under correction By The Purchase Enquiry Originator', 'John PEO', 'N/A', '2020-08-03 09:14:37', '2020-08-03 09:14:37'),
(75, 1, 25, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 19:04:47', '2020-09-18 19:04:47'),
(76, 1, 26, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 19:14:58', '2020-09-18 19:14:58'),
(77, 1, 27, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 19:20:32', '2020-09-18 19:20:32'),
(78, 1, 28, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 19:23:25', '2020-09-18 19:23:25'),
(79, 1, 29, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 20:12:54', '2020-09-18 20:12:54'),
(80, 1, 30, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 20:15:11', '2020-09-18 20:15:11'),
(81, 1, 31, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 21:09:11', '2020-09-18 21:09:11'),
(82, 1, 32, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 21:15:49', '2020-09-18 21:15:49'),
(83, 1, 33, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 21:17:22', '2020-09-18 21:17:22'),
(84, 1, 34, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 21:20:25', '2020-09-18 21:20:25'),
(85, 1, 35, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 21:33:13', '2020-09-18 21:33:13'),
(86, 1, 36, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-18 21:40:25', '2020-09-18 21:40:25'),
(87, 1, 37, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-19 03:36:24', '2020-09-19 03:36:24'),
(88, 1, 38, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-19 03:38:00', '2020-09-19 03:38:00'),
(89, 1, 39, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-09-19 03:49:05', '2020-09-19 03:49:05'),
(90, 1, 11, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2020-09-20 19:21:20', '2020-09-20 19:21:20'),
(91, 1, 15, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2020-09-20 19:21:36', '2020-09-20 19:21:36'),
(92, 1, 17, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2020-09-20 19:22:27', '2020-09-20 19:22:27'),
(93, 1, 12, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2020-09-20 19:23:58', '2020-09-20 19:23:58'),
(94, 1, 16, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2020-09-20 19:25:56', '2020-09-20 19:25:56'),
(95, 1, 18, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2020-09-20 19:27:23', '2020-09-20 19:27:23'),
(96, 1, 40, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-10-17 00:50:10', '2020-10-17 00:50:10'),
(97, 1, 41, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-10-17 00:55:32', '2020-10-17 00:55:32'),
(98, 1, 42, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-10-17 00:55:32', '2020-10-17 00:55:32'),
(99, 1, 43, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-10-17 00:56:31', '2020-10-17 00:56:31'),
(100, 1, 44, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-10-17 01:15:39', '2020-10-17 01:15:39'),
(101, 1, 45, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-10-17 01:31:39', '2020-10-17 01:31:39'),
(102, 1, 46, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-10-17 01:38:56', '2020-10-17 01:38:56'),
(103, 1, 47, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-10-17 01:41:41', '2020-10-17 01:41:41'),
(104, 1, 48, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-10-17 01:45:40', '2020-10-17 01:45:40'),
(105, 1, 49, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-11-27 07:09:04', '2020-11-27 07:09:04'),
(106, 1, 12, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-10 21:38:39', '2020-12-10 21:38:39'),
(107, 1, 11, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-10 21:38:39', '2020-12-10 21:38:39'),
(108, 1, 17, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-10 21:50:58', '2020-12-10 21:50:58'),
(109, 1, 16, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-10 21:50:58', '2020-12-10 21:50:58'),
(110, 1, 18, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-10 21:50:58', '2020-12-10 21:50:58'),
(111, 1, 50, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-12-11 13:48:06', '2020-12-11 13:48:06'),
(112, 1, 50, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '5', '1', 'Approved', 'q', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2020-12-11 13:55:12', '2020-12-11 13:55:12'),
(113, 1, 50, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', 'q', 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2020-12-11 13:58:24', '2020-12-11 13:58:24'),
(114, 1, 50, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-11 14:21:47', '2020-12-11 14:21:47'),
(115, 1, 15, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-11 14:21:47', '2020-12-11 14:21:47'),
(116, 1, 13, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-11 14:21:47', '2020-12-11 14:21:47'),
(117, 1, 50, 'Send for a New Request for Proposals', '12', 'N/A', 'Cancelled', 'asdfghj', 'Purchase Enquiry line under review by the Request For Proposal administrator', 'Request for Proposals Administrator(s)', 'N/A', '2020-12-11 14:24:18', '2020-12-11 14:24:18'),
(118, 1, 15, 'Send for a New Request for Proposals', '12', 'N/A', 'Cancelled', 'asdfghj', 'Purchase Enquiry line under review by the Request For Proposal administrator', 'Request for Proposals Administrator(s)', 'N/A', '2020-12-11 14:24:18', '2020-12-11 14:24:18'),
(119, 1, 13, 'Send for a New Request for Proposals', '12', 'N/A', 'Cancelled', 'asdfghj', 'Purchase Enquiry line under review by the Request For Proposal administrator', 'Request for Proposals Administrator(s)', 'N/A', '2020-12-11 14:24:18', '2020-12-11 14:24:18'),
(120, 1, 15, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-11 14:33:24', '2020-12-11 14:33:24'),
(121, 1, 51, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2020-12-11 15:09:16', '2020-12-11 15:09:16'),
(122, 1, 51, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '5', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2020-12-11 15:10:05', '2020-12-11 15:10:05'),
(123, 1, 51, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2020-12-11 15:10:43', '2020-12-11 15:10:43'),
(124, 1, 50, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-11 15:12:06', '2020-12-11 15:12:06'),
(125, 1, 13, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-11 15:12:06', '2020-12-11 15:12:06'),
(126, 1, 51, NULL, '12', 'N/A', 'N/A', 'N/A', NULL, 'Quotations From Vendors', 'N/A', '2020-12-11 15:12:06', '2020-12-11 15:12:06'),
(127, 1, 52, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2021-02-27 11:58:09', '2021-02-27 11:58:09'),
(128, 1, 53, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2021-02-27 17:54:20', '2021-02-27 17:54:20'),
(129, 1, 54, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2021-03-03 10:32:03', '2021-03-03 10:32:03'),
(130, 1, 54, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '5', '1', 'Rejected', 'this is not required. Please cancel it. Thank you', 'Purchase Enquiry line Under correction By The Purchase Enquiry Originator', 'John PEO', 'N/A', '2021-03-03 10:36:57', '2021-03-03 10:36:57'),
(131, 1, 54, 'Cancelled By Originator', '4', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '2021-03-03 10:40:24', '2021-03-03 10:40:24'),
(132, 1, 53, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', '5', '1', 'Approved', NULL, 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 2', 'John PEV2', '2', '2021-03-03 11:06:55', '2021-03-03 11:06:55'),
(133, 1, 53, 'Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level', '6', '2', 'Approved', NULL, 'Purchase Enquiry line Under Review by The Request For Proposal Administrator', 'Request For Proposal Administrator(s)', '', '2021-03-03 11:11:32', '2021-03-03 11:11:32'),
(134, 1, 55, 'Purchase Enquiry Line Originated', '4', 'N/A', 'N/A', 'N/A', 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1', 'John PEV1', '1', '2021-03-03 13:09:11', '2021-03-03 13:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `history_purchase_order`
--

CREATE TABLE `history_purchase_order` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) UNSIGNED NOT NULL,
  `purchase_order_id` int(255) UNSIGNED NOT NULL,
  `current_action_description` text,
  `current_action_owner_id` text,
  `current_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `next_action_description` text,
  `next_action_owners` text,
  `next_approval_level` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_purchase_order`
--

INSERT INTO `history_purchase_order` (`id`, `company_id`, `purchase_order_id`, `current_action_description`, `current_action_owner_id`, `current_approval_level`, `decision`, `decision_notes`, `next_action_description`, `next_action_owners`, `next_approval_level`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Purchase Order Created', '13', '1', 'N/A', 'N/A', 'Purchase Order Under Review By The Purchase order Validator level 1', 'John POV1', '1', '2019-11-05 12:54:45', '2019-11-05 12:54:45'),
(2, 1, 2, 'Purchase Order Created', '13', '1', 'N/A', 'N/A', 'Purchase Order Under Review By The Purchase order Validator level 1', 'John POV1', '1', '2019-11-05 12:55:57', '2019-11-05 12:55:57'),
(3, 1, 3, 'Purchase Order Created', '13', '1', 'N/A', 'N/A', 'Purchase Order Under Review By The Purchase order Validator level 1', 'John POV1', '1', '2019-11-05 13:35:41', '2019-11-05 13:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `history_purchase_order_cancellation`
--

CREATE TABLE `history_purchase_order_cancellation` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) UNSIGNED NOT NULL,
  `purchase_order_cancellation_id` int(255) UNSIGNED NOT NULL,
  `description` text,
  `current_action_owner_id` text,
  `next_action_owners` text,
  `current_approval_level` text,
  `next_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_rate_contract`
--

CREATE TABLE `history_rate_contract` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) UNSIGNED NOT NULL,
  `rate_contract_id` int(255) UNSIGNED NOT NULL,
  `description` text,
  `current_action_owner_id` text,
  `next_action_owners` text,
  `current_approval_level` text,
  `next_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_rate_contract_request`
--

CREATE TABLE `history_rate_contract_request` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `rate_contract_request_id` int(255) NOT NULL,
  `description` text,
  `current_action_owner_id` text,
  `next_action_owners` text,
  `current_approval_level` text,
  `next_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_stock_item`
--

CREATE TABLE `history_stock_item` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `stock_item_id` int(255) NOT NULL,
  `description` text,
  `current_action_owner_id` text,
  `next_action_owners` text,
  `current_approval_level` text,
  `next_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_stock_item_issue_request`
--

CREATE TABLE `history_stock_item_issue_request` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `stock_item_issue_request_id` int(255) NOT NULL,
  `description` text,
  `current_action_owner_id` text,
  `next_action_owners` text,
  `current_approval_level` text,
  `next_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_stock_item_request`
--

CREATE TABLE `history_stock_item_request` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `stock_item_request_id` int(255) NOT NULL,
  `description` text,
  `current_action_owner_id` text,
  `next_action_owners` text,
  `current_approval_level` text,
  `next_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_stock_item_return_request`
--

CREATE TABLE `history_stock_item_return_request` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `stock_item_return_request_id` int(255) NOT NULL,
  `description` text,
  `current_action_owner_id` text,
  `next_action_owners` text,
  `current_approval_level` text,
  `next_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_stock_transfer`
--

CREATE TABLE `history_stock_transfer` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `stock_transfer_request_id` int(255) NOT NULL,
  `description` text,
  `current_action_owner_id` text,
  `next_action_owners` text,
  `current_approval_level` text,
  `next_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `histroy_rn_receiving`
--

CREATE TABLE `histroy_rn_receiving` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) UNSIGNED NOT NULL,
  `receiving_id` int(255) UNSIGNED NOT NULL,
  `description` text,
  `current_action_owner_id` text,
  `next_action_owners` text,
  `current_approval_level` text,
  `next_approval_level` text,
  `decision` text,
  `decision_notes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_master`
--

CREATE TABLE `item_master` (
  `id` int(255) UNSIGNED NOT NULL,
  `item_group_id` varchar(255) DEFAULT NULL,
  `item_ingroup_id` varchar(255) DEFAULT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  `template_id` int(255) DEFAULT NULL,
  `creation_request_id` int(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `u_o_m` varchar(45) DEFAULT NULL,
  `field_1` text,
  `field_2` text,
  `field_3` text,
  `field_4` text,
  `field_5` text,
  `field_6` text,
  `field_7` text,
  `field_8` text,
  `field_9` text,
  `field_10` text,
  `field_11` text,
  `field_12` text,
  `field_13` text,
  `field_14` text,
  `field_15` text,
  `field_16` text,
  `field_17` text,
  `field_18` text,
  `field_19` text,
  `field_20` text,
  `picture` varchar(255) DEFAULT 'image_not_available.png',
  `images` text,
  `status` varchar(255) NOT NULL DEFAULT 'Pending Level 1 Approval',
  `approval_level` varchar(255) DEFAULT '1',
  `active` varchar(255) NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_master`
--

INSERT INTO `item_master` (`id`, `item_group_id`, `item_ingroup_id`, `created_by`, `company_id`, `project_id`, `template_id`, `creation_request_id`, `prefix`, `description`, `u_o_m`, `field_1`, `field_2`, `field_3`, `field_4`, `field_5`, `field_6`, `field_7`, `field_8`, `field_9`, `field_10`, `field_11`, `field_12`, `field_13`, `field_14`, `field_15`, `field_16`, `field_17`, `field_18`, `field_19`, `field_20`, `picture`, `images`, `status`, `approval_level`, `active`, `created_at`, `updated_at`) VALUES
(1, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'OYSTER PERPETUAL YACHT–MASTER 42 (m116619lb)\nThe Rolex Oyster Perpetual Yacht-Master 42 is a 42 mm model sailing watch. \nThe model is equipped with calibre 3235 and is created from 18 ct white gold.\nThe model has a bidirectional rotatable bezel with a raised 60-minute graduation. \nThe Yacht-Master 42 is fitted with a Cerachrom insert in matt-black ceramic and a black lacquer dial. \nThe Yacht-Master 42 offers exceptional legibility in all circumstances, and especially in the dark, thanks to its Chromalight display. The broad hands and hour markers are filled with a luminescent material emitting a long-lasting glow.  \nThe Yacht-Master 42 carries the Superlative Chronometer certification, which ensures excellent performance on the wrist.\n\nhttps://www.rolex.com/watches/submariner/m116619lb-0001.html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-07-30 04:35:34', '2019-07-30 04:35:34'),
(2, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'DATE JUST 3255 MOVEMENT\nThe Day-Date 40 is equipped with a new-generation movement, calibre 3255.\nThe dial is the distinctive face of a Rolex watch, the feature most responsible for its identity and readability. Characterised by hour markers fashioned from 18 ct gold to prevent tarnishing.\n\nReference\n228238\nMODEL CASE\nOyster, 40 mm, yellow gold\nOYSTER ARCHITECTURE\nMonobloc middle case, screw-down case back and winding crown\nDIAMETER\n40 mm\nMATERIAL\n18 ct yellow gold\nBEZEL\nFluted\nWINDING CROWN\nScrew-down, Twinlock double waterproofness system\nCRYSTAL\nScratch-resistant sapphire, Cyclops lens over the date\nWATER-RESISTANCE\nWaterproof to 100 metres / 330 feet\nMOVEMENT\nPerpetual, mechanical, self-winding\nCALIBRE\n3255, Manufacture Rolex\nPRECISION\n-2/+2 sec/day, after casing\nFUNCTIONS\nCentre hour, minute and seconds hands Instantaneous day and date in apertures, unrestricted rapid-setting. Stop-seconds for precise time setting\nOSCILLATOR\nParamagnetic blue Parachrom hairspring. High-performance Paraflex shock absorbers\nWINDING\nBidirectional self-winding via Perpetual rotor\nPOWER RESERVE\nApproximately 70 hours\nBRACELET\nPresident, semi-circular three-piece links\nBRACELET MATERIAL\n18 ct yellow gold\nCLASP\nConcealed folding Crownclasp\nDIAL\nWhite\nCERTIFICATION\nSuperlative Chronometer (COSC + Rolex certification after casing)\n\nhttps://www.rolex.com/watches/day-date/m228238-0042.html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-07-30 04:35:34', '2019-07-30 04:35:34'),
(3, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'ROLEX AIR-KING 116900\nMODEL CASE\nOyster, 40 mm, Oystersteel\nOYSTER ARCHITECTURE\nMonobloc middle case, screw-down case back and winding crown\nDIAMETER\n40 mm\nMATERIAL\nOystersteel\nBEZEL\nSmooth\nWINDING CROWN\nScrew-down, Twinlock double waterproofness system\nCRYSTAL\nScratch-resistant sapphire\nWATER-RESISTANCE\nWaterproof to 100 metres / 330 feet\nMOVEMENT\nPerpetual, mechanical , self-winding , with a magnetic shield to protect the movement\nCALIBRE\n3131, Manufacture Rolex\nPRECISION\n-2/+2 sec/day, after casing\nFUNCTIONS\nCentre hour, minute and seconds hands. Stop-seconds for precise time setting\nOSCILLATOR\nParamagnetic blue Parachrom hairspring\nWINDING\nBidirectional self-winding via Perpetual rotor\nPOWER RESERVE\nApproximately 48 hours\nBRACELET\nOyster, flat three-piece links\nBRACELET MATERIAL\nOystersteel\nCLASP\nFolding Oysterclasp with Easylink 5 mm comfort extension link\nDIAL\nBlack\nDETAILS\nHighly legible Chromalight display with long-lasting blue luminescence\nCERTIFICATION\nSuperlative Chronometer (COSC + Rolex certification after casing)\n\nhttps://www.rolex.com/watches/air-king/m116900-0001.html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-07-30 04:35:34', '2019-07-30 04:35:34'),
(4, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'COSMOGRAPH DAYTONA 116503\nMODEL CASE\nOyster, 40 mm, Oystersteel and yellow gold\nOYSTER ARCHITECTURE\nMonobloc middle case, screw-down case back and winding crown\nDIAMETER\n40 mm\nMATERIAL\nYellow Rolesor - combination of Oystersteel and 18 ct yellow gold\nBEZEL\nFixed, with engraved tachymetric scale, in 18 ct yellow gold\nWINDING CROWN\nScrew-down, Triplock triple waterproofness system\nCRYSTAL\nScratch-resistant sapphire\nWATER-RESISTANCE\nWaterproof to 100 metres / 330 feet\nMOVEMENT\nPerpetual, mechanical chronograph, self-winding\nCALIBRE\n4130, Manufacture Rolex\nPRECISION\n-2/+2 sec/day, after casing\nFUNCTIONS\nCentre hour, minute and seconds hands, small seconds hand at 6 o\'clock. Chronograph (centre hand) accurate to within 1/8 of a second, 30-minute counter at 3 o\'clock and 12-hour counter at 9 o\'clock. Stop seconds for precise time setting\nOSCILLATOR\nParamagnetic blue Parachrom hairspring\nWINDING\nBidirectional self-winding via Perpetual rotor\nPOWER RESERVE\nApproximately 72 hours\nBRACELET\nOyster, flat three-piece links\nBRACELET MATERIAL\nYellow Rolesor - combination of Oystersteel and 18 ct yellow gold\nCLASP\nFolding Oysterlock safety clasp with Easylink 5 mm comfort extension link\nDIAL\nBlack\nDETAILS\nDial with snailed small counters\nCERTIFICATION\nSuperlative Chronometer (COSC + Rolex certification after casing)\n\nhttps://www.rolex.com/watches/cosmograph-daytona/m116503-0004.html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-07-30 04:42:59', '2019-07-30 04:42:59'),
(5, '2', '3', 8, 1, 1, 2, 6, NULL, ' | Rolex Air-King 116900 | Perpetual, mechanical, self-winding, with a magnetic shield to protect the movement | 3131, Manufacture Rolex | -2/+2 sec/day, after casing | Centre hour, minute and seconds hands. Stop-seconds for precise time setting | Paramagnetic blue Parachrom hairspring | Bidirectional self-winding via Perpetual rotor  | Approximately 48 hours | Oyster, flat three-piece links - Oystersteel (Material) | Folding Oysterclasp with Easylink 5 mm comfort extension link | Black with highly legible Chromalight display with long-lasting blue luminescence | Superlative Chronometer (COSC + Rolex certification after casing) | Oyster, 40 mm, Oystersteel | Monobloc middle case, screw-down case back and winding crown | 40 mm | Oystersteel | Smooth  | Scratch-resistant sapphire | Waterproof to 100 metres / 330 feet |', 'piece', 'Rolex Air-King 116900', 'Perpetual, mechanical, self-winding, with a magnetic shield to protect the movement', '3131, Manufacture Rolex', '-2/+2 sec/day, after casing', 'Centre hour, minute and seconds hands. Stop-seconds for precise time setting', 'Paramagnetic blue Parachrom hairspring', 'Bidirectional self-winding via Perpetual rotor ', 'Approximately 48 hours', 'Oyster, flat three-piece links - Oystersteel (Material)', 'Folding Oysterclasp with Easylink 5 mm comfort extension link', 'Black with highly legible Chromalight display with long-lasting blue luminescence', 'Superlative Chronometer (COSC + Rolex certification after casing)', 'Oyster, 40 mm, Oystersteel', 'Monobloc middle case, screw-down case back and winding crown', '40 mm', 'Oystersteel', 'Smooth ', 'Scratch-resistant sapphire', 'Waterproof to 100 metres / 330 feet', '', '1561736316355678-hp-pavilion-11t-n000-x360.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-08-05 02:56:56', '2019-08-05 04:16:28'),
(6, '2', '1', 8, 1, 1, 2, 4, NULL, ' | YACHT–MASTER 42 (m116619lb) | Perpetual, mechanical, self-winding | 3235, Manufacture Rolex | -2/+2 sec/day, after casing | Centre hour, minute and seconds hands. Instantaneous date with rapid setting. Stop-seconds for precise  | Paramagnetic blue Parachrom hairspring. High-performance Paraflex shock absorbers | Bidirectional self-winding via Perpetual rotor | Approximately 70 hours | Oysterflex, Flexible metal blades overmoulded with high-performance elastomer | Folding Oysterlock safety clasp with Rolex Glidelock extension system | Black, Highly legible Chromalight display with long-lasting blue luminescence | Superlative Chronometer (COSC + Rolex certification after casing) | Oyster, 42 mm, white gold | Monobloc middle case, screw-down case back and winding crown | 42 mm | 18 ct white gold | Bidirectional rotatable 60-minute graduated bezel with matt black Cerachrom insert in ceramic, polished raised numerals and graduations | Scratch-resistant sapphire, Cyclops lens over the date | Waterproof to 100 metres / 330 feet |', 'Piece', 'YACHT–MASTER 42 (m116619lb)', 'Perpetual, mechanical, self-winding', '3235, Manufacture Rolex', '-2/+2 sec/day, after casing', 'Centre hour, minute and seconds hands. Instantaneous date with rapid setting. Stop-seconds for precise ', 'Paramagnetic blue Parachrom hairspring. High-performance Paraflex shock absorbers', 'Bidirectional self-winding via Perpetual rotor', 'Approximately 70 hours', 'Oysterflex, Flexible metal blades overmoulded with high-performance elastomer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1561736316355678-hp-pavilion-11t-n000-x360.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-08-06 02:15:40', '2019-08-06 02:32:06'),
(7, '2', '2', 8, 1, 1, 2, 5, NULL, ' | DATEJUST 36, 2019 Model | Perpetual, mechanical, self-winding | 3235, Manufacture Rolex | -2/+2 sec/day, after casing | Centre hour, minute and seconds hands Instantaneous day and date in apertures, unrestricted rapid-setting. Stop-seconds for precise time setting | Paramagnetic blue Parachrom hairspring. High-performance Paraflex shock absorbers | Bidirectional self-winding via Perpetual rotor | Approximately 70 hours | Oysterflex, Flexible metal blades overmoulded with high-performance elastomer | Concealed folding Crownclasp  | White | Superlative Chronometer (COSC + Rolex certification after casing) | Oyster, 42 mm, yellow gold | Monobloc middle case, screw-down case back and winding crown | 40 mm | 18 ct yellow gold | Fluted | Scratch-resistant sapphire, Cyclops lens over the date | Waterproof to 100 metres / 330 feet |', 'Piece', 'DATEJUST 36, 2019 Model', 'Perpetual, mechanical, self-winding', '3235, Manufacture Rolex', '-2/+2 sec/day, after casing', 'Centre hour, minute and seconds hands Instantaneous day and date in apertures, unrestricted rapid-setting. Stop-seconds for precise time setting', 'Paramagnetic blue Parachrom hairspring. High-performance Paraflex shock absorbers', 'Bidirectional self-winding via Perpetual rotor', 'Approximately 70 hours', 'Oysterflex, Flexible metal blades overmoulded with high-performance elastomer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1561736316355678-hp-pavilion-11t-n000-x360.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-08-06 02:27:47', '2019-08-06 02:32:34'),
(8, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Casio G-Shock Watch reference 11-MG9986-3-ZX', 'pieces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-08-06 02:50:13', '2019-08-06 02:50:13'),
(9, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Ted Lapidus Burbon Red Silk Tie (Ref# 11TY-78-PO)', 'pieces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-08-06 02:55:26', '2019-08-06 02:55:26'),
(10, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Ted Lapidus Glacier White Silk Shirt (Ref# 11PW-76-GH)', 'pieces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-08-06 02:55:26', '2019-08-06 02:55:26'),
(11, '3', '6', 8, 1, 1, 3, 13, NULL, ' | Lesieur | Mayonnaise | Mayonnaise Zest de Citron | France |', 'Squeezable container of 175 ml.', 'Lesieur', 'Mayonnaise', 'Mayonnaise Zest de Citron', 'France', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1561736316355678-hp-pavilion-11t-n000-x360.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-08-26 02:35:50', '2019-08-26 02:53:37'),
(12, '3', '5', 8, 1, 1, 3, 12, NULL, ' | Lesieur | Mayonnaise | Mayonnaise Forte | France |', 'Squeezable container of 250 ml.', 'Lesieur', 'Mayonnaise', 'Mayonnaise Forte', 'France', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1561736316355678-hp-pavilion-11t-n000-x360.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-08-26 02:37:42', '2019-08-26 02:53:26'),
(13, '3', '4', 8, 1, 1, 3, 11, NULL, ' | Lesieur | Mayonnaise | Mayonnaise Douce |', 'Squeezable container of 250 ml.', 'Lesieur', 'Mayonnaise', 'Mayonnaise Douce', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1561736316355678-hp-pavilion-11t-n000-x360.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-08-26 02:38:37', '2019-08-26 02:53:18'),
(14, '3', '3', 8, 1, 1, 3, 10, NULL, ' | Lesieur | Table Oil | ISIO 4 OLIVE | France |', 'PET Bottle of 1 liter', 'Lesieur', 'Table Oil', 'ISIO 4 OLIVE', 'France', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1561736316355678-hp-pavilion-11t-n000-x360.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-08-26 02:41:12', '2019-08-26 02:52:57'),
(15, '3', '2', 8, 1, 1, 3, 9, NULL, ' | Lesieur | Table Oil | Coeur de Tournesol | France |', 'PET Bottle of 1.5 liters', 'Lesieur', 'Table Oil', 'Coeur de Tournesol', 'France', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1561736316355678-hp-pavilion-11t-n000-x360.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-08-26 02:42:36', '2019-08-26 02:51:08'),
(16, '3', '1', 8, 1, 1, 3, 8, NULL, ' | Lesieur | Table Oil | Fleur De Colza | France |', 'PET Bottle of 2.5 liters', 'Lesieur', 'Table Oil', 'Fleur De Colza', 'France', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1561736316355678-hp-pavilion-11t-n000-x360.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-08-26 02:43:20', '2019-08-26 02:49:56'),
(17, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Casio G-Shock Chronograph. Rugged. Model CGS-12357', 'piece', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-04 03:10:18', '2019-09-04 03:10:18'),
(18, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Apple Vinagre. acidity @ 15%. Product made in Italy.  PET bottles only. Rotating closing caps. Labeling in English and Arabic.  shelflife no less than 2 years from the date of the Request For Proposals.', 'Boxes of 2.5 liters bottles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-04 03:36:45', '2019-09-04 03:36:45'),
(19, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Vinagre. Maximum acceptable acidity is 19%. Product made in Spain.  Glass bottles with rotating closing caps only. Labeling in English and Arabic.  Shelflife no less than 18 months from the date of the Request For Proposals.', 'Boxes of 1.0 liter bottles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-04 03:36:45', '2019-09-04 03:36:45'),
(20, '5', '1', 8, 1, 1, 5, 15, NULL, ' | Samsung | Note 10 + | 5G | 1000-3456 | Korea |', 'Boxes of 12 pieces', 'Samsung', 'Note 10 +', '5G', '1000-3456', 'Korea', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1567845195samsung.jpg', NULL, 'Fully Approved by Level 3', '3', 'Yes', '2019-09-07 03:33:15', '2019-09-07 03:36:59'),
(21, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'TTest 1', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-12 12:29:18', '2019-09-12 12:29:18'),
(22, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'TTest 2', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-12 12:29:18', '2019-09-12 12:29:18'),
(23, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'TTest 3', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-12 12:29:18', '2019-09-12 12:29:18'),
(24, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'TTest 3', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-12 12:29:18', '2019-09-12 12:29:18'),
(25, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'TTest 4', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-12 12:29:18', '2019-09-12 12:29:18'),
(26, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'sadasd', 'Dozen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-30 13:40:59', '2019-09-30 13:40:59'),
(27, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Testing some', 'Dozen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-30 13:46:45', '2019-09-30 13:46:45'),
(28, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Test', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-09-30 13:53:45', '2019-09-30 13:53:45'),
(29, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Dell SPX 13. RAM 16 GB, 512 GB, Touchscreen', 'laptop(s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-10-30 04:20:42', '2019-10-30 04:20:42'),
(30, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'HP laptop 16GB RAM, 1 TB', 'Boxes of 12 laptops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-10-30 06:00:26', '2019-10-30 06:00:26'),
(31, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Lenovo notebook. ThinkPad X1 Carbon. 16GB, i7 processor. 512 GB', 'box of 3 laptops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
(32, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'HP Printer Laserjet. B&W. 15 pages per minute', 'printers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(33, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'ACER Printer Laserjet. B&W. 25 pages per minute', 'printers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(34, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'GRUNDIG Printer Laserjet. B&W. 25 pages per minute', 'printers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(35, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'SHARP Printer Laserjet. B&W. 25 pages per minute', 'printers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2019-11-05 13:11:05', '2019-11-05 13:11:05'),
(36, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Montre Suisse', 'Pieces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-08-03 09:08:02', '2020-08-03 09:08:02'),
(37, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'abcd', 'kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-09-19 03:36:23', '2020-09-19 03:36:23'),
(38, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'descrit', 'kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-09-19 03:49:05', '2020-09-19 03:49:05'),
(39, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'dsadasdasd', 'dozen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-10-17 00:31:31', '2020-10-17 00:31:31'),
(40, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'fsdfsdf', 'dozen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-10-17 00:36:11', '2020-10-17 00:36:11'),
(43, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'dfsdfs', 'Dozen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-10-17 00:50:09', '2020-10-17 00:50:09'),
(44, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'asdasdas', 'Dozen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-10-17 00:55:32', '2020-10-17 00:55:32'),
(45, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'asdasdas', 'kilo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-10-17 00:55:32', '2020-10-17 00:55:32'),
(46, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'asdasdasdatrtyt', 'Liter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-10-17 01:31:39', '2020-10-17 01:31:39'),
(47, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'sdfsdfdsfs', 'Dozen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-10-17 01:38:56', '2020-10-17 01:38:56'),
(48, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'hhhhjjjkk', 'Liters', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-10-17 01:41:41', '2020-10-17 01:41:41'),
(49, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'dfsdfdsfsf', 'Liters', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-10-17 01:45:40', '2020-10-17 01:45:40'),
(50, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'sadfgdj', 'kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-11-27 07:09:04', '2020-11-27 07:09:04'),
(51, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'wwww', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-12-11 13:48:05', '2020-12-11 13:48:05'),
(52, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'qwert', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2020-12-11 15:09:16', '2020-12-11 15:09:16'),
(53, 'N/A', 'N/A', 4, 1, 1, NULL, NULL, NULL, 'Superman', 'cartons of 12 bottles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'image_not_available.png', NULL, 'Pre Approved by Level (System) As LOM is Not Required', '1', 'Yes', '2021-03-03 13:09:11', '2021-03-03 13:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `item_master_setup`
--

CREATE TABLE `item_master_setup` (
  `id` int(255) UNSIGNED NOT NULL,
  `template_group_id` int(255) NOT NULL,
  `template_ingroup_id` int(255) NOT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `u_o_m` varchar(255) NOT NULL DEFAULT 'Unit Of Measure',
  `field_1` text,
  `field_1_required` varchar(255) DEFAULT NULL,
  `field_2` text,
  `field_2_required` varchar(255) DEFAULT NULL,
  `field_3` text,
  `field_3_required` varchar(255) DEFAULT NULL,
  `field_4` text,
  `field_4_required` varchar(255) DEFAULT NULL,
  `field_5` text,
  `field_5_required` varchar(255) DEFAULT NULL,
  `field_6` text,
  `field_6_required` varchar(255) DEFAULT NULL,
  `field_7` text,
  `field_7_required` varchar(255) DEFAULT NULL,
  `field_8` text,
  `field_8_required` varchar(255) DEFAULT NULL,
  `field_9` text,
  `field_9_required` varchar(255) DEFAULT NULL,
  `field_10` text,
  `field_10_required` varchar(255) DEFAULT NULL,
  `field_11` text,
  `field_11_required` varchar(255) DEFAULT NULL,
  `field_12` text,
  `field_12_required` varchar(255) DEFAULT NULL,
  `field_13` text,
  `field_13_required` varchar(255) DEFAULT NULL,
  `field_14` text,
  `field_14_required` varchar(255) DEFAULT NULL,
  `field_15` text,
  `field_15_required` varchar(255) DEFAULT NULL,
  `field_16` text,
  `field_16_required` varchar(255) DEFAULT NULL,
  `field_17` text,
  `field_17_required` varchar(255) DEFAULT NULL,
  `field_18` text,
  `field_18_required` varchar(255) DEFAULT NULL,
  `field_19` text,
  `field_19_required` varchar(255) DEFAULT NULL,
  `field_20` text,
  `field_20_required` varchar(255) DEFAULT NULL,
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_master_setup`
--

INSERT INTO `item_master_setup` (`id`, `template_group_id`, `template_ingroup_id`, `created_by`, `company_id`, `template_name`, `prefix`, `u_o_m`, `field_1`, `field_1_required`, `field_2`, `field_2_required`, `field_3`, `field_3_required`, `field_4`, `field_4_required`, `field_5`, `field_5_required`, `field_6`, `field_6_required`, `field_7`, `field_7_required`, `field_8`, `field_8_required`, `field_9`, `field_9_required`, `field_10`, `field_10_required`, `field_11`, `field_11_required`, `field_12`, `field_12_required`, `field_13`, `field_13_required`, `field_14`, `field_14_required`, `field_15`, `field_15_required`, `field_16`, `field_16_required`, `field_17`, `field_17_required`, `field_18`, `field_18_required`, `field_19`, `field_19_required`, `field_20`, `field_20_required`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 8, 1, 'Rolex Watches', NULL, 'Unit Of Measure', 'MOVEMENT', 'Yes', 'CALIBRE', 'Yes', 'PRECISION', 'Yes', 'FUNCTIONS', 'Yes', 'OSCILLATOR', 'Yes', 'WINDING', 'Yes', 'POWER RESERVE', 'Yes', 'BRACELET', 'Yes', 'BRACELET MATERIAL', 'Yes', 'CLASP', 'Yes', 'DIAL', 'Yes', 'CERTIFICATION', 'Yes', 'MODEL CASE', 'Yes', 'OYSTER ARCHITECTURE', 'Yes', 'DIAMETER', 'Yes', 'MATERIAL', 'Yes', 'BEZEL', 'Yes', 'CRYSTAL', 'Yes', 'WATER-RESISTANCE', 'Yes', 'Ogeo-None', 'No', 'No', '2019-08-05 02:40:50', '2019-08-05 03:50:41'),
(2, 2, 2, 8, 1, 'ROLEX WATCH', NULL, 'Unit Of Measure', 'MODEL', 'Yes', 'MOVEMENT', 'Yes', 'CALIBRE', 'Yes', 'PRECISION', 'Yes', 'FUNCTIONS', 'Yes', 'OSCILLATOR', 'Yes', 'WINDING', 'Yes', 'POWER RESERVE', 'Yes', 'BRACELET', 'Yes', 'CLASP', 'Yes', 'DIAL', 'No', 'CERTIFICATION', 'Yes', 'MODEL CASE', 'Yes', 'OYSTER ARCHITECTURE', 'Yes', 'DIAMETER', 'Yes', 'MATERIAL', 'Yes', 'BEZEL', 'Yes', 'CRYSTAL', 'Yes', 'WATER-RESISTANCE', 'Yes', 'Ogeo-None', 'No', 'Yes', '2019-08-05 03:51:15', '2019-08-05 03:51:15'),
(3, 3, 3, 8, 1, 'Table Oil & Mayonnaise', NULL, 'Unit Of Measure', 'Brand', 'Yes', 'Category', 'Yes', 'Product Name', 'Yes', 'Country of Origin', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2019-08-26 02:33:17', '2019-08-26 02:33:17'),
(4, 1, 1, 58, 4, 'Foodstuff', NULL, 'Unit Of Measure', 'Calibre', 'Yes', 'Shelf life', 'Yes', 'Country of origin', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(5, 4, 4, 8, 1, 'Mobile Phones', NULL, 'Unit Of Measure', 'Brand', 'Yes', 'Model', 'Yes', 'Telecommunication Standard', 'No', 'Finance GL', 'Yes', 'Country of Origin', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2019-09-07 03:30:45', '2019-09-07 03:30:45'),
(6, 1, 1, 74, 5, 'Laptops', NULL, 'Unit Of Measure', 'Brand', 'Yes', 'Make', 'Yes', 'Serial Number', 'Yes', 'HHD', 'Yes', 'Processor', 'Yes', 'Display Size', 'Yes', 'Motherboard', 'Yes', 'Weight', 'Yes', 'Country of origin', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(51, 1, 1, 33, 7, 'temp5', NULL, 'Unit Of Measure', 'head1', 'Yes', 'head2', 'No', 'head3', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2020-09-30 22:54:47', '2020-09-30 22:54:47'),
(52, 1, 1, 33, 7, 'temp6', NULL, 'Unit Of Measure', 'head1', 'Yes', 'head2', 'No', 'head3', 'Yes', 'head4', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2020-09-30 22:54:47', '2020-09-30 22:54:47'),
(53, 1, 1, 323, 10, 'firsttemp', NULL, 'Unit Of Measure', 'head1', 'Yes', 'head2', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2020-10-01 00:51:45', '2020-10-01 00:51:45'),
(56, 1, 1, 324, 11, 't67_tem', NULL, 'Unit Of Measure', 'head1', 'Yes', 'head2', 'Yes', 'head3', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2020-10-06 22:56:00', '2020-10-06 22:56:00'),
(57, 1, 1, 324, 11, 't67_tem2', NULL, 'Unit Of Measure', 'header1', 'Yes', 'header2', 'No', 'header3', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2020-10-06 22:56:00', '2020-10-06 22:56:00'),
(62, 1, 1, 343, 12, 'aa', NULL, 'Unit Of Measure', 'ljlj', 'Yes', 'ljl', 'Yes', 'jl', 'Yes', 'j,', 'Yes', 'n,', 'Yes', 'lk', 'Yes', 'jl', 'Yes', 'ml', 'Yes', 'jl', 'Yes', 'm.', 'Yes', 'j', 'Yes', 'j.', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2020-12-12 21:15:03', '2020-12-12 21:15:03'),
(63, 1, 1, 343, 12, 'asdf', NULL, 'Unit Of Measure', 're', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2020-12-12 21:15:03', '2020-12-12 21:15:03'),
(73, 1, 1, 359, 14, 'abc', NULL, 'Unit Of Measure', 'acccc', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-01-22 18:21:50', '2021-01-22 18:21:50'),
(74, 1, 1, 359, 14, 'jlkj', NULL, 'Unit Of Measure', 'lkj', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'lj', 'Yes', 'lj', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-01-22 18:21:50', '2021-01-22 18:21:50'),
(75, 1, 1, 359, 14, 'lkjl', NULL, 'Unit Of Measure', 'lkj', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'lj', 'Yes', 'j', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-01-22 18:21:51', '2021-01-22 18:21:51'),
(76, 1, 1, 359, 14, 'kjljkl', NULL, 'Unit Of Measure', 'lj', 'Yes', 'lkj', 'Yes', 'lj', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-01-22 18:21:51', '2021-01-22 18:21:51'),
(119, 1, 1, 360, 15, 'Laptops', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-01-30 15:42:30', '2021-01-30 15:42:30'),
(120, 1, 1, 360, 15, 'Monitors', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-01-30 15:42:30', '2021-01-30 15:42:30'),
(121, 1, 1, 360, 15, 'Printers', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-01-30 15:42:30', '2021-01-30 15:42:30'),
(191, 1, 1, 344, 13, 'adsf', NULL, 'Unit Of Measure', 'as', 'Yes', 'df', 'Yes', 'asdf', 'Yes', 'asd', 'Yes', 'fa', 'Yes', 'sdf', 'Yes', 'asd', 'Yes', 'f', 'Yes', 'asdf', 'Yes', 'asdf', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(192, 1, 1, 344, 13, 'zxc', NULL, 'Unit Of Measure', 'v', 'Yes', 'zcxv', 'Yes', 'zxc', 'Yes', 'vz', 'Yes', 'xcv', 'Yes', 'zxcv', 'Yes', 'zx', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(193, 1, 1, 344, 13, 'wwqer', NULL, 'Unit Of Measure', 'qwe', 'Yes', 'rq', 'Yes', 'wer', 'Yes', 'qwerq', 'Yes', 'wer', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(194, 1, 1, 344, 13, 'rfv ', NULL, 'Unit Of Measure', 'v', 'Yes', 'gg', 'Yes', 'v', 'Yes', 'b', 'Yes', 'b', 'Yes', 'b', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(195, 1, 1, 344, 13, 'asdf', NULL, 'Unit Of Measure', 'l', 'Yes', 'jlk', 'Yes', 'jl', 'Yes', 'jl', 'Yes', 'jl', 'Yes', 'kj', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(196, 1, 1, 344, 13, 'l', NULL, 'Unit Of Measure', 'kjl', 'Yes', 'kjl', 'Yes', 'jl', 'Yes', 'jl', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(197, 1, 1, 344, 13, 'samad', NULL, 'Unit Of Measure', 'asdfl', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'lkkj', 'Yes', 'ljk', 'Yes', 'l', 'Yes', 'kjl', 'Yes', 'kjl', 'Yes', 'kjl', 'Yes', 'jl', 'Yes', 'jl', 'Yes', 'kj', 'Yes', 'lkj', 'Yes', 'lj', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(198, 1, 1, 344, 13, 'younas', NULL, 'Unit Of Measure', 'lkkj', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'kjl', 'Yes', 'j', 'Yes', 'l', 'Yes', 'kjl', 'Yes', 'kjl', 'Yes', 'kjl', 'Yes', 'jl', 'Yes', 'jl', 'Yes', 'kj', 'Yes', 'lkj', 'Yes', 'lj', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(199, 1, 1, 344, 13, 'lj', NULL, 'Unit Of Measure', 'lkkj', 'Yes', 'lkkj', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'ljk', 'Yes', 'lj', 'Yes', 'lj', 'Yes', 'lk', 'Yes', 'jl', 'Yes', 'jl', 'Yes', 'kj', 'Yes', 'kj', 'Yes', 'lkj', 'Yes', 'lj', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(200, 1, 1, 344, 13, 'lkj', NULL, 'Unit Of Measure', 'lj', 'Yes', 'lkj', 'Yes', 'lj', 'Yes', 'lkj', 'Yes', 'lkj', 'Yes', 'ln', 'Yes', ',mn', 'Yes', 'ngy', 'Yes', 'fy', 'Yes', 'dy', 'Yes', 'gf\'', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(201, 1, 1, 344, 13, 'nbv', NULL, 'Unit Of Measure', 'fjh', 'Yes', 'vv', 'Yes', 'bnv', 'Yes', 'nv', 'Yes', 'nbv', 'Yes', 'n', 'Yes', 'vjh', 'Yes', 'u', 'Yes', 'fy', 'Yes', 'dy', 'Yes', 'gf\'', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 14:17:30', '2021-02-03 14:17:30'),
(202, 1, 1, 361, 16, 'Laptops 1', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:18', '2021-02-03 22:26:18'),
(203, 1, 1, 361, 16, 'Laptops 2', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:18', '2021-02-03 22:26:18'),
(204, 1, 1, 361, 16, 'Laptops 3', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:18', '2021-02-03 22:26:18'),
(205, 1, 1, 361, 16, 'Laptops 4', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:18', '2021-02-03 22:26:18'),
(206, 1, 1, 361, 16, 'Laptops 5', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:18', '2021-02-03 22:26:18'),
(207, 1, 1, 361, 16, 'Laptops 6', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(208, 1, 1, 361, 16, 'Laptops 7', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(209, 1, 1, 361, 16, 'Laptops 8', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(210, 1, 1, 361, 16, 'Laptops 9', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(211, 1, 1, 361, 16, 'Laptops 10', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(212, 1, 1, 361, 16, 'Laptops 11', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'CPU', 'Yes', 'Hard Drive Capacity', 'Yes', 'Type of RAM', 'Yes', 'Screen Size', 'Yes', 'Operating System', 'Yes', 'Graphic Chip', 'Yes', 'Battery Size', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(213, 1, 1, 361, 16, 'Printers 1', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(214, 1, 1, 361, 16, 'Printers 2', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(215, 1, 1, 361, 16, 'Printers 3', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(216, 1, 1, 361, 16, 'Printers 4', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(217, 1, 1, 361, 16, 'Printers 5', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(218, 1, 1, 361, 16, 'Printers 6', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(219, 1, 1, 361, 16, 'Printers 7', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(220, 1, 1, 361, 16, 'Printers 8', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(221, 1, 1, 361, 16, 'Printers 9', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(222, 1, 1, 361, 16, 'Printers 10', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(223, 1, 1, 361, 16, 'Printers 11', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(224, 1, 1, 361, 16, 'Printers 12', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(225, 1, 1, 361, 16, 'Printers 13', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(226, 1, 1, 361, 16, 'Printers 14', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(227, 1, 1, 361, 16, 'Printers 15', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(228, 1, 1, 361, 16, 'Printers 16', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(229, 1, 1, 361, 16, 'Printers 17', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(230, 1, 1, 361, 16, 'Printers 18', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(231, 1, 1, 361, 16, 'Printers 19', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(232, 1, 1, 361, 16, 'Printers 20', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(233, 1, 1, 361, 16, 'Printers 21', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(234, 1, 1, 361, 16, 'Printers 22', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(235, 1, 1, 361, 16, 'Printers 23', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(236, 1, 1, 361, 16, 'Printers 24', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(237, 1, 1, 361, 16, 'Printers 25', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(238, 1, 1, 361, 16, 'Printers 26', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(239, 1, 1, 361, 16, 'Printers 27', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(240, 1, 1, 361, 16, 'Printers 28', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(241, 1, 1, 361, 16, 'Printers 29', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(242, 1, 1, 361, 16, 'Printers 30', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(243, 1, 1, 361, 16, 'Printers 31', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(244, 1, 1, 361, 16, 'Printers 32', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(245, 1, 1, 361, 16, 'Printers 33', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(246, 1, 1, 361, 16, 'Printers 34', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(247, 1, 1, 361, 16, 'Printers 35', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(248, 1, 1, 361, 16, 'Printers 36', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(249, 1, 1, 361, 16, 'Printers 37', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(250, 1, 1, 361, 16, 'Printers 38', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(251, 1, 1, 361, 16, 'Printers 39', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(252, 1, 1, 361, 16, 'Printers 40', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(253, 1, 1, 361, 16, 'Printers 41', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(254, 1, 1, 361, 16, 'Printers 42', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(255, 1, 1, 361, 16, 'Printers 43', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(256, 1, 1, 361, 16, 'Printers 44', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(257, 1, 1, 361, 16, 'Printers 45', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(258, 1, 1, 361, 16, 'Printers 46', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(259, 1, 1, 361, 16, 'Printers 47', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(260, 1, 1, 361, 16, 'Printers 48', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(261, 1, 1, 361, 16, 'Printers 49', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(262, 1, 1, 361, 16, 'Printers 50', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(263, 1, 1, 361, 16, 'Printers 51', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19');
INSERT INTO `item_master_setup` (`id`, `template_group_id`, `template_ingroup_id`, `created_by`, `company_id`, `template_name`, `prefix`, `u_o_m`, `field_1`, `field_1_required`, `field_2`, `field_2_required`, `field_3`, `field_3_required`, `field_4`, `field_4_required`, `field_5`, `field_5_required`, `field_6`, `field_6_required`, `field_7`, `field_7_required`, `field_8`, `field_8_required`, `field_9`, `field_9_required`, `field_10`, `field_10_required`, `field_11`, `field_11_required`, `field_12`, `field_12_required`, `field_13`, `field_13_required`, `field_14`, `field_14_required`, `field_15`, `field_15_required`, `field_16`, `field_16_required`, `field_17`, `field_17_required`, `field_18`, `field_18_required`, `field_19`, `field_19_required`, `field_20`, `field_20_required`, `active`, `created_at`, `updated_at`) VALUES
(264, 1, 1, 361, 16, 'Printers 52', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(265, 1, 1, 361, 16, 'Printers 53', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(266, 1, 1, 361, 16, 'Printers 54', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(267, 1, 1, 361, 16, 'Printers 55', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(268, 1, 1, 361, 16, 'Printers 56', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(269, 1, 1, 361, 16, 'Printers 57', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(270, 1, 1, 361, 16, 'Printers 58', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(271, 1, 1, 361, 16, 'Printers 59', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(272, 1, 1, 361, 16, 'Printers 60', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(273, 1, 1, 361, 16, 'Printers 61', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(274, 1, 1, 361, 16, 'Printers 62', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(275, 1, 1, 361, 16, 'Printers 63', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(276, 1, 1, 361, 16, 'Printers 64', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(277, 1, 1, 361, 16, 'Printers 65', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(278, 1, 1, 361, 16, 'Printers 66', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(279, 1, 1, 361, 16, 'Printers 67', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(280, 1, 1, 361, 16, 'Printers 68', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(281, 1, 1, 361, 16, 'Printers 69', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(282, 1, 1, 361, 16, 'Printers 70', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(283, 1, 1, 361, 16, 'Printers 71', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(284, 1, 1, 361, 16, 'Printers 72', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(285, 1, 1, 361, 16, 'Printers 73', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(286, 1, 1, 361, 16, 'Printers 74', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(287, 1, 1, 361, 16, 'Printers 75', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(288, 1, 1, 361, 16, 'Printers 76', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(289, 1, 1, 361, 16, 'Printers 77', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(290, 1, 1, 361, 16, 'Printers 78', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(291, 1, 1, 361, 16, 'Printers 79', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(292, 1, 1, 361, 16, 'Printers 80', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Printing Technology', 'Yes', 'Printing Speed', 'Yes', 'Density', 'Yes', 'Print Size', 'Yes', 'Ink Droplet Size', 'Yes', 'Image Resolution', 'Yes', 'Color Gamut', 'Yes', 'Ink Configuration', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(293, 1, 1, 361, 16, 'Monitors 1', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(294, 1, 1, 361, 16, 'Monitors 2', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(295, 1, 1, 361, 16, 'Monitors 3', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(296, 1, 1, 361, 16, 'Monitors 4', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(297, 1, 1, 361, 16, 'Monitors 5', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(298, 1, 1, 361, 16, 'Monitors 6', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(299, 1, 1, 361, 16, 'Monitors 7', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(300, 1, 1, 361, 16, 'Monitors 8', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(301, 1, 1, 361, 16, 'Monitors 9', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(302, 1, 1, 361, 16, 'Monitors 10', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(303, 1, 1, 361, 16, 'Monitors 11', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(304, 1, 1, 361, 16, 'Monitors 12', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(305, 1, 1, 361, 16, 'Monitors 13', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(306, 1, 1, 361, 16, 'Monitors 14', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(307, 1, 1, 361, 16, 'Monitors 15', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(308, 1, 1, 361, 16, 'Monitors 16', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(309, 1, 1, 361, 16, 'Monitors 17', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(310, 1, 1, 361, 16, 'Monitors 18', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(311, 1, 1, 361, 16, 'Monitors 19', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(312, 1, 1, 361, 16, 'Monitors 20', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(313, 1, 1, 361, 16, 'Monitors 21', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(314, 1, 1, 361, 16, 'Monitors 22', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(315, 1, 1, 361, 16, 'Monitors 23', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(316, 1, 1, 361, 16, 'Monitors 24', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(317, 1, 1, 361, 16, 'Monitors 25', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(318, 1, 1, 361, 16, 'Monitors 26', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(319, 1, 1, 361, 16, 'Monitors 27', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(320, 1, 1, 361, 16, 'Monitors 28', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(321, 1, 1, 361, 16, 'Monitors 29', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(322, 1, 1, 361, 16, 'Monitors 30', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(323, 1, 1, 361, 16, 'Monitors 31', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(324, 1, 1, 361, 16, 'Monitors 32', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(325, 1, 1, 361, 16, 'Monitors 33', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(326, 1, 1, 361, 16, 'Monitors 34', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(327, 1, 1, 361, 16, 'Monitors 35', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(328, 1, 1, 361, 16, 'Monitors 36', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(329, 1, 1, 361, 16, 'Monitors 37', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(330, 1, 1, 361, 16, 'Monitors 38', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(331, 1, 1, 361, 16, 'Monitors 39', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(332, 1, 1, 361, 16, 'Monitors 40', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(333, 1, 1, 361, 16, 'Monitors 41', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(334, 1, 1, 361, 16, 'Monitors 42', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(335, 1, 1, 361, 16, 'Monitors 43', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(336, 1, 1, 361, 16, 'Monitors 44', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(337, 1, 1, 361, 16, 'Monitors 45', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(338, 1, 1, 361, 16, 'Monitors 46', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19'),
(339, 1, 1, 361, 16, 'Monitors 47', NULL, 'Unit Of Measure', 'Country of Origin', 'Yes', 'Make', 'Yes', 'Model', 'Yes', 'Size', 'Yes', 'Refresh Rate', 'Yes', 'Resolution', 'Yes', 'Pixel Per Inch', 'Yes', 'Response Time', 'Yes', 'Panel Technology', 'Yes', 'Wattage', 'Yes', 'Voltage', 'Yes', 'Recommended Price', 'Yes', 'Warrantee in Years', 'Yes', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Ogeo-None', 'No', 'Yes', '2021-02-03 22:26:19', '2021-02-03 22:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `item_requests`
--

CREATE TABLE `item_requests` (
  `id` int(255) UNSIGNED NOT NULL,
  `item_request_group_id` int(255) NOT NULL,
  `item_request_ingroup_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  `requester_id` int(255) UNSIGNED NOT NULL,
  `item_description` text NOT NULL,
  `item_link` text,
  `file1` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Created and Assigned to the Library of Materials Administrator',
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_requests`
--

INSERT INTO `item_requests` (`id`, `item_request_group_id`, `item_request_ingroup_id`, `company_id`, `project_id`, `requester_id`, `item_description`, `item_link`, `file1`, `file2`, `file3`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 7, 'cvmvchgy ui   uuiuiu  uiii iub8u iouiub  eeaa', NULL, '', '', '', 'Request Cancelled By Originator', 'Yes', '2019-07-30 05:39:10', '2019-07-30 05:54:06'),
(2, 2, 2, 1, 1, 7, 'jhhg ;jhhui', 'https://www.rolex.com/watches/cosmograph-daytona/m116503-0004.html', '', '', '', 'Request Cancelled By Originator', 'Yes', '2019-07-30 05:39:50', '2019-07-30 05:54:26'),
(3, 3, 3, 1, 1, 7, 'hgc kkjuyu yyhr', 'https://www.rolex.com/watches/cosmograph-daytona/m116503-0004.html', '1564483249Rolex.docx', '', '', 'Request Cancelled By Originator', 'Yes', '2019-07-30 05:40:49', '2019-07-30 05:54:36'),
(4, 4, 4, 1, 1, 7, 'OYSTER PERPETUAL YACHT–MASTER 42 (m116619lb)\nThe Rolex Oyster Perpetual Yacht-Master 42 is a 42 mm model sailing watch. \nThe model is equipped with calibre 3235 and is created from 18 ct white gold.\nThe model has a bidirectional rotatable bezel with a raised 60-minute graduation. \nThe Yacht-Master 42 is fitted with a Cerachrom insert in matt-black ceramic and a black lacquer dial. \nThe Yacht-Master 42 offers exceptional legibility in all circumstances, and especially in the dark, thanks to its Chromalight display. The broad hands and hour markers are filled with a luminescent material emitting a long-lasting glow.  \nThe Yacht-Master 42 carries the Superlative Chronometer certification, which ensures excellent performance on the wrist.', NULL, '1564988395Rolex.docx', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-08-05 01:59:55', '2019-08-06 02:32:06'),
(5, 5, 5, 1, 1, 7, 'DATE JUST 3255 MOVEMENT\nThe Day-Date 40 is equipped with a new-generation movement, calibre 3255.\nThe dial is the distinctive face of a Rolex watch, the feature most responsible for its identity and readability. Characterised by hour markers fashioned from 18 ct gold to prevent tarnishing.\n\nReference\n228238\nMODEL CASE\nOyster, 40 mm, yellow gold\nOYSTER ARCHITECTURE\nMonobloc middle case, screw-down case back and winding crown\nDIAMETER\n40 mm\nMATERIAL\n18 ct yellow gold\nBEZEL\nFluted\nWINDING CROWN\nScrew-down, Twinlock double waterproofness system\nCRYSTAL\nScratch-resistant sapphire, Cyclops lens over the date\nWATER-RESISTANCE\nWaterproof to 100 metres / 330 feet\nMOVEMENT\nPerpetual, mechanical, self-winding\nCALIBRE\n3255, Manufacture Rolex\nPRECISION\n-2/+2 sec/day, after casing\nFUNCTIONS\nCentre hour, minute and seconds hands Instantaneous day and date in apertures, unrestricted rapid-setting. Stop-seconds for precise time setting\nOSCILLATOR\nParamagnetic blue Parachrom hairspring. High-performance Paraflex shock absorbers\nWINDING\nBidirectional self-winding via Perpetual rotor\nPOWER RESERVE\nApproximately 70 hours\nBRACELET\nPresident, semi-circular three-piece links\nBRACELET MATERIAL\n18 ct yellow gold\nCLASP\nConcealed folding Crownclasp\nDIAL\nWhite\nCERTIFICATION\nSuperlative Chronometer (COSC + Rolex certification after casing)', NULL, '1564989035General T&C.docx', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-08-05 02:10:35', '2019-08-06 02:32:34'),
(6, 6, 6, 1, 1, 7, 'Rolex Air-King 116900\nMODEL CASE\nOyster, 40 mm, Oystersteel\nOYSTER ARCHITECTURE\nMonobloc middle case, screw-down case back and winding crown\nDIAMETER\n40 mm\nMATERIAL\nOystersteel\nBEZEL\nSmooth\nWINDING CROWN\nScrew-down, Twinlock double waterproofness system\nCRYSTAL\nScratch-resistant sapphire\nWATER-RESISTANCE\nWaterproof to 100 metres / 330 feet\nMOVEMENT\nPerpetual, mechanical , self-winding , with a magnetic shield to protect the movement\nCALIBRE\n3131, Manufacture Rolex\nPRECISION\n-2/+2 sec/day, after casing\nFUNCTIONS\nCentre hour, minute and seconds hands. Stop-seconds for precise time setting\nOSCILLATOR\nParamagnetic blue Parachrom hairspring\nWINDING\nBidirectional self-winding via Perpetual rotor\nPOWER RESERVE\nApproximately 48 hours\nBRACELET\nOyster, flat three-piece links\nBRACELET MATERIAL\nOystersteel\nCLASP\nFolding Oysterclasp with Easylink 5 mm comfort extension link\nDIAL\nBlack\nDETAILS\nHighly legible Chromalight display with long-lasting blue luminescence\nCERTIFICATION\nSuperlative Chronometer (COSC + Rolex certification after casing)', 'https://www.rolex.com/watches/air-king/m116900-0001.html', '', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-08-05 02:13:08', '2019-08-05 04:16:28'),
(7, 7, 7, 1, 1, 7, 'asd', NULL, '', '', '', 'Created and Assigned to the Library of Materials Administrator', 'Yes', '2019-08-19 09:12:18', '2019-08-19 09:12:18'),
(8, 8, 8, 1, 1, 7, 'Natural Oil. Bottles of 2.5 liters. Brand: Lesieur, Product: Fleur De Colza', 'http://www.lesieur.fr/Produits/Fleur-de-Colza/Fleur-de-Colza', '1566803158Fleur-de-Colza_product_detail.png', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-08-26 02:05:58', '2019-08-26 02:49:56'),
(9, 9, 9, 1, 1, 7, 'Table Oil. Bottles of 1.5 liters. Brand: Lesieur, Coeur de Tournesol', 'http://www.lesieur.fr/Produits/Coeur-de-Tournesol/Coeur-de-tournesol', '1566803345LT_1L_HD_product_detail.png', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-08-26 02:09:05', '2019-08-26 02:51:08'),
(10, 10, 10, 1, 1, 7, 'Table Oi. Bottles of 1 liter. Brand: Lesieur. ISIO 4 OLIVE', 'http://www.lesieur.fr/Produits/ISIO-4/Huile-ISIO-4-Olive-1L', '1566803661LT_1L_HD_product_detail.png', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-08-26 02:14:21', '2019-08-26 02:52:57'),
(11, 11, 11, 1, 1, 7, 'Mayonnaise Douce. 250 ml container. Lesieur', 'http://www.lesieur.fr/Produits/Toutes-nos-Sauces/Les-Mayonnaises/Mayonnaise-Fine-et-Douce', '1566803881LESIEUR-MAYO-F-D-475G-HD-3011360030504_product_detail.png', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-08-26 02:18:01', '2019-08-26 02:53:18'),
(12, 12, 12, 1, 1, 7, 'Mayonnaise Forte. Container 250 ml. Lesieur', 'http://www.lesieur.fr/Produits/Toutes-nos-Sauces/Les-Mayonnaises/Mayonnaise-Saveur-Forte', '1566804059Mayonnaise-Saveur-Forte_product_detail.png', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-08-26 02:20:59', '2019-08-26 02:53:26'),
(13, 13, 13, 1, 1, 7, 'Mayonnaise Zest de Citron. 150 ml.  Lesieur', 'http://www.lesieur.fr/Produits/Toutes-nos-Sauces/Les-Mayonnaises/Mayonnaise-Touche-de-Citron-et-son-Zeste', '1566804192Mayonnaise-Touche-de-Citron-et-son-Zeste_product_detail.png', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-08-26 02:23:12', '2019-08-26 02:53:37'),
(14, 14, 14, 1, 1, 7, 'I need cleaning machine', NULL, '', '', '', 'Created and Assigned to the Library of Materials Administrator', 'Yes', '2019-08-27 14:04:29', '2019-08-27 14:04:29'),
(15, 15, 15, 1, 1, 7, 'Phone, Samsung Note 10', 'https://www.samsung.com/ae/smartphones/galaxy-note10/buy/?cid=ae_davinci_laun_w_ggl_sm_galaxynote10plus_en_190827_721701079567_ao_awtext_b_p_eva&gclid=Cj0KCQjwqs3rBRCdARIsADe1pfT4CEc8Mtp5uOsSQmArJspb8NTPHG-YApMJveIgRCA2Jrr2pXDgfwoaAnUMEALw_wcB&gclsrc=aw.ds', '1567844760samsung.jpg', '', '', 'Fully Approved by Level 3 and the Library of Materials Updated', 'Yes', '2019-09-07 03:26:00', '2019-09-07 03:36:59'),
(16, 16, 16, 1, 1, 7, 'This is a test', NULL, '', '', '', 'Created and Assigned to the Library of Materials Administrator', 'Yes', '2019-09-15 14:56:56', '2019-09-15 14:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laravel_logs`
--

CREATE TABLE `laravel_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_file_location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_line_location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `posted_data` text COLLATE utf8mb4_unicode_ci,
  `formatted_error` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remote_addr` int(10) UNSIGNED DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolve_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Open',
  `created_by` int(11) DEFAULT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('024124de-79be-4ec1-9296-4288f2d19ba1', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":17,\"budget_creation_request_id\":21,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 21:00:39', '2021-02-06 21:00:39'),
('027991af-6e73-42d8-91ab-84207208d91e', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":30,\"budget_creation_request_id\":34,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 13:59:30', '2021-02-22 13:59:30'),
('02d2f014-e904-4c9e-ae34-71147b4f2cc7', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":1,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 16:25:19', '2021-02-22 16:25:19'),
('02dd77d6-427e-4e40-9522-69e50aec0d00', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":3,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-02 05:08:46', '2019-11-02 05:08:46'),
('03161e15-3901-4b8b-98de-5b1effb859b1', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":15,\"budget_creation_request_id\":21,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 07:26:25', '2020-12-09 07:26:25'),
('035ace24-2dbd-49c7-ace5-521260c77a8a', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"31af7db5-32ad-43a6-8747-d3c14e2057cf\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-09-18 19:23:25', '2020-09-18 19:23:25'),
('03cdf034-25fc-49f1-b1d7-71c119686359', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":11,\"budget_creation_request_id\":11,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:37:21', '2021-02-24 16:37:21'),
('046e774a-b593-450a-adbc-b9505388417c', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":13,\"budget_creation_request_id\":13,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-03 10:45:17', '2021-03-03 10:45:17'),
('04fea696-a239-40f7-939c-d6d90004716b', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":23,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-09 07:53:38', '2020-12-09 07:53:38'),
('06e73637-d510-4a66-a599-2c557a32e810', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":10,\"budget_creation_request_id\":15,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 13:54:23', '2020-12-08 13:54:23'),
('07973371-a748-4ae5-8d87-ac6443ea0822', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":2,\"budget_creation_request_id\":2,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 11:40:36', '2021-01-21 11:40:36'),
('08819bff-3a30-4216-8255-5976545f6db3', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":5,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 14:56:12', '2021-02-22 14:56:12'),
('0931d5a6-b0b1-4d94-9421-a41d505cc941', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":17,\"budget_creation_request_id\":23,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 07:53:47', '2020-12-09 07:53:47'),
('0a14c349-2535-4a01-81d7-e5976d8d8ad8', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":25,\"budget_creation_request_id\":4,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-16 04:02:54', '2021-01-16 04:02:54'),
('0b08200b-e21d-4a66-a26d-73fc5c24edb1', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":11,\"budget_creation_request_id\":11,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:35:40', '2021-02-24 16:35:40'),
('0b5717c7-6471-4901-8dcd-2f60dd5057f1', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":6,\"budget_creation_request_id\":10,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 21:27:37', '2021-02-06 21:27:37'),
('0b70f009-6471-40db-84ff-f6e5afdee752', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":27,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-10 22:02:34', '2020-12-10 22:02:34'),
('0c48589d-c48b-4274-a533-46a6ed38d664', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":4,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 14:51:18', '2021-02-22 14:51:18'),
('0d4fe72f-de35-4191-bb7a-b19c56e95e61', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":9,\"budget_creation_request_id\":13,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-03 22:04:31', '2021-02-03 22:04:31'),
('0e87198d-01a8-4c6a-ab7e-5bf82543db93', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":21,\"budget_creation_request_id\":27,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-10 22:02:38', '2020-12-10 22:02:38'),
('0ec91c61-d468-4fc1-afd0-2463b4af2c68', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":25,\"budget_creation_request_id\":29,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-21 10:28:44', '2021-02-21 10:28:44'),
('0ef18a4b-c53b-4387-9dac-57b143ff86d5', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":9,\"budget_creation_request_id\":9,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:29:55', '2021-02-24 16:29:55'),
('10913e77-3824-49db-aca4-64481e2a573e', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":15,\"budget_creation_request_id\":15,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-03 11:00:02', '2021-03-03 11:00:02'),
('11e9b56a-1ce6-4784-9708-dd696005f99d', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":15,\"budget_creation_request_id\":19,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 21:27:16', '2021-02-06 21:27:16'),
('15853646-4f4b-4b53-bc69-352be1154be8', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":2,\"budget_creation_request_id\":2,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 14:35:54', '2021-02-22 14:35:54'),
('15dcd2b6-5f15-47bf-b481-2610e59ecc10', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"1ff53d69-d606-4e97-b879-ee927957f059\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-07-21 06:02:38', '2020-07-21 06:02:38'),
('161550ea-86df-47f2-b32f-92c15e000381', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":19,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-09 06:54:00', '2020-12-09 06:54:00'),
('16236b17-3f61-4334-872d-8f7bd997b44e', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":2,\"budget_creation_request_id\":2,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 15:01:00', '2021-02-22 15:01:00'),
('17a5211e-bc21-4a37-a80f-aa408e2a972c', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":26,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-10 12:37:13', '2020-12-10 12:37:13'),
('1844cb20-ca93-4c33-a9ce-171fee6d6646', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":11,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-03 21:52:01', '2021-02-03 21:52:01'),
('18779582-5a3b-41f0-adff-7c2cf7d2f047', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":13,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2020-05-15 07:40:36', '2020-05-15 07:40:36'),
('1a461561-5a65-4db5-b556-20a0d2477418', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":21,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2020-08-03 09:13:43', '2020-08-03 09:13:43'),
('1b6c2435-2519-4bb1-95f3-cac2166fbec9', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":3,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 14:46:01', '2021-02-22 14:46:01'),
('1c090c07-00c9-4be1-bbf8-76c95fbbb7fd', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":7,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-24 15:54:06', '2021-02-24 15:54:06'),
('1d553305-0726-496c-b5ae-ee031e18f1f8', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":14,\"budget_creation_request_id\":20,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 07:10:53', '2020-12-09 07:10:53'),
('1daff7aa-fa3d-44b4-bc73-f6d13a7bfe0b', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":4,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-16 04:02:51', '2021-01-16 04:02:51'),
('1f802869-6a93-42f1-a6c4-cb060adac054', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":7,\"budget_creation_request_id\":7,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:18:24', '2021-02-24 16:18:24'),
('1fdfdf76-9e8e-4412-bc21-d0df2b81ea5e', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":13,\"budget_creation_request_id\":19,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 06:54:12', '2020-12-09 06:54:12'),
('20530661-b7e0-470e-9cae-b4c82388762f', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":7,\"budget_creation_request_id\":11,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-03 21:55:52', '2021-02-03 21:55:52'),
('219d750a-26d1-4142-b301-3246384de7eb', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":6,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-05 11:58:16', '2019-11-05 11:58:16'),
('2275545c-85f5-4e1b-ac4a-93700c1bfaa9', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":12,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-03 21:59:16', '2021-02-03 21:59:16'),
('2306f3e0-6d45-4c79-af53-9c08e0da4fba', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":18,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-04 20:37:24', '2021-02-04 20:37:24'),
('2343dc71-6be1-48e7-a0ac-774b74f394d3', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":8,\"budget_creation_request_id\":13,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 13:29:51', '2020-12-08 13:29:51'),
('2475994f-073b-4943-8d44-04e715e72c59', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":6,\"budget_creation_request_id\":11,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 11:56:22', '2020-12-08 11:56:22'),
('2535a91a-cb8d-48d5-9a5f-96d287e58872', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":26,\"budget_creation_request_id\":30,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-21 10:49:43', '2021-02-21 10:49:43'),
('28eb1bf1-5883-466c-ae66-918636b24d6e', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"ebee54c6-f8d7-4756-8f84-05c480dd08a4\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-09-18 19:04:48', '2020-09-18 19:04:48'),
('29646b24-c1e2-4937-b021-2768c56a8268', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":27,\"budget_creation_request_id\":6,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-16 04:19:59', '2021-01-16 04:19:59'),
('29f537fd-adff-42bb-b54e-25f50d3d2208', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"59b3b5fb-7570-47ca-86c7-a7c81f3e8da7\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-02-25 11:42:34', '2020-02-25 11:42:34'),
('2a036509-89d6-45f9-9048-5c2bcc8a1a50', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":15,\"budget_creation_request_id\":21,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 07:25:13', '2020-12-09 07:25:13'),
('2a1ba348-9465-4763-9f7e-232032a9cf8a', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":1,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-21 08:24:36', '2021-01-21 08:24:36'),
('2b0fed21-376f-45c8-b980-060d9e541b81', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":9,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-24 16:28:36', '2021-02-24 16:28:36'),
('2d392c0e-14f7-4326-823c-e501e11c721a', 'App\\Notifications\\PurchaseOrderCreatedNotification', 14, 'App\\User', '{\"purchase_order_id\":2,\"class_name\":\"PurchaseOrder\",\"notification_name\":\"Purchase Order Approval\"}', NULL, '2019-11-05 12:56:00', '2019-11-05 12:56:00'),
('2d9fc81c-9280-42a6-a388-9dc2157df7fd', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":3,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-21 13:03:23', '2021-01-21 13:03:23'),
('2e8f170c-8da3-4f90-8fba-40ca38792544', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":18,\"budget_creation_request_id\":22,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 21:02:08', '2021-02-06 21:02:08'),
('31801cf5-9b03-49ae-94d4-20896993ef6a', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":12,\"budget_creation_request_id\":18,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 06:42:18', '2020-12-09 06:42:18'),
('3301122d-5141-4390-b51e-3158a6368b98', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":12,\"budget_creation_request_id\":16,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-04 20:19:58', '2021-02-04 20:19:58'),
('35cc8bdb-556e-49d9-985f-85f141f9672c', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":5,\"budget_creation_request_id\":5,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 14:45:35', '2021-02-24 14:45:35'),
('362e43ec-9d8e-42bb-9fab-47aadd4446a4', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":20,\"budget_creation_request_id\":20,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-06 17:54:10', '2021-03-06 17:54:10'),
('38e24aa8-e418-4390-9dd0-7184c831aeb1', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":8,\"budget_creation_request_id\":13,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 13:28:27', '2020-12-08 13:28:27'),
('39ad5242-4130-4983-9852-cc6e14f13d50', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":8,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-05 13:14:18', '2019-11-05 13:14:18'),
('3a2aeee4-6d12-4855-baed-59b10990da88', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"4a51833d-aedb-480b-ae63-9953159abb80\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-08-03 09:08:05', '2020-08-03 09:08:05'),
('3a70eeb1-0fc4-4d40-b945-99f7c660fcc4', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":5,\"budget_creation_request_id\":5,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 14:56:18', '2021-02-22 14:56:18'),
('3a87d283-6596-4893-8fb1-a713b5d355b6', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":16,\"budget_creation_request_id\":20,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 21:27:08', '2021-02-06 21:27:08'),
('3ad2b5bf-139c-40d5-8379-4328feba4516', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":6,\"budget_creation_request_id\":6,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 14:54:55', '2021-02-24 14:54:55'),
('3ae152cd-d364-4193-ad90-7d0fcdc8915e', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":15,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-03-03 10:59:56', '2021-03-03 10:59:56'),
('3aef88a8-02ec-4244-b698-c780e3da5c66', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":20,\"budget_creation_request_id\":26,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-10 12:37:18', '2020-12-10 12:37:18'),
('3af09e5c-e1a9-4d3f-8643-12e37515f4bb', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":18,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-03-05 21:20:39', '2021-03-05 21:20:39'),
('3c11d4c0-e52e-402e-9d44-a16380d71ed2', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":16,\"budget_creation_request_id\":16,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-03 13:11:20', '2021-03-03 13:11:20'),
('3c28d09a-a807-4f44-a5c9-a9fc2e92fd46', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":4,\"budget_creation_request_id\":4,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 22:42:36', '2021-02-22 22:42:36'),
('3c8b02a9-be2e-41ba-a940-fe8a947e0faf', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":11,\"budget_creation_request_id\":16,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 20:04:24', '2020-12-08 20:04:24'),
('3c927d27-71d7-413e-bb16-e4889dca3918', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":1,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-14 09:27:44', '2021-01-14 09:27:44'),
('3c9b6c34-9915-438d-b290-eecd73b38a26', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"907969e1-20fd-4fac-87ee-5a2c7319d311\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-09-18 20:12:54', '2020-09-18 20:12:54'),
('3cf7af75-a575-49d9-a0b6-a2bca8975788', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":19,\"budget_creation_request_id\":19,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-05 22:27:57', '2021-03-05 22:27:57'),
('3e36c01d-b593-4ef4-91e7-45c6404e938a', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":16,\"budget_creation_request_id\":20,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-04 21:50:19', '2021-02-04 21:50:19'),
('3f165ccd-9134-4b5e-b362-ae10c948c292', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":4,\"budget_creation_request_id\":4,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 22:40:35', '2021-02-22 22:40:35'),
('3f5e034b-997a-48fd-bde1-b369973b01dc', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":20,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-04 21:50:16', '2021-02-04 21:50:16'),
('3f8475e2-3c07-4504-be73-0dc23e030f87', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":2,\"budget_creation_request_id\":2,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 16:40:04', '2021-02-22 16:40:04'),
('3f8f91f1-3df9-4e84-99b5-c930a851e8a1', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":18,\"budget_creation_request_id\":24,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 08:37:15', '2020-12-09 08:37:15'),
('3fabf565-49b4-4c0e-82ef-f628cff4e283', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":16,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-03-03 13:11:08', '2021-03-03 13:11:08'),
('41d602fb-20b1-4cb8-bf71-064045fef9ab', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":10,\"budget_creation_request_id\":10,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:33:48', '2021-02-24 16:33:48'),
('42ea3b96-0318-4389-9064-68b75704e81e', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":20,\"budget_creation_request_id\":24,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 23:04:28', '2021-02-06 23:04:28'),
('43a37c79-0f43-47d0-a24c-ba6297bf613c', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":3,\"budget_creation_request_id\":3,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 09:26:08', '2021-01-21 09:26:08'),
('44504e49-fdb6-4c43-a6b4-0e19af7940d0', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":14,\"budget_creation_request_id\":14,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-03 10:51:25', '2021-03-03 10:51:25'),
('454221e2-1bdc-4903-b14a-c8c4d5bc2e68', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":15,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 13:54:18', '2020-12-08 13:54:18'),
('4607cc38-3b20-4766-9a43-dcd1b0332200', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":1,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 11:25:20', '2021-01-21 11:25:20'),
('46870050-0908-48b4-9e53-c08474ee051c', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":2,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 16:36:24', '2021-02-22 16:36:24'),
('479fb52d-f14b-4ff2-8b26-a3a557e65dc8', 'App\\Notifications\\BudgetCreationRequestRejectedNotification', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":12,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request Rejection\"}', NULL, '2021-02-24 16:41:00', '2021-02-24 16:41:00'),
('47b1c6bf-801d-43bd-9537-65260a8bec36', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":25,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-06 23:12:58', '2021-02-06 23:12:58'),
('48db24c8-fbd9-4a94-a48e-60bd6ac331af', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":19,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-04 21:48:15', '2021-02-04 21:48:15'),
('4a3b3ae6-06e3-47e8-ac63-05dd23eddda8', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":9,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 10:29:51', '2020-12-08 10:29:51'),
('4a98b349-280f-419b-acec-8ea8c6540c68', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":13,\"budget_creation_request_id\":17,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-04 20:24:19', '2021-02-04 20:24:19'),
('4ba6c568-18fa-4c63-afac-7205c07874c2', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":11,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-24 16:35:35', '2021-02-24 16:35:35'),
('4ba6f466-a64b-4cb7-a9c8-e7224e2fbb57', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":21,\"budget_creation_request_id\":25,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 23:13:01', '2021-02-06 23:13:01'),
('4bbf6467-f7b5-4cc2-a123-75d3897473b9', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":27,\"budget_creation_request_id\":31,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-21 17:26:07', '2021-02-21 17:26:07'),
('4c5ea875-61ac-4269-8253-a85a80c08cbe', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":3,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 21:00:25', '2021-02-22 21:00:25'),
('4c96b6b4-781e-4637-a0e3-9829d8d279d0', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":2,\"budget_creation_request_id\":2,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 08:55:16', '2021-01-21 08:55:16'),
('4d1e8eef-e119-40bb-a085-ee5fb643c5cc', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":12,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 13:20:05', '2020-12-08 13:20:05'),
('4d2c451a-928e-45af-a973-c66e9cf0e805', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":1,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 11:12:25', '2021-01-21 11:12:25'),
('4d616c63-efc3-4aec-b61e-ed63fefb0ac6', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":4,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 22:40:29', '2021-02-22 22:40:29'),
('4e9baf67-16f3-4f28-87ee-d36b138a91c1', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":6,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-24 14:51:24', '2021-02-24 14:51:24'),
('4f10eb61-ff0e-44fb-a19a-5107f974f146', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":14,\"budget_creation_request_id\":14,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-03 10:55:18', '2021-03-03 10:55:18'),
('4f14cda0-df17-46de-acf4-248b2d4d2509', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":18,\"budget_creation_request_id\":22,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 21:01:45', '2021-02-06 21:01:45'),
('5291ce38-eedf-493d-aee1-4a14f769fcf1', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":24,\"budget_creation_request_id\":28,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-08 19:33:47', '2021-02-08 19:33:47'),
('52a90821-e4d1-445a-bacb-992098d1d5b3', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":2,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-21 08:55:12', '2021-01-21 08:55:12'),
('54a5f435-a3fa-4bfc-9c1b-99fd850e9e69', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":3,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-16 04:01:00', '2021-01-16 04:01:00'),
('54d33434-43dc-4fe9-bbfd-819a5d4cd901', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":13,\"budget_creation_request_id\":19,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 06:58:03', '2020-12-09 06:58:03'),
('55a79f66-9817-4073-8492-a08decdc6efc', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":7,\"budget_creation_request_id\":11,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-03 21:52:11', '2021-02-03 21:52:11'),
('560d7326-7ac8-47cc-a5d4-b9b9c22ab8fe', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"8511045d-01f7-4a17-89aa-dc0348654887\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-07-20 07:27:26', '2020-07-20 07:27:26'),
('578d24d8-f0e0-4a34-9e30-0463a29e4dcc', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":24,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-06 23:04:24', '2021-02-06 23:04:24'),
('57c02ae2-6e9b-4128-9476-68272f1f331c', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":28,\"budget_creation_request_id\":7,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-16 04:20:33', '2021-01-16 04:20:33'),
('59bbad94-6ae8-47b2-a76d-8a0a8751abbf', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":7,\"budget_creation_request_id\":12,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 13:20:09', '2020-12-08 13:20:09'),
('5af1ffaf-17ba-4cbd-8515-5df494057d12', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":1,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-20 08:52:01', '2021-01-20 08:52:01'),
('5c0f78f0-f60f-4d8e-93d6-1bf467c97c3e', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":12,\"budget_creation_request_id\":16,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-04 20:21:22', '2021-02-04 20:21:22'),
('5cd70099-fd3d-4340-9bf0-f6242aba333c', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":27,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-08 19:30:01', '2021-02-08 19:30:01'),
('5ceed215-7aa0-4b8a-9ca0-ae7c8af4cae3', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":4,\"budget_creation_request_id\":9,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 10:31:58', '2020-12-08 10:31:58'),
('5e21011f-7240-4730-8608-f0a786915b6b', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":3,\"budget_creation_request_id\":3,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 21:00:38', '2021-02-22 21:00:38'),
('5ec8b89b-f3f2-4a93-b30e-f2003cdf6a74', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":3,\"budget_creation_request_id\":3,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 14:46:07', '2021-02-22 14:46:07'),
('5f664bc9-941f-44c5-a664-9f219cf05761', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":32,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 13:31:43', '2021-02-22 13:31:43'),
('61ab9f1f-c84c-4bb4-904b-bfed40bc216b', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":5,\"budget_creation_request_id\":5,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 14:42:39', '2021-02-24 14:42:39'),
('63745129-6bbe-47da-810f-0b5da9b34f25', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":8,\"budget_creation_request_id\":8,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:26:07', '2021-02-24 16:26:07'),
('63a13ca9-6e96-4daa-92f2-65f7ceb190ac', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":24,\"budget_creation_request_id\":3,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-16 04:01:04', '2021-01-16 04:01:04'),
('6540816e-e8c3-408b-9bfa-2a71557c1ad7', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":2,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-02 05:08:35', '2019-11-02 05:08:35'),
('660ac895-72f6-4100-86fb-22d1681a2a6b', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":5,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-24 14:42:27', '2021-02-24 14:42:27'),
('66f62ab8-adc1-407e-8c5b-e7007c18a6aa', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"34efc062-6548-4d08-bb72-9a50a00f6582\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-05-15 07:34:37', '2020-05-15 07:34:37'),
('688f7dfc-b241-40e5-951e-711ef4f20cb5', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":17,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 20:29:56', '2020-12-08 20:29:56'),
('68d9f26b-cae5-4cbb-ad75-d30b755afa91', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":10,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-05 13:14:58', '2019-11-05 13:14:58'),
('6b53b38a-15de-44f8-93e1-2e0d72e57171', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":5,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-30 17:10:43', '2021-01-30 17:10:43'),
('6d30a6da-908b-4026-8bfc-94d232aa4387', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":13,\"budget_creation_request_id\":17,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-04 20:23:43', '2021-02-04 20:23:43'),
('6d691d05-5908-4fb1-a0c9-ed0be4ae0c77', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":1,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 08:39:07', '2021-01-21 08:39:07'),
('6d9e8558-8f86-42a4-9a09-2d0ab8f988f2', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":3,\"budget_creation_request_id\":8,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 10:20:35', '2020-12-08 10:20:35'),
('6f703637-2d1b-4b7f-9db7-fcf05b6fa53d', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":13,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-03-03 10:45:05', '2021-03-03 10:45:05'),
('6fe3762f-a5c8-40f4-85dd-1fe58e993bb2', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":7,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-05 13:13:58', '2019-11-05 13:13:58'),
('7011eac8-a7d6-49d9-829a-29ee73777ee4', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":6,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-07 11:40:29', '2020-12-07 11:40:29'),
('70b3f9ad-81f0-45fb-9fd8-25f96b90e266', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":19,\"budget_creation_request_id\":25,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 11:11:35', '2020-12-09 11:11:35'),
('70c694a6-6579-4c2a-8137-94a407af2cab', 'App\\Notifications\\BudgetCreationRequestRejectedNotification', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":1,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request Rejection\"}', NULL, '2021-02-22 15:00:36', '2021-02-22 15:00:36'),
('71294ae9-9f72-47c1-9253-fa2d0328814e', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":4,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-02 05:08:53', '2019-11-02 05:08:53'),
('717a694b-2663-4cca-97db-ef0e0bc06387', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":30,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-21 10:33:37', '2021-02-21 10:33:37'),
('71c8fda7-ad47-437d-bfd9-bf7274c01ab2', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":14,\"budget_creation_request_id\":20,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 07:20:48', '2020-12-09 07:20:48'),
('73b573f6-5349-45f0-8114-b5814edad356', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":6,\"budget_creation_request_id\":10,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-03 14:43:37', '2021-02-03 14:43:37'),
('74479023-6a25-4f8a-8940-98364733e1ab', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":4,\"budget_creation_request_id\":4,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 14:51:24', '2021-02-22 14:51:24'),
('758e2f8e-541e-46aa-b1b0-65ba36f8c396', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":22,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-09 07:42:25', '2020-12-09 07:42:25'),
('7666668c-d980-4fb1-aaad-615627ea7f8e', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":28,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-08 19:33:43', '2021-02-08 19:33:43'),
('766e8004-f0ce-4a84-8900-2458e129c51f', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":5,\"budget_creation_request_id\":10,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 11:46:05', '2020-12-08 11:46:05'),
('766fee3e-92a4-40ff-a359-6f6e959696df', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":4,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-22 17:00:21', '2021-01-22 17:00:21'),
('789684f6-2960-4021-ba7f-84e0b0c30967', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":8,\"budget_creation_request_id\":12,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-03 22:00:54', '2021-02-03 22:00:54'),
('797e96fd-f935-4b63-a25d-39db49ad2754', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":8,\"budget_creation_request_id\":12,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-03 21:59:19', '2021-02-03 21:59:19'),
('79ce8b52-0363-4601-8d18-d6bba1aa6b0b', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":29,\"budget_creation_request_id\":33,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 13:39:49', '2021-02-22 13:39:49'),
('7a10197b-6a32-4465-8557-65eceef2c188', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":1,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 14:07:59', '2021-02-22 14:07:59'),
('7af63609-239e-41be-9c67-6bb1a3f967fe', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":16,\"budget_creation_request_id\":22,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 07:42:34', '2020-12-09 07:42:34'),
('7afb8965-229e-4d1e-9106-de6a0fb74136', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":4,\"budget_creation_request_id\":4,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-22 17:00:31', '2021-01-22 17:00:31'),
('7b43c9be-3164-4529-9f60-416c8ca01924', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":1,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 08:24:44', '2021-01-21 08:24:44'),
('7c50b75c-32c4-47d5-a34b-bcfff29bca2b', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":11,\"budget_creation_request_id\":15,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-04 00:10:14', '2021-02-04 00:10:14'),
('7cb2ff09-0882-4996-afac-b643836d8ba5', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":4,\"budget_creation_request_id\":9,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 10:29:56', '2020-12-08 10:29:56'),
('7dacd39a-14f6-4f31-9d18-5446d54a3573', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":2,\"budget_creation_request_id\":2,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 16:36:30', '2021-02-22 16:36:30'),
('7dc877d3-dae9-4422-9c3c-f40b43989892', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":20,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-03-06 17:53:57', '2021-03-06 17:53:57'),
('7e32e3d6-ccde-4539-95ad-e4437a0db8cd', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":1,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-21 11:12:21', '2021-01-21 11:12:21'),
('7e5c6823-9a22-4598-863d-01bce770a9ad', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-06-29 03:21:29', '2020-06-29 03:21:29'),
('7fe95589-1ab5-44b4-8beb-a08dccb24c16', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":29,\"budget_creation_request_id\":33,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 13:41:47', '2021-02-22 13:41:47');
INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('80f8f8b2-17c8-4211-a503-0e063ebf2d6d', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":3,\"budget_creation_request_id\":8,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 10:21:55', '2020-12-08 10:21:55'),
('81a87719-22a4-46f3-918e-6cce281935e1', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":34,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 13:59:24', '2021-02-22 13:59:24'),
('81d62d83-0ecb-43e7-9df3-1d8b1e194e29', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":16,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2020-06-29 03:25:50', '2020-06-29 03:25:50'),
('8295205e-e3a7-4b21-9877-5f1e41a85ed9', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":14,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-03-03 10:51:20', '2021-03-03 10:51:20'),
('82b8c3f2-c486-4cca-b4d0-17013f894aa8', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":17,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-04 20:23:40', '2021-02-04 20:23:40'),
('82da889e-a488-452c-9844-04b4c56867d5', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":17,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-03-03 14:01:07', '2021-03-03 14:01:07'),
('843e8791-4d62-4d3c-a1ce-c8d51ac9ac28', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":25,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-09 11:08:45', '2020-12-09 11:08:45'),
('84f91af5-847e-4837-978f-45f45d4e6d5a', 'App\\Notifications\\PurchaseEnquiryRejectedNotification', 4, 'App\\User', '{\"purchase_enquiry\":14,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Rejection\"}', NULL, '2020-05-15 07:41:50', '2020-05-15 07:41:50'),
('860bab4c-1051-4bdf-be03-c6bc19bc5cca', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":6,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-30 18:29:01', '2021-01-30 18:29:01'),
('86f3ed46-b339-406d-9a03-32c312856451', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":10,\"budget_creation_request_id\":14,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-03 22:11:26', '2021-02-03 22:11:26'),
('873a1a89-d800-4d11-9c92-27c5b89a40e2', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":15,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2020-06-29 03:25:06', '2020-06-29 03:25:06'),
('8872cc03-7776-4ddd-aa04-0d21660c9adf', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":22,\"budget_creation_request_id\":1,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-14 09:27:52', '2021-01-14 09:27:52'),
('89e360a1-26cb-4d81-8f0a-384412e48f4b', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"9aa967e6-abac-441f-a275-9251b56c9579\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-09-19 03:36:26', '2020-09-19 03:36:26'),
('8a8f2093-de53-465a-80cc-a170290b7037', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"bd50f6a0-0693-4484-b50a-fcad54dd268b\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-07-02 04:32:33', '2020-07-02 04:32:33'),
('8bd526c0-4082-4648-85ab-1638378409e8', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":7,\"budget_creation_request_id\":12,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 13:22:35', '2020-12-08 13:22:35'),
('8cd371e3-f293-4199-a157-f6ca9d88d2b6', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":7,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-02 18:35:57', '2021-02-02 18:35:57'),
('8f87eed1-849f-4396-912f-27eb939ffa74', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":2,\"budget_creation_request_id\":7,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-07 14:54:49', '2020-12-07 14:54:49'),
('909bf0e6-b04b-4f01-a17b-c07c72d555bf', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":26,\"budget_creation_request_id\":5,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-16 04:06:50', '2021-01-16 04:06:50'),
('91f3d140-8715-4529-95cf-82cd3281576a', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":1,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-02 05:08:18', '2019-11-02 05:08:18'),
('9200d90f-5b47-4dcd-b614-9139dc1c5a96', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":17,\"budget_creation_request_id\":23,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 07:54:51', '2020-12-09 07:54:51'),
('94a4910d-2f66-4db0-8c04-440099e732af', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":14,\"budget_creation_request_id\":18,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-04 20:37:29', '2021-02-04 20:37:29'),
('972abca6-60c5-4f4c-a61b-38973674a2f3', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":12,\"budget_creation_request_id\":12,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:39:45', '2021-02-24 16:39:45'),
('9a0fd83e-978b-4027-80ba-2572cc68dcbf', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":23,\"budget_creation_request_id\":27,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-08 19:31:32', '2021-02-08 19:31:32'),
('9aa7d9d9-a930-4237-8f30-274dacb627f2', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":13,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-03 22:04:28', '2021-02-03 22:04:28'),
('9c420ded-42e9-49ad-8cac-8dee794396a6', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":18,\"budget_creation_request_id\":24,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 08:39:25', '2020-12-09 08:39:25'),
('9c541721-98dc-47ec-952d-5281248462ea', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":2,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-21 11:40:32', '2021-01-21 11:40:32'),
('9d7e1a08-1867-4f50-86da-1af790629ebe', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":10,\"budget_creation_request_id\":10,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:32:47', '2021-02-24 16:32:47'),
('9d8a4c3d-bbe4-4f5c-8cc3-714a0a05204d', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":21,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-09 07:25:01', '2020-12-09 07:25:01'),
('9ddb567e-9254-4dff-9726-b9898a9c4dde', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":25,\"budget_creation_request_id\":29,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-21 10:23:48', '2021-02-21 10:23:48'),
('9e641dc5-b0e2-4146-8a26-3180a47f1221', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":12,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-24 16:39:39', '2021-02-24 16:39:39'),
('a2067b96-38a3-46ae-8dd9-4af86f4cc141', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":9,\"budget_creation_request_id\":14,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 13:47:56', '2020-12-08 13:47:56'),
('a25070cf-6855-4607-a776-939eb1099e0f', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":9,\"budget_creation_request_id\":14,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 13:47:06', '2020-12-08 13:47:06'),
('a432bea6-5f0e-48ff-b57b-e7cd1ce5d8a0', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":9,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-05 13:14:44', '2019-11-05 13:14:44'),
('a44da1ec-cbdc-4c2f-a226-ced5720a7598', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":19,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-03-05 22:24:52', '2021-03-05 22:24:52'),
('a4c58c69-401b-4278-af76-0645c85fc5b8', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":33,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 13:39:44', '2021-02-22 13:39:44'),
('a503664e-ccb6-4184-953f-2f48c906ba77', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":9,\"budget_creation_request_id\":9,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:28:41', '2021-02-24 16:28:41'),
('a6ffdcad-79a3-47e5-a325-053ea3d2ee08', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":13,\"budget_creation_request_id\":13,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-03 10:47:22', '2021-03-03 10:47:22'),
('a9405e92-d468-4f7a-a859-651b66be99f1', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":19,\"budget_creation_request_id\":19,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-05 22:24:57', '2021-03-05 22:24:57'),
('ac2bee99-df0d-4b2a-bf19-93b669ea3644', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":24,\"budget_creation_request_id\":28,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-08 19:35:55', '2021-02-08 19:35:55'),
('ac7e7f51-2772-40eb-a2bf-b71512fb7aef', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":8,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-24 16:22:13', '2021-02-24 16:22:13'),
('acc29d3d-694a-42f2-8ddf-e508e0ff519c', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":23,\"budget_creation_request_id\":2,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-16 03:35:02', '2021-01-16 03:35:02'),
('ae4f9028-1a6d-4d37-b529-8d3dd311ffb9', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":17,\"budget_creation_request_id\":21,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 20:59:53', '2021-02-06 20:59:53'),
('b045b05c-3609-4043-a7b2-1d5ec8f06043', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":28,\"budget_creation_request_id\":32,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 13:31:52', '2021-02-22 13:31:52'),
('b0b6d2fc-a22f-47eb-963c-1905e4051dc8', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":17,\"budget_creation_request_id\":17,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-03 14:01:14', '2021-03-03 14:01:14'),
('b0e4d0b3-2447-4560-96e9-b9725cab4862', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"632f12b4-bdc0-4c72-b597-cb29efeaf07b\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-09-18 19:14:58', '2020-09-18 19:14:58'),
('b0e67cdf-bdd4-4076-b7a9-ea88440ca032', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":7,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-16 04:20:30', '2021-01-16 04:20:30'),
('b15c2070-fd86-4d45-b7b3-1dc14fda16c3', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":6,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-16 04:19:56', '2021-01-16 04:19:56'),
('b3fd7e2a-1398-4721-81d7-4d54374a6a45', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":3,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-21 09:26:02', '2021-01-21 09:26:02'),
('b4b6b833-f830-48f7-ac74-dd2ca352fcbd', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":11,\"budget_creation_request_id\":15,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-04 00:11:19', '2021-02-04 00:11:19'),
('b5df328e-38cd-4f37-8c50-8efb2c775161', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":31,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-21 17:25:54', '2021-02-21 17:25:54'),
('b5e7096b-03e4-4f79-ae4b-322787d3cf20', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":8,\"budget_creation_request_id\":8,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 16:22:18', '2021-02-24 16:22:18'),
('b8080ac8-ef4d-483e-adf4-a20927d61a0a', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"550235a5-6089-4cb0-a734-20d05805ecba\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2019-11-02 05:05:48', '2019-11-02 05:05:48'),
('b95a07d4-0cca-4ff9-8ddc-f746ed2de423', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":3,\"budget_creation_request_id\":3,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 13:03:27', '2021-01-21 13:03:27'),
('bc689151-1e07-4d37-89dc-1fe73fe71e02', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":5,\"budget_creation_request_id\":9,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-03 13:53:33', '2021-02-03 13:53:33'),
('beb42f00-8a0a-4e83-9967-b0b8ec863417', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":12,\"budget_creation_request_id\":18,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 06:49:52', '2020-12-09 06:49:52'),
('bf480c21-886b-44c2-9779-2113d7c4ebd8', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":19,\"budget_creation_request_id\":23,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 22:52:42', '2021-02-06 22:52:42'),
('bfd06e25-978a-41c1-aba0-644d78043444', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":14,\"budget_creation_request_id\":18,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 21:27:23', '2021-02-06 21:27:23'),
('c05ec7d4-21a1-4d62-b53a-5d114e1b1f5b', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":6,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-07 13:11:15', '2020-12-07 13:11:15'),
('c0b71ac5-6e39-4809-b635-935b9c0d457b', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":8,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 10:20:26', '2020-12-08 10:20:26'),
('c1bd029c-f9d4-4355-9c14-817b4d9a2862', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":10,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-24 16:32:41', '2021-02-24 16:32:41'),
('c1bd9d55-9670-478d-8620-f16296d63f49', 'App\\Notifications\\PurchaseOrderCreatedNotification', 14, 'App\\User', '{\"purchase_order_id\":1,\"class_name\":\"PurchaseOrder\",\"notification_name\":\"Purchase Order Approval\"}', NULL, '2019-11-05 12:54:46', '2019-11-05 12:54:46'),
('c26d002c-d74f-4d2c-ae35-bd8cbdc0265b', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":11,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 11:56:16', '2020-12-08 11:56:16'),
('c2f9b9b4-344e-44e6-bd6d-69205320a0f6', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":29,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-21 10:23:34', '2021-02-21 10:23:34'),
('c43a4bc8-98ba-466e-8198-a2ac295ac7f7', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":24,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-09 08:37:07', '2020-12-09 08:37:07'),
('c6c3bb8d-c760-4a86-b440-96ce06537694', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":2,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 14:35:47', '2021-02-22 14:35:47'),
('c971b011-da59-4c9f-bce0-3b3d9e24c634', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":22,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-06 21:01:41', '2021-02-06 21:01:41'),
('c9872e06-cd9d-4f21-af0b-e87a45c3d733', 'App\\Notifications\\BudgetCreationRequestRejectedNotification', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":10,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request Rejection\"}', NULL, '2021-02-06 21:43:57', '2021-02-06 21:43:57'),
('c9b2e852-3603-4169-81e3-0b42be5b974e', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":11,\"budget_creation_request_id\":16,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 20:00:51', '2020-12-08 20:00:51'),
('ca0d3e75-1edd-4811-a55b-267008bf1a38', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":5,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-16 04:06:46', '2021-01-16 04:06:46'),
('ca47421e-9f7a-4b70-a215-e993212fefcc', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":1,\"budget_creation_request_id\":1,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 16:28:29', '2021-02-22 16:28:29'),
('ca9381cf-bc67-46f8-8a14-edb9877a7328', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":18,\"budget_creation_request_id\":18,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-05 21:20:57', '2021-03-05 21:20:57'),
('cadb6ca0-63d6-4c76-b8a3-10c7b713b06a', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":19,\"budget_creation_request_id\":25,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 11:08:50', '2020-12-09 11:08:50'),
('cb94280a-0c20-4d9c-ab97-e2e28c7d71f2', 'App\\Notifications\\BudgetCreationRequestRejectedNotification', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":13,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request Rejection\"}', NULL, '2021-02-03 22:06:48', '2021-02-03 22:06:48'),
('cced5387-1255-4657-a7f5-9f57da5ddc9a', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":20,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-09 07:10:41', '2020-12-09 07:10:41'),
('ccffa8bb-7e17-4f40-8c5d-3b447fead1c9', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":22,\"budget_creation_request_id\":26,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-07 18:51:24', '2021-02-07 18:51:24'),
('cd44d09f-a590-4bb8-a235-db77a9091cbf', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":23,\"budget_creation_request_id\":27,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-08 19:30:09', '2021-02-08 19:30:09'),
('ce801384-d6d2-4e4a-9af5-7e8e534786a4', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":6,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-07 11:40:17', '2020-12-07 11:40:17'),
('cecff336-b7c5-42a1-a0a1-10666d7ef426', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":15,\"budget_creation_request_id\":19,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-04 21:48:24', '2021-02-04 21:48:24'),
('cf0e0ba9-e3dc-4d42-b9d7-f04d1cad02b8', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":11,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2020-02-25 11:44:36', '2020-02-25 11:44:36'),
('d02b4263-9042-49a0-aa4d-468413aa146b', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":17,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2020-09-20 19:17:13', '2020-09-20 19:17:13'),
('d0613c35-45d5-4e24-9a36-60477d19e06e', 'App\\Notifications\\BudgetCreationRequestRejectedNotification', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":14,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request Rejection\"}', NULL, '2021-03-03 10:57:18', '2021-03-03 10:57:18'),
('d0811419-9f79-4b2c-83d8-90180a913f75', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":13,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 13:28:23', '2020-12-08 13:28:23'),
('d0e9ddc8-bcec-4a5f-9e01-cc72e1f157bd', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":18,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-09 06:42:10', '2020-12-09 06:42:10'),
('d31500e0-0357-408f-8e8b-86bdb95f4d2b', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":18,\"budget_creation_request_id\":18,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-03-05 22:11:18', '2021-03-05 22:11:18'),
('d567d971-090d-4fe2-a0b3-984a0f983cad', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":7,\"budget_creation_request_id\":7,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 15:54:14', '2021-02-24 15:54:14'),
('d61f6a82-d0a4-42d8-a577-56c4c3eeee02', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":5,\"budget_creation_request_id\":5,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 05:44:04', '2021-01-21 05:44:04'),
('d6920bfd-6ad0-4a7e-a48a-6ec453655e1d', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":15,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-04 00:10:06', '2021-02-04 00:10:06'),
('d6ce4eba-10ba-4618-8d70-e7341dd4417d', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":5,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2019-11-05 11:58:08', '2019-11-05 11:58:08'),
('d79bdcd9-76d1-4e62-9d1e-c8fd01516c60', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":8,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-03 13:52:58', '2021-02-03 13:52:58'),
('d9bacf23-0cab-4a8a-bf73-a1a1911e2e69', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"32628743-4de8-4a70-92a4-cfd34dbbbfdd\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2019-11-05 13:11:08', '2019-11-05 13:11:08'),
('da05921f-e2ce-4602-b21e-75889ec8223e', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":10,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 11:46:00', '2020-12-08 11:46:00'),
('da22c551-652b-4b66-a29f-faf7db7a20a0', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":28,\"budget_creation_request_id\":32,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-22 13:37:10', '2021-02-22 13:37:10'),
('dac1f7fb-42f7-4105-a4a5-4255d758948e', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":2,\"budget_creation_request_id\":2,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 12:56:52', '2021-01-21 12:56:52'),
('db3d1736-92b2-4f8f-b7d7-a529d7a3dbde', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":19,\"budget_creation_request_id\":23,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 22:57:49', '2021-02-06 22:57:49'),
('db5175e2-0ebc-4f3f-9841-7952316998cc', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":21,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-06 20:59:44', '2021-02-06 20:59:44'),
('dc9ab7d6-ceef-4701-9c98-054e50993b93', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":16,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 20:00:46', '2020-12-08 20:00:46'),
('dd4d5918-2cdd-47cc-9814-451a3094b435', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":10,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-03 14:43:32', '2021-02-03 14:43:32'),
('de34e8e0-dcab-44b4-8845-16399b95c2ea', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":26,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-07 18:51:15', '2021-02-07 18:51:15'),
('df18d97c-e15f-49b6-9a81-dcff97839077', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":5,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-21 05:43:55', '2021-01-21 05:43:55'),
('df731564-0b62-407c-a65c-00a616e21803', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":20,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2020-09-20 19:18:54', '2020-09-20 19:18:54'),
('e0367627-b29c-4a81-aca6-3d3a74cc73a9', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":2,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-01-16 03:34:52', '2021-01-16 03:34:52'),
('e13e1574-cbce-46f2-8e50-f443d8908717', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":6,\"budget_creation_request_id\":11,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 11:57:04', '2020-12-08 11:57:04'),
('e27d7421-619d-435c-894e-57cc0549d3e8', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":21,\"budget_creation_request_id\":25,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 23:13:40', '2021-02-06 23:13:40'),
('e285c8c4-392e-416c-9f9f-95bd6070ae36', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":3,\"budget_creation_request_id\":3,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-01-21 13:04:37', '2021-01-21 13:04:37'),
('e339b750-a018-4f9b-8acd-23fea79f8ee6', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":16,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-04 20:19:50', '2021-02-04 20:19:50'),
('e88ed24e-7e70-439b-9ab3-ac814b9af49a', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":7,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-07 14:47:32', '2020-12-07 14:47:32'),
('ea982da8-8874-4c84-9a70-5b06ed0cf59e', 'App\\Notifications\\PurchaseEnquiryRejectedNotification', 4, 'App\\User', '{\"purchase_enquiry\":22,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Rejection\"}', NULL, '2020-08-03 09:14:38', '2020-08-03 09:14:38'),
('eb6b0d58-5282-46c8-99e5-7185b592f529', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":2,\"budget_creation_request_id\":7,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-07 14:47:38', '2020-12-07 14:47:38'),
('eb75eb0f-977d-4bec-9727-81aec48b4c25', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":14,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-03 22:11:23', '2021-02-03 22:11:23'),
('ebadc687-d794-4461-9d32-573e2e010496', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":12,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2020-02-25 11:44:47', '2020-02-25 11:44:47'),
('ebd441cf-570c-45aa-8fd7-6655ae823efe', 'App\\Notifications\\PurchaseOrderCreatedNotification', 14, 'App\\User', '{\"purchase_order_id\":3,\"class_name\":\"PurchaseOrder\",\"notification_name\":\"Purchase Order Approval\"}', NULL, '2019-11-05 13:35:42', '2019-11-05 13:35:42'),
('ec088f58-1750-4141-a2fb-49f8a2204d92', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":23,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-06 22:52:33', '2021-02-06 22:52:33'),
('ec783483-70cc-43ee-8216-d3d85fd0c5cc', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":6,\"budget_creation_request_id\":6,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-24 14:51:30', '2021-02-24 14:51:30'),
('ec977e97-7091-4727-abdf-bf54a814f2e2', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":5,\"budget_creation_request_id\":10,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-08 11:47:16', '2020-12-08 11:47:16'),
('ee70a03a-5685-4f89-b484-c971a3d1e9fb', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":14,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2020-12-08 13:47:01', '2020-12-08 13:47:01'),
('f130c1da-97f6-44d3-9b5c-5a336c1bb672', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":20,\"budget_creation_request_id\":24,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-06 23:10:54', '2021-02-06 23:10:54'),
('f42afbeb-7c8e-4374-95b5-a0b43d0d9735', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":9,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-03 13:53:29', '2021-02-03 13:53:29'),
('f4dd3218-ea8c-42e3-999b-87d551fed8ce', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":10,\"budget_creation_request_id\":14,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-03 22:12:08', '2021-02-03 22:12:08'),
('f8869fe9-500d-4272-98d8-9a719261ef86', 'App\\Notifications\\BudgetCreatedValidationNotification', 340, 'App\\User', '{\"budget_master_id\":26,\"budget_creation_request_id\":30,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2021-02-21 10:33:47', '2021-02-21 10:33:47'),
('f89983a9-4199-40c4-9e95-8d8f8b5bdcbd', 'App\\Notifications\\BudgetCreationRequestNotifications', 340, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":1,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 16:25:14', '2021-02-22 16:25:14'),
('f89bd843-bf25-48fb-b782-df07afb88f67', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"b367300e-49a9-4fae-9fde-74a7e1b83a37\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2019-11-05 11:57:06', '2019-11-05 11:57:06'),
('fd23674b-b674-4873-93ab-d86793f18ba8', 'App\\Notifications\\BudgetCreationRequestNotifications', 339, 'App\\User', '{\"creator_id\":339,\"budget_creation_request_id\":1,\"class_name\":\"BudgetCreationRequest\",\"notification_name\":\"Budget Creation Request\"}', NULL, '2021-02-22 14:07:54', '2021-02-22 14:07:54'),
('fd9166df-1041-49a5-86e8-bf1eb6938cd2', 'App\\Notifications\\PurchaseRequestCreatedNotification', 5, 'App\\User', '{\"purchase_request_grouping_id\":\"865b3b35-cf94-4f15-b9cf-3714b9e78880\",\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Approval\"}', NULL, '2020-09-18 19:20:32', '2020-09-18 19:20:32'),
('fdc85103-0765-44d4-bb11-ec3978606c69', 'App\\Notifications\\PurchaseRequestValidationNotification', 6, 'App\\User', '{\"purchase_request_id\":18,\"class_name\":\"PurchaseEnquiry\",\"notification_name\":\"Purchase Enquiry Validation\"}', NULL, '2020-09-20 19:20:22', '2020-09-20 19:20:22'),
('ff2bdb06-be24-49da-97a4-c20eabc87506', 'App\\Notifications\\BudgetCreatedValidationNotification', 341, 'App\\User', '{\"budget_master_id\":16,\"budget_creation_request_id\":22,\"class_name\":\"BudgetMaster\",\"notification_name\":\"Budget Creation Validation\"}', NULL, '2020-12-09 07:46:02', '2020-12-09 07:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('cb532a3f88729d4601f3d9a162c32f035515d4dd33f0b01c30289ad23a18fc8c59e76362afb5ca22', 1, 1, 'LaraPassport', '[]', 1, '2019-08-01 05:47:13', '2019-08-01 05:47:13', '2020-08-01 05:47:13'),
('cf089310d0ac8e8dc18e829f579949b87674af280d3d29bd7b017651017e9b7e315c2b71bc9e596f', 31, 1, 'LaraPassport', '[]', 1, '2019-08-01 05:48:04', '2019-08-01 05:48:04', '2020-08-01 05:48:04'),
('2e4c1a1e07c51381fc3cdc173bec728b0afc1eabdcfa36ce43217dad015609d47ffc56eed7067669', 31, 1, 'LaraPassport', '[]', 1, '2019-08-01 05:48:17', '2019-08-01 05:48:17', '2020-08-01 05:48:17'),
('71ea3567df8768237c0963dd0e6817c5f9cfe5bb4c8e5b4478819c2ad147cbf5a68aa131a3961209', 7, 1, 'LaraPassport', '[]', 1, '2019-08-01 05:58:50', '2019-08-01 05:58:50', '2020-08-01 05:58:50'),
('bd06303a3916041ac4aeac08cff39f9d8cb95e17a4e3e73712d89f6e7a2a69f2b957acfed88fbc7e', 31, 1, 'LaraPassport', '[]', 1, '2019-08-01 05:59:25', '2019-08-01 05:59:25', '2020-08-01 05:59:25'),
('7c80e3441c13c78524b283f4e6804a6e050ba0210894f41ee6e84980945a16612f8afcd95d69b4cb', 7, 1, 'LaraPassport', '[]', 1, '2019-08-02 08:11:09', '2019-08-02 08:11:09', '2020-08-02 08:11:09'),
('512bc1a8f1dd7f05a3c111740d24f7b6dbc0fa67917f03f9a17bb7a4857b43734d0789196225b482', 7, 1, 'LaraPassport', '[]', 1, '2019-08-02 08:42:54', '2019-08-02 08:42:54', '2020-08-02 08:42:54'),
('f76cd77a5570a430e11f6e95a1b9f5fb6eb242e8694c3ccaf795e0ce925557fb3d9b12f2d723481d', 7, 1, 'LaraPassport', '[]', 1, '2019-08-03 10:26:45', '2019-08-03 10:26:45', '2020-08-03 10:26:45'),
('e62c40988787eadd723009d7d5a894ea367769bced0157dce5e741b7f508595260a5ee8bb6dc536a', 7, 1, 'LaraPassport', '[]', 1, '2019-08-03 10:29:03', '2019-08-03 10:29:03', '2020-08-03 10:29:03'),
('8f2893b575f011ec470e3a5e47de0b4856793cebc68672c5888cfac83613fbf8332e3d787d34c2bd', 21, 1, 'LaraPassport', '[]', 1, '2019-08-03 12:32:56', '2019-08-03 12:32:56', '2020-08-03 12:32:56'),
('19e23142caed3832fc8074b9b7976ad62cc4f4b775d25517c25f8d13e312e69011d574938e73c365', 7, 1, 'LaraPassport', '[]', 1, '2019-08-03 23:56:11', '2019-08-03 23:56:11', '2020-08-03 23:56:11'),
('bce9446d34fc5ad7a499f2ed982c66323b7d29a2f75663c1c7f4a3f989af6bded2aead1838b2db9c', 21, 1, 'LaraPassport', '[]', 1, '2019-08-04 11:46:38', '2019-08-04 11:46:38', '2020-08-04 11:46:38'),
('f3ff31c4cf2ac20d6d5b99f45747119aa934c99e60942d78bd440e30da1e9625da5e8d27f44c7f4e', 2, 1, 'LaraPassport', '[]', 1, '2019-08-05 01:17:08', '2019-08-05 01:17:08', '2020-08-05 01:17:08'),
('31c0acdd6647e0501ddd67d8a9889f95bcec048fbd68118735f808d757134e16d7567c87f4c4307a', 21, 1, 'LaraPassport', '[]', 1, '2019-08-05 01:18:05', '2019-08-05 01:18:05', '2020-08-05 01:18:05'),
('b4f8ea108278482a06a67dbf973bb6efb58d5f4565ed7d6900c6b7dcadf2110286c884585645399c', 2, 1, 'LaraPassport', '[]', 0, '2019-08-05 01:37:15', '2019-08-05 01:37:15', '2020-08-05 01:37:15'),
('1354f74068a57fe12888f5666e7aef3ea597c41e02d62d41a710f90d4ad485a7f7ff284561f1285c', 2, 1, 'LaraPassport', '[]', 1, '2019-08-05 01:42:39', '2019-08-05 01:42:39', '2020-08-05 01:42:39'),
('d9211483b28d22967badc98fb1eb99c1a2ffdf8e4328fb9fdd03b5f43438209957018403c359897a', 2, 1, 'LaraPassport', '[]', 1, '2019-08-05 01:47:31', '2019-08-05 01:47:31', '2020-08-05 01:47:31'),
('ee078a71c5a9d511a658028dae2bf478520b7929ce29c9e6d78b3ed4b3083f4af97efc9f4946ac89', 7, 1, 'LaraPassport', '[]', 1, '2019-08-05 01:50:40', '2019-08-05 01:50:40', '2020-08-05 01:50:40'),
('af4df16a588518b04d2eac1e89ab2c07f73c70bd30e22d3fe27e39578f2091e706584379e48476cf', 1, 1, 'LaraPassport', '[]', 1, '2019-08-05 01:55:49', '2019-08-05 01:55:49', '2020-08-05 01:55:49'),
('012282653f092312b71d30388e05b33f9525218f6ce1eb44d12fd41f6a59effec37b13f5bca9c5a6', 2, 1, 'LaraPassport', '[]', 0, '2019-08-05 02:19:28', '2019-08-05 02:19:28', '2020-08-05 02:19:28'),
('a08c88d4c5e6744bae460c41fda9c34c6121168999aa190b4b23602a0d7c61efbd9ca4d69e6b00db', 8, 1, 'LaraPassport', '[]', 1, '2019-08-05 02:20:45', '2019-08-05 02:20:45', '2020-08-05 02:20:45'),
('a5a02080056dba23f01905b62236b6ff9505d8037e27b355da665c892faafd14a4d7b57c4ab4aad3', 9, 1, 'LaraPassport', '[]', 1, '2019-08-05 02:57:52', '2019-08-05 02:57:52', '2020-08-05 02:57:52'),
('1565dee13118e986eb784fb0122f52e6b331ee61e8dc0374abcae808445c32acd2d2d4de155ed85a', 10, 1, 'LaraPassport', '[]', 1, '2019-08-05 03:04:29', '2019-08-05 03:04:29', '2020-08-05 03:04:29'),
('695bf27c0d6021d8e7162976e8979df6e82d616f7dd46299e279c6107ee2cd89b89ec77336a6b992', 11, 1, 'LaraPassport', '[]', 1, '2019-08-05 03:29:53', '2019-08-05 03:29:53', '2020-08-05 03:29:53'),
('67256c4256d5c69a0f024dce0dbf734a89483a45bf910371e54473020eded79c4fae8e20aa9c35d6', 7, 1, 'LaraPassport', '[]', 1, '2019-08-05 03:31:28', '2019-08-05 03:31:28', '2020-08-05 03:31:28'),
('e91a21e8d8d8a167d5239914bf1241c4276336cc66d6dd65ce1794b8786ead926b308cb358b02536', 8, 1, 'LaraPassport', '[]', 1, '2019-08-05 03:33:03', '2019-08-05 03:33:03', '2020-08-05 03:33:03'),
('efca237a1dd34f8fe5d7d822ca5323eb8b12e48cd3cec765f3878525a1a9d392576d2ff95cada174', 9, 1, 'LaraPassport', '[]', 1, '2019-08-05 04:12:58', '2019-08-05 04:12:58', '2020-08-05 04:12:58'),
('55477618104de667b061572e7ff45335e39eadf3c677f7c87b677bcbbd2679998f8ebb46813ee94d', 10, 1, 'LaraPassport', '[]', 1, '2019-08-05 04:14:48', '2019-08-05 04:14:48', '2020-08-05 04:14:48'),
('e0890bfe52101deabb8dece5206fa02a7c83237ae34f91edd7e14567794214cb17ec7854107e3b3f', 11, 1, 'LaraPassport', '[]', 1, '2019-08-05 04:16:02', '2019-08-05 04:16:02', '2020-08-05 04:16:02'),
('a38d49f1854ee3b9fb460f099d29164f013383c0f958f9724298602adee3b6d8fe8a90326bece408', 8, 1, 'LaraPassport', '[]', 1, '2019-08-05 04:21:08', '2019-08-05 04:21:08', '2020-08-05 04:21:08'),
('19694f374de946b07168bebd2bcb5b24e599713fc1a6546b47f7c41cba5f96efc9e174b0ad67b714', 9, 1, 'LaraPassport', '[]', 1, '2019-08-06 02:28:14', '2019-08-06 02:28:14', '2020-08-06 02:28:14'),
('8197f4ceb5b7cde5fed11e5d149a0fb41ffdaff3d5dea01bd81b59e88999149f4e11cb7279adabc9', 10, 1, 'LaraPassport', '[]', 1, '2019-08-06 02:29:14', '2019-08-06 02:29:14', '2020-08-06 02:29:14'),
('b5bc03c7efb220e67465cbd9e0ec4e2644e134aff7d6313bba5819e8c2e38c129b20bc71a9514d5b', 11, 1, 'LaraPassport', '[]', 1, '2019-08-06 02:31:33', '2019-08-06 02:31:33', '2020-08-06 02:31:33'),
('a803bf91941f5b6815598c0f0836909aa545456ea9f5fd89e4c618387b381aef6e5469db786d25b5', 8, 1, 'LaraPassport', '[]', 1, '2019-08-06 02:33:31', '2019-08-06 02:33:31', '2020-08-06 02:33:31'),
('a2d77e654c43e0bdaa90bc70f11056d9cfa8d6d6eaf766d07c06b4ea0dee0a6d744683c4307aa910', 4, 1, 'LaraPassport', '[]', 1, '2019-08-06 02:35:02', '2019-08-06 02:35:02', '2020-08-06 02:35:02'),
('d339f95b0f26a71c1164efdee6ca98277fa0dc56752ae664ed02461c68ca9c094acb7ca3d3f37dec', 8, 1, 'LaraPassport', '[]', 1, '2019-08-06 02:55:55', '2019-08-06 02:55:55', '2020-08-06 02:55:55'),
('f5db72b49fa5292c58e02142854ada490dc11f85b7405fb66170f5d54da8b94a3f42176eed7e114c', 5, 1, 'LaraPassport', '[]', 1, '2019-08-06 03:00:31', '2019-08-06 03:00:31', '2020-08-06 03:00:31'),
('e80f5ea137b35a2df5c528409161ffb88cf6bb361823a3c00b34aa8779813c4acbd213d3b42a3c20', 6, 1, 'LaraPassport', '[]', 1, '2019-08-06 03:18:49', '2019-08-06 03:18:49', '2020-08-06 03:18:49'),
('c06efd2748ca79dae5c0549bcc671255c1a551fef0d0e55732d2e55e2d5949e05276df623267ef67', 4, 1, 'LaraPassport', '[]', 1, '2019-08-06 03:24:02', '2019-08-06 03:24:02', '2020-08-06 03:24:02'),
('b214844b361b5ee8080c4c4c50fb38b1c14904ea731378d81c98bdb36f1cdb1186d9444009c25e11', 5, 1, 'LaraPassport', '[]', 1, '2019-08-06 03:32:25', '2019-08-06 03:32:25', '2020-08-06 03:32:25'),
('3ff08894ba11168e1d71fb7b997b1c8836d052c2afc3a9b917884816120261e242e76deab212b7b8', 6, 1, 'LaraPassport', '[]', 1, '2019-08-06 03:35:03', '2019-08-06 03:35:03', '2020-08-06 03:35:03'),
('9b36fe1f76f1f998d85b85191664fd00c0c11585c22f230cf11f8f33bab49ba48e65974aac61fa2f', 21, 1, 'LaraPassport', '[]', 1, '2019-08-06 03:38:36', '2019-08-06 03:38:36', '2020-08-06 03:38:36'),
('72edb2cda3daa6f4201701ee88e111919f31dbaaeb3fbe79c44af40878bbd9c4d03c9bf611cd7b7c', 4, 1, 'LaraPassport', '[]', 1, '2019-08-06 03:41:33', '2019-08-06 03:41:33', '2020-08-06 03:41:33'),
('aba9bf12f621530383edd64b613cc9a976202f9b3958f8a92cb39d5d9d608b13180287b1c7c40c62', 12, 1, 'LaraPassport', '[]', 1, '2019-08-06 03:43:13', '2019-08-06 03:43:13', '2020-08-06 03:43:13'),
('0cba2ea46b297cbde54f9557dbff96b8cee475b338b35d4332d3f5260f59cb2c9b760ec34bf5b732', 12, 1, 'LaraPassport', '[]', 1, '2019-08-06 04:03:57', '2019-08-06 04:03:57', '2020-08-06 04:03:57'),
('b65c8bb9972752b5eba3ba431a6d639d283beeb8c8a72e7945a62d8a6293df8ac62accbb180a113b', 21, 1, 'LaraPassport', '[]', 1, '2019-08-06 04:07:35', '2019-08-06 04:07:35', '2020-08-06 04:07:35'),
('a92d98886dcad0bc60c599358df4412030e9e4733254ad9cb61a40a1952932920e9c0f9b678f4bfe', 21, 1, 'LaraPassport', '[]', 1, '2019-08-06 23:48:58', '2019-08-06 23:48:58', '2020-08-06 23:48:58'),
('ee34f6b189ef8e5201c65b31c6af2983de398b6d116aab39b5ba4bf2c915098ae39601164af49b2c', 21, 1, 'LaraPassport', '[]', 1, '2019-08-06 23:49:12', '2019-08-06 23:49:12', '2020-08-06 23:49:12'),
('c1a156bf91f4323b62e349eba86eaebe4630be7846d6558d85d50ea3716850192724f1eba5acbfc6', 21, 1, 'LaraPassport', '[]', 1, '2019-08-07 00:04:24', '2019-08-07 00:04:24', '2020-08-07 00:04:24'),
('f9809bd5cb29103f46aa6e463d2ffd51d4d4cc4175f3affcb57e033af29b440a8fe5ac9236cc497f', 7, 1, 'LaraPassport', '[]', 1, '2019-08-07 00:04:57', '2019-08-07 00:04:57', '2020-08-07 00:04:57'),
('745f65bb3b23fe53f4df8b48dc953bad644375606f907c954543c01fbf2158fa60c26c43af31f65f', 7, 1, 'LaraPassport', '[]', 1, '2019-08-07 00:05:54', '2019-08-07 00:05:54', '2020-08-07 00:05:54'),
('edcaf0daf97ec7c71f40f4b16075847d45b237b3a39e764dae9bbc59a30bf69180b5ee6625174843', 7, 1, 'LaraPassport', '[]', 1, '2019-08-07 13:08:38', '2019-08-07 13:08:38', '2020-08-07 13:08:38'),
('9c6ac1137077587feb16094324dd612643fc908347f629b6ce6b6ef2a372ce07aea0d27f11ead32b', 7, 1, 'LaraPassport', '[]', 1, '2019-08-07 13:13:41', '2019-08-07 13:13:41', '2020-08-07 13:13:41'),
('92ac91cc2804a8a975b3870e5c98ce50b6b65a76b75943def7dec0bc8735b01d2e8b9738f9b3870a', 7, 1, 'LaraPassport', '[]', 1, '2019-08-07 13:17:12', '2019-08-07 13:17:12', '2020-08-07 13:17:12'),
('4f7d948d0b8e3c46d64e6471c26c730f10ff97d6e0dc26224068b803b7656fadfb1ad19d0fb274f6', 7, 1, 'LaraPassport', '[]', 1, '2019-08-07 13:17:41', '2019-08-07 13:17:41', '2020-08-07 13:17:41'),
('334841bf4d46615a2cfea9137c999b2b122e0afc35ff5bf6ba91e1bd731e50e2d8944f3dd4dd3646', 7, 1, 'LaraPassport', '[]', 1, '2019-08-07 13:19:09', '2019-08-07 13:19:09', '2020-08-07 13:19:09'),
('04c2a690dbb8259117e9f0c392cd5b326d965549601c2b3203e71f58f13e0cd29f27d3bfae314990', 7, 1, 'LaraPassport', '[]', 1, '2019-08-07 15:37:55', '2019-08-07 15:37:55', '2020-08-07 15:37:55'),
('1de2471b613eaf82e72904eba75979ab98faaf98224d4b7fc2764937120e42027d4e1723d87c6dbd', 21, 1, 'LaraPassport', '[]', 1, '2019-08-09 04:07:45', '2019-08-09 04:07:45', '2020-08-09 04:07:45'),
('e86e083151ad715a55a8ac3320c09e695029aca4f5fec00398ca56176ad0651937a5920053ae5c0a', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-08-09 04:11:40', '2019-08-09 04:11:40', '2020-08-09 04:11:40'),
('e482bb88127268e80b21bbb87e0f59369f27da3490dca406e14430b66566db61289a37d2a1d38cd3', 12, 1, 'LaraPassport', '[]', 1, '2019-08-09 09:22:21', '2019-08-09 09:22:21', '2020-08-09 09:22:21'),
('1934110e87399680b4c28d0953136b39fe29cdbd1d1f581ec27315900e7cdc83afb5171e24978523', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-08-09 09:23:34', '2019-08-09 09:23:34', '2020-08-09 09:23:34'),
('6739743e3245e36225ae14fe368c5cea9fdef005b537fbe5d3b9e4896a0e0a8016a5a456a9c33cb0', 12, 1, 'LaraPassport', '[]', 1, '2019-08-09 09:25:33', '2019-08-09 09:25:33', '2020-08-09 09:25:33'),
('0cba973081dc9e09cff8112dfd090ff706b6eaaeacee7bd129b8b34aac03aed912e350d6d6785625', 4, 1, 'LaraPassport', '[]', 1, '2019-08-09 09:26:42', '2019-08-09 09:26:42', '2020-08-09 09:26:42'),
('a8120778262dbcacad9b6863aaaead36012592f21d67b7cc2477070d2b0626e704291a3aaddf64c0', 7, 1, 'LaraPassport', '[]', 1, '2019-08-19 09:11:49', '2019-08-19 09:11:49', '2020-08-19 09:11:49'),
('eaf40e2f5959027b721d5e9b1e0029ca9d5300b777b3650952fe06a7e67e2ba49e76c443988f091a', 5, 1, 'LaraPassport', '[]', 1, '2019-08-25 05:15:08', '2019-08-25 05:15:08', '2020-08-25 05:15:08'),
('4cc79c4e98b6be31072a55b0e227b99ffa4f110d46dc88f9e8645ede402d0ceffcf95d3b9963e889', 6, 1, 'LaraPassport', '[]', 1, '2019-08-25 05:16:59', '2019-08-25 05:16:59', '2020-08-25 05:16:59'),
('d12e731c0374f53e9cc463b9f8ee19a869c394dab85e06fa8fd412d05051d9bf087e069da08996d9', 2, 1, 'LaraPassport', '[]', 0, '2019-08-25 05:20:46', '2019-08-25 05:20:46', '2020-08-25 05:20:46'),
('ea6beff8eca1b58f4c222877285882d17ca5852ced36510c45b67e3fda0e14489bec172a1df5cc1e', 12, 1, 'LaraPassport', '[]', 1, '2019-08-25 05:21:40', '2019-08-25 05:21:40', '2020-08-25 05:21:40'),
('cbf4f704a9d71bbcca7783f8123d29ffeef375adc91339e4c4e5149b1ec08914f85265818acedd5b', 6, 1, 'LaraPassport', '[]', 1, '2019-08-25 05:24:19', '2019-08-25 05:24:19', '2020-08-25 05:24:19'),
('d68c672f9bb2eb9c5d6054688fd3ecf2c9ad45bc72f766e86d9597bc5272e354dfc1e4c7ac3b69d8', 12, 1, 'LaraPassport', '[]', 1, '2019-08-25 05:24:57', '2019-08-25 05:24:57', '2020-08-25 05:24:57'),
('336c0429d6221e30f8d842367b93d846611e1949a0f3ae8844cf4bb6a3bb47b341bcd528e6438f78', 1, 1, 'LaraPassport', '[]', 1, '2019-08-26 01:43:54', '2019-08-26 01:43:54', '2020-08-26 01:43:54'),
('dd3db0f8499a9abaec7df9946fb498985ab65cff0244e5d2be2ff2164e04c7942285ae3292fc103d', 7, 1, 'LaraPassport', '[]', 1, '2019-08-26 01:47:47', '2019-08-26 01:47:47', '2020-08-26 01:47:47'),
('b96e9c108b2d0d0cf96d30d269c2d286d9342a65879a02b1505f137f3d383d4c27a7f292639cc484', 1, 1, 'LaraPassport', '[]', 1, '2019-08-26 01:51:46', '2019-08-26 01:51:46', '2020-08-26 01:51:46'),
('0d9786d4947a430ba6503a7e63933d39b4b4111d454a606c9ad32d736c20e25731ff8eb28671da76', 7, 1, 'LaraPassport', '[]', 1, '2019-08-26 01:53:51', '2019-08-26 01:53:51', '2020-08-26 01:53:51'),
('2532074e5e528274ad6a0c473c85150239265c0c253215d87ca2c29b5321a52c2e64799d812c1fbd', 8, 1, 'LaraPassport', '[]', 1, '2019-08-26 02:27:49', '2019-08-26 02:27:49', '2020-08-26 02:27:49'),
('abd93b88289fc9d54cd9c2bacc938f3cf5f571a9794b5f4ccccedceae14cad194393740bb97f05d4', 9, 1, 'LaraPassport', '[]', 1, '2019-08-26 02:44:26', '2019-08-26 02:44:26', '2020-08-26 02:44:26'),
('d910503665b69ce91819cf32173b9ee084f54658e551fd19d81e7dfdeb0bd069741307450ccb0fe3', 10, 1, 'LaraPassport', '[]', 1, '2019-08-26 02:47:35', '2019-08-26 02:47:35', '2020-08-26 02:47:35'),
('1de595ca526f92e11c2fa0050df1770f85beaa260ed733c301c28170737069d34be869e0a2a69a2c', 11, 1, 'LaraPassport', '[]', 1, '2019-08-26 02:49:36', '2019-08-26 02:49:36', '2020-08-26 02:49:36'),
('60002eae5e3154703d50cc571eac2d61f1c8acad33ee9f6093f17ffc287f30c522de51f316c6fd05', 4, 1, 'LaraPassport', '[]', 1, '2019-08-26 02:55:57', '2019-08-26 02:55:57', '2020-08-26 02:55:57'),
('8ca3a8874c557ce27ddb07ec44b58a08d9f30bf3ba0605db22987a1af61d031f041ba39e072e8b00', 5, 1, 'LaraPassport', '[]', 1, '2019-08-26 03:11:29', '2019-08-26 03:11:29', '2020-08-26 03:11:29'),
('834ce27db15630f7bdffa9c0e90d2795176db2dd93ec136c1823dec8f29f808475719affd4b226a9', 6, 1, 'LaraPassport', '[]', 1, '2019-08-26 03:18:27', '2019-08-26 03:18:27', '2020-08-26 03:18:27'),
('59d02535c29ca3baf670449015f7a813cc7d8e249103462f172611a33f9e1af2f86f674f92e3608d', 6, 1, 'LaraPassport', '[]', 1, '2019-08-26 03:23:10', '2019-08-26 03:23:10', '2020-08-26 03:23:10'),
('98231f1051c4106639b84ca0daf8cc5437a931490226c5a87528e0772474c06f09e4bff80f729f34', 12, 1, 'LaraPassport', '[]', 1, '2019-08-26 03:23:47', '2019-08-26 03:23:47', '2020-08-26 03:23:47'),
('4d86b729763636ebc6dd026b0c5b302866062490235a94b82a0131d8cb1cd7bd60d235e00e07644a', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-08-27 03:13:22', '2019-08-27 03:13:22', '2020-08-27 03:13:22'),
('7c3ee39f0833ea4a2e7e11db2a5956e2bb417ad2ca4bb00dfec7e943776d5476a97cb2e7dc57cf5c', 21, 1, 'LaraPassport', '[]', 1, '2019-08-27 03:17:19', '2019-08-27 03:17:19', '2020-08-27 03:17:19'),
('31d5d9ba2f2810ad8cc4b054d489fc4cb9399f3c78c72b3ae726cbfc0b5189cd296e533dc1f61b4b', 8, 1, 'LaraPassport', '[]', 1, '2019-08-27 13:47:00', '2019-08-27 13:47:00', '2020-08-27 13:47:00'),
('926cb795ce9f4a068486cc0fbcb718efc9ac6a3efff475102644c5f62403e19aa82019b267590aae', 4, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:04:06', '2019-08-27 14:04:06', '2020-08-27 14:04:06'),
('31ba8b849e80673ae482a7e8e2c0b3cb1dfcf9728e1f11ef12aab39249fb65a37920ef6ac978bd11', 7, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:04:14', '2019-08-27 14:04:14', '2020-08-27 14:04:14'),
('5a9dd001aad3fc2fec1e5897961f7f659e4e73143f481c43ef55cf3d82468fa21ae03c45d36d7dd4', 9, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:05:04', '2019-08-27 14:05:04', '2020-08-27 14:05:04'),
('16dda6d6fd82acef85f54394e99ba3ced235732b540c7a3ca7aa03a97d932290cf9a2b1da8d6669e', 8, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:05:31', '2019-08-27 14:05:31', '2020-08-27 14:05:31'),
('0903744198957c526681de24dde0f8c269e4d1e89e2ce1aecd41cad44230f8c38198c70849375f46', 4, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:09:29', '2019-08-27 14:09:29', '2020-08-27 14:09:29'),
('778a1ee6abbd49122df5a0fda64035c7283fba7037a1576ec1c21a810289c56a9a05892882935e65', 21, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:12:41', '2019-08-27 14:12:41', '2020-08-27 14:12:41'),
('67e12102417d33f705760996c8bb0a6b463bd9b03ae0ffd489b2f2643d70ac74d1b3caf9452b6a3e', 21, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:12:56', '2019-08-27 14:12:56', '2020-08-27 14:12:56'),
('c23f4a76e3ae8b0ccf1f1af823a5174e52950934801310b8ef08e96fe54cf1f7c325266b8f0666c4', 7, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:13:46', '2019-08-27 14:13:46', '2020-08-27 14:13:46'),
('d0cd8398458d20c4a561bd03f43bbfae4532c6e19425a0bd1e1ac384e3ed25dff2e6edc24c75c98e', 4, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:19:33', '2019-08-27 14:19:33', '2020-08-27 14:19:33'),
('728b80cd52d93bc10f07c8cf824e9198e694c9db3574a865e661f3161cd04fa884744d8e5f66272d', 4, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:20:07', '2019-08-27 14:20:07', '2020-08-27 14:20:07'),
('48e2229fdd2aaa55804bd2364f54cb7526c5386ae04773c3e1a5f8395f84d23f0936cacb70130aae', 4, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:20:22', '2019-08-27 14:20:22', '2020-08-27 14:20:22'),
('c14e82bdff0d0fba1003dbebaa5cd9e405a00b7eaeb6e78be5446ba47a456130161c02f873091cc3', 4, 1, 'LaraPassport', '[]', 1, '2019-08-27 14:20:29', '2019-08-27 14:20:29', '2020-08-27 14:20:29'),
('0ddf57864bbaf22dcbfd180e3c119679a3a7102ff1fca3c2ffb925bfb62ab37b8c47893f97a1dad0', 4, 1, 'LaraPassport', '[]', 1, '2019-08-31 16:42:16', '2019-08-31 16:42:16', '2020-08-31 16:42:16'),
('0776b9f86dcaae2a5d55eca89f36f4aabed332b5e6c4db1a6d1d1d6e6f3b5bb8e1f5ecbcfff63df3', 12, 1, 'LaraPassport', '[]', 1, '2019-09-04 02:48:06', '2019-09-04 02:48:06', '2020-09-04 02:48:06'),
('c963b4918a430d3cddba4a9966f880977d76e1d14d77c7253740dca197eaed607b140255e72358d1', 1, 1, 'LaraPassport', '[]', 1, '2019-09-04 02:49:16', '2019-09-04 02:49:16', '2020-09-04 02:49:16'),
('caf5273b72a29d523602a1da2280918d8de799459ded874356b2b9e1be6c7200c67b31a15611257c', 4, 1, 'LaraPassport', '[]', 1, '2019-09-04 02:50:30', '2019-09-04 02:50:30', '2020-09-04 02:50:30'),
('0ca7af7e215ea90749571a484769241ababa97711e3dbe6b2147b2999b655ba57f1b7d7b062ce8b1', 7, 1, 'LaraPassport', '[]', 1, '2019-09-04 02:52:00', '2019-09-04 02:52:00', '2020-09-04 02:52:00'),
('cb59d5282d9c000f11f3efa6d95531038736a29cee8a0b55e5d79c77cdc2fadd8f309be2c7f1fc67', 4, 1, 'LaraPassport', '[]', 1, '2019-09-04 02:56:03', '2019-09-04 02:56:03', '2020-09-04 02:56:03'),
('d37f090080da87638825955fc4887cac23344f6f62bf4dcd00abaa0717feb968c74b4c587dc12fda', 5, 1, 'LaraPassport', '[]', 1, '2019-09-04 03:39:11', '2019-09-04 03:39:11', '2020-09-04 03:39:11'),
('3a5f563b226fe966904a92ee69f8dbfe07349a7eb5cec02ce7841af0cfe673049cc7945b65f1157f', 6, 1, 'LaraPassport', '[]', 1, '2019-09-04 03:46:13', '2019-09-04 03:46:13', '2020-09-04 03:46:13'),
('00768e4d203a160dcca45dc2001072f858bd9629ef423037c6e968d6ee86854465493c510971b7e0', 12, 1, 'LaraPassport', '[]', 1, '2019-09-04 03:53:37', '2019-09-04 03:53:37', '2020-09-04 03:53:37'),
('aeb3d15d4e78c49736d38b78f4a02aa3aa95bab3fcd4d8c8e60d58fd289bc997939b29b0141942d3', 4, 1, 'LaraPassport', '[]', 1, '2019-09-04 11:30:30', '2019-09-04 11:30:30', '2020-09-04 11:30:30'),
('27137249aa81bb37ac39edfc42e65d202b907f459beb1ce4ad3f94271feeeedb6ac669d928fbc24e', 12, 1, 'LaraPassport', '[]', 1, '2019-09-04 11:39:13', '2019-09-04 11:39:13', '2020-09-04 11:39:13'),
('49005e5cdfdf0bc077c00e5f4491520315174b9ad0c44c717be960722eabc33b4fca58feff506119', 4, 1, 'LaraPassport', '[]', 1, '2019-09-05 12:38:54', '2019-09-05 12:38:54', '2020-09-05 12:38:54'),
('59ffe2f01c468713f41797bda28a3605f6e54f1e96f5485d8f54f4b24444d8163f6578ac03135529', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-09-06 01:44:13', '2019-09-06 01:44:13', '2020-09-06 01:44:13'),
('e6ba0c8e0e226c5e77e839c551b24e93f1a6c8b7d612a5c5f0acc108c224c990ae34c8f8c7140aba', 12, 1, 'LaraPassport', '[]', 1, '2019-09-06 01:47:33', '2019-09-06 01:47:33', '2020-09-06 01:47:33'),
('8a846207edf329d90c6814b09844dffd2a0a4e3350e7dd95d25a3ff600149d8ba6afb47f17530bbc', 12, 1, 'LaraPassport', '[]', 1, '2019-09-06 09:44:08', '2019-09-06 09:44:08', '2020-09-06 09:44:08'),
('74dcf3dc63902657e64f2f351ab69ce49491a9f2bccd9504fc2b606dd435121ef09420005fac197b', 12, 1, 'LaraPassport', '[]', 1, '2019-09-06 09:44:41', '2019-09-06 09:44:41', '2020-09-06 09:44:41'),
('3fb16131dca3cbcf75fe27f06656889c2a667eaf38c1116de5d3fd8a04ffaca1589624741fe57cfe', 4, 1, 'LaraPassport', '[]', 1, '2019-09-07 01:12:34', '2019-09-07 01:12:34', '2020-09-07 01:12:34'),
('a8b40af462b85c71e8694312c7075eb8e0adde6470710a44d57dde9c8e3b39f4721054b5dc88d6e1', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 01:13:09', '2019-09-07 01:13:09', '2020-09-07 01:13:09'),
('7009fd60dc7482fe0b44031220ce1e0f5532dd759f890a30f2f98d9e4e356908ce3a140020f105c3', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 01:24:23', '2019-09-07 01:24:23', '2020-09-07 01:24:23'),
('3abd95ade1edc6c1ce344b187bef575362a93c78badf97fafb24e73639d30f134c0f15361f0db5e9', 1, 1, 'LaraPassport', '[]', 1, '2019-09-07 01:44:52', '2019-09-07 01:44:52', '2020-09-07 01:44:52'),
('af3395425115feca2285a8ad58e6b97536c7f1da3dde34b542b09bcb8ce8ada71d4dfbac2643f1aa', 4, 1, 'LaraPassport', '[]', 1, '2019-09-07 01:46:19', '2019-09-07 01:46:19', '2020-09-07 01:46:19'),
('0dc3d224babf72a15931a969c364899a004c5bab39480274fe70179e93db4ab4ac8f01d43f4b053d', 2, 1, 'LaraPassport', '[]', 1, '2019-09-07 02:05:24', '2019-09-07 02:05:24', '2020-09-07 02:05:24'),
('29a65d66b7056cf9c661cdc15d810b9a426fe9f62be6dec04e2c3563e0da32a13bb889b37692d5ef', 5, 1, 'LaraPassport', '[]', 1, '2019-09-07 02:07:23', '2019-09-07 02:07:23', '2020-09-07 02:07:23'),
('e2b27fcf8ec18303bfa70166bc9eb11294032bd60cb37af19ee7fc13725c37974448fa5ebf716a93', 4, 1, 'LaraPassport', '[]', 1, '2019-09-07 02:09:48', '2019-09-07 02:09:48', '2020-09-07 02:09:48'),
('65a1aa94a966057dd1200af28375a4e3bada679e8b6b732434397f98df6d529ed722b945ab18fe67', 5, 1, 'LaraPassport', '[]', 1, '2019-09-07 02:10:50', '2019-09-07 02:10:50', '2020-09-07 02:10:50'),
('15550f4379a77748777ae7575b7be88d13068752bc214e6b04f0f41af59a377c0a9312c28e2a9848', 6, 1, 'LaraPassport', '[]', 1, '2019-09-07 02:12:35', '2019-09-07 02:12:35', '2020-09-07 02:12:35'),
('ce03160e6397b65114a842c0e43703213af2a3249032528070d4c620941751b7d4800ddc1a124703', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 02:14:00', '2019-09-07 02:14:00', '2020-09-07 02:14:00'),
('d9d4fd2ad21b58f440b42bd0b68e8609be321cbd4d3e6f35191ccd1968951ec24244606005b70f57', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-09-07 02:20:04', '2019-09-07 02:20:04', '2020-09-07 02:20:04'),
('5f5c501f0ccf340cd0bb504476f7c188cb5bf6b2227ee56fd265a99ab64bc041e625fe8130593e43', 58, 1, 'LaraPassport', '[]', 1, '2019-09-07 02:27:04', '2019-09-07 02:27:04', '2020-09-07 02:27:04'),
('19dbeefc3e8077368932004f9d7aa65adf87835a58995ef05ca18fd8565de8650872d95e77b0ea2f', 21, 1, 'LaraPassport', '[]', 1, '2019-09-07 03:13:23', '2019-09-07 03:13:23', '2020-09-07 03:13:23'),
('8133a7fca7cb3a8b2f01132fdb9c940d3eb4e66faf4e63cfc0741ac9934f58b6215f4814d2346eb9', 7, 1, 'LaraPassport', '[]', 1, '2019-09-07 03:19:56', '2019-09-07 03:19:56', '2020-09-07 03:19:56'),
('c4c04f055a0f330dab290202821f455f634d58a454841e3d9d343fa8f8740b17eab0fa578efa9853', 8, 1, 'LaraPassport', '[]', 1, '2019-09-07 03:27:31', '2019-09-07 03:27:31', '2020-09-07 03:27:31'),
('e2ab99d71e2dad30c87cb9906c5884125d84d2417abce917f2b1b8b96c0e34fd23760ec79546971d', 2, 1, 'LaraPassport', '[]', 1, '2019-09-07 03:34:04', '2019-09-07 03:34:04', '2020-09-07 03:34:04'),
('8f82ef8e1e7d27bfd7b6964f28b76062f18e1002b1ae825e260659d5cdd7137d0ec02f3258c0a0a5', 9, 1, 'LaraPassport', '[]', 1, '2019-09-07 03:34:53', '2019-09-07 03:34:53', '2020-09-07 03:34:53'),
('ccd9b8053a35853c7886edaffea7bb75061935dfd7253526d22437e6676899dd8c1074601a304f55', 10, 1, 'LaraPassport', '[]', 1, '2019-09-07 03:35:46', '2019-09-07 03:35:46', '2020-09-07 03:35:46'),
('3e4bbda0c0530bedec1daecff01f644e29d65a33c86407951c50b545f41fe877fe0ebb41a6dc8e2d', 11, 1, 'LaraPassport', '[]', 1, '2019-09-07 03:36:14', '2019-09-07 03:36:14', '2020-09-07 03:36:14'),
('28d1d35a03d933361c677b9ece72c6698db99c2d30faf293daeb02abd5fd9bf63d798f7d94fbd31d', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 07:05:23', '2019-09-07 07:05:23', '2020-09-07 07:05:23'),
('192210e53cacbe9e515d340468c5262b30dc5ca6d14328f927fe97e2452d7268726e8a77d1348f38', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 07:09:14', '2019-09-07 07:09:14', '2020-09-07 07:09:14'),
('af043ecf3b3849e677697ad5a655527fa934b54e6ba9021a113692711931908a1936e1bcd223baad', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-09-07 07:13:53', '2019-09-07 07:13:53', '2020-09-07 07:13:53'),
('069adf71822f0bbf4d278a948e5fe3ff210051cdfeab75f11105a23fbc7a45365bb7f67b6e334b2c', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-09-07 07:50:36', '2019-09-07 07:50:36', '2020-09-07 07:50:36'),
('7149bb3c4b6fc18c62a17e22afe2f7519f852e48c83ea857967f85c095cbd038689e6b5f16b089a0', 6, 1, 'LaraPassportVendor', '[]', 1, '2019-09-07 07:55:16', '2019-09-07 07:55:16', '2020-09-07 07:55:16'),
('bf11250e0331f29f9a98601964f0189cb0e51163928ff17a5d5406bbabe50ac666ba1734585eea70', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 09:12:42', '2019-09-07 09:12:42', '2020-09-07 09:12:42'),
('53beb2683bbe235789da9cbecc1351d83b87503ab92bcbf9f471638a98e5381851d32cc94777ae83', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-09-07 09:23:05', '2019-09-07 09:23:05', '2020-09-07 09:23:05'),
('e0c9a724cac463db828ed64bdfb128048ef90124a78d4a9a17c32e7d29697bfdce845be226d647d2', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 09:29:30', '2019-09-07 09:29:30', '2020-09-07 09:29:30'),
('b9b3506c4e9859c690d29f7a9c1e79411a4dbc58b3308c8cbe0adcfaa0cf8875b6925be604b2f7e9', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-09-07 09:31:03', '2019-09-07 09:31:03', '2020-09-07 09:31:03'),
('3774300e693fd756575a696862f7fc5cb7884bbe1bf2e145ef1c2bae89972f7b5a856cb0610500be', 21, 1, 'LaraPassport', '[]', 1, '2019-09-07 09:35:11', '2019-09-07 09:35:11', '2020-09-07 09:35:11'),
('6fadab49fd58a93790a2f365b77c338ce3a085f45fbab4f6a66b355f4c3fce25ad86db87970cf903', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-09-07 09:36:42', '2019-09-07 09:36:42', '2020-09-07 09:36:42'),
('4f45fff01f04da1428ef8be0fef949fbda1c91b1a2832c7006a61cb1147e497f36daeb042859390d', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 09:41:48', '2019-09-07 09:41:48', '2020-09-07 09:41:48'),
('d30c8ac2a2bf08183f3621c9c1c8795624aa48a2704a3ce3c71441c4397a84b4c5cc36d561b59461', 4, 1, 'LaraPassport', '[]', 0, '2019-09-07 09:54:52', '2019-09-07 09:54:52', '2020-09-07 09:54:52'),
('54aabd5c2f4569099c89209e6d4962b1b488731d7d5045ab58fd43e63e84c7cfc896d0ea6ec7331f', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 14:11:57', '2019-09-07 14:11:57', '2020-09-07 14:11:57'),
('ef0a3ce90b143a93a9846a15f1cc1b7c47047f40603bf947e2e2e9ced72e37ae409c893ab2ec514d', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-09-07 14:15:38', '2019-09-07 14:15:38', '2020-09-07 14:15:38'),
('d9dbfdb8683f8f03992b402a357638cf9a0f1f2cfdbc695fee5c29db6bc00dced117159fd4ce8a1c', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-09-07 14:49:13', '2019-09-07 14:49:13', '2020-09-07 14:49:13'),
('a9954df44ee07e9681bee8f5d3c3f0d268de5cf22b8b4bb246a15ea6751d143e2f7147d9de65cbba', 12, 1, 'LaraPassport', '[]', 1, '2019-09-07 15:05:41', '2019-09-07 15:05:41', '2020-09-07 15:05:41'),
('cc33d962ce3194805790af46786a982d818cef9e598a6e98287bb12be33f9b254497886627f74793', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-09-08 02:35:55', '2019-09-08 02:35:55', '2020-09-08 02:35:55'),
('f6f987428cd67d78477d393fafa46c44a236e7f7294a9ba862478d2e4e454da011d468be572b8a62', 2, 1, 'LaraPassport', '[]', 1, '2019-09-08 02:37:21', '2019-09-08 02:37:21', '2020-09-08 02:37:21'),
('b40dd06b1365a7b93a918c6901b514ee44dcc4191488469df3bfce1a9d5d782cc2bafe43de9df0ce', 1, 1, 'LaraPassport', '[]', 1, '2019-09-08 02:38:09', '2019-09-08 02:38:09', '2020-09-08 02:38:09'),
('1d69e2e33244c96173c13c0be9d8861bb0f5d6076e1c22f95d056570c9e020009ed92d181427b2a0', 4, 1, 'LaraPassport', '[]', 1, '2019-09-08 02:40:25', '2019-09-08 02:40:25', '2020-09-08 02:40:25'),
('ab75f556a0a14342eba259e46dfbd198ca20d975b3fcebcb5d73800e621b7a9374923285046046c5', 5, 1, 'LaraPassport', '[]', 1, '2019-09-08 02:58:28', '2019-09-08 02:58:28', '2020-09-08 02:58:28'),
('874922aa3075f32a1ff9d7aa34d45b676ee2c339dd47bd9e45861fbb6269281ada637e84facc1b37', 6, 1, 'LaraPassport', '[]', 1, '2019-09-08 03:00:51', '2019-09-08 03:00:51', '2020-09-08 03:00:51'),
('58a0039b4c5879e214eaad1fbb879f6c8951d8126c19b83bffa546c0acd3799ba92d6d3ca571c8b4', 12, 1, 'LaraPassport', '[]', 1, '2019-09-08 03:04:14', '2019-09-08 03:04:14', '2020-09-08 03:04:14'),
('8556d57cd1c2692876df93be69c60e70b62db93ff090bbe850a90393c37e3400e17b63962b47ccf8', 5, 1, 'LaraPassportVendor', '[]', 0, '2019-09-08 04:52:09', '2019-09-08 04:52:09', '2020-09-08 04:52:09'),
('7bc84103a03752d73c62f872f3b649d3f44224c64ad893d54067738bdc606d3bfcada9d46677ed22', 4, 1, 'LaraPassport', '[]', 1, '2019-09-08 05:11:16', '2019-09-08 05:11:16', '2020-09-08 05:11:16'),
('65831f4333a3ab13db992fcec345c455368ddcf97e5e7cf9eba7892a349cc4383e5db518f94cd578', 12, 1, 'LaraPassport', '[]', 1, '2019-09-08 05:14:07', '2019-09-08 05:14:07', '2020-09-08 05:14:07'),
('e0a1b64ceb270b3afe231cb7bfd9532bbf2eeb0bd3a949ac2e2d2251b9525c9255fc23a5344f14f5', 12, 1, 'LaraPassport', '[]', 1, '2019-09-08 09:38:41', '2019-09-08 09:38:41', '2020-09-08 09:38:41'),
('1db9e4c9ce67327a4ed90887193014b47233e2d10c2366eb79a4af2f86cede07d69708eeb6a1504e', 12, 1, 'LaraPassport', '[]', 1, '2019-09-12 12:24:03', '2019-09-12 12:24:03', '2020-09-12 12:24:03'),
('c31a0119d9b50372c20be64f8706e90ece62824773ef7b04616b61bc561e0a942c9025f1a35dba6f', 4, 1, 'LaraPassport', '[]', 1, '2019-09-12 12:28:29', '2019-09-12 12:28:29', '2020-09-12 12:28:29'),
('7acf852ea276a9b87d5d67aff0bd3b9e3cb768037bd72450ed55a12ae1a81824117cb4353e6943ec', 5, 1, 'LaraPassport', '[]', 1, '2019-09-12 12:29:26', '2019-09-12 12:29:26', '2020-09-12 12:29:26'),
('e3cbc40d3674679dcc89a6469657d98e65d0b9043419bf90488557860515bafff26aba0602534df1', 6, 1, 'LaraPassport', '[]', 1, '2019-09-12 12:30:05', '2019-09-12 12:30:05', '2020-09-12 12:30:05'),
('4ca89e4ffa79ec4a4309c1b20d65f09fdaf5ae11cc33904ed8ddc4b973033ff7a58b87b36c6487c1', 12, 1, 'LaraPassport', '[]', 1, '2019-09-12 12:30:51', '2019-09-12 12:30:51', '2020-09-12 12:30:51'),
('743987626a2aa6ea06a9f5b92c967252df8cd28218bd7772b302335a5e63500686cf2e8f0f8d3e72', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-09-12 12:34:10', '2019-09-12 12:34:10', '2020-09-12 12:34:10'),
('bf75790073f7b79817428d71eeba0fe9fb893e11b3026c65ff3e54d9754f12f4414b95234f144fff', 4, 1, 'LaraPassport', '[]', 1, '2019-09-12 12:37:05', '2019-09-12 12:37:05', '2020-09-12 12:37:05'),
('75ab9ed34b7454e8a625f2eee5d9dac3aa6fedb121cffa4e169617c9718f3804c1d60d13ce956206', 12, 1, 'LaraPassport', '[]', 1, '2019-09-12 12:39:22', '2019-09-12 12:39:22', '2020-09-12 12:39:22'),
('957be2dd156ee70502e0d45128bb40af10f812d93b68b01d71c7d844e128e358ebd8bae418623c92', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-09-12 12:40:12', '2019-09-12 12:40:12', '2020-09-12 12:40:12'),
('d2ec41995b4baafffb3ef45091f4cf99e0438003f75fb35812c0d7d4970d3582a099f3d2f2eda928', 1, 1, 'LaraPassportVendor', '[]', 0, '2019-09-12 12:42:56', '2019-09-12 12:42:56', '2020-09-12 12:42:56'),
('c49698a74cea8f766720b376ef24b376de53048a1b47388e72a7360cf4e9024a678c051664fa1f03', 13, 1, 'LaraPassport', '[]', 0, '2019-09-12 13:40:46', '2019-09-12 13:40:46', '2020-09-12 13:40:46'),
('d0ff271c36b22701f3a97ba7c84166fb9c16cf55e810b9d7d26a05d98b79ea477ceca8c0800fad43', 2, 1, 'LaraPassport', '[]', 1, '2019-09-12 13:58:30', '2019-09-12 13:58:30', '2020-09-12 13:58:30'),
('cfc5211b0fbf0d5a8259e1f7fd7f414c34dbc8d005f58252aba6829365e14f88461967f6fe6bbe75', 1, 1, 'LaraPassport', '[]', 1, '2019-09-12 13:58:53', '2019-09-12 13:58:53', '2020-09-12 13:58:53'),
('6180348a4a665c780a7edee9c52e681339576ecab3e421a7c3b0a3eeae112302c2da56056a09a49f', 4, 1, 'LaraPassport', '[]', 1, '2019-09-12 14:00:02', '2019-09-12 14:00:02', '2020-09-12 14:00:02'),
('be82f6ea80f66d0dafc57297d6650d3f5af859d89faf8693765b2afd3f16f2f516d8b45a9de82421', 12, 1, 'LaraPassport', '[]', 1, '2019-09-12 14:39:08', '2019-09-12 14:39:08', '2020-09-12 14:39:08'),
('4f16f7413a77085c66b13a806c7e371d47509991d1c113a6409bb9501d980f285c34d6a54503edbe', 8, 1, 'LaraPassport', '[]', 1, '2019-09-12 14:39:29', '2019-09-12 14:39:29', '2020-09-12 14:39:29'),
('2791c25b7633c40f8748f5ac29b993c07f4543e7739deace8834fd06fdd580c48ad31e672f3427ef', 12, 1, 'LaraPassport', '[]', 1, '2019-09-12 14:40:15', '2019-09-12 14:40:15', '2020-09-12 14:40:15'),
('8ec2a7dc9c8def2f2f41eb25b376d5f37114e3806c58a4efec4d6845d5648b5adbfcf41cd61e0ac6', 4, 1, 'LaraPassport', '[]', 0, '2019-09-12 14:41:31', '2019-09-12 14:41:31', '2020-09-12 14:41:31'),
('c3450483ee7b24472166cbebbe6e79691ad2d719492261feec5cd54c2098b59d4ef020d8ee9ce30f', 12, 1, 'LaraPassport', '[]', 1, '2019-09-15 14:45:48', '2019-09-15 14:45:48', '2020-09-15 14:45:48'),
('0a8284656ae1a7301ba6f4aa3f970a36941790b8e5eb41490a08fc400bbc28f591ed9159ad46b35e', 4, 1, 'LaraPassport', '[]', 1, '2019-09-15 14:47:38', '2019-09-15 14:47:38', '2020-09-15 14:47:38'),
('38ae4224bea60da79cd3c01406c6c09fee71e535fdefe7d6bc2ccca47a67730e57941c80e5368870', 5, 1, 'LaraPassport', '[]', 1, '2019-09-15 14:48:07', '2019-09-15 14:48:07', '2020-09-15 14:48:07'),
('dea256567b383b6b12f22296ad89fe0e104afc5faf4f73b851f448d02f46c3f81faae92e42dec79c', 6, 1, 'LaraPassport', '[]', 1, '2019-09-15 14:48:35', '2019-09-15 14:48:35', '2020-09-15 14:48:35'),
('a5ec1ffbb090a8301325a45d1d2f732c752fa595e4ec79111a4cd14e62196b2f67660b4066f1e4ab', 12, 1, 'LaraPassport', '[]', 1, '2019-09-15 14:49:16', '2019-09-15 14:49:16', '2020-09-15 14:49:16'),
('b25a0ce1f7c95cffb329ccadd2cca7db3d9f2bee9b2e46b928579fac90342613d489db743dcd497b', 7, 1, 'LaraPassport', '[]', 1, '2019-09-15 14:54:57', '2019-09-15 14:54:57', '2020-09-15 14:54:57'),
('f44965466a99dc720205c790164c7f9f92544a1990d608e3e7fcb420ff333ed81b7de927bc929399', 8, 1, 'LaraPassport', '[]', 1, '2019-09-15 14:56:27', '2019-09-15 14:56:27', '2020-09-15 14:56:27'),
('b79beebbdd3a4fff3544e4617951d2e9c4b3ec1c1fbc5b82b1a2eee19fdb847de223bc1662c56583', 10, 1, 'LaraPassport', '[]', 1, '2019-09-15 14:58:44', '2019-09-15 14:58:44', '2020-09-15 14:58:44'),
('4dc61b72ca44257123e0c8db87ad4a9101f09f82dc4fa9dbfbaf87f0973f7446422197b14e850f98', 9, 1, 'LaraPassport', '[]', 1, '2019-09-15 14:58:58', '2019-09-15 14:58:58', '2020-09-15 14:58:58'),
('51ec85f70ddc2dde770085872bc3cef27f48582f3fb8d2a89308d55eb39d4290557c46a29f1fb2ce', 1, 1, 'LaraPassport', '[]', 1, '2019-09-15 15:01:41', '2019-09-15 15:01:41', '2020-09-15 15:01:41'),
('ea162b2373284b4204f71f349c64f7e413d1e3daf97ced9564a0f36b7c14be23c0f85f218c1279e4', 1, 1, 'LaraPassport', '[]', 1, '2019-09-15 15:23:54', '2019-09-15 15:23:54', '2020-09-15 15:23:54'),
('2aecb8007d0fe8791b63381ab304033f84a63aa03c2e8191438853f1063319740fbd1c1e2254f313', 12, 1, 'LaraPassport', '[]', 1, '2019-09-15 15:24:28', '2019-09-15 15:24:28', '2020-09-15 15:24:28'),
('c2dad222c2903a42df7ee3b24181b452f1e6560ac59023edf315a1c12be28162410c1fa3e41645c4', 1, 1, 'LaraPassport', '[]', 1, '2019-09-15 15:27:38', '2019-09-15 15:27:38', '2020-09-15 15:27:38'),
('d779fdd655bd57e948f144ee2dda861648a5065def65c7b001793992bf4306b664c513e12e6eb529', 4, 1, 'LaraPassport', '[]', 0, '2019-09-15 15:27:46', '2019-09-15 15:27:46', '2020-09-15 15:27:46'),
('50652b3bcf270b2698e2bd6e24c5134eb155a1fe876d2f86fdfd8068272c62223c312a877ebd117c', 12, 1, 'LaraPassport', '[]', 1, '2019-09-15 15:50:45', '2019-09-15 15:50:45', '2020-09-15 15:50:45'),
('b70dbc797a2f731594833fa657500492e7be089b0600b66ed6227412e4c94e0959a40ff64766b5f6', 1, 1, 'LaraPassport', '[]', 1, '2019-09-30 13:00:57', '2019-09-30 13:00:57', '2020-09-30 13:00:57'),
('3bcf1660440e903ee0d71c78d28dc75bed2a6369f79b1ca8abacafe940e19e300e389ab7f09e9aa6', 1, 1, 'LaraPassport', '[]', 1, '2019-09-30 13:02:09', '2019-09-30 13:02:09', '2020-09-30 13:02:09'),
('ad0e6d173c616feaa9e0cae2f613b9fe46287a6b26ac4a7dfb03d6d5ef1b63d50c0e23ed88244ac4', 4, 1, 'LaraPassport', '[]', 1, '2019-09-30 13:02:39', '2019-09-30 13:02:39', '2020-09-30 13:02:39'),
('a10ca352558779559621c8ec5cbd86a3d603e4b1ae44cc9927f9583c181fe88eb7fce6fce2d3d83d', 4, 1, 'LaraPassport', '[]', 1, '2019-09-30 13:11:37', '2019-09-30 13:11:37', '2020-09-30 13:11:37'),
('02d400f4cd3f1b6e6aaef8483806d19ce0c5873534f01b36ae75fadd79b011b8875c86e0286bae31', 5, 1, 'LaraPassport', '[]', 1, '2019-09-30 14:15:35', '2019-09-30 14:15:35', '2020-09-30 14:15:35'),
('33e51a58e735f0c21b8a685ec0bc1d543a9bbe313903c8b8b3f3e5d87b155a6004cb3538243fdddf', 6, 1, 'LaraPassport', '[]', 1, '2019-09-30 14:16:12', '2019-09-30 14:16:12', '2020-09-30 14:16:12'),
('4cdc3bd5f5541af2e23c47adb0333566815bd4dc60fc235dc190d4c7e49ec608af8593b2117d1728', 12, 1, 'LaraPassport', '[]', 1, '2019-09-30 14:16:39', '2019-09-30 14:16:39', '2020-09-30 14:16:39'),
('1ad8a1da88263e023de373564070dbdb9443225aa9527bf6bf48e8042c5353fbef52b80b1fb75677', 12, 1, 'LaraPassport', '[]', 1, '2019-09-30 14:25:25', '2019-09-30 14:25:25', '2020-09-30 14:25:25'),
('381ccaee6695769c5b449c2c24c7e73f0294a74ee86e9a615de21ceec71601b209916a68e39ed7a3', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-09-30 15:08:26', '2019-09-30 15:08:26', '2020-09-30 15:08:26'),
('ed3b9e5072cddfdeac6e7c66fd791ad98744d56bef81ca935ffc941971fab392d1bddae9d1b365cd', 12, 1, 'LaraPassport', '[]', 1, '2019-10-02 10:51:00', '2019-10-02 10:51:00', '2020-10-02 10:51:00'),
('77ae5236b022ae82e47adcc429d72e3fb4cf362d6e8ff5d24536acf639e35f435e5669c7ee944ec6', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-02 11:11:20', '2019-10-02 11:11:20', '2020-10-02 11:11:20'),
('585b2976a204acaf79d0ce89693cb676e4168a797989045b38f2c392335ba40528ffdf01b4ffc374', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-05 07:47:35', '2019-10-05 07:47:35', '2020-10-05 07:47:35'),
('8eeb7d67ef1c5152f32774dd5718dd41a7e81e84f5173774811ea60fc23da6a29e71a4eb37093777', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-05 07:49:24', '2019-10-05 07:49:24', '2020-10-05 07:49:24'),
('9e3e49fee44085b57439cf557a0825db65e86fbe005f7a01052b7ad99a1af0ceff6f6b4fdd6dd77a', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-05 07:52:21', '2019-10-05 07:52:21', '2020-10-05 07:52:21'),
('862018d2420c60b3c75ef7212f772197cfa6cc888a62fa63b7355dafcb5e934c6fa49636f851ba1e', 7, 1, 'LaraPassport', '[]', 1, '2019-10-05 07:52:44', '2019-10-05 07:52:44', '2020-10-05 07:52:44'),
('3e166212cde53cc9be230ff41b2426ccaecb679c09c02362e17bd3484f7a4986bea9acc2d10833ce', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-05 07:53:09', '2019-10-05 07:53:09', '2020-10-05 07:53:09'),
('6e8a82c84306f12cbd6d8e89e69521a2e70cfabcf712d7301e0d6f1096822c8b0dafa6591581d74b', 12, 1, 'LaraPassport', '[]', 1, '2019-10-05 08:15:32', '2019-10-05 08:15:32', '2020-10-05 08:15:32'),
('0cecc0619e6d45c44e39d6ce492c2f27e4619699de857f6aa24ba287bad82ec7e099311fc157bff1', 12, 1, 'LaraPassport', '[]', 1, '2019-10-05 08:32:12', '2019-10-05 08:32:12', '2020-10-05 08:32:12'),
('e76fc83cb4c8585bbd31eaacac58b46c2d975565647d3ec1e0d255c96c391c64f16953fca558cfe5', 12, 1, 'LaraPassport', '[]', 1, '2019-10-05 14:17:49', '2019-10-05 14:17:49', '2020-10-05 14:17:49'),
('7b0d47b79fb868a1ef9cfa7a0ffdf15c0ffa8de034ba95ce47ed16eeb7b730073422a997c2b813ed', 13, 1, 'LaraPassport', '[]', 1, '2019-10-05 14:21:05', '2019-10-05 14:21:05', '2020-10-05 14:21:05'),
('33034e7570628b698f5bb1eec9e953421cabcdb4266e6276ad9f5e039a5c7754be0cb34f8a2f31a0', 12, 1, 'LaraPassport', '[]', 1, '2019-10-05 14:23:49', '2019-10-05 14:23:49', '2020-10-05 14:23:49'),
('ba30d8f5c07317dcbd119cfb14502b455045f022a891b0ac55c0c0a05f896fe5427e572ce0b4c6d0', 13, 1, 'LaraPassport', '[]', 1, '2019-10-05 14:32:10', '2019-10-05 14:32:10', '2020-10-05 14:32:10'),
('92293e016b095c0258cd4af2dc92712001ca4a42a47ed2f97febe9e38d6f7c2ed05ece10cddfc86f', 4, 1, 'LaraPassport', '[]', 1, '2019-10-05 14:48:26', '2019-10-05 14:48:26', '2020-10-05 14:48:26'),
('eb26e2e2629afd9e7885c5953fa8f83af37f49fbbbee2bfbcd6c8df4f28145ae0e70ac2998fe2e2a', 13, 1, 'LaraPassport', '[]', 1, '2019-10-05 14:49:50', '2019-10-05 14:49:50', '2020-10-05 14:49:50'),
('689fb010deacf3e54c558a769bfacc3f80f753ea74733d642d690dc8de8084d08ef0481bd14c6feb', 12, 1, 'LaraPassport', '[]', 1, '2019-10-05 15:06:31', '2019-10-05 15:06:31', '2020-10-05 15:06:31'),
('570d81a8947d33525da568342f8b6a7b85f6b8e8d00e7699673c00757bd1063c2d485f250a472a11', 14, 1, 'LaraPassport', '[]', 1, '2019-10-05 15:09:10', '2019-10-05 15:09:10', '2020-10-05 15:09:10'),
('83d1d344043e9596ab0222fd3b10e037c1c9494aa94a373c9a943e013692e787f4ca71e428cf1587', 4, 1, 'LaraPassport', '[]', 1, '2019-10-05 15:09:27', '2019-10-05 15:09:27', '2020-10-05 15:09:27'),
('abea89a9aa232fe460921385b1ad0210bea39e4821c9694bba1bde0c3fdd4fb54d31e34dd3a46885', 13, 1, 'LaraPassport', '[]', 1, '2019-10-05 15:09:36', '2019-10-05 15:09:36', '2020-10-05 15:09:36'),
('a744e4289ba365600606bdc32e794db75419e8c356ed316671c316dc37118e540f5a3998c0d052c6', 14, 1, 'LaraPassport', '[]', 1, '2019-10-05 15:11:01', '2019-10-05 15:11:01', '2020-10-05 15:11:01'),
('bfff8c9cf9f93e0968fef6ad927bb60cf3a4e4f5b4428550c08f1b63739634e256a1bc44ade1678c', 13, 1, 'LaraPassport', '[]', 1, '2019-10-05 15:15:20', '2019-10-05 15:15:20', '2020-10-05 15:15:20'),
('f0d5703d4b1ec74c3408f8c8fc34ba7153082e8342efd1a097703eb10c4a5c9df436fb2baf34ecf5', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-05 15:27:42', '2019-10-05 15:27:42', '2020-10-05 15:27:42'),
('818053f302794aeed940f409e50a4212c6715de24d07f068836e8f0861c44481e1d61b71957646fc', 13, 1, 'LaraPassport', '[]', 1, '2019-10-05 15:33:54', '2019-10-05 15:33:54', '2020-10-05 15:33:54'),
('c1b710c27af245c1152f41ec8ee33a39bd604046edbb0e9b6c4d109d5d60e9f205c0e3896eb68206', 13, 1, 'LaraPassport', '[]', 1, '2019-10-06 09:56:22', '2019-10-06 09:56:22', '2020-10-06 09:56:22'),
('da6ee77f7b06922c771971eefb0d09d0f638a54cfccdd8cb8391a18b20259ed468c99be4ae7fc792', 13, 1, 'LaraPassport', '[]', 1, '2019-10-06 10:14:34', '2019-10-06 10:14:34', '2020-10-06 10:14:34'),
('01d8d3b80defe9428d77b58b7bffaf69a09eff1ab92688f6cf712244a3a0c6b11ef37e078d187a87', 12, 1, 'LaraPassport', '[]', 0, '2019-10-06 10:14:44', '2019-10-06 10:14:44', '2020-10-06 10:14:44'),
('fc144e84ec8518122e9e23098a756019d5f4e463f840f98508b2fad60cc8b64e92fb88b4aecbd2a1', 12, 1, 'LaraPassport', '[]', 1, '2019-10-06 11:51:18', '2019-10-06 11:51:18', '2020-10-06 11:51:18'),
('63b5be4223efcbd1737743178f4cffe96d469bbc67f43a7eddc78f8fafcaa21f4686ef2b034c92a2', 13, 1, 'LaraPassport', '[]', 1, '2019-10-06 11:52:13', '2019-10-06 11:52:13', '2020-10-06 11:52:13'),
('65ea315edc6aaf157b8bdd452b01cb7a2c0ca60c7b07a2e7a4aa9d704580c2f75cf14118e040fd8f', 14, 1, 'LaraPassport', '[]', 1, '2019-10-06 11:56:46', '2019-10-06 11:56:46', '2020-10-06 11:56:46'),
('8a37bfc4df10270df90d0b00e29e5267866f58fa2614892bc19cf516a509fcb68be19d5ae07e73d2', 5, 1, 'LaraPassport', '[]', 1, '2019-10-06 11:59:18', '2019-10-06 11:59:18', '2020-10-06 11:59:18'),
('d25c42aaaa0f6ae25d1e8d1bdd0953efdc7eb3d5c5cee1ef208bc6d1adfa6dbd6bea9cac1a3648dd', 14, 1, 'LaraPassport', '[]', 1, '2019-10-06 12:00:45', '2019-10-06 12:00:45', '2020-10-06 12:00:45'),
('79c0c1a4fb16edd240cb15a24b84da083859c6b88b76c2d4a7a30033b5d42aaa55b325f60cb9a4f6', 13, 1, 'LaraPassport', '[]', 1, '2019-10-06 12:13:18', '2019-10-06 12:13:18', '2020-10-06 12:13:18'),
('60eea6fcd6e679770d021467a6ea1d9302b68adc616a9c82c48187d71522a52367c45cb19b1b0f7f', 12, 1, 'LaraPassport', '[]', 1, '2019-10-12 12:42:07', '2019-10-12 12:42:07', '2020-10-12 12:42:07'),
('542d1e8302be0d5da51e40382b3153d37906fb9fe7fb3c51d018128285a52cb6e7edae8785d44d8b', 13, 1, 'LaraPassport', '[]', 1, '2019-10-12 12:45:01', '2019-10-12 12:45:01', '2020-10-12 12:45:01'),
('9186c33538d85489dbdae6b1af53b16d9bc21655c43e423961e4a45062cb8876841533422942c818', 12, 1, 'LaraPassport', '[]', 1, '2019-10-12 13:05:53', '2019-10-12 13:05:53', '2020-10-12 13:05:53'),
('ddad22ffda25d4881be4c02890ac1f8e6bb2d4af9bc66ccfc65794d5b12b984f7e4712d9ec239a75', 13, 1, 'LaraPassport', '[]', 1, '2019-10-12 13:07:12', '2019-10-12 13:07:12', '2020-10-12 13:07:12'),
('e5dbbbc99c11a2a0ca6add9224baee962be6d70260d11d4c5f804f9f0dcc7e31940d2c4a31e3f98f', 14, 1, 'LaraPassport', '[]', 1, '2019-10-12 13:10:59', '2019-10-12 13:10:59', '2020-10-12 13:10:59'),
('aa7e5b51a2017fedff57fac3f2ccd3ecde057de2460afa1983c08eae6dd998064f91e654959d3316', 13, 1, 'LaraPassport', '[]', 1, '2019-10-12 13:13:01', '2019-10-12 13:13:01', '2020-10-12 13:13:01'),
('5d9976366e0f6c533cefa13328863934bfd27d770d1af41df6127b61ce0414c9c08ba14c9892e790', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-12 13:18:43', '2019-10-12 13:18:43', '2020-10-12 13:18:43'),
('10a461c0974d909fa44fe66309a5626fc7db56ddc2dc525e1b8f1af7a0a3748c365f54a4595315cd', 13, 1, 'LaraPassport', '[]', 1, '2019-10-12 13:19:09', '2019-10-12 13:19:09', '2020-10-12 13:19:09'),
('15103909cb15d774041e73b67344ff2cce68a183d4b284d27bdaab54d10f53eddc89fcd769c12779', 12, 1, 'LaraPassport', '[]', 1, '2019-10-12 13:19:18', '2019-10-12 13:19:18', '2020-10-12 13:19:18'),
('e725803b78e2bb46cf186c18ed66a67d5773605992499a50ca7345b88856052d624036dec282f60f', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-12 13:19:39', '2019-10-12 13:19:39', '2020-10-12 13:19:39'),
('00f25f89d1994ecff11d8cdfae61af25614688dbbf1cadb23aaae9acec2f27f6ac03fcab44d378c5', 12, 1, 'LaraPassport', '[]', 1, '2019-10-12 13:19:59', '2019-10-12 13:19:59', '2020-10-12 13:19:59'),
('4ebdb30a0feef4794af6cc4eabd48c8caf78505d1d0844a9b9064fb350d4046d266b142951263dfb', 13, 1, 'LaraPassport', '[]', 1, '2019-10-12 13:29:14', '2019-10-12 13:29:14', '2020-10-12 13:29:14'),
('21d182ee5e0f14fb1cb6b31bb6683371d55595deb53bbe6ec815934dcbc747fc00556d1c0fd4dc49', 12, 1, 'LaraPassport', '[]', 1, '2019-10-12 14:58:20', '2019-10-12 14:58:20', '2020-10-12 14:58:20'),
('a735172c807762ae0c7a3f3e1b2bb45b3c9e86f37b69ef4d9a0caf4f99cfbd8509cb7b466c24069d', 13, 1, 'LaraPassport', '[]', 1, '2019-10-12 15:01:54', '2019-10-12 15:01:54', '2020-10-12 15:01:54'),
('1cbbdb6829e6f1f43352dd92852b157add4d0725ff712e6aeab5e7a8d7fde2c192ec80ab1c2eed04', 4, 1, 'LaraPassport', '[]', 1, '2019-10-12 15:13:53', '2019-10-12 15:13:53', '2020-10-12 15:13:53'),
('f3388b49bddde385802985814f45c4452a7607f19c6b6c551c4516c9d0a55b3dcb5995cc6201be3f', 5, 1, 'LaraPassport', '[]', 1, '2019-10-12 15:19:26', '2019-10-12 15:19:26', '2020-10-12 15:19:26'),
('18d1589e66a12977ea8f2c14575dcd9bd4e9aa7dc1ce77eb1966a9802e3fa3398ec750535656adbc', 6, 1, 'LaraPassport', '[]', 1, '2019-10-12 15:20:43', '2019-10-12 15:20:43', '2020-10-12 15:20:43'),
('dad9e68ae422428674ffa7b59b228f4b80be2906e90b5adfaa6cac0315ad4bd28dfd9c44d8bdbc53', 12, 1, 'LaraPassport', '[]', 1, '2019-10-12 15:22:14', '2019-10-12 15:22:14', '2020-10-12 15:22:14'),
('960be18f45e3cbca4f840f889f5ee88f6bfd5c5bd76ca565b957e85201e33481cb3bcde57d15c52b', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-12 15:23:56', '2019-10-12 15:23:56', '2020-10-12 15:23:56'),
('fda1988a0d7cb3bb1dd62c9fded5a9749d0775b85d57f6bd80422330539b320381cf12a199058d0f', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-12 15:24:31', '2019-10-12 15:24:31', '2020-10-12 15:24:31'),
('904418f9dd31435a5e44e7e7dd0b8efb01c792b963934e795dc0cdb6fea43bae1d4821b5d9b44bea', 12, 1, 'LaraPassport', '[]', 1, '2019-10-12 15:27:15', '2019-10-12 15:27:15', '2020-10-12 15:27:15'),
('5b3498390741c6040f558ec0ca63eeb6f4887ba2ed859e6913da6bc0585a122cef4c098d636510c0', 13, 1, 'LaraPassport', '[]', 1, '2019-10-12 15:28:09', '2019-10-12 15:28:09', '2020-10-12 15:28:09'),
('1520afe6dd3dbcd07df3e0c3d4a291ed3ea1b30a885eb692b38b778c1a582ec63775a2a75db8e532', 12, 1, 'LaraPassport', '[]', 1, '2019-10-13 13:10:56', '2019-10-13 13:10:56', '2020-10-13 13:10:56'),
('336548150eaa82426ae1531aad52d52a504b56298093485dd29c3b2f38a8f58b9de5002746d78811', 13, 1, 'LaraPassport', '[]', 1, '2019-10-13 13:14:32', '2019-10-13 13:14:32', '2020-10-13 13:14:32'),
('e4b424f55cbf63535780bf43b10033d0e67bd3a90b98b134584c863f411bdc3d39580f3994ba511d', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 11:10:34', '2019-10-16 11:10:34', '2020-10-16 11:10:34'),
('df66d64ddf9ef58f44d440952f99a5878de77fe8ab5c79ac48f3da7f412967b0d56536e372531b92', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 11:11:35', '2019-10-16 11:11:35', '2020-10-16 11:11:35'),
('0126aa018862c5b78e4f0518d57da8d9dbc29749740317736666fe023ab67cfb7137a14c461bb1c7', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 11:12:03', '2019-10-16 11:12:03', '2020-10-16 11:12:03'),
('cf3dc090b50f52d4ff8d904b57fb8cdcd59215512fb39b426a45b400d635e43afd4c9ac9e8f2ab00', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 11:12:34', '2019-10-16 11:12:34', '2020-10-16 11:12:34'),
('85de2f1d160ab38b571e24b75db3adf166dfbf1172bf3c736cc05b55a6187336dc4a6a559ab3d803', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 11:13:32', '2019-10-16 11:13:32', '2020-10-16 11:13:32'),
('9c3c0db7e7e94629c36450a0c323c907b39c474af840d00a322ca56a7726992a5f7fcd4105e4c860', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 11:14:13', '2019-10-16 11:14:13', '2020-10-16 11:14:13'),
('cf00981bdceac377cc1c8f94f0c52a028a1827749f5ff8e63a260e0c8af81024974b9a2598f312f1', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 11:14:42', '2019-10-16 11:14:42', '2020-10-16 11:14:42'),
('a0e4ef56a71753840aee1e3397cd274966bab997db66c7001e43d884ba902292c7a929dcd32290a0', 13, 1, 'LaraPassport', '[]', 1, '2019-10-16 11:16:28', '2019-10-16 11:16:28', '2020-10-16 11:16:28'),
('ad0558dd99913226f6034eb423ed7805956210aeb8066487da682a6145e370b73469fd2dc5b9d3bf', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 12:02:51', '2019-10-16 12:02:51', '2020-10-16 12:02:51');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('14041b5891637578ee4a4f64dccf8527590b97d262d823167e061c957b1f8baa30418d8139ba064c', 13, 1, 'LaraPassport', '[]', 1, '2019-10-16 12:47:57', '2019-10-16 12:47:57', '2020-10-16 12:47:57'),
('f8116b626a06296c737f99b2039b2f495a3ffb26f7c295682c7ce512b7aa4fed255321ef5d8d4d65', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 12:56:44', '2019-10-16 12:56:44', '2020-10-16 12:56:44'),
('e193c6ac2282d27e9cf2f9c95a94e2f11c2c2ad4ee48bb0a73ca3fe4a34dbcb58b58eaa81a91603a', 1, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:06:25', '2019-10-16 14:06:25', '2020-10-16 14:06:25'),
('93f470a1d971d3ddb5fb200fb23ab55b8a27504a1c46aad88554f6ff83b9973c61485d5d62551f74', 4, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:07:10', '2019-10-16 14:07:10', '2020-10-16 14:07:10'),
('a0d6429c05d5f732f2083d1af69e317d51a307ac023d17284532c3f59e9b8fa0a0af74b8667f9099', 14, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:08:27', '2019-10-16 14:08:27', '2020-10-16 14:08:27'),
('5737661e7f87d928c545169cab640a9a6af2d595330e8bbbb2d952493a68138f874215fbe017857c', 5, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:08:36', '2019-10-16 14:08:36', '2020-10-16 14:08:36'),
('aeb757404ac121330e457531f3d0b957b75e8c70a9187c4bd2748159de84e6993ddd413aaf93cdd0', 6, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:11:14', '2019-10-16 14:11:14', '2020-10-16 14:11:14'),
('1eab706965ebb618e861dfb422096140e526a62c2fe809142e768d09237178658d27e508d56e1086', 5, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:13:36', '2019-10-16 14:13:36', '2020-10-16 14:13:36'),
('bc4876cb65694e87d580b6647348825c19547ffb6efecf7ccfdde8d1ccd46712c97ecf5b1bfb668e', 6, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:13:51', '2019-10-16 14:13:51', '2020-10-16 14:13:51'),
('70774c00b9a4fa1fb6727c97e818c21ababb102661b5da67d05e5ccdbd7a1b159756ba2fa048ba20', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:14:11', '2019-10-16 14:14:11', '2020-10-16 14:14:11'),
('efc84b4c1c9ff118875c0c84c8777fa4d38f2b93bb448047ba2a94bede0bac20a6950f40e5896b77', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 14:23:11', '2019-10-16 14:23:11', '2020-10-16 14:23:11'),
('1e817f0f9d9ccc6c73b4ca4d276a4eaf092ad824bf531715d9329fef96ae53edc35d70a9ba116d36', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:23:32', '2019-10-16 14:23:32', '2020-10-16 14:23:32'),
('dbc7829051a8620f0dd9ed77cfa10fc441fc14c174b8f425ab9f5d195adb9585b0278f8c2605d76a', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 14:25:19', '2019-10-16 14:25:19', '2020-10-16 14:25:19'),
('ea696267694abf096db90c9c6272d958122643706f059cb165742b6cc1227e72f107b512e63c6730', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 14:29:43', '2019-10-16 14:29:43', '2020-10-16 14:29:43'),
('be79c3aa6e9b6c746c4c0507e49b46529a601dff7efff83b8aea4a59c7fb144c603e682c279f1890', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:33:26', '2019-10-16 14:33:26', '2020-10-16 14:33:26'),
('99be3c48ccf7192b0386706391d4a561d6234bc04674bdc04d2fbd7524d10ea977c598dcb8157212', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 14:40:22', '2019-10-16 14:40:22', '2020-10-16 14:40:22'),
('e66a52aec374efdb2a2d1fb22d4099fd7133eb977d53741d6478e1853819dbd2000a5f2cb3b09dd1', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:40:58', '2019-10-16 14:40:58', '2020-10-16 14:40:58'),
('faf1fca923896adc8eb7a02006dd5058859383f4529ea0eec08abae7801b8dec3f05a2879baa11fb', 13, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:41:29', '2019-10-16 14:41:29', '2020-10-16 14:41:29'),
('d2b1188478f60557b55708789b4203a8929dab58b88438f09e23d3523257dd66b1c5d3b9603de12b', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 14:42:28', '2019-10-16 14:42:28', '2020-10-16 14:42:28'),
('89d6a7cc404d08619357ae27b5d76d8b8f1e1662885a58412cf32467975339d377c321282c85bba2', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:55:45', '2019-10-16 14:55:45', '2020-10-16 14:55:45'),
('49fee60a3d34fc564d483641f1f26243c1f2697489d5eac2aec44d90caeb3927c8cc3f998d1890f3', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-16 14:56:53', '2019-10-16 14:56:53', '2020-10-16 14:56:53'),
('d360c0c4e24ba30cfe8948729466958fcc7ce49b1c25f017631ddc18c5a38108666ea059d423998f', 12, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:58:53', '2019-10-16 14:58:53', '2020-10-16 14:58:53'),
('f342d5b91bac222847157d2c92a228487f512fa3299fed8811b52618da8562c57b530ec64c98bb45', 13, 1, 'LaraPassport', '[]', 1, '2019-10-16 14:59:12', '2019-10-16 14:59:12', '2020-10-16 14:59:12'),
('fc0ead346a9808a21cd5e1384f6e0412a925be81ace1651051c95e5069d9d6cb31f671290df75cda', 1, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:07:08', '2019-10-17 11:07:08', '2020-10-17 11:07:08'),
('637360e633256c197be50075671b194ddb6cee0b9f9b7dac29a20c6f545b75811d187957bfcd00a5', 4, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:07:25', '2019-10-17 11:07:25', '2020-10-17 11:07:25'),
('2b7bb2c1a91abab120669506309d6ee049e39550a4c04013be8acabcc745119925eec4ab5ff34c4e', 5, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:08:46', '2019-10-17 11:08:46', '2020-10-17 11:08:46'),
('5df7b00ed5b038702a1c69c6fd62b18cf9f3600a3f7f594f61076c9c54da0901239377f9e2955520', 6, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:09:43', '2019-10-17 11:09:43', '2020-10-17 11:09:43'),
('f2a27708039c26e8498b96ad4e133df4f3363d3cd44c6314d7b60c7b69f4b3f220fda002c8500057', 12, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:10:27', '2019-10-17 11:10:27', '2020-10-17 11:10:27'),
('7667c17c95b4f7c80a19060a8fcb97e0e4bd88ed35cb166c39ace9c5fb33a536df589334dd51fca0', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-17 11:11:16', '2019-10-17 11:11:16', '2020-10-17 11:11:16'),
('7bd582e7a745da3478ff5fcc5f24df04f7cc83c065e55fab5f3baec24d79847780a101daf03f23c9', 5, 1, 'LaraPassportVendor', '[]', 0, '2019-10-17 11:12:17', '2019-10-17 11:12:17', '2020-10-17 11:12:17'),
('e5af6b6bb6545f161171f533f66b1086e6d9d40f17d812ed12c53b1dc64c581d29e5687836a7c9a6', 13, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:14:21', '2019-10-17 11:14:21', '2020-10-17 11:14:21'),
('1894b39c5213ad5afe40ca405aceb0836929578c7a7144a2dccbdb2d9dd461cc088c502dd033bda1', 1, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:20:52', '2019-10-17 11:20:52', '2020-10-17 11:20:52'),
('5fa4b1fb4775298c84132bab04da1f617388b661d27aab149b6066d2167bae86f749e71c7c40eb9c', 4, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:21:17', '2019-10-17 11:21:17', '2020-10-17 11:21:17'),
('ae9c0e155b0be80a2a58f1cf3946a6159941c354b12987e5390fb15640195f0e611648d22dd3113b', 5, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:22:02', '2019-10-17 11:22:02', '2020-10-17 11:22:02'),
('cefe4acef0bc62f0f64b2a3c4b2d7ef95a1ed6b5c6bb9fa5911e0de30a3804f89d4c047e7cee5842', 6, 1, 'LaraPassport', '[]', 1, '2019-10-17 11:22:26', '2019-10-17 11:22:26', '2020-10-17 11:22:26'),
('41c5110ba0d65ec89e1f94ae35ba764f9be4c74b63cd6688a3f8b760f2306e7d0e69c77b18aaeec2', 12, 1, 'LaraPassport', '[]', 0, '2019-10-17 11:22:51', '2019-10-17 11:22:51', '2020-10-17 11:22:51'),
('5228d0fbd4c2fea6e7416a81964d45b8854f196ad595db27c56886f44f9a36bfa65bae8560a69ab5', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-17 11:53:55', '2019-10-17 11:53:55', '2020-10-17 11:53:55'),
('b5c67bab599877015898966da4792819db07e1c52c592e8d8e7d70a2a089c075866cf28822ab57e7', 5, 1, 'LaraPassportVendor', '[]', 0, '2019-10-17 11:54:22', '2019-10-17 11:54:22', '2020-10-17 11:54:22'),
('12150c551f763321780c8c0a0b98a52517f94eedabcbc148c7839ba9c64142348a213f6ebc12b68e', 12, 1, 'LaraPassport', '[]', 0, '2019-10-17 11:55:46', '2019-10-17 11:55:46', '2020-10-17 11:55:46'),
('14b8dc3465ad2b88dbb70e8329d0e361b32426dc4d5dc27eb942890076f576049403e68adf423af5', 13, 1, 'LaraPassport', '[]', 1, '2019-10-29 01:53:02', '2019-10-29 01:53:02', '2020-10-29 01:53:02'),
('46c8ebda7cf1d0da7a9bf53a99918385e7edd029470e149a09b8872c5772d498237c11c16471ab88', 4, 1, 'LaraPassport', '[]', 1, '2019-10-29 01:53:14', '2019-10-29 01:53:14', '2020-10-29 01:53:14'),
('12ff083e579a69eac39d37286670be487df71c000b045b0d8e58f76b11cd0a740527edc8150b8249', 12, 1, 'LaraPassport', '[]', 1, '2019-10-29 01:53:21', '2019-10-29 01:53:21', '2020-10-29 01:53:21'),
('a5b757afa45f861064050ae56e0436a9737cd7b1cbaded90e3743fd5a4373eec9f454c9a9d71c1d1', 4, 1, 'LaraPassport', '[]', 1, '2019-10-29 01:54:28', '2019-10-29 01:54:28', '2020-10-29 01:54:28'),
('ba5159d9cfbdee761d535543d7a456448c123f68417f2261e5c9d4a8443c2155ff37b97bf39cb759', 5, 1, 'LaraPassport', '[]', 1, '2019-10-29 01:55:18', '2019-10-29 01:55:18', '2020-10-29 01:55:18'),
('a69e8ee79b7f10f663e56936eeb80ee632e960ebca3fee8d520768b73d3f3908fc5840239535ece1', 6, 1, 'LaraPassport', '[]', 1, '2019-10-29 01:56:08', '2019-10-29 01:56:08', '2020-10-29 01:56:08'),
('6ac2e015277a5223531b4c16d68fd53501adad4c64872c3dc7939931cfa1a9d809aafc3f142c14e0', 12, 1, 'LaraPassport', '[]', 1, '2019-10-29 01:56:48', '2019-10-29 01:56:48', '2020-10-29 01:56:48'),
('6bd9b082a466e26ac016eaa5011828e2563514c31f46616cea4267d23421f2b1c03a03d373358d7b', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-29 01:57:56', '2019-10-29 01:57:56', '2020-10-29 01:57:56'),
('33520cebd50b210987b2ea15e4dbc9623e29756062b77a23aa613ee6f29dcb58ca2ba542290fd123', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-29 01:59:13', '2019-10-29 01:59:13', '2020-10-29 01:59:13'),
('4ed97f72cef4f78ee475107d8fc06e675818fe00261dfd888d8cdfd939d723ed0cf5573b836f6520', 12, 1, 'LaraPassport', '[]', 1, '2019-10-29 02:01:00', '2019-10-29 02:01:00', '2020-10-29 02:01:00'),
('9390110e54429b3d7e4be269f4052473ab9294eb6c7ddcea65e39f3783853007dcb32c74748d6b55', 13, 1, 'LaraPassport', '[]', 1, '2019-10-29 02:02:05', '2019-10-29 02:02:05', '2020-10-29 02:02:05'),
('28a2fdd6447cf5449b062d4a6616ed929efd3dec12e3ad1d5cf09a6c58312eca1e20b4d189f225e2', 13, 1, 'LaraPassport', '[]', 0, '2019-10-29 02:10:32', '2019-10-29 02:10:32', '2020-10-29 02:10:32'),
('d401afabd903eb263d1872d89ed8edf89f9978243189024f03f5eaa9ee0d7b37a7bc64706f52789b', 1, 1, 'LaraPassport', '[]', 1, '2019-10-29 08:52:44', '2019-10-29 08:52:44', '2020-10-29 08:52:44'),
('698a6fa43c8e0c05d9f1a3c7eb615a633ab58735dac739f4a7381d5df9049fcdd230190d9f75b29e', 4, 1, 'LaraPassport', '[]', 1, '2019-10-30 03:58:06', '2019-10-30 03:58:06', '2020-10-30 03:58:06'),
('6f317e2c4fb67e5b4fe5ff334e1907f1fc6820ea4abb805ef19b1caf81054e3335e4bf8ae8847235', 5, 1, 'LaraPassport', '[]', 1, '2019-10-30 04:21:32', '2019-10-30 04:21:32', '2020-10-30 04:21:32'),
('17307d8339f12f0874fdfe9a423de0b96fe1f586ce203aae01725d8a8bc1df00a92c2659d688414f', 6, 1, 'LaraPassport', '[]', 1, '2019-10-30 04:24:39', '2019-10-30 04:24:39', '2020-10-30 04:24:39'),
('a0bf8495caccc69d9d0704021b6b081765a582df9437af2f299a218006c6b050830b28fc01c63986', 12, 1, 'LaraPassport', '[]', 1, '2019-10-30 04:26:24', '2019-10-30 04:26:24', '2020-10-30 04:26:24'),
('21fe2ab10f630d0391a86f35fa5666f85158b9d8acf8c4d99fee96d46f60b3b4ab2fa8da4daeed21', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-30 04:36:06', '2019-10-30 04:36:06', '2020-10-30 04:36:06'),
('00043eadee49f61af4d459b9b6f7fc9f4951660d397f70c14cb08f5685043699e48a696e6e30344a', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-30 04:41:48', '2019-10-30 04:41:48', '2020-10-30 04:41:48'),
('79fac09e6c95b5163189d1e08df95d705510fc94b2b32f33b70ea5c7f7136121eb9d2e2f57ab1b74', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-30 04:43:07', '2019-10-30 04:43:07', '2020-10-30 04:43:07'),
('368646d11cd8ab62c053bb721099f09f85ab7a777e1b513501f0e09b61a7d418eb46ecbe5d03558a', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-30 04:54:01', '2019-10-30 04:54:01', '2020-10-30 04:54:01'),
('0f940df40e8baf10e9a920e03aa0f3518cd76d69fd8d93beae4d182301c737a31a3ef335344cba5b', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-30 05:06:37', '2019-10-30 05:06:37', '2020-10-30 05:06:37'),
('f8922c6a909f8bc31fa1a0ee64330eb60c97aaa82f07d05eb38ce8f403c9d90ee45c06d1bc627bf5', 13, 1, 'LaraPassport', '[]', 1, '2019-10-30 05:08:27', '2019-10-30 05:08:27', '2020-10-30 05:08:27'),
('6f7a741a2c286aa1533b14176fb510a66eb951d50982ca03066759afde66df0df7ca3d8544f5e92c', 4, 1, 'LaraPassport', '[]', 1, '2019-10-30 05:50:36', '2019-10-30 05:50:36', '2020-10-30 05:50:36'),
('2a42a278899a6fbcede7f74f477c0cacd2ba92fc509c1d19f2c3cc7041198e1902fae17f82b2989e', 5, 1, 'LaraPassport', '[]', 1, '2019-10-30 06:02:12', '2019-10-30 06:02:12', '2020-10-30 06:02:12'),
('0fce55d0063b6e3651cb75b96c9a9b0b2864899866aaf3cb63ae215d6d851502ab50c0918021a6d5', 5, 1, 'LaraPassport', '[]', 1, '2019-10-30 06:09:18', '2019-10-30 06:09:18', '2020-10-30 06:09:18'),
('e86f09cb0ab2f82080ea51c8b096a123d917147ff29f974c2fb2071b0bd27ed38ccf2aa36cd73f61', 6, 1, 'LaraPassport', '[]', 1, '2019-10-30 06:11:14', '2019-10-30 06:11:14', '2020-10-30 06:11:14'),
('2060053a074bb17d8eef3fc1d8ca1c7426dc2a53a5c5c48c84dec4caddfbf7ace1417509c81f7f84', 12, 1, 'LaraPassport', '[]', 1, '2019-10-30 06:13:11', '2019-10-30 06:13:11', '2020-10-30 06:13:11'),
('7509c76922913ff2795731330686bbe1081bd6eead7384e23dc912869f5408cdba4b123a8ea888fc', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-10-30 06:40:56', '2019-10-30 06:40:56', '2020-10-30 06:40:56'),
('ce6aaa384154661ee282e2a7e41e87a2e6dd73b3f09ac90cd691cf6b266acf3cfcfa5bf9fdf6be58', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-10-30 06:42:25', '2019-10-30 06:42:25', '2020-10-30 06:42:25'),
('a549e9e032f0c54f8e2ee357ee59392928d3e94d2ac1ed8ebb74e71a4eb2da7cb75c6acfeb764f9d', 1, 1, 'LaraPassportVendor', '[]', 0, '2019-10-30 06:45:25', '2019-10-30 06:45:25', '2020-10-30 06:45:25'),
('6750ae3b72956ce60a77478abae32be5373efcc4edd5564c82dd3384d611aa95965aae3aee4371ba', 13, 1, 'LaraPassport', '[]', 1, '2019-10-30 06:51:11', '2019-10-30 06:51:11', '2020-10-30 06:51:11'),
('eb780f51f80c1cbb57f368d3bc8a33dbfe1ae8952c7b8cb0a32f61b7eb4cab38b6ec22fcca14630a', 61, 1, 'LaraPassport', '[]', 1, '2019-10-30 07:12:36', '2019-10-30 07:12:36', '2020-10-30 07:12:36'),
('31a824c2075a0c1682961a60f0e5c276b4a0c09652319c4fc6e88dccef12249722d4d5df6117eb23', 13, 1, 'LaraPassport', '[]', 1, '2019-10-30 12:32:43', '2019-10-30 12:32:43', '2020-10-30 12:32:43'),
('87d854c4514c5b09d0a2052d06bf09c9ceb1dc7db53eb65d08362f6763f2c15a4faf3013e9745475', 1, 1, 'LaraPassport', '[]', 1, '2019-11-02 04:58:00', '2019-11-02 04:58:00', '2020-11-02 04:58:00'),
('907cc28f9d4a4fee615c52b89dea4176e78a00aa1e3d7cadf5ca300c56f2a921486c18b5fcc11769', 4, 1, 'LaraPassport', '[]', 1, '2019-11-02 04:59:07', '2019-11-02 04:59:07', '2020-11-02 04:59:07'),
('cafa546148441ef6ed7425fce4f3c3d4088cb8c146658b083c4cce2217ccebed1f41d9c8a4918fd3', 5, 1, 'LaraPassport', '[]', 1, '2019-11-02 05:07:58', '2019-11-02 05:07:58', '2020-11-02 05:07:58'),
('f1de64bc8d638598f42297ba8f1a6af3b222da5bc41dd7cc10a607a868704bf29e91e44ae8ace2ab', 6, 1, 'LaraPassport', '[]', 1, '2019-11-02 05:09:19', '2019-11-02 05:09:19', '2020-11-02 05:09:19'),
('6d95710dadfb14dc46e9770c5507f534b53cfa90c9243b7c6cf505416939439e329ed897bfe1dd5e', 12, 1, 'LaraPassport', '[]', 1, '2019-11-02 05:10:50', '2019-11-02 05:10:50', '2020-11-02 05:10:50'),
('f1652cb04d6fb7f032d9dc7aca3d39e0cce21cb8276b091b3fc30f28ac6c7f1aab7c920137904096', 1, 1, 'LaraPassportVendor', '[]', 0, '2019-11-02 05:13:27', '2019-11-02 05:13:27', '2020-11-02 05:13:27'),
('beaaa7d2ec420d4b5fbd59448164ed65744ab547bc2a339ff18f72b8daf11506790ab51737953a47', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-02 14:49:10', '2019-11-02 14:49:10', '2020-11-02 14:49:10'),
('67d18180479937a187e8582a2663bc530b0eb3ef0fd3be73a4e0900d5231e0f350eea94ae6d88aca', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-03 22:17:25', '2019-11-03 22:17:25', '2020-11-03 22:17:25'),
('6eab42e9ceebb5a6f8b3b7656d98889cbe4b39492a5466fe9f016f467ff78b2c31eae4de06b340c8', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-03 22:20:51', '2019-11-03 22:20:51', '2020-11-03 22:20:51'),
('6217bf951c9a4c097fd9d3a41b34cc9103423c78db7872fdbc6b3a40dac7dfa2632aaf7191b61119', 12, 1, 'LaraPassport', '[]', 1, '2019-11-03 22:24:18', '2019-11-03 22:24:18', '2020-11-03 22:24:18'),
('087709ce8f51392871373ce06c4e93b9a4cb6d9077324bbbd91b84dafeaa61108f52e9984d05d09c', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-04 10:31:36', '2019-11-04 10:31:36', '2020-11-04 10:31:36'),
('22a582cb914c000c6f740bc66e77c0d9678410f320c1001df31a8d912c02a429c4097f60cc5991b1', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-04 10:33:05', '2019-11-04 10:33:05', '2020-11-04 10:33:05'),
('7d001c368bac0ae89b36c1695088b335cb4ad77a61f13c8ed786c80fc44f847a06a9fa72a2a0f301', 5, 1, 'LaraPassportVendor', '[]', 0, '2019-11-04 10:33:39', '2019-11-04 10:33:39', '2020-11-04 10:33:39'),
('81d504e45d25ec86496b53d1745c6b8f9bd540648d95edd045063879c94501b410e96ecc157ed8ea', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-04 10:37:19', '2019-11-04 10:37:19', '2020-11-04 10:37:19'),
('ba9a76701e67a432a7e009d5a3532afaad1335b628ac652fd886856abb146f07faca200d16a01aea', 5, 1, 'LaraPassportVendor', '[]', 0, '2019-11-04 10:38:34', '2019-11-04 10:38:34', '2020-11-04 10:38:34'),
('55bd9e89ed2baffdfbb08e4b6d62a87b19d7d834d8d681caef7d4337ad3a8948e2e4c29637628593', 1, 1, 'LaraPassportVendor', '[]', 0, '2019-11-04 10:44:05', '2019-11-04 10:44:05', '2020-11-04 10:44:05'),
('7d85b3701a4a110a10d51ec1cc8383fc600370e917bd55663020ff5666c148fa3480a3be15d40edb', 5, 1, 'LaraPassportVendor', '[]', 0, '2019-11-05 06:27:15', '2019-11-05 06:27:15', '2020-11-05 06:27:15'),
('57b7d83d92c8eb780079338393198f92ac4fa802087960c1f11f3163c86e295fd8f6760cd58e85c8', 5, 1, 'LaraPassportVendor', '[]', 0, '2019-11-05 06:42:29', '2019-11-05 06:42:29', '2020-11-05 06:42:29'),
('a370fa567c805f061302745d180885952003e474611f8a03137b452b2c9efd3492c21835d3b6880a', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-11-05 11:10:43', '2019-11-05 11:10:43', '2020-11-05 11:10:43'),
('f71adc5ff7d2f30a2146711c9dd559420e77b9eb3c545359fc40a0f5538545221b04922e78a01fdb', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-05 11:15:54', '2019-11-05 11:15:54', '2020-11-05 11:15:54'),
('8295d07e64aa30b9978c2dacb61f7f819e09a490475dfa6e939ef98031f50919b60217934e4f6598', 12, 1, 'LaraPassport', '[]', 1, '2019-11-05 11:16:20', '2019-11-05 11:16:20', '2020-11-05 11:16:20'),
('62d7dd15e3e9e9c822ec35e1a90e7a2762aef07a72e79f43d8eeee5b7cb39ccce7ce3ba54cdbacfa', 4, 1, 'LaraPassport', '[]', 1, '2019-11-05 11:53:59', '2019-11-05 11:53:59', '2020-11-05 11:53:59'),
('6d7c345d4583b16fbe65d68c20935fac6f976a7fcb1b82489bde1bb8f460ca4437c60020987d3db9', 5, 1, 'LaraPassport', '[]', 1, '2019-11-05 11:57:52', '2019-11-05 11:57:52', '2020-11-05 11:57:52'),
('e90ead0ed5fb5257b32e8edb74741667da496a6b34acb595b8de5372f77181c1f68cf0b4425cc228', 6, 1, 'LaraPassport', '[]', 1, '2019-11-05 11:58:39', '2019-11-05 11:58:39', '2020-11-05 11:58:39'),
('05eb037b78137d68c18c2fc8089e7b632b8992475c033b819dd93f64584ddd2b2a00e2d2c6f83546', 12, 1, 'LaraPassport', '[]', 1, '2019-11-05 11:59:20', '2019-11-05 11:59:20', '2020-11-05 11:59:20'),
('cd4fca20a6a46bf5c578f6e73adc1c52621444f939544519c17bee383b3c9b8aeac549542a393056', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-05 12:05:29', '2019-11-05 12:05:29', '2020-11-05 12:05:29'),
('4e1cbc0e0c12e415e089ac30b1cb4e53e756369ab0e6b6578dbf69f5bffb75a6b1398496f96630af', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-11-05 12:07:36', '2019-11-05 12:07:36', '2020-11-05 12:07:36'),
('95bfd3d857e4328ddc491ab74c31a98340c6518caaef03ffad143c937a02f1a0c877228ad3908a4d', 12, 1, 'LaraPassport', '[]', 1, '2019-11-05 12:09:32', '2019-11-05 12:09:32', '2020-11-05 12:09:32'),
('2d5d3c71d69e75821aa3352fde3357db2a52e2d3a4c51b0e38c4e61793a4510fac5bec1d3b233ab1', 13, 1, 'LaraPassport', '[]', 1, '2019-11-05 12:16:06', '2019-11-05 12:16:06', '2020-11-05 12:16:06'),
('f9c3c594e5d70bb7758a994612c0413ce3fd399d9b1c1465063359153fe6017088ae08ecf9777105', 12, 1, 'LaraPassport', '[]', 1, '2019-11-05 12:20:28', '2019-11-05 12:20:28', '2020-11-05 12:20:28'),
('31f274fd7259afc78f0347668fce115a2970571c72af352c61043beb1f520750f6d94a460b602ff1', 4, 1, 'LaraPassport', '[]', 1, '2019-11-05 12:22:10', '2019-11-05 12:22:10', '2020-11-05 12:22:10'),
('3d357174e99d5cb4cf264d914879bdaaa70002c39b214e440e3fb1ecd20b9f405f2db1f8b7e1d27f', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-05 12:23:40', '2019-11-05 12:23:40', '2020-11-05 12:23:40'),
('fd87976ec06888064957e3d1aaeed7d0096d20995dfa14174d6000dc89ec857f8733ae0348ef6b42', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-11-05 12:27:57', '2019-11-05 12:27:57', '2020-11-05 12:27:57'),
('22909a782a26e79ecd65317afb1db49571911e46aa398bc217273d3552d33bcb196fd8e3a9e9b056', 12, 1, 'LaraPassport', '[]', 1, '2019-11-05 12:47:17', '2019-11-05 12:47:17', '2020-11-05 12:47:17'),
('9fe034e1be29bf6758237628ce22e6a5bc87f31bc3180b9b401f417c128f8108540a5b0a538fd7ae', 13, 1, 'LaraPassport', '[]', 1, '2019-11-05 12:53:04', '2019-11-05 12:53:04', '2020-11-05 12:53:04'),
('a8c84dff8718a7259d11c597a0e204dc0e8999d7689869faa1c530e1adc41ee15ca4aac4b61f722e', 4, 1, 'LaraPassport', '[]', 1, '2019-11-05 13:02:55', '2019-11-05 13:02:55', '2020-11-05 13:02:55'),
('366d407e8e522f8ee317a5d3f4d22626653a1fe05216c0b76e0377380eba8357971fc31c568e1d32', 5, 1, 'LaraPassport', '[]', 1, '2019-11-05 13:13:17', '2019-11-05 13:13:17', '2020-11-05 13:13:17'),
('10905cb7245221982d8c025653d03bd97d4b8f4a849c4f2e868459ce72da7e1151cd3fe3bb09f1d9', 6, 1, 'LaraPassport', '[]', 1, '2019-11-05 13:16:08', '2019-11-05 13:16:08', '2020-11-05 13:16:08'),
('9fd7b16537f5b6a2ea1c25348c016a9b81a70e6e6f6eae0be77449b93b95f3b11bf86a39931f9e65', 12, 1, 'LaraPassport', '[]', 1, '2019-11-05 13:18:06', '2019-11-05 13:18:06', '2020-11-05 13:18:06'),
('62e72cf1761d677564f49a3ecdade989d1a6cd4bf280d712f0a93f9ba135eeaa273e9dbb325295af', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-05 13:21:29', '2019-11-05 13:21:29', '2020-11-05 13:21:29'),
('bd5266fa8fca8e4a96e565e9953e2a3036ac1b6ffb97bdf6420b6d21510d71a0d69574c7fc902b26', 12, 1, 'LaraPassport', '[]', 1, '2019-11-05 13:25:35', '2019-11-05 13:25:35', '2020-11-05 13:25:35'),
('6d82165635df4d82601f8a13518f0fd732ba9916c0262636fa759205c79c0635413ca86b3cd63625', 1, 1, 'LaraPassportVendor', '[]', 1, '2019-11-05 13:28:43', '2019-11-05 13:28:43', '2020-11-05 13:28:43'),
('ae9edc85bb140736bc0345c14158f837c169ffeb21691d2d612f9b542b0ab1d4deef3ff2202fb087', 13, 1, 'LaraPassport', '[]', 1, '2019-11-05 13:33:21', '2019-11-05 13:33:21', '2020-11-05 13:33:21'),
('317e8b27585d83bc2cab81dcee6487fb49928596a87acb2cde5f0ec60af0f699bcdf8985fc005570', 14, 1, 'LaraPassport', '[]', 0, '2019-11-05 13:38:26', '2019-11-05 13:38:26', '2020-11-05 13:38:26'),
('f50715bf88d37c934fcfc611e8c2c519fcd9b6b663e1f344ea16a19b58ec6bd56a6fde4c5d29ed1f', 5, 1, 'LaraPassportVendor', '[]', 1, '2019-11-06 02:36:29', '2019-11-06 02:36:29', '2020-11-06 02:36:29'),
('330ee4149bb441414e744fe8c94a84ed3313317a72b81249b8eabc00ef1a9ed670adacb6d46f7aff', 1, 1, 'LaraPassport', '[]', 1, '2019-11-14 14:08:14', '2019-11-14 14:08:14', '2020-11-14 14:08:14'),
('982f5649302484261de393af2e2ea279532014153ab2d09bea7f95329e0d728002af18a8383928e5', 34, 1, 'LaraPassport', '[]', 1, '2019-11-15 01:20:00', '2019-11-15 01:20:00', '2020-11-15 01:20:00'),
('027cdec4ba08fe822a5c699773c3a2f049435f86f968420ee14aed804f220a52eb46566f62feaa72', 7, 1, 'LaraPassport', '[]', 1, '2019-11-15 01:20:25', '2019-11-15 01:20:25', '2020-11-15 01:20:25'),
('6946a20f8c08be69dbfd6d6453413849c41e9cacab9d05dbe934d84eef263a395ae6e6f86fa2ecb5', 4, 1, 'LaraPassport', '[]', 1, '2019-11-15 01:20:46', '2019-11-15 01:20:46', '2020-11-15 01:20:46'),
('faed673e0a44d81cd7a1237143d99e450690e6d23ccf532aa5926fda0f959d2861205e9f58ec4400', 10, 1, 'LaraPassport', '[]', 1, '2019-11-18 15:20:44', '2019-11-18 15:20:44', '2020-11-18 15:20:44'),
('e0b8d819a6d1435c785cbda124c68cc9aca70890a3fbfa5bca39c4bcc1dcf280e84f4ed6e4ad0839', 1, 1, 'LaraPassport', '[]', 1, '2019-11-19 13:19:43', '2019-11-19 13:19:43', '2020-11-19 13:19:43'),
('40b4122232933c3f004f2885be93f55f4982071b9e5e14122e8b52ef7b75355b1dac684d75c21f01', 1, 1, 'LaraPassport', '[]', 1, '2019-12-30 15:31:10', '2019-12-30 15:31:10', '2020-12-30 15:31:10'),
('16526b58bf10854376d1e656b4983ed23604e871965f30db0740a627e46c7d76f863d99d5674f26d', 62, 1, 'LaraPassport', '[]', 1, '2020-01-14 02:08:04', '2020-01-14 02:08:04', '2021-01-14 02:08:04'),
('e598d42536fad81ae539c04e58a885d4ad580ec4eac16c1cd17a8c4110f90700cb6012391471ec65', 63, 1, 'LaraPassport', '[]', 1, '2020-01-14 03:08:02', '2020-01-14 03:08:02', '2021-01-14 03:08:02'),
('e4427b2739aef76087bc1430aae895241297768aacda3de065267556c2b4878e4d7a46ce4d78b8fa', 64, 1, 'LaraPassport', '[]', 1, '2020-01-22 07:07:28', '2020-01-22 07:07:28', '2021-01-22 07:07:28'),
('67fde3b4b1aaf0b4017839cc7267d15f9432ce3d15ddd0f2ed2b51f260c92e8ca3eb4e3e079c5806', 31, 1, 'LaraPassport', '[]', 1, '2020-01-23 07:33:15', '2020-01-23 07:33:15', '2021-01-23 07:33:15'),
('3c8b17847d7b884a440f08811050226cd88c9220451159609b39c0f50f1250382ae1e66e075fbd3b', 64, 1, 'LaraPassport', '[]', 1, '2020-01-26 01:22:36', '2020-01-26 01:22:36', '2021-01-26 01:22:36'),
('9d9f8d32997ab9d83f3041efa3f8fc6cb5f34ef4a1e9cced013a4b0ffbbca62df9611469c83120a1', 4, 1, 'LaraPassport', '[]', 1, '2020-01-26 09:25:26', '2020-01-26 09:25:26', '2021-01-26 09:25:26'),
('03a26de7f1990a51da5e0884ecf896ea4383d4fa640bd232a7dbe32c2bda5ea3fca9167c0eba5bba', 64, 1, 'LaraPassport', '[]', 1, '2020-01-26 09:25:42', '2020-01-26 09:25:42', '2021-01-26 09:25:42'),
('70aa802faa8937f5b3e0c3981dd1f5dcc226e71fba613e64c17ba3b23f247ff6ad93a56ea98fb58e', 1, 1, 'LaraPassport', '[]', 1, '2020-01-27 11:18:09', '2020-01-27 11:18:09', '2021-01-27 11:18:09'),
('309c54a53526ff1dd2071fedd20d8fd3fdbc7e395493109cc830a60637d00259d9b9e68b5c9bf700', 65, 1, 'LaraPassport', '[]', 0, '2020-01-27 17:39:35', '2020-01-27 17:39:35', '2021-01-27 17:39:35'),
('231e2ccf03d8ef8dc13e19546228db8f34cb9daff9dab18b22b61ec1d13b0523265a1cffa86e45a3', 1, 1, 'LaraPassport', '[]', 1, '2020-02-06 11:03:25', '2020-02-06 11:03:25', '2021-02-06 11:03:25'),
('36f10eb6cf53add62d8413ecf2fe103a8f2c4991319cf219bd505127025c3394d3d4af327baa7c81', 66, 1, 'LaraPassport', '[]', 1, '2020-02-16 03:14:45', '2020-02-16 03:14:45', '2021-02-16 03:14:45'),
('266fa5bd9ced460adfea663f9c7d39cb6dd329588ebb613d4f527989f0b44e88bb9500aafa54357d', 67, 1, 'LaraPassport', '[]', 1, '2020-02-16 03:59:08', '2020-02-16 03:59:08', '2021-02-16 03:59:08'),
('b1574a025c0ddb2559525e93739a189262f3b6a37613c873aacb578a5a3ec8df1a273780e46bd3b3', 68, 1, 'LaraPassport', '[]', 1, '2020-02-16 04:31:35', '2020-02-16 04:31:35', '2021-02-16 04:31:35'),
('62a3253549a6e94bfbba0298180238ecad51c52e5d37837047c0150df196a162c2ce7a65a1a9f188', 2, 1, 'LaraPassport', '[]', 1, '2020-02-17 02:07:19', '2020-02-17 02:07:19', '2021-02-17 02:07:19'),
('ed1d06b17ab8927345109de06882ef2d04e886b86b22a6a673353d0024eeee34941608d80f741ec3', 4, 1, 'LaraPassport', '[]', 1, '2020-02-17 02:09:11', '2020-02-17 02:09:11', '2021-02-17 02:09:11'),
('fef1961f7f4df2238a6171b159c9c2d8cdaf38e433c0c6b8add8f2d07395678dffc0afd7c74bbdc2', 2, 1, 'LaraPassport', '[]', 1, '2020-02-17 07:11:45', '2020-02-17 07:11:45', '2021-02-17 07:11:45'),
('e72754b0da9717db24311edbe7dd4a0614e18e137e875d698cb8ef3509f4ed47725602de597a065b', 4, 1, 'LaraPassport', '[]', 1, '2020-02-17 07:12:26', '2020-02-17 07:12:26', '2021-02-17 07:12:26'),
('df23815a1a9de6c8bbe0ccc7ad42d2e06769007af75410479990887ea262928fd62cf249c9076f83', 2, 1, 'LaraPassport', '[]', 1, '2020-02-25 10:45:05', '2020-02-25 10:45:05', '2021-02-25 10:45:05'),
('4b9430f14d5c86d2a9e47b3311bc17fdf6d92c65e467270206f89dd012f8013a79ed19684db3c67a', 2, 1, 'LaraPassport', '[]', 1, '2020-02-25 11:28:00', '2020-02-25 11:28:00', '2021-02-25 11:28:00'),
('1b3c1d14cc684c369e19b977ae52289c1da8c4f7137528f3633fcf347c3d82a316dad0d648135a53', 4, 1, 'LaraPassport', '[]', 1, '2020-02-25 11:32:23', '2020-02-25 11:32:23', '2021-02-25 11:32:23'),
('879de9b0c7baf0e89bd227212d5d63deadb75a1156883a2203ff54798ee3c207c86a511211c37aec', 5, 1, 'LaraPassport', '[]', 1, '2020-02-25 11:43:06', '2020-02-25 11:43:06', '2021-02-25 11:43:06'),
('4ea4360acaa06b6a29869f71792980c910731a90e3e9896a0187eb3b3c796e3e788b73caf8d37a5d', 2, 1, 'LaraPassport', '[]', 1, '2020-04-19 08:53:27', '2020-04-19 08:53:27', '2021-04-19 08:53:27'),
('b1da3296900f4a4312697d055244ffd3024a706a933e3f377267b8ba832f558a32781094ed558991', 2, 1, 'LaraPassport', '[]', 1, '2020-04-19 08:54:16', '2020-04-19 08:54:16', '2021-04-19 08:54:16'),
('c5e991e3e0550bb1323ac36650820fe6743f2d38a70c7e2ce8c5108480b05c23be3abd9de686262d', 4, 1, 'LaraPassport', '[]', 1, '2020-04-19 08:55:38', '2020-04-19 08:55:38', '2021-04-19 08:55:38'),
('dbcb16b61d226f18fb749fbbe51828f65bbb2a55a4f96d0247f6b35374d5c444e7b059055aeaea74', 69, 1, 'LaraPassport', '[]', 1, '2020-05-15 07:10:39', '2020-05-15 07:10:39', '2021-05-15 07:10:39'),
('2c3d14ff14585e6fb012547afdeca9e7ca862234a88dfec75456dd756beaa3563e5e7c7f77159160', 2, 1, 'LaraPassport', '[]', 1, '2020-05-15 07:24:59', '2020-05-15 07:24:59', '2021-05-15 07:24:59'),
('e74b316f32abddc6316c1d1a08f6aa0c37f64ce944189c6832ddb6c7715e08e85a950930ae70735c', 4, 1, 'LaraPassport', '[]', 1, '2020-05-15 07:27:50', '2020-05-15 07:27:50', '2021-05-15 07:27:50'),
('91641e87b22d7a0a8775d0d2300db13f189bc0fdb9f4c7068244f6e42a668a26b369114b5ad3451f', 2, 1, 'LaraPassport', '[]', 1, '2020-05-15 07:38:32', '2020-05-15 07:38:32', '2021-05-15 07:38:32'),
('ca862fdae219957b264e8a9b47a455db7a27b58db362e257b974b3a089561fb60276592207c97bc7', 5, 1, 'LaraPassport', '[]', 1, '2020-05-15 07:39:09', '2020-05-15 07:39:09', '2021-05-15 07:39:09'),
('bf806ca6e5369857758e8346271806fc73107a46aad7287a6bd3f43e190205e19d82cffee8abf716', 6, 1, 'LaraPassport', '[]', 1, '2020-05-15 07:42:51', '2020-05-15 07:42:51', '2021-05-15 07:42:51'),
('243f9528b210a094197c9efb6ff1f2bb65adac91b8d43210f723a02ef3510887da562e83de7cb138', 4, 1, 'LaraPassport', '[]', 1, '2020-05-15 07:53:27', '2020-05-15 07:53:27', '2021-05-15 07:53:27'),
('4b092b0a89922dc4715c1c905fa9c8fcd55874e6daa34e4095b072d389b58deb9a7fadc0a490cc22', 1, 1, 'LaraPassport', '[]', 1, '2020-05-15 08:02:46', '2020-05-15 08:02:46', '2021-05-15 08:02:46'),
('81399858f0703449d399f5449c2a18ac20f6577cf746fe69268ce72525289149c691fbe8bf54a0f7', 70, 1, 'LaraPassport', '[]', 1, '2020-06-29 02:34:09', '2020-06-29 02:34:09', '2021-06-29 02:34:09'),
('d947f5457216133ba6b940ef48cf1a2432c3849215425761237c868eee91c127242778000b6cfb97', 2, 1, 'LaraPassport', '[]', 1, '2020-06-29 03:06:47', '2020-06-29 03:06:47', '2021-06-29 03:06:47'),
('1c505f0c843af466950a5c74cfe7e4259d25c99f6936c18f327ccca330e5fa45c40e59ddd4d2fa7f', 4, 1, 'LaraPassport', '[]', 1, '2020-06-29 03:10:04', '2020-06-29 03:10:04', '2021-06-29 03:10:04'),
('ed8e9b63aff768b9bf237886f5328771141c5d416dd812755b264ee34b3beb016f2cbcd78e1a0d52', 5, 1, 'LaraPassport', '[]', 1, '2020-06-29 03:23:24', '2020-06-29 03:23:24', '2021-06-29 03:23:24'),
('8750c4ffc215eee458414fa3b3b4873d8cfbc467c2a88f3f7438754322c73bd1edf3cc20d8777101', 71, 1, 'LaraPassport', '[]', 1, '2020-07-02 04:18:43', '2020-07-02 04:18:43', '2021-07-02 04:18:43'),
('59a630dfa4104f4368dfe3032108ea602627d2ca0840bf09a76c90e7f91bcbba833d413bd8e8d6fa', 2, 1, 'LaraPassport', '[]', 1, '2020-07-02 04:27:04', '2020-07-02 04:27:04', '2021-07-02 04:27:04'),
('7847cfdd63b4be1fefea664062c852253b45b84bf48a642cb28bc5151f1583d46cb8df325db39b12', 2, 1, 'LaraPassport', '[]', 1, '2020-07-02 04:28:21', '2020-07-02 04:28:21', '2021-07-02 04:28:21'),
('419e45ddfce5c096b3d1158d7fee311a711345b104c16111f36304bc63988b169320ea7d791493cc', 4, 1, 'LaraPassport', '[]', 1, '2020-07-02 04:29:05', '2020-07-02 04:29:05', '2021-07-02 04:29:05'),
('23015a6da21e37994a5d3c243d6ba44c3f0a23365f61d13f4d6963f32c19aa85b014607f98603c12', 1, 1, 'LaraPassport', '[]', 1, '2020-07-02 04:36:52', '2020-07-02 04:36:52', '2021-07-02 04:36:52'),
('ddd2c87004dbf50aee63d07ecac8941365924f63a83cc4639cc6ba6b4f84a49963007cda47496b83', 2, 1, 'LaraPassport', '[]', 1, '2020-07-06 09:45:33', '2020-07-06 09:45:33', '2021-07-06 09:45:33'),
('8a80e4338a46c80af23c24aed4edc1cdbee8543be2c4750021a1d0c832b966e737d1b27ecb0f5358', 2, 1, 'LaraPassport', '[]', 1, '2020-07-06 14:52:04', '2020-07-06 14:52:04', '2021-07-06 14:52:04'),
('6b2ef70346adf526514add9aba54b720effbdb03abfd0eb8322f07116df2b10fe6c70ea4d0e0ef61', 2, 1, 'LaraPassport', '[]', 1, '2020-07-07 04:00:22', '2020-07-07 04:00:22', '2021-07-07 04:00:22'),
('2be83a4ed1de3144b48cb48d4bc6021c23fb743c5ab92db1549f3e486a6bf3ea506ca56ab5c98499', 72, 1, 'LaraPassport', '[]', 1, '2020-07-07 04:41:55', '2020-07-07 04:41:55', '2021-07-07 04:41:55'),
('f2becf6e2e744f30865284157e24e1e2639432b5e4232fee40526fb6e56ee5796f25f6637948dd71', 4, 1, 'LaraPassport', '[]', 1, '2020-07-07 05:10:34', '2020-07-07 05:10:34', '2021-07-07 05:10:34'),
('261402a4bb8653acde2447e3619df1877870427e08eb11dca33b3a199b96f6971b4d3198ef3d39c0', 4, 1, 'LaraPassport', '[]', 1, '2020-07-07 05:45:30', '2020-07-07 05:45:30', '2021-07-07 05:45:30'),
('73ef321d9b299aa4268ef5021f9e64c1e887001779805d60e52936327641e2dc03cbf4486036daf0', 9, 1, 'LaraPassport', '[]', 1, '2020-07-07 05:45:43', '2020-07-07 05:45:43', '2021-07-07 05:45:43'),
('63f532bf05e2868f1e2e88926b841938842f3e255104ce2cd1c74a1d692bce5535063f7e1ba7f4fe', 4, 1, 'LaraPassport', '[]', 1, '2020-07-07 05:50:44', '2020-07-07 05:50:44', '2021-07-07 05:50:44'),
('6d528b84f1bc8516469316f46b2c8b279e338caba83b05741b8743be8210b31e31caa7cdd0f34e67', 9, 1, 'LaraPassport', '[]', 1, '2020-07-07 05:59:17', '2020-07-07 05:59:17', '2021-07-07 05:59:17'),
('9c2dfaf1c9459376c8a8dd608fbeb5c2518883102925b84de0877fbf61d7b1b2d1857d6a6c2a5aba', 73, 1, 'LaraPassport', '[]', 1, '2020-07-07 06:01:04', '2020-07-07 06:01:04', '2021-07-07 06:01:04'),
('68976d1e997fb5ae647e030d10ff49a3772aa5226910f3cc1f38947b68354af8303ac17443acc26d', 4, 1, 'LaraPassport', '[]', 0, '2020-07-07 06:02:24', '2020-07-07 06:02:24', '2021-07-07 06:02:24'),
('59e4732c146c6c904edc6aec4e83afbde0178a50206b03469f678b4c6a1aa9a0798dcf47dcacf482', 4, 1, 'LaraPassport', '[]', 0, '2020-07-07 06:10:39', '2020-07-07 06:10:39', '2021-07-07 06:10:39'),
('cd898008afc197f90b2e9d371579111660cdd2254f920c2eea0b9aad38967ab1e4433bae4d49b48c', 9, 1, 'LaraPassport', '[]', 1, '2020-07-07 06:17:02', '2020-07-07 06:17:02', '2021-07-07 06:17:02'),
('8562f2efdd1b7d4fd773f39a4f60006f3461dd733e1898d208f2f5cc78ca1bf262a39ce684223617', 9, 1, 'LaraPassport', '[]', 1, '2020-07-07 06:37:59', '2020-07-07 06:37:59', '2021-07-07 06:37:59'),
('8f9137459ac2ca634ee99a412c36354564bf4e5857e17b7922c4c5e21146da8a24c96096669fba9a', 5, 1, 'LaraPassport', '[]', 1, '2020-07-07 06:43:19', '2020-07-07 06:43:19', '2021-07-07 06:43:19'),
('41e714eec857b930de205d25834e67494411ae7094983c77e315b2bc62bfaa7e120c1858d088c85e', 5, 1, 'LaraPassport', '[]', 1, '2020-07-07 06:55:28', '2020-07-07 06:55:28', '2021-07-07 06:55:28'),
('d836ec55cec82343be9026db74c96ed3314dad1843d0409033d3b6d6d03f2ae74fd03905572763a1', 5, 1, 'LaraPassport', '[]', 0, '2020-07-07 08:16:43', '2020-07-07 08:16:43', '2021-07-07 08:16:43'),
('745fa4dbbe425ad9ce627cb6451dcb99a5a8e12cc48848f23c62f784c22557060ef113b247840dbf', 74, 1, 'LaraPassport', '[]', 1, '2020-07-14 08:26:15', '2020-07-14 08:26:15', '2021-07-14 08:26:15'),
('54b9a316bf9bddeba8d305776199cc79ba8edc9433946ba2228656b6c18869dbff1150537dc7ca35', 79, 1, 'LaraPassport', '[]', 1, '2020-07-20 06:33:04', '2020-07-20 06:33:04', '2021-07-20 06:33:04'),
('4a44c7d642e7426b218678cf0ec8d6426922209e48571a4cd0fc76acadf897c816b558bcc27febcb', 2, 1, 'LaraPassport', '[]', 1, '2020-07-20 07:11:31', '2020-07-20 07:11:31', '2021-07-20 07:11:31'),
('4ffb1e0d216f011d0bf48f70d3a01bc6b260875f9a0f1215b98cdd5b71aead2b4a17fdbb1f5e308e', 2, 1, 'LaraPassport', '[]', 1, '2020-07-20 07:18:17', '2020-07-20 07:18:17', '2021-07-20 07:18:17'),
('e3f06aad05f1e09e25cb27daa893257f17e1966ed8b4e5c71fc3339e86f9b2ac955fba264cc7a787', 4, 1, 'LaraPassport', '[]', 1, '2020-07-20 07:18:50', '2020-07-20 07:18:50', '2021-07-20 07:18:50'),
('c02bdcfa49efedcce548a6be54f8d90ea65086f5a8638a3ca7b50fc5b9d87af6184e913e342edfc1', 1, 1, 'LaraPassport', '[]', 1, '2020-07-20 07:31:59', '2020-07-20 07:31:59', '2021-07-20 07:31:59'),
('b530881efdb2ace6756a2341990b001c7b9185e8af3cbbac709060b51cd0389ff7c93d5b943b04a0', 80, 1, 'LaraPassport', '[]', 1, '2020-07-21 05:36:09', '2020-07-21 05:36:09', '2021-07-21 05:36:09'),
('5f39d2c66a07ce005698ebf577916ac50c7c019e7f78d9463b51a18ca28d327b1d970d5006021d95', 2, 1, 'LaraPassport', '[]', 1, '2020-07-21 05:55:33', '2020-07-21 05:55:33', '2021-07-21 05:55:33'),
('42d28c082c627a9bc6ec82c5502f329ba199faa588b7f02b1a280b21745eca3ff54280d1e07a2841', 4, 1, 'LaraPassport', '[]', 1, '2020-07-21 05:57:05', '2020-07-21 05:57:05', '2021-07-21 05:57:05'),
('145e5438bdbca26c2c98c460302c898dc9009888cfab8e52c97d3f05550bfbb3a27984a88f4c97b9', 2, 1, 'LaraPassport', '[]', 1, '2020-08-03 08:10:01', '2020-08-03 08:10:01', '2021-08-03 08:10:01'),
('449f2e2e687e2ba190868dd73402f9623d96bd891e311e778c818be6036b0a160e8a6493544b0bf2', 81, 1, 'LaraPassport', '[]', 1, '2020-08-03 08:36:53', '2020-08-03 08:36:53', '2021-08-03 08:36:53'),
('9abc23adcbc0bae33a2f2dc6b64dc8527e60601e63852b2016dda0757fc67ef4545801854e423ae3', 2, 1, 'LaraPassport', '[]', 1, '2020-08-03 09:01:15', '2020-08-03 09:01:15', '2021-08-03 09:01:15'),
('37f97c72e903b19260ccd2953766ce5eab0fe6248adb98a0152b9939709d46b4d61e3e17e6255766', 4, 1, 'LaraPassport', '[]', 1, '2020-08-03 09:02:11', '2020-08-03 09:02:11', '2021-08-03 09:02:11'),
('a15211b6434ed75c3793c306a525cc6644a1136f16d1d8cd0eda5736214b654b9d376184e67c1c6e', 5, 1, 'LaraPassport', '[]', 1, '2020-08-03 09:12:19', '2020-08-03 09:12:19', '2021-08-03 09:12:19'),
('0253c734ef3bca4cc7ab60a3aa39c0731a4d18cd357ba2cb268119cbb0f8c8f60efc39fb485d1df3', 1, 1, 'LaraPassport', '[]', 0, '2020-08-03 09:15:46', '2020-08-03 09:15:46', '2021-08-03 09:15:46'),
('eac319b0cb7b5776c26db4b45b33c23cc786b75ca8b299685b8f84472ecec163d787196fad82079f', 97, 1, 'LaraPassport', '[]', 0, '2020-08-26 19:11:26', '2020-08-26 19:11:26', '2021-08-27 00:11:26'),
('8a1b30f198540cc9ed960432822bcc643feefc7fce10005226b8207001ca4d33b56faa4d345ea738', 104, 1, 'LaraPassport', '[]', 1, '2020-08-26 21:26:54', '2020-08-26 21:26:54', '2021-08-27 02:26:54'),
('3ef1cd315fd55bcf136427cac7c673209d1fc2d5eb0d043617e39fe43123a011607bf01e8faa19ff', 104, 1, 'LaraPassport', '[]', 1, '2020-08-26 21:30:28', '2020-08-26 21:30:28', '2021-08-27 02:30:28'),
('da7c1de04d5a56d0be6e9d0c5bf1934c8c8a0e076f278eb56f8c3a0ea159da1a633971dfdf1f8961', 104, 1, 'LaraPassport', '[]', 1, '2020-09-02 19:20:26', '2020-09-02 19:20:26', '2021-09-03 00:20:26'),
('7ffde25cac733dda1242e2e1500f9718ef101ca25110cd5fdd90ed26b60917c4b583f3e2f9544f04', 5, 1, 'LaraPassport', '[]', 1, '2020-09-02 19:22:40', '2020-09-02 19:22:40', '2021-09-03 00:22:40'),
('d6423080529aa0f325e41849eebb670ca58d45912f4abc36f3691b3caa1d9651f5166a2333e89564', 4, 1, 'LaraPassport', '[]', 1, '2020-09-02 20:43:09', '2020-09-02 20:43:09', '2021-09-03 01:43:09'),
('e1d6c6eea8e31f304d227fbab01df702baa190a2576688a6721b76addbd3103ca739a29f76a09dc3', 4, 1, 'LaraPassport', '[]', 1, '2020-09-02 23:29:18', '2020-09-02 23:29:18', '2021-09-03 04:29:18'),
('3c55062a595cfebe538df83a1d2759f44c4d963fc8582623d79d28fe35642218c324d5d3a469697d', 4, 1, 'LaraPassport', '[]', 1, '2020-09-02 23:38:34', '2020-09-02 23:38:34', '2021-09-03 04:38:34'),
('ac82f729f91a31408ce11ad86bf2c2b8d304104f8bfd7862d65b0fd0727a940bca51a0d80e89a2cb', 4, 1, 'LaraPassport', '[]', 1, '2020-09-02 23:53:28', '2020-09-02 23:53:28', '2021-09-03 04:53:28'),
('c56ae7d3ed25bac086cf676777ea13e9a70014e83888346509e74edc5df44d722e7745cf6cf25704', 4, 1, 'LaraPassport', '[]', 1, '2020-09-02 23:55:58', '2020-09-02 23:55:58', '2021-09-03 04:55:58'),
('3de567281e916ae0a617c7c682446adb6972e4ead4948f2f9c11a12c17cfe49048a29b271397edc9', 4, 1, 'LaraPassport', '[]', 1, '2020-09-02 23:58:07', '2020-09-02 23:58:07', '2021-09-03 04:58:07'),
('c584ac401761f840aae123f3bd7d246c8fb0b75170ec669e385c1f4b6a1d3d94c6a08e1a7d967320', 4, 1, 'LaraPassport', '[]', 1, '2020-09-03 00:02:04', '2020-09-03 00:02:04', '2021-09-03 05:02:04'),
('33558f1e471365932cbbda8cb504158f48778d9fea1efaf66e0ba5bdcc479e36d28f77e7d0d6a3ac', 4, 1, 'LaraPassport', '[]', 1, '2020-09-03 00:04:57', '2020-09-03 00:04:57', '2021-09-03 05:04:57'),
('52293137f7148960443a58c87ad5d80c22a70cc9cd7691126dec96db816ee90ce978bc695aee6ba2', 4, 1, 'LaraPassport', '[]', 1, '2020-09-03 00:05:43', '2020-09-03 00:05:43', '2021-09-03 05:05:43'),
('c1601ffcf4e56c5cde6cc5fe8b80738251ce3c8a5f4d100e04796e29026c6753d7fa0e4c66251c17', 4, 1, 'LaraPassport', '[]', 1, '2020-09-03 20:55:47', '2020-09-03 20:55:47', '2021-09-04 01:55:47'),
('7973163871f5bbf13417671ca187ac7c70a27eee040ddfa5f32b351960d83f258382b43b36cb6cb4', 4, 1, 'LaraPassport', '[]', 1, '2020-09-04 19:50:42', '2020-09-04 19:50:42', '2021-09-05 00:50:42'),
('7b6b10793a8b934d7322430804929541ebf301b58acc8939c46ea2eb0f9be00d29e7d8e0152a76a2', 105, 1, 'LaraPassport', '[]', 0, '2020-09-04 21:55:38', '2020-09-04 21:55:38', '2021-09-05 02:55:38'),
('39d568af26d17df69b133a92f3278fae13955a1a55a20e524622c045bfc5ac5ad5e584c094601fbd', 106, 1, 'LaraPassport', '[]', 0, '2020-09-04 21:58:52', '2020-09-04 21:58:52', '2021-09-05 02:58:52'),
('a4879889eeeb0fc53d50ce17d23d04c80c5fc5eaca7975cd74c81653d8b30e58df43a0e2aea20863', 107, 1, 'LaraPassport', '[]', 0, '2020-09-04 22:01:23', '2020-09-04 22:01:23', '2021-09-05 03:01:23'),
('1912d150f811a5ad77d1a67337805a6f6ee20fc218a7fe28a39960bd991a1d52d00511402e9c8bde', 108, 1, 'LaraPassport', '[]', 0, '2020-09-04 22:03:50', '2020-09-04 22:03:50', '2021-09-05 03:03:50'),
('fdf0fd169f96998fed66464cbcc6ca571e7eadb2219a053390fde9cc29afde526924110c89c1da94', 109, 1, 'LaraPassport', '[]', 0, '2020-09-04 22:05:33', '2020-09-04 22:05:33', '2021-09-05 03:05:33'),
('1dcbe2db7700dc0e86cf489d6acf4837c076f724c7c661a99638adde9786e573d21915981a219538', 110, 1, 'LaraPassport', '[]', 1, '2020-09-04 22:08:34', '2020-09-04 22:08:34', '2021-09-05 03:08:34'),
('818ec918db8c0eace2cf6de861df77ad9577026c8cd3e45a990f765a3d5c79f2593bfc4421995fc3', 111, 1, 'LaraPassport', '[]', 0, '2020-09-04 23:18:18', '2020-09-04 23:18:18', '2021-09-05 04:18:18'),
('884f1bb0b2aecf1c97bed7fc6330660cc0101e2770cce509df597752eb58542cf5ef8d0c6e190248', 4, 1, 'LaraPassport', '[]', 1, '2020-09-04 23:20:03', '2020-09-04 23:20:03', '2021-09-05 04:20:03'),
('7dc76c38e6e3d32da3a62d9e4e709357db0b11dbd1df1cf0cbf5c57f47e6cb876bdbb40f33cedb3e', 112, 1, 'LaraPassport', '[]', 1, '2020-09-04 23:25:18', '2020-09-04 23:25:18', '2021-09-05 04:25:18'),
('04a7ad852c9b2cd12d7cc3a5a04acb0948fb3648779d119898da258e8960a19cc9a16960a91b6ec2', 113, 1, 'LaraPassport', '[]', 1, '2020-09-04 23:32:46', '2020-09-04 23:32:46', '2021-09-05 04:32:46'),
('60d056d285eb3ec2e049dc2ce35ef78aa962602cc70f5bfa6a7d7a189550707af674f09c272afd95', 4, 1, 'LaraPassport', '[]', 1, '2020-09-04 23:35:00', '2020-09-04 23:35:00', '2021-09-05 04:35:00'),
('19b3d30d1a65a81ccf7b54da064660ffb0fd1a65ab1873b255f628cb000fba04036c133688f5e45f', 4, 1, 'LaraPassport', '[]', 1, '2020-09-04 23:36:26', '2020-09-04 23:36:26', '2021-09-05 04:36:26'),
('0b8dfc8a25f2be4ba82925a0399fb49c97a6775e4e85cd12fc16c2d5b2897b8e8cd347db48c0d271', 114, 1, 'LaraPassport', '[]', 1, '2020-09-05 01:49:54', '2020-09-05 01:49:54', '2021-09-05 06:49:54'),
('7237837d654ffbee5a59deb2701cdd60861adaa43abe982b5460bbbd89f0e2a0df5581de464ffaf6', 4, 1, 'LaraPassport', '[]', 1, '2020-09-06 18:55:14', '2020-09-06 18:55:14', '2021-09-06 23:55:14'),
('29679ceb1063f3b17ca57c6117c815eba4e6f2562daa342ab353d4f5e19a7cf7511b5ec78a1cc730', 115, 1, 'LaraPassport', '[]', 1, '2020-09-06 18:57:45', '2020-09-06 18:57:45', '2021-09-06 23:57:45'),
('7269a3396367e5170a371f76bf54cc40a6e4e3adc17636a0f84b648ca53b523f8508de786cda9e1e', 116, 1, 'LaraPassport', '[]', 1, '2020-09-08 21:16:40', '2020-09-08 21:16:40', '2021-09-09 02:16:40'),
('6f4f11f87da600519c04417e92ee3da0ef828ca37a18a13e3c936f168bd7e4a16674e24399267ee6', 4, 1, 'LaraPassport', '[]', 1, '2020-09-10 03:55:13', '2020-09-10 03:55:13', '2021-09-10 08:55:13'),
('9ae09b6e1c999453a5fdf642d0961dfd1fc0d55c62089d0f9512e5ddfa073f2f7a2e3975585b6ba6', 4, 1, 'LaraPassport', '[]', 1, '2020-09-10 21:29:21', '2020-09-10 21:29:21', '2021-09-11 02:29:21'),
('2a280c715f46f7ce8db067e1530eb0c76bb0eaa0f0780a8156a97c004d0e7162b0b5eab356b87d1b', 4, 1, 'LaraPassport', '[]', 1, '2020-09-10 21:30:36', '2020-09-10 21:30:36', '2021-09-11 02:30:36'),
('71a578f1c6b721d83b317d2f7690e84df8d1666cdcff0dd6bccaaf3be8dc618a0134fa567dc09f3a', 4, 1, 'LaraPassport', '[]', 1, '2020-09-10 23:38:50', '2020-09-10 23:38:50', '2021-09-11 04:38:50'),
('72389c1ce4cfa5fd95121a7481b3198c7e87506fb52ac0c3f70e14715745779de1d91f6d753c1a44', 1, 1, 'LaraPassport', '[]', 1, '2020-09-10 23:41:32', '2020-09-10 23:41:32', '2021-09-11 04:41:32'),
('4449e411737a664987c9903ce0ae01d79b9b4d3bf2c5bc9b1b3990e58f477d2f110b037504237035', 3, 1, 'LaraPassportVendor', '[]', 1, '2020-09-10 23:45:26', '2020-09-10 23:45:26', '2021-09-11 04:45:26'),
('855dedb4ca1ce22c91878bc8abf2c7c9c05b46a821039cc0b9920e92627b457b252b7009a252ac9e', 126, 1, 'LaraPassport', '[]', 1, '2020-09-12 06:45:50', '2020-09-12 06:45:50', '2021-09-12 11:45:50'),
('ed2fd50d32d4b8fa6475cd2f096f457320133105bfef947374afba181316094f0b01fee87654b133', 4, 1, 'LaraPassport', '[]', 1, '2020-09-14 21:44:55', '2020-09-14 21:44:55', '2021-09-15 02:44:55'),
('24ecf21a82e09f77e53b06e475735625b581e664b7c7b5ef56bfbcd5a4b730c8bfdde5fd24ff03b8', 2, 1, 'LaraPassport', '[]', 1, '2020-09-14 21:49:10', '2020-09-14 21:49:10', '2021-09-15 02:49:10'),
('d1945693f0fe16c31662509ab872be6b39ca17b0d6f301b016cf92451bac88ee30ba0f00c51c3c2e', 4, 1, 'LaraPassport', '[]', 1, '2020-09-14 21:56:09', '2020-09-14 21:56:09', '2021-09-15 02:56:09'),
('cf43ec4f834c348737cceeae65a3e38d7fb5815c849b64987f8673e4af184367e6b67db099bd5036', 1, 1, 'LaraPassport', '[]', 1, '2020-09-14 21:56:53', '2020-09-14 21:56:53', '2021-09-15 02:56:53'),
('66fe324f6e42f459660116b81e6f084254dd0ca295e5ebdc0db17dc1d3fdab9398cd93541f127e3e', 126, 1, 'LaraPassport', '[]', 1, '2020-09-14 22:09:54', '2020-09-14 22:09:54', '2021-09-15 03:09:54'),
('8538bdda43f26b88a64ed62690118ce2ffb148a77b365a715ff0135635680ad34b779480e70902fe', 4, 1, 'LaraPassport', '[]', 1, '2020-09-14 23:04:32', '2020-09-14 23:04:32', '2021-09-15 04:04:32'),
('9267c249b14b8abcba973fb1043bc1dc02775a3f1847916f39a1495d57ed161619345200de61567c', 1, 1, 'LaraPassportVendor', '[]', 1, '2020-09-14 23:15:05', '2020-09-14 23:15:05', '2021-09-15 04:15:05'),
('623b3cbfd3d17d954af18db5d2a0d375895b2089165f593ba6b6c3932f491d08968ea3779612617d', 1, 1, 'LaraPassportVendor', '[]', 0, '2020-09-14 23:51:48', '2020-09-14 23:51:48', '2021-09-15 04:51:48'),
('b720f12b2d37d202591b29606bdf72fe368967e3a73b6fee35f5244b7d0fc2177c27f14b5ef45908', 1, 1, 'LaraPassportVendor', '[]', 1, '2020-09-14 23:53:28', '2020-09-14 23:53:28', '2021-09-15 04:53:28'),
('0998cb0b062bb7e3f3d93e8e3b4b67ed02b726d4337bbbd9d7107591dfe779399a5f4b735b7276a8', 4, 1, 'LaraPassport', '[]', 1, '2020-09-17 20:52:28', '2020-09-17 20:52:28', '2021-09-18 01:52:28'),
('f9fba636e18e07637a8f8b1fceb0c3d22ecd407f992cf66a3137d792caad960f9e3c04a3eeae4f6e', 5, 1, 'LaraPassport', '[]', 1, '2020-09-17 21:09:35', '2020-09-17 21:09:35', '2021-09-18 02:09:35'),
('a7de3877fb492ebd0a9b1f1a50ee10c30060fa2a3ac7f63843068c4477145d3f237716acdd4f73d5', 6, 1, 'LaraPassport', '[]', 1, '2020-09-17 21:13:40', '2020-09-17 21:13:40', '2021-09-18 02:13:40'),
('abd4ce406d44bfde09bdc2354f47d434044e3d45b2df838983e164b307267a77fd7acdff6f463594', 12, 1, 'LaraPassport', '[]', 1, '2020-09-17 21:15:55', '2020-09-17 21:15:55', '2021-09-18 02:15:55'),
('9ca8c6b3c695510f89619c4274d72b8da4f3b0c5a99070a8349ab06f054b931d2202638b228e8dfd', 4, 1, 'LaraPassport', '[]', 1, '2020-09-18 00:52:35', '2020-09-18 00:52:35', '2021-09-18 05:52:35'),
('43634948b9de00a54d2016239f5bf9f2a0056668083b80070ec81c5a8a17f61b611ad24f6a13e745', 5, 1, 'LaraPassport', '[]', 1, '2020-09-18 01:48:43', '2020-09-18 01:48:43', '2021-09-18 06:48:43'),
('1dd661c0169ad948135002158d59dff5a8a33d94d4fe1d534d7379847bf1b7489cacbaa620ae6ada', 12, 1, 'LaraPassport', '[]', 1, '2020-09-18 02:37:13', '2020-09-18 02:37:13', '2021-09-18 07:37:13'),
('9caef97e392167de31db73eb0d902438393fda26a43573a43c52b984c095aee30a5896f09eee809c', 4, 1, 'LaraPassport', '[]', 1, '2020-09-18 18:43:19', '2020-09-18 18:43:19', '2021-09-18 23:43:19'),
('7654b956353ddd4537943d9d9cea3de533dc20f4f7480d5ae40445df50611ac45d3f52421d7460eb', 4, 1, 'LaraPassport', '[]', 1, '2020-09-19 01:54:50', '2020-09-19 01:54:50', '2021-09-19 06:54:50'),
('07c02ac6b1fd3e65059ba32dda7b33ec96874a5018b16d32dbe18351d0fcf6698fa6a9ee84d811a9', 4, 1, 'LaraPassport', '[]', 1, '2020-09-19 02:06:28', '2020-09-19 02:06:28', '2021-09-19 07:06:28'),
('76306b66ef1745bcf02f7a8760d82bde00b483593ebd9f171776941dbbe6254987681e521537982d', 4, 1, 'LaraPassport', '[]', 0, '2020-09-19 03:34:03', '2020-09-19 03:34:03', '2021-09-19 08:34:03'),
('243b5a392f6ca19c4aac9aa541c079cea0d7ce34a55111ce32268fef103cb0a9af0e1e42c685611f', 12, 1, 'LaraPassport', '[]', 1, '2020-09-20 18:41:14', '2020-09-20 18:41:14', '2021-09-20 23:41:14'),
('4f88e68fb292d8cf6841827c21087adfc50dded9ed12eafc25809be325e6450cb5d23399ed5bf060', 5, 1, 'LaraPassport', '[]', 1, '2020-09-20 19:16:51', '2020-09-20 19:16:51', '2021-09-21 00:16:51'),
('2c5d09d892d25d480ea4ca9bbe25c5e9aef03e5da0ecf9f8af807e25c552ae7cfe22db89ff5e58cb', 6, 1, 'LaraPassport', '[]', 1, '2020-09-20 19:21:04', '2020-09-20 19:21:04', '2021-09-21 00:21:04'),
('7a41590c164fc877c998c9e3379d258ffe84b2c57c0f10e6dcfdb7b5af17a62377a2b44171c4b67f', 33, 1, 'LaraPassport', '[]', 1, '2020-09-27 19:58:15', '2020-09-27 19:58:15', '2021-09-28 00:58:15'),
('ad92f105ee95956679403301e25dbbf60b26063926a721bb0a98aa7bfc1d41f4a020b5d6f258efe8', 33, 1, 'LaraPassport', '[]', 1, '2020-09-30 22:52:53', '2020-09-30 22:52:53', '2021-10-01 03:52:53'),
('91711757b3be2848893b83f20371be66611c4ec4b08e825f2d30c084d617740110a08e9529abe5c2', 33, 1, 'LaraPassport', '[]', 1, '2020-09-30 22:54:21', '2020-09-30 22:54:21', '2021-10-01 03:54:21'),
('f072be39cdef06283d0dd3eb14e0223e95c62f478b59071e1b19f79a47e5058b86e837b632680d20', 320, 1, 'LaraPassport', '[]', 1, '2020-09-30 23:22:46', '2020-09-30 23:22:46', '2021-10-01 04:22:46'),
('c188bafdeea0c083673d72d44d6f41080ff7c9ff83ec8f62998e401ecb5e846751af44ce731e5dbc', 320, 1, 'LaraPassport', '[]', 0, '2020-09-30 23:51:30', '2020-09-30 23:51:30', '2021-10-01 04:51:30'),
('45060f8946af3c8881344f8020b919d90c2865fdcfb340725822e870024e2b1aa5325ab28ddf6ea0', 320, 1, 'LaraPassport', '[]', 1, '2020-09-30 23:53:41', '2020-09-30 23:53:41', '2021-10-01 04:53:41'),
('8d5ba7ed387a2b3a445c359b3f2e4e48332376468a8251bb3dd2c90e5e61a5d6c5b19f98d0bf3184', 321, 1, 'LaraPassport', '[]', 1, '2020-09-30 23:54:25', '2020-09-30 23:54:25', '2021-10-01 04:54:25'),
('d19845da722e63478141cb506069969e0e09a07f9088ca0bf70aeec04e9c7c3be1cb07c9a7411779', 321, 1, 'LaraPassport', '[]', 1, '2020-10-01 00:04:19', '2020-10-01 00:04:19', '2021-10-01 05:04:19');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2db6721d04ee88b92286428b4526f8468ce814fa41cbab2e8b17e4e218c7ce1da391097ff756c1d6', 322, 1, 'LaraPassport', '[]', 1, '2020-10-01 00:19:21', '2020-10-01 00:19:21', '2021-10-01 05:19:21'),
('b4a3fa33a750f426f06ef2432005fe4f25578ca7f218c29c6fb0d15fd1169450d9f3a21e506c8174', 322, 1, 'LaraPassport', '[]', 1, '2020-10-01 00:49:22', '2020-10-01 00:49:22', '2021-10-01 05:49:22'),
('fe4bec8f70ea8f9204449100c1e9dcc20bb7d184e67282d33dd9f5d8f680007e520094984ef8f9b5', 323, 1, 'LaraPassport', '[]', 1, '2020-10-01 00:49:56', '2020-10-01 00:49:56', '2021-10-01 05:49:56'),
('930c2bcfc5a4a5c2b844d000e3ede34b1a2635032cd1536f28a7138f45d0210bf79ee4e88d7b155d', 323, 1, 'LaraPassport', '[]', 1, '2020-10-01 00:54:00', '2020-10-01 00:54:00', '2021-10-01 05:54:00'),
('97ed31a53a13eee8c9ec35fef214990ddfded962ded232d466069d8581b6ffbdd71c897917980fa1', 323, 1, 'LaraPassport', '[]', 1, '2020-10-01 20:43:01', '2020-10-01 20:43:01', '2021-10-02 01:43:01'),
('1f0e2588b336c26fa1b4c5b4df8b3a9bbfea5f450638204bcc93acb93d7c01070afa2fd99d62391d', 33, 1, 'LaraPassport', '[]', 1, '2020-10-01 20:46:12', '2020-10-01 20:46:12', '2021-10-02 01:46:12'),
('95ab00bd1d217f1312d1dcd5daff4d270d44b65fffcf3b6a47a67c0005c27cc62aea1d205013bc2f', 3, 1, 'LaraPassport', '[]', 1, '2020-10-01 20:46:54', '2020-10-01 20:46:54', '2021-10-02 01:46:54'),
('30b68eefe3ba5eac73bc661559764c1f630931dba90dd6f0b1a23f79d7792ab0ae7e959c24318615', 2, 1, 'LaraPassport', '[]', 1, '2020-10-01 20:47:57', '2020-10-01 20:47:57', '2021-10-02 01:47:57'),
('8370813e734a1519eb78f31118b4bdf29875c8c0479472dac4a8c5a1ba5d473d206347657f128e0e', 3, 1, 'LaraPassport', '[]', 1, '2020-10-01 20:48:19', '2020-10-01 20:48:19', '2021-10-02 01:48:19'),
('c13336ea78a3b536fe2d4db3b9b145c6907f4037e9b79255ee62b97421b37847b6621a26826db3ef', 5, 1, 'LaraPassport', '[]', 1, '2020-10-01 21:58:15', '2020-10-01 21:58:15', '2021-10-02 02:58:15'),
('479bf59d468fff07fba83510fd615b7930c312f95a033ec5d5b1844ec83b20e993ea5dbebcd205d7', 6, 1, 'LaraPassport', '[]', 1, '2020-10-01 23:15:41', '2020-10-01 23:15:41', '2021-10-02 04:15:41'),
('3c2ead19b1a8fa5d86a400c89b0c86730e0a433f707d0d25788756c78508b158a31475071c152841', 6, 1, 'LaraPassport', '[]', 1, '2020-10-01 23:18:59', '2020-10-01 23:18:59', '2021-10-02 04:18:59'),
('058271f35de1529d6040ea37b4282c78e19e18aae5989c3f3df320e4f03b2869a7981fd88aef898a', 3, 1, 'LaraPassport', '[]', 1, '2020-10-01 23:19:52', '2020-10-01 23:19:52', '2021-10-02 04:19:52'),
('ce724fb00887dccd536451216ec1d7fecf75d622ea7e6afebe9bc23381f7973bd717c0bf5c3ce575', 5, 1, 'LaraPassport', '[]', 1, '2020-10-01 23:20:38', '2020-10-01 23:20:38', '2021-10-02 04:20:38'),
('67c993c4268ab21c23170fb1255ff37ca78cbe58e3b076ea0af4c358d8d7f8748c192a5c7a79dbf3', 3, 1, 'LaraPassport', '[]', 1, '2020-10-01 23:21:36', '2020-10-01 23:21:36', '2021-10-02 04:21:36'),
('55eee67c6b52a367e953ecd9c3523582d04aa23c3f2a9bd8b8750eebb4d73803261467572ee59ea4', 5, 1, 'LaraPassport', '[]', 1, '2020-10-01 23:37:04', '2020-10-01 23:37:04', '2021-10-02 04:37:04'),
('d5731cb9029e753ae1eeea682d0110156f18a725de9bda65d27846cdfaf26e53dd99e4756d5e4e23', 3, 1, 'LaraPassport', '[]', 1, '2020-10-01 23:50:09', '2020-10-01 23:50:09', '2021-10-02 04:50:09'),
('1a78dbd6bf98fb766048728a8d7005a60360050ae3fa229ba100fdb864117df2cafc12ce544a9bbc', 5, 1, 'LaraPassport', '[]', 1, '2020-10-05 05:46:14', '2020-10-05 05:46:14', '2021-10-05 10:46:14'),
('f0a971fb87866203fc5d360d48d0a02ceec87b1d07489c57fc96f32a23d6da3db33caaf7a1410f52', 324, 1, 'LaraPassport', '[]', 1, '2020-10-06 22:51:59', '2020-10-06 22:51:59', '2021-10-07 03:51:59'),
('f6d5d4bf4a6eaee151db5130fbd94b5f2cf954a9d1c8c7fa917e186ae765490e6dba64f9fd12d3bb', 4, 1, 'LaraPassport', '[]', 1, '2020-10-11 19:34:47', '2020-10-11 19:34:47', '2021-10-12 00:34:47'),
('8210e3a27b69cc8eaaee48e627bf90edbc5b7b1ab3bb07df3c19b96eabe851479573de2063d88729', 4, 1, 'LaraPassport', '[]', 1, '2020-10-11 19:38:14', '2020-10-11 19:38:14', '2021-10-12 00:38:14'),
('243bd33d6dd89ea2800e066d9c2107afb9723d66baa7279872eea7e70df1c3e4ee640c3cf82c224c', 2, 1, 'LaraPassport', '[]', 1, '2020-10-16 20:57:55', '2020-10-16 20:57:55', '2021-10-17 01:57:55'),
('18ddb2a35dbb1c31a1870f1c2b52bedfd33f88b0ba83646cc659f07da133c444dd327388f35e0cc1', 4, 1, 'LaraPassport', '[]', 0, '2020-10-16 21:03:10', '2020-10-16 21:03:10', '2021-10-17 02:03:10'),
('cfb09fc61d35e8f773db593714681edd239942c90e24245f8767f56507e7110286503dc5a59c0fda', 12, 1, 'LaraPassport', '[]', 1, '2020-11-27 06:47:33', '2020-11-27 06:47:33', '2021-11-27 06:47:33'),
('b5503fd5941a81376b2b250765d257197084c6e6d86ab9f0695418b7cc5c87a824393a5b3fd64e2d', 4, 1, 'LaraPassport', '[]', 1, '2020-11-27 06:52:49', '2020-11-27 06:52:49', '2021-11-27 06:52:49'),
('72d69ce4d57e45c614cc53d71814e50e40397bf9573ae45796bb44516b10f8864e36e183bb96863b', 339, 1, 'LaraPassport', '[]', 1, '2020-11-27 06:58:56', '2020-11-27 06:58:56', '2021-11-27 06:58:56'),
('89599c7a6c9a957716c97d2885c19d3faa40c92e827a51ccabd6cc2c9939a74241cd8e7c821b0de5', 4, 1, 'LaraPassport', '[]', 1, '2020-11-27 07:08:22', '2020-11-27 07:08:22', '2021-11-27 07:08:22'),
('bda3ec8023e47bcefcdc74599c66bd89b88f945a7e8fb17e27c68bccbc8f75b6550db0055e5c5e94', 339, 1, 'LaraPassport', '[]', 0, '2020-11-27 07:13:45', '2020-11-27 07:13:45', '2021-11-27 07:13:45'),
('3079d01e3e442057f7ef12e2670d1a107af0a67f8d853cddb0249e4c1579166662fb2c487de42981', 339, 1, 'LaraPassport', '[]', 0, '2020-12-07 11:26:27', '2020-12-07 11:26:27', '2021-12-07 03:26:27'),
('9fd86f64891d290168089eca619c849a43bbd83db640e0e7a8a19c59431cb434f1227e60c9980993', 339, 1, 'LaraPassport', '[]', 0, '2020-12-07 12:51:33', '2020-12-07 12:51:33', '2021-12-07 04:51:33'),
('8a6d89f7e9953064b61054c9686f4bd54f3f0e5476524e73ea505b50703e948c9a7ee655ac6fbf20', 340, 1, 'LaraPassport', '[]', 0, '2020-12-07 13:10:18', '2020-12-07 13:10:18', '2021-12-07 05:10:18'),
('361a4211df9f58e7556faf57586a4f88152075b3b2193ab74d4b29389985fdb6db02c7759d069c90', 341, 1, 'LaraPassport', '[]', 1, '2020-12-08 09:51:45', '2020-12-08 09:51:45', '2021-12-08 01:51:45'),
('760fb4e6e5e8370b6e15c70d59e54bce9b43d477b617e5ae8d8d554647de1e94700405a86b277d3d', 339, 1, 'LaraPassport', '[]', 1, '2020-12-08 10:19:50', '2020-12-08 10:19:50', '2021-12-08 02:19:50'),
('4ed88534075ac0dd51a9f4e47bbca36194faf9939d43ef03c36f4ee04ea731bc3c7a0503d6d95a05', 340, 1, 'LaraPassport', '[]', 1, '2020-12-08 10:21:22', '2020-12-08 10:21:22', '2021-12-08 02:21:22'),
('f80ae295f56a3c0908b187c0f6fc127be76331a495b729dce436fa48e2c1ca60945d8f60d6119fc3', 341, 1, 'LaraPassport', '[]', 1, '2020-12-08 10:32:54', '2020-12-08 10:32:54', '2021-12-08 02:32:54'),
('9262b1a9a340e242ee7200e918fb503a787853a8578ee5ce18b06eb63a67cfd44a8e296eebf6ef22', 340, 1, 'LaraPassport', '[]', 1, '2020-12-08 11:46:54', '2020-12-08 11:46:54', '2021-12-08 03:46:54'),
('a9c62a519955132784a3f253bfaadd4fcb095b529e24f8badf0a8bdd9637369f299efcf169ff96dd', 341, 1, 'LaraPassport', '[]', 1, '2020-12-08 11:58:00', '2020-12-08 11:58:00', '2021-12-08 03:58:00'),
('1f38b220a549aea20170bb75256a990ca1b84a9c21c6692f1be656c8210eb4fb00159adb8dd5512e', 340, 1, 'LaraPassport', '[]', 1, '2020-12-08 13:20:37', '2020-12-08 13:20:37', '2021-12-08 05:20:37'),
('30756b124a113d13d7a99046580cad650c28bcbbd7f78be6324186a8c795d82b123c67535a1c157c', 341, 1, 'LaraPassport', '[]', 1, '2020-12-08 13:23:21', '2020-12-08 13:23:21', '2021-12-08 05:23:21'),
('1d563e404b09f4ff9a6d01dbfe4e70f1415eb0ff129cb2f478a651ffa151695c140635c3a5c6565f', 340, 1, 'LaraPassport', '[]', 1, '2020-12-08 13:28:50', '2020-12-08 13:28:50', '2021-12-08 05:28:50'),
('6b7d35a2e21ba48ceb500e9e7bef5910d6393964d1b36e534dfaca65443cc18f06dd8467fa73088f', 341, 1, 'LaraPassport', '[]', 1, '2020-12-08 13:30:54', '2020-12-08 13:30:54', '2021-12-08 05:30:54'),
('413da105db39b5e2d8898e21deda8abd44cc692ffa266e5ef5e65ad2979f66b4cb93dc35830e5053', 340, 1, 'LaraPassport', '[]', 1, '2020-12-08 13:47:33', '2020-12-08 13:47:33', '2021-12-08 05:47:33'),
('701e5db15e80b3f2a9deac30120c096ad09ea83b3582f8a5378368df9498c018edc049752d042b93', 340, 1, 'LaraPassport', '[]', 1, '2020-12-08 13:48:19', '2020-12-08 13:48:19', '2021-12-08 05:48:19'),
('2b9b03856cf4dba88eef52cec75e8323edb750835bf483883204cb03883475044a911ebdd2a6d54c', 341, 1, 'LaraPassport', '[]', 1, '2020-12-08 13:48:38', '2020-12-08 13:48:38', '2021-12-08 05:48:38'),
('6684df8eec9bdae13fe6fc559bdfbe3a666e87c6c7542b84cff5eec8b282bd4a496832ed6fb6fdca', 340, 1, 'LaraPassport', '[]', 1, '2020-12-08 14:33:00', '2020-12-08 14:33:00', '2021-12-08 06:33:00'),
('ce665de4411820987add8ab5bf387796965be9bd9003aec0e530c760e00e42af6bc16f3deecaf2e3', 322, 1, 'LaraPassport', '[]', 1, '2020-12-08 14:33:52', '2020-12-08 14:33:52', '2021-12-08 06:33:52'),
('b00ef5d52620622f5aecc122f40468b15287556bf114499757fa34ae8d7df0e61b56e7df43f286da', 342, 1, 'LaraPassport', '[]', 0, '2020-12-08 14:35:49', '2020-12-08 14:35:49', '2021-12-08 06:35:49'),
('3fec5a6a8431b377a1d314420f326eb63098cadac0ef0086c07cd594545268784391ecaec5a2892b', 339, 1, 'LaraPassport', '[]', 1, '2020-12-08 14:36:50', '2020-12-08 14:36:50', '2021-12-08 06:36:50'),
('25af15e117461f141e546179af2cf6baa2f62fe0c775794e12a31368f22e15cb7f3530c5de6dacc2', 343, 1, 'LaraPassport', '[]', 1, '2020-12-08 14:37:30', '2020-12-08 14:37:30', '2021-12-08 06:37:30'),
('b15e21226ce4088ca26bfcace7c27683f807baf0b7f5b460968319885e5af883946e109d37b6034f', 339, 1, 'LaraPassport', '[]', 0, '2020-12-08 19:43:16', '2020-12-08 19:43:16', '2021-12-08 11:43:16'),
('39bdb721f777ed87c5c4a73e3dca7b9a40ea700fd7a386a5e2c522f262ea9a9d9de8491f5987be73', 340, 1, 'LaraPassport', '[]', 1, '2020-12-08 20:03:35', '2020-12-08 20:03:35', '2021-12-08 12:03:35'),
('e79214241d3de3b31183761b136d6e9223003bf45c0233d66ea34f8b2974ffee1f92a1688e084848', 341, 1, 'LaraPassport', '[]', 1, '2020-12-08 20:18:14', '2020-12-08 20:18:14', '2021-12-08 12:18:14'),
('ce29de0b82eb8f36c08eab9233dca384feda0bdc78a85c18a7613cc78a5e03922c0b9488249a72b4', 340, 1, 'LaraPassport', '[]', 0, '2020-12-08 20:30:57', '2020-12-08 20:30:57', '2021-12-08 12:30:57'),
('beacc0b6d076c99584d07278e78b3096fa33f8a3194528806740a1829b4c86e34593439b18c81162', 339, 1, 'LaraPassport', '[]', 0, '2020-12-09 06:41:08', '2020-12-09 06:41:08', '2021-12-08 22:41:08'),
('f0a387bd28ea903049106d3465bbde7138ba00f16e46ef25070cf0a651f25b01a75a0cebfc9b2916', 340, 1, 'LaraPassport', '[]', 1, '2020-12-09 06:42:34', '2020-12-09 06:42:34', '2021-12-08 22:42:34'),
('ac809bdd217af09519d90b75a1c5f2062f775680eb07e41d871414a6be6cdce381682ab5df092606', 341, 1, 'LaraPassport', '[]', 0, '2020-12-09 06:52:19', '2020-12-09 06:52:19', '2021-12-08 22:52:19'),
('c1ed5db6b40642ed3557be550686d90cb7b3b3a72b322213aaacb3b34497bf893f766670aab5427a', 340, 1, 'LaraPassport', '[]', 0, '2020-12-09 06:56:43', '2020-12-09 06:56:43', '2021-12-08 22:56:43'),
('d25438235228f17ac4a3c4d87d0273b9f539e601ead0febc1d8ac4145fd94dd91e26df484356d69e', 339, 1, 'LaraPassport', '[]', 0, '2020-12-09 11:07:02', '2020-12-09 11:07:02', '2021-12-09 03:07:02'),
('51ad39810c1c4e4bf6eeac1c5f4512591cf0a5d40429d964b5b909aa445a0ee82748c3261fffc160', 340, 1, 'LaraPassport', '[]', 0, '2020-12-09 11:07:16', '2020-12-09 11:07:16', '2021-12-09 03:07:16'),
('91fbee950b6857ee21874f144afe35b98d198ff6d51b3bf7630daef620b834f7a5b827e9e228838c', 341, 1, 'LaraPassport', '[]', 0, '2020-12-09 11:07:28', '2020-12-09 11:07:28', '2021-12-09 03:07:28'),
('e7a4c4b54b10006ac146d5429a6668e3824731fe5f06ffc92918bdae1d3bd1657a3642fc188cd80b', 339, 1, 'LaraPassport', '[]', 0, '2020-12-09 13:43:09', '2020-12-09 13:43:09', '2021-12-09 05:43:09'),
('aa75d6e3c2b44dc394f449306db464e5badfd5c26634584150c5c2fa2cb7a8fe51f565286a9af223', 339, 1, 'LaraPassport', '[]', 1, '2020-12-09 20:06:53', '2020-12-09 20:06:53', '2021-12-09 12:06:53'),
('21707a46fbd25b4d3883500ad1048bf8bf2d540c9277c306df7f274a3ee1bcd7b3d428bd262932cc', 340, 1, 'LaraPassport', '[]', 1, '2020-12-09 20:09:17', '2020-12-09 20:09:17', '2021-12-09 12:09:17'),
('ceeffd32f1b50e8b13ca276c0ffe803ff03edba8ad1f11cbaf3d401b3121ff33532441e69cf2b6ec', 343, 1, 'LaraPassport', '[]', 1, '2020-12-09 20:22:05', '2020-12-09 20:22:05', '2021-12-09 12:22:05'),
('1ebc0916935318d69d2b1ebda95a5884b2560f883171002543323eb0f955fba4cfe8268db6a11a54', 339, 1, 'LaraPassport', '[]', 1, '2020-12-09 20:47:01', '2020-12-09 20:47:01', '2021-12-09 12:47:01'),
('57e677b9cdc23d2547649c51a82794f1de86e54dc04acee1fd5e5dc768f0a09d6d64dad68dc74860', 4, 1, 'LaraPassport', '[]', 0, '2020-12-09 21:05:20', '2020-12-09 21:05:20', '2021-12-09 13:05:20'),
('a73eb321a2b25d22a84bd16e9577b649b08e21808a2e6cb5dbe75a150fc4379e2d5f5177f84b27bb', 4, 1, 'LaraPassport', '[]', 0, '2020-12-09 21:15:01', '2020-12-09 21:15:01', '2021-12-09 13:15:01'),
('5a481c445fd0e5ab9dade07ba783ce1a64982843edbe32832b90540135a2c80190cc4a3da6eaced3', 12, 1, 'LaraPassport', '[]', 0, '2020-12-09 21:48:58', '2020-12-09 21:48:58', '2021-12-09 13:48:58'),
('46dd979fe8ad84b2b821561971f88a05ff45e496aed32d0f13a784f327efe9dcfc2910940382760a', 4, 1, 'LaraPassport', '[]', 1, '2020-12-10 06:21:58', '2020-12-10 06:21:58', '2021-12-09 22:21:58'),
('e5919f6c0120d8c7b6496f6718c216bc8363d050759701c07e6160e167eeeee077ff7a0679a81c20', 12, 1, 'LaraPassport', '[]', 1, '2020-12-10 06:22:36', '2020-12-10 06:22:36', '2021-12-09 22:22:36'),
('c6f7d7d4cd9fdd978367a97d157ce988e39c3e8683cf0bff1e544534e7843868fa0c837ef357960a', 344, 1, 'LaraPassport', '[]', 0, '2020-12-10 12:02:15', '2020-12-10 12:02:15', '2021-12-10 04:02:15'),
('8215740b0ea3c5f76e851be60fd7c3fd2eac72ad1a57d30a38d604b08ecee41a042b21c4d4449536', 12, 1, 'LaraPassport', '[]', 1, '2020-12-10 12:22:22', '2020-12-10 12:22:22', '2021-12-10 04:22:22'),
('bc5772d91d81d2e344ac132988bfc3d613c21b75d3bb3f7a4eae54110922b7f27d1400ce42c59290', 4, 1, 'LaraPassport', '[]', 1, '2020-12-10 12:25:29', '2020-12-10 12:25:29', '2021-12-10 04:25:29'),
('50e0314ec8e03e8c41158481eb18e678a90f7f83016695926dc886d6c62152fc552f7b26b8ecd452', 340, 1, 'LaraPassport', '[]', 1, '2020-12-10 12:32:54', '2020-12-10 12:32:54', '2021-12-10 04:32:54'),
('2566e2d9d356811f47ffd6cc813461fcb63f424f6359726aad0968feb9b298a16c278e84db51115a', 339, 1, 'LaraPassport', '[]', 1, '2020-12-10 12:36:43', '2020-12-10 12:36:43', '2021-12-10 04:36:43'),
('4d705a2c4458d0cd2b0c8f2a1d04b2945e1d304d6c3a1ebff093104f4ec499182f0167ecd65f873a', 340, 1, 'LaraPassport', '[]', 1, '2020-12-10 12:37:37', '2020-12-10 12:37:37', '2021-12-10 04:37:37'),
('512276f7434b02fc10f8410bd963728693600e0db44d2b96d3c2cc68b7c2c8a73c19d00143b4a833', 12, 1, 'LaraPassport', '[]', 0, '2020-12-10 12:45:47', '2020-12-10 12:45:47', '2021-12-10 04:45:47'),
('64709fcb4b160469bad6234abcfdd3410ce83e9c216bfb139875a0b0e34d2227a1ed72ba180b2ae7', 4, 1, 'LaraPassport', '[]', 1, '2020-12-10 12:48:15', '2020-12-10 12:48:15', '2021-12-10 04:48:15'),
('aba439fbbc36b19e7b5b0930404025db80cb9ff0c963657b83d8598d57fce6ca63b43bca66d7a27c', 12, 1, 'LaraPassport', '[]', 0, '2020-12-10 13:14:12', '2020-12-10 13:14:12', '2021-12-10 05:14:12'),
('f5efefbaf29cb9dd4cdd6753e0e40a942a96cb53a4880462fc2f14c91e421212d9f7ee6563aefd40', 12, 1, 'LaraPassport', '[]', 1, '2020-12-10 19:44:05', '2020-12-10 19:44:05', '2021-12-10 11:44:05'),
('06f895bb8fba54772471f0e225deec87cb48d0306904f52f7d4c06de8173878e22438aa14d55ec3a', 12, 1, 'LaraPassport', '[]', 1, '2020-12-10 21:27:09', '2020-12-10 21:27:09', '2021-12-10 13:27:09'),
('85286e6d50a491e976ea301aab5972c8fd1c301190c5fcf15da9dce026f32bb2de11854878783c2e', 339, 1, 'LaraPassport', '[]', 1, '2020-12-10 21:51:32', '2020-12-10 21:51:32', '2021-12-10 13:51:32'),
('e87d7b22d3a1dd26e1531393f9b30551f9aa8459bd9c8c7bc4f40684e4abd985def48c02f0d15ce2', 340, 1, 'LaraPassport', '[]', 1, '2020-12-10 21:52:06', '2020-12-10 21:52:06', '2021-12-10 13:52:06'),
('7cfb6fc2fa60059f15a03e7b753c188a0613eca5ec7050cb80688ede5545ff19a99b927f211dcd0e', 339, 1, 'LaraPassport', '[]', 1, '2020-12-10 21:59:12', '2020-12-10 21:59:12', '2021-12-10 13:59:12'),
('22afdb27ad218950c50a7a4a317720d3225e61aa1527b7a94efa6a399ab316feaf328f84db9a5e0b', 340, 1, 'LaraPassport', '[]', 1, '2020-12-10 22:13:06', '2020-12-10 22:13:06', '2021-12-10 14:13:06'),
('a064d49c3816466b2ea37fecc6807d3becae7ae8a2dd6473dbdea5b9287f4d0f2eac97117e5753a4', 4, 1, 'LaraPassport', '[]', 0, '2020-12-10 22:13:48', '2020-12-10 22:13:48', '2021-12-10 14:13:48'),
('3564a045015fc880b8f983e0e0816c52417ffdcae9f07a2c093fae5c16a96a178507e4753c170806', 339, 1, 'LaraPassport', '[]', 1, '2020-12-11 13:12:15', '2020-12-11 13:12:15', '2021-12-11 05:12:15'),
('4a16d45ad1016d00a6eccbeb6b01bfd07a07861e62372ca7d944e7509c12aae85680b58c034f5d01', 12, 1, 'LaraPassport', '[]', 1, '2020-12-11 13:19:09', '2020-12-11 13:19:09', '2021-12-11 05:19:09'),
('daa3c64f43934babb9b91444a6f860ad398f26bef2e472dd422d1da0cbf3f1dae0db29c71fc700b0', 4, 1, 'LaraPassport', '[]', 1, '2020-12-11 13:21:35', '2020-12-11 13:21:35', '2021-12-11 05:21:35'),
('e535004ed65cc34791f6aec0870c8b660dab9995e9efb2959b5edd46958baeb2063e73ec295bca9a', 5, 1, 'LaraPassport', '[]', 1, '2020-12-11 13:52:33', '2020-12-11 13:52:33', '2021-12-11 05:52:33'),
('34a82e95832d1ceadbdc8553451d40765bdf0bde562b76993a06430734231574dd24b96a3a5b3dfe', 6, 1, 'LaraPassport', '[]', 1, '2020-12-11 13:55:41', '2020-12-11 13:55:41', '2021-12-11 05:55:41'),
('c42cb3514676a9deeda636215cadcf965f0814372a6623be1fe4785db2306ba0d014b13ec6dcfee9', 4, 1, 'LaraPassport', '[]', 1, '2020-12-11 15:08:11', '2020-12-11 15:08:11', '2021-12-11 07:08:11'),
('0b0ebfb87f59debff7bafaaa5c59ac94f3afcf3f531489c541d9bde87b9a35a437a1b77417a0b4d1', 5, 1, 'LaraPassport', '[]', 1, '2020-12-11 15:09:42', '2020-12-11 15:09:42', '2021-12-11 07:09:42'),
('e2ee37f7c4211955a3077d2cb12fd2def524d447916e27551d6e1712a7734f7610129fe716382d2b', 6, 1, 'LaraPassport', '[]', 0, '2020-12-11 15:10:23', '2020-12-11 15:10:23', '2021-12-11 07:10:23'),
('3767740a206408408ebbf1a2117f27a825514684319dfc4847681944dac32d283a5d74a1f8e72d24', 340, 1, 'LaraPassport', '[]', 0, '2020-12-11 15:12:57', '2020-12-11 15:12:57', '2021-12-11 07:12:57'),
('d699b16c9d1c8cf48e2c76f2d5318dc10d1e6eeae230097a6475d5d3b1413c92b595c2edb85739d8', 4, 1, 'LaraPassport', '[]', 1, '2020-12-12 10:26:48', '2020-12-12 10:26:48', '2021-12-12 02:26:48'),
('2b94473c9f63f95728994d68c51d3bcee3aae7f4ba1e579a628957d382cc79e03d1eafed3d037477', 12, 1, 'LaraPassport', '[]', 0, '2020-12-12 10:27:44', '2020-12-12 10:27:44', '2021-12-12 02:27:44'),
('e81061cbdf4a139f3d2d74750e6a647ce4cf58421522ceabc49ad6541f6ba41407b331f3454dcd3b', 339, 1, 'LaraPassport', '[]', 0, '2020-12-12 10:55:55', '2020-12-12 10:55:55', '2021-12-12 02:55:55'),
('f7e33e6903d27b7c244dc6f7df70c1633f903721c29d977ac839af8e3d9a1cb79531008f2d6022bb', 339, 1, 'LaraPassport', '[]', 0, '2020-12-12 10:55:56', '2020-12-12 10:55:56', '2021-12-12 02:55:56'),
('4dc359ac430cfae87a6766816ddcfb34bf2600726a9758f036a94311364718e7210e223a66fbf0b9', 343, 1, 'LaraPassport', '[]', 1, '2020-12-12 20:07:16', '2020-12-12 20:07:16', '2021-12-12 12:07:16'),
('fcc9ed39bc14ac4ad8272a512e8f02075ec9ff9ee30a2e82fb2a5427cb3961145ed8820afa844648', 343, 1, 'LaraPassport', '[]', 1, '2020-12-12 21:14:47', '2020-12-12 21:14:47', '2021-12-12 13:14:47'),
('4026c9e666f503655422aa80a31437a07964a2cfada2678f830b1a531f7505b9b21f46d2c51ba0e4', 12, 1, 'LaraPassport', '[]', 0, '2020-12-12 22:33:34', '2020-12-12 22:33:34', '2021-12-12 14:33:34'),
('de6851d009732035ccb9e1bb4d1e3ad64fb764ed671685e0d80e3446d3de65ce5d0a66f50b46bba8', 12, 1, 'LaraPassport', '[]', 1, '2020-12-14 12:36:23', '2020-12-14 12:36:23', '2021-12-14 04:36:23'),
('95104821e2246a90e96b40cbef102586cc00228f4dc7b1d0bfde2ca4eafadfe5190896e3b133b30e', 1, 1, 'LaraPassport', '[]', 0, '2020-12-14 12:40:31', '2020-12-14 12:40:31', '2021-12-14 04:40:31'),
('37aa6df9a5f733bc51a5149e68d4efbb1d7084644d1271884198cc9b56830bb27e2fb6f2a508f4f2', 339, 1, 'LaraPassport', '[]', 1, '2021-01-14 09:27:04', '2021-01-14 09:27:04', '2022-01-14 14:27:04'),
('ffd596f624417c12953090c58520c3c0321b4d9bb03971aca09d12e384b09ed8029d7e1cfc783251', 344, 1, 'LaraPassport', '[]', 0, '2021-01-14 09:28:55', '2021-01-14 09:28:55', '2022-01-14 14:28:55'),
('7c96ad13b0670631b958e6dbe84c2fbe979dc64886769e895e241c533799fa21b37b296c9aecd492', 344, 1, 'LaraPassport', '[]', 1, '2021-01-15 08:49:45', '2021-01-15 08:49:45', '2022-01-15 13:49:45'),
('1196dd9fab800b4650afe354c817da2b1bb2aca5823de9bf6831708cab5064047fc4c2d095fea4ae', 2, 1, 'LaraPassport', '[]', 1, '2021-01-15 09:58:23', '2021-01-15 09:58:23', '2022-01-15 14:58:23'),
('596110e6b5d4771ad6cbcc863553e5b65e1c62a29738d4bfa9405ed603b34b9243781618dbebab08', 339, 1, 'LaraPassport', '[]', 1, '2021-01-15 10:51:19', '2021-01-15 10:51:19', '2022-01-15 15:51:19'),
('a9856b8d417fc74d18e3d4de19f9ed6c40afba87f379caab649d99e1f3fd6fbd199b766a39dfc5dc', 344, 1, 'LaraPassport', '[]', 1, '2021-01-16 05:04:43', '2021-01-16 05:04:43', '2022-01-16 10:04:43'),
('ea6886630c009de93c381bdf9a104f66923b826ef317a918c244d28c365686ee1e8b2f58d823bbd2', 344, 1, 'LaraPassport', '[]', 1, '2021-01-16 06:51:20', '2021-01-16 06:51:20', '2022-01-16 11:51:20'),
('3bc75c3752a0109b8fa678587185a2ba8e5d96ec48dd2ab3f93eb56f5951d6deb90700f0a56b97b5', 339, 1, 'LaraPassport', '[]', 1, '2021-01-16 06:53:14', '2021-01-16 06:53:14', '2022-01-16 11:53:14'),
('d7994dc6f7d7bb43bfd0c2b81324a14f0aedec257c8f4bed26e5c03f474cc5a2a60571cef811e9d5', 344, 1, 'LaraPassport', '[]', 1, '2021-01-16 06:57:33', '2021-01-16 06:57:33', '2022-01-16 11:57:33'),
('a30dcd9a7ecf69d7b20829c0729d3204c1ddf4e6f9e547596a64fa5ec07b1b2642aada3f499c69e8', 344, 1, 'LaraPassport', '[]', 1, '2021-01-16 08:02:40', '2021-01-16 08:02:40', '2022-01-16 13:02:40'),
('3d96557467c4d334eab8333b989dee5f5eb355a1baf6267430e6667fb6f042ec2ac2a54fbeff0427', 344, 1, 'LaraPassport', '[]', 1, '2021-01-16 08:03:04', '2021-01-16 08:03:04', '2022-01-16 13:03:04'),
('40de4dd89e0773ed78134199e35933718ae98c3f95b455bf6c2b388a0da440904b4489f9e4cac768', 339, 1, 'LaraPassport', '[]', 0, '2021-01-16 09:13:13', '2021-01-16 09:13:13', '2022-01-16 14:13:13'),
('5ad96c3aeee0393f5cee74e3125c0a4b70aa7548babda95a59d88c463e37add0279f224b923fc02f', 4, 1, 'LaraPassport', '[]', 1, '2021-01-17 08:57:34', '2021-01-17 08:57:34', '2022-01-17 13:57:34'),
('ce598d092f5dafabfe9d317f8d43f8602a8a761206da73c19063b91fa861edaf26d4467a1f4bb3c4', 8, 1, 'LaraPassport', '[]', 1, '2021-01-17 08:58:04', '2021-01-17 08:58:04', '2022-01-17 13:58:04'),
('362253b07e4b833e85555730e3ee6f794444c410e94d1e9c0730fa30427a4c0eb7206a54c87a403c', 340, 1, 'LaraPassport', '[]', 1, '2021-01-17 09:23:36', '2021-01-17 09:23:36', '2022-01-17 14:23:36'),
('a875f7aee583a160fb01390764d4b30dc83395f016543092a8cb94a1a095ddcad3b8a2dc84d2630d', 9, 1, 'LaraPassport', '[]', 0, '2021-01-17 11:04:02', '2021-01-17 11:04:02', '2022-01-17 16:04:02'),
('8ace4b48fab4603d5b20eb3c43db6d5e6c623e109cc95dd03d0fa43b7f0c6a4d1131498d91dda104', 4, 1, 'LaraPassport', '[]', 1, '2021-01-18 09:35:05', '2021-01-18 09:35:05', '2022-01-18 14:35:05'),
('8a7389253e909daae4382291d8e85c9d4c456e452f9011a894f5b3691dd04ea7abebe2ac61a7b646', 344, 1, 'LaraPassport', '[]', 1, '2021-01-18 10:11:18', '2021-01-18 10:11:18', '2022-01-18 15:11:18'),
('4e62c16cd57f9e7e258a95ca3271ff9d4d6eca9407070717c2d4c70c6ce3c97d17efcf2b1b57d34f', 339, 1, 'LaraPassport', '[]', 0, '2021-01-18 10:42:28', '2021-01-18 10:42:28', '2022-01-18 15:42:28'),
('af693e9096bbc1d2745b5d4f5fbacc75ebfcecb0933f7b4909393f40a55dcc1d280beba0b4f8afee', 340, 1, 'LaraPassport', '[]', 0, '2021-01-18 11:31:40', '2021-01-18 11:31:40', '2022-01-18 16:31:40'),
('dfba535c070f352c88161b6673fae16626b6dbc5b32d4d690b6ca82f82b238b1ff82bf6fea646d1d', 339, 1, 'LaraPassport', '[]', 0, '2021-01-19 09:13:01', '2021-01-19 09:13:01', '2022-01-19 14:13:01'),
('9408a567e1c2672745c35c5ab60932b0b40ef596bcbe77b387b9bbcc6d3c04eb573eb1d9a5a4a4db', 339, 1, 'LaraPassport', '[]', 1, '2021-01-20 08:06:52', '2021-01-20 08:06:52', '2022-01-20 13:06:52'),
('8e156252700ea3f89252e02eeb2cc4b079d6045aaf4d73d1fa2fb6dcb467b3f9140fa308e32f408a', 340, 1, 'LaraPassport', '[]', 1, '2021-01-20 08:29:03', '2021-01-20 08:29:03', '2022-01-20 13:29:03'),
('c1337004bd66bad691bf7bab0971d34668a3ec1c15864aef36b95bbbf3c10aefc2e683c67a577049', 341, 1, 'LaraPassport', '[]', 1, '2021-01-20 08:39:56', '2021-01-20 08:39:56', '2022-01-20 13:39:56'),
('312a2f0c5cdc3c3adc2e487b7adb2939912838a4ce045a307c48f47b24452b08ac90dbc3fd577bad', 340, 1, 'LaraPassport', '[]', 1, '2021-01-20 08:40:33', '2021-01-20 08:40:33', '2022-01-20 13:40:33'),
('ba7691213e783f709defd7fe2bd6f9145bffb25f7cb0024c0208778ebed8c311333bf5ff7a85e909', 339, 1, 'LaraPassport', '[]', 1, '2021-01-20 08:45:49', '2021-01-20 08:45:49', '2022-01-20 13:45:49'),
('78b9533e84acda49626fe11e016ea5ce2c2230c32caf5e5d5948b3a6afca9f2573c9aefab1ae73e7', 340, 1, 'LaraPassport', '[]', 1, '2021-01-20 08:47:50', '2021-01-20 08:47:50', '2022-01-20 13:47:50'),
('c6cf0460052090d7ce3ab4e1c854bd05c03cfd473c468ef2649ac089d754314796db792f780a3b5d', 341, 1, 'LaraPassport', '[]', 1, '2021-01-20 08:57:03', '2021-01-20 08:57:03', '2022-01-20 13:57:03'),
('617794c3be1da2101d99d8d2b5160a45281bc7647e3ed2d25e9bdb6b30eb2655e4c076953a897063', 339, 1, 'LaraPassport', '[]', 1, '2021-01-20 09:00:21', '2021-01-20 09:00:21', '2022-01-20 14:00:21'),
('c272a893f306852151895af7579521d3a8ab0d5a04d0b48edc318ee53d671cac5ed0513c34f4ea13', 340, 1, 'LaraPassport', '[]', 1, '2021-01-20 09:04:05', '2021-01-20 09:04:05', '2022-01-20 14:04:05'),
('d55145cd9e76a8f697e43dd3b2f0549495925f9ad5b8c8058ed3b7fc77f23c4dfbac04ba7a5ffa69', 340, 1, 'LaraPassport', '[]', 1, '2021-01-20 09:07:14', '2021-01-20 09:07:14', '2022-01-20 14:07:14'),
('be326908b30a72222969a51b50012195265f982f41687374d7ff1f27e16fba1cbc7fccfe729f1f60', 339, 1, 'LaraPassport', '[]', 0, '2021-01-20 09:51:54', '2021-01-20 09:51:54', '2022-01-20 14:51:54'),
('d325633ce14ca098e50f677556a91e287cf5b22c7cd5296f9d8e46f0216fb90fbd476c66b23cc0c8', 339, 1, 'LaraPassport', '[]', 0, '2021-01-20 09:51:54', '2021-01-20 09:51:54', '2022-01-20 14:51:54'),
('1aafa41454cb93850a063ccdb60bf3650536965848561da75362cb7b48421f97901140c2937a076c', 339, 1, 'LaraPassport', '[]', 0, '2021-01-21 05:16:29', '2021-01-21 05:16:29', '2022-01-21 10:16:29'),
('227a26ad5c8ef62239bb9afd538bbac9cc4e2b4ded7437a8d2315f63dde881460174411318eba5ae', 339, 1, 'LaraPassport', '[]', 1, '2021-01-21 08:14:42', '2021-01-21 08:14:42', '2022-01-21 13:14:42'),
('37ec47de8973a9666b702e896bb82e35fcfdf818ef83ee7b3730a482681f4655603db48dd03047df', 340, 1, 'LaraPassport', '[]', 1, '2021-01-21 08:34:18', '2021-01-21 08:34:18', '2022-01-21 13:34:18'),
('fc90564f6c462b7c473861a4c8c05489651a2dc70b75627aff4964eb7c111a90c69783cb50af033b', 341, 1, 'LaraPassport', '[]', 1, '2021-01-21 08:46:38', '2021-01-21 08:46:38', '2022-01-21 13:46:38'),
('994575d8e5a8b5ca745ce556edb61ee6e36d720940a105f4d42da1228711cf5f6ac04eb29d50161b', 341, 1, 'LaraPassport', '[]', 1, '2021-01-21 08:49:06', '2021-01-21 08:49:06', '2022-01-21 13:49:06'),
('25a0421203a104a7a2010b3699187db36a0c3a2737c16fa1c50d6d40d0d5fb90857b91ce480b5bc1', 339, 1, 'LaraPassport', '[]', 1, '2021-01-21 08:54:22', '2021-01-21 08:54:22', '2022-01-21 13:54:22'),
('8cda3f0c8b16931371a9622e9aa379b826c2e24b2e8e55098f87ccdbc24b3f46a2d1ee7107d1f6d4', 339, 1, 'LaraPassport', '[]', 1, '2021-01-21 08:55:45', '2021-01-21 08:55:45', '2022-01-21 13:55:45'),
('0ec61c24f2cffaf20e27b8c49b2719bfddba3cb9147d3a4440d0491e1e18ba8a683ed563b85bf564', 340, 1, 'LaraPassport', '[]', 1, '2021-01-21 08:56:39', '2021-01-21 08:56:39', '2022-01-21 13:56:39'),
('9115d6d881fbf8652b9973fab81fb9f1597da6c0c125c7c16e69daaf81409db2886d6efbd3982238', 339, 1, 'LaraPassport', '[]', 1, '2021-01-21 09:25:00', '2021-01-21 09:25:00', '2022-01-21 14:25:00'),
('2cc215e8ad4ec57dc727b5a3106ce05b4e8eeb79d164a0535eaa97acd98252054413e966d538e789', 340, 1, 'LaraPassport', '[]', 1, '2021-01-21 09:26:45', '2021-01-21 09:26:45', '2022-01-21 14:26:45'),
('910dff58ee1a10ca6f4cda306e5c81a163d3953b9a263a13a4e515b0ff59455f4c6d31d78104261a', 339, 1, 'LaraPassport', '[]', 1, '2021-01-21 10:56:56', '2021-01-21 10:56:56', '2022-01-21 15:56:56'),
('44830b016daf7527077493d286c24baa6d60eb8e68f3605aa415bfd5713eed4a70c83bc59781a9c8', 340, 1, 'LaraPassport', '[]', 1, '2021-01-21 11:12:47', '2021-01-21 11:12:47', '2022-01-21 16:12:47'),
('17e62caf27f95f74d157f6d6707528406a38060e07b731b2b32845be3c92335b93f8684b8a003a16', 341, 1, 'LaraPassport', '[]', 1, '2021-01-21 11:26:58', '2021-01-21 11:26:58', '2022-01-21 16:26:58'),
('e4d2e4084d41bf55ae34e2e56fbe8a2025783c199f654b1776d9e880baa23aa091432688c8504b50', 339, 1, 'LaraPassport', '[]', 1, '2021-01-21 11:39:03', '2021-01-21 11:39:03', '2022-01-21 16:39:03'),
('587e5ecbb2c609efbcf629337466fc24f154b43396d899a33edc7e27fa36aaceeb27b8be22b93f18', 340, 1, 'LaraPassport', '[]', 1, '2021-01-21 12:52:47', '2021-01-21 12:52:47', '2022-01-21 17:52:47'),
('a32df926a7063b250e6adf050b7397b23ea51bc7e818fd20ec90de341df925b9091110acf9cc3b36', 341, 1, 'LaraPassport', '[]', 1, '2021-01-21 12:57:18', '2021-01-21 12:57:18', '2022-01-21 17:57:18'),
('0150c379ffb58726cba9cf859deb73e43b2623a6c443a77b21eae1fd68787305bac40fa879651f00', 341, 1, 'LaraPassport', '[]', 1, '2021-01-21 13:01:56', '2021-01-21 13:01:56', '2022-01-21 18:01:56'),
('24372223c453018e6faa86c1988eae09b8569e565f88036ac4bf729481813222464eb629bd485f86', 339, 1, 'LaraPassport', '[]', 1, '2021-01-21 13:02:13', '2021-01-21 13:02:13', '2022-01-21 18:02:13'),
('4e016c0d71bab9ede9bf667aa52ffe6b3be97415286c1628f5f7b77fa7fdb7b111d6ca813e21ab5c', 340, 1, 'LaraPassport', '[]', 1, '2021-01-21 13:04:20', '2021-01-21 13:04:20', '2022-01-21 18:04:20'),
('316331a5d28f92bedafc77ad5f73dd70783eefbdfdcc2867758f8efb82b71b6b1db9f9c58726023a', 341, 1, 'LaraPassport', '[]', 1, '2021-01-21 13:05:10', '2021-01-21 13:05:10', '2022-01-21 18:05:10'),
('d300197e7b6942742fec28a6ac6845eb26e71d10695fa291ef3c3af351796e061d4889e31fa439e9', 339, 1, 'LaraPassport', '[]', 0, '2021-01-21 13:05:47', '2021-01-21 13:05:47', '2022-01-21 18:05:47'),
('4d66b71170bfea1a867a8ee7ba4bc449adeeff566ef5c91cf0394dd65b23e5e0bae7218aac78344d', 339, 1, 'LaraPassport', '[]', 1, '2021-01-22 10:36:02', '2021-01-22 10:36:02', '2022-01-22 15:36:02'),
('409fa151f12644d5bacbfb88acceae2f7e816237a82b831de1793d0b2edbd15ddab5c7a55bdc462c', 339, 1, 'LaraPassport', '[]', 1, '2021-01-22 10:43:36', '2021-01-22 10:43:36', '2022-01-22 15:43:36'),
('c9c26dfb257aa0e502af1df9f30dd5b1699157c5f6d6ff92b13d9789320a46c529e73d121eb65217', 359, 1, 'LaraPassport', '[]', 1, '2021-01-22 11:03:16', '2021-01-22 11:03:16', '2022-01-22 16:03:16'),
('ea7385f8f567bd12e10521be1e14fd93dd9ea6e56de4299e72a226aef40005dfa6b7e808d53c4d2d', 339, 1, 'LaraPassport', '[]', 1, '2021-01-22 12:02:43', '2021-01-22 12:02:43', '2022-01-22 17:02:43'),
('fea07e8ef1e6fee7ac8c62f6cd8a0178e027cbf88668fa4058556ea962fc324d979ae7ac24253eb1', 359, 1, 'LaraPassport', '[]', 1, '2021-01-22 16:36:12', '2021-01-22 16:36:12', '2022-01-22 21:36:12'),
('ffd4e6b6b3c60266922c76342582041bf97ab6be046abd9b5956f53bd3c44ef54bc912e4457a68d5', 339, 1, 'LaraPassport', '[]', 0, '2021-01-22 16:59:38', '2021-01-22 16:59:38', '2022-01-22 21:59:38'),
('396b6bf2e59213a9af5a2ebdd47da8907f1284ec3ec77a88c9d34a11f506f2edb11f3c04ff7d11dc', 4, 1, 'LaraPassport', '[]', 1, '2021-01-22 20:04:11', '2021-01-22 20:04:11', '2022-01-23 01:04:11'),
('13bcdb79f4b3217bb4c5e72a93e4822668e5d68aa4dbec0506162efc42df7dde2ead3a5196cc2360', 4, 1, 'LaraPassport', '[]', 1, '2021-01-22 20:15:30', '2021-01-22 20:15:30', '2022-01-23 01:15:30'),
('16689b14c659aa05be4153b6d560d5b928e8d61bb872af3fbfc9f6366f023b76270f8af0a53108ce', 339, 1, 'LaraPassport', '[]', 1, '2021-01-22 21:18:15', '2021-01-22 21:18:15', '2022-01-23 02:18:15'),
('de28169b0330c79a4e898e2df4aa49f4ce697f7c65ce443e9736a0c3fb35f7e3413b1814186f818c', 339, 1, 'LaraPassport', '[]', 1, '2021-01-22 21:24:23', '2021-01-22 21:24:23', '2022-01-23 02:24:23'),
('5e57b333762e1bfb82e6aa01654aa7594d2718c012fc7a21a7d69eb535fff5a8a2c41cfd391117b2', 4, 1, 'LaraPassport', '[]', 1, '2021-01-23 16:35:56', '2021-01-23 16:35:56', '2022-01-23 21:35:56'),
('f9e1c0c3d101896d8987385af08da603367f582ca12f769145b2254f0666717ecad0ee98f0e9d1e5', 339, 1, 'LaraPassport', '[]', 1, '2021-01-23 16:56:23', '2021-01-23 16:56:23', '2022-01-23 21:56:23'),
('cba307b995ba12d6eda6fe2c72718ca39354964ee49e8c7824385c9e5d4a986291956f9bcb52d2fa', 4, 1, 'LaraPassport', '[]', 1, '2021-01-23 17:00:39', '2021-01-23 17:00:39', '2022-01-23 22:00:39'),
('445e645a33ad2701f30ac3a95fe2712a1f330a5bdb9c02cf6d5661b32593ef62853c010b6d0288b3', 339, 1, 'LaraPassport', '[]', 1, '2021-01-23 17:01:25', '2021-01-23 17:01:25', '2022-01-23 22:01:25'),
('c7c1bf4b64dabc955ba563c564a21270a8a3ddbc3eb77aa98d1d2b8856ab3620c3e6dcc0905db8e2', 344, 1, 'LaraPassport', '[]', 0, '2021-01-23 17:11:18', '2021-01-23 17:11:18', '2022-01-23 22:11:18'),
('dcf101914aeb6401d9b6916febdcd0bab5977bb56a5690b16b7b4721188da76e962010039691d015', 344, 1, 'LaraPassport', '[]', 0, '2021-01-25 09:11:54', '2021-01-25 09:11:54', '2022-01-25 14:11:54'),
('c33478a4084129cca51f4580f4ef0eeac6d4da46abec26b51e837a484c4128b7d0cb367f390b5b98', 344, 1, 'LaraPassport', '[]', 0, '2021-01-25 09:26:59', '2021-01-25 09:26:59', '2022-01-25 14:26:59'),
('5b916978a82ec66fad0818213f4ce94e40654650f38d5f1427ac3b8ee14b23aee35bb43c55dbd888', 344, 1, 'LaraPassport', '[]', 0, '2021-01-25 09:30:00', '2021-01-25 09:30:00', '2022-01-25 14:30:00'),
('37c03bd82babccc9ece01498a47143441242f5dbf80e84cb5f85dd48f33c5bab5fce4803f447ad9a', 344, 1, 'LaraPassport', '[]', 0, '2021-01-25 09:32:29', '2021-01-25 09:32:29', '2022-01-25 14:32:29'),
('3fe336e4b0d1011930558d48cd137abc5629cbf73e1c927306538812dfebf66d2afb9616201bf83e', 344, 1, 'LaraPassport', '[]', 0, '2021-01-25 09:42:15', '2021-01-25 09:42:15', '2022-01-25 14:42:15'),
('152638001e7f3ffd94045c811f6aee541e736d6458931d05bfa2d740d328cc813910b7150bd9d4a2', 344, 1, 'LaraPassport', '[]', 0, '2021-01-25 14:27:23', '2021-01-25 14:27:23', '2022-01-25 19:27:23'),
('897d2699fad6bd045714c0d0acdc2701424c284cd8c3bd0a7b220ba94114c9bcfd8ee085bad14588', 344, 1, 'LaraPassport', '[]', 1, '2021-01-25 16:56:11', '2021-01-25 16:56:11', '2022-01-25 21:56:11'),
('3f0c6a29d44da2a181595952577c9a732437974ad70ecae2b114449436be040bdbd915fef51b5f6d', 339, 1, 'LaraPassport', '[]', 1, '2021-01-25 17:36:09', '2021-01-25 17:36:09', '2022-01-25 22:36:09'),
('993ce8125d109fc24ad90a63cc184bc527c21aebbf9bfd650133ea344038f2ff7e49c79c450b3897', 4, 1, 'LaraPassport', '[]', 0, '2021-01-25 17:41:52', '2021-01-25 17:41:52', '2022-01-25 22:41:52'),
('09283e54c358a01b2a375757ee86f8cb5f9b30dd834a4b661d0271806d706248bcc5dd3e2bc04dc3', 4, 1, 'LaraPassport', '[]', 1, '2021-01-29 15:31:58', '2021-01-29 15:31:58', '2022-01-29 15:31:58'),
('e7600fc0b8aa2ee739c4fc9d66efec59c79f2c0e1377f37295a0d421aee03c91e04cdec283e47c28', 4, 1, 'LaraPassport', '[]', 1, '2021-01-29 15:33:15', '2021-01-29 15:33:15', '2022-01-29 15:33:15'),
('637a1800df1e40d811416909c0a4d5e1902e699ee93a543d53bb0c078c66aa1150df94c8514850fb', 339, 1, 'LaraPassport', '[]', 0, '2021-01-29 15:35:03', '2021-01-29 15:35:03', '2022-01-29 15:35:03'),
('0b9b7829a2c32e0eb90c7baf195ca30641783bf08f7fc4398feee628cf60aa12df7c98e406a403eb', 339, 1, 'LaraPassport', '[]', 0, '2021-01-29 17:58:24', '2021-01-29 17:58:24', '2022-01-29 17:58:24'),
('7fb27b608aabbe8ec9902764211a2f868e12450b79fe66ccc5b14015689ea2cd3da526a9347e7b88', 339, 1, 'LaraPassport', '[]', 1, '2021-01-29 18:08:27', '2021-01-29 18:08:27', '2022-01-29 18:08:27'),
('a57afef0f40b0a2120dab447626ae012f769e7a3ea1fc5ce580f017eb12e30053abba09f5d8be71a', 4, 1, 'LaraPassport', '[]', 0, '2021-01-29 18:08:57', '2021-01-29 18:08:57', '2022-01-29 18:08:57'),
('73f169cb3c1837f7c87c581b296b00dff492735be796e00acbe477ebf8ff11609ae35e323c01905b', 4, 1, 'LaraPassport', '[]', 1, '2021-01-29 18:43:24', '2021-01-29 18:43:24', '2022-01-29 18:43:24'),
('7016f4cfa6efd21f6661e28f0611531a07683f29115487aaf7b4fe5d7299960df6fd80cb73619d49', 339, 1, 'LaraPassport', '[]', 0, '2021-01-29 18:44:00', '2021-01-29 18:44:00', '2022-01-29 18:44:00'),
('790be47bca003e49943011df921ae046360b89df661cad096d7b33b072912ffe4db2bbcab29ea75d', 4, 1, 'LaraPassport', '[]', 1, '2021-01-30 11:16:15', '2021-01-30 11:16:15', '2022-01-30 11:16:15'),
('01a3268391914968de5facfbc124c31b0f64961b28ff53653d5583e4665fe2dda9f2049af00d80af', 360, 1, 'LaraPassport', '[]', 1, '2021-01-30 11:24:24', '2021-01-30 11:24:24', '2022-01-30 11:24:24'),
('79610a4c1240646b61770b9f9c9db64067244f0024a9ad8714c60b95ba685bb514f3a7912a285bef', 4, 1, 'LaraPassport', '[]', 1, '2021-01-30 16:03:29', '2021-01-30 16:03:29', '2022-01-30 16:03:29'),
('858f8278eee675bc6ee1558c56849a5f78ad2d7f82934194682de39dfd2a221d39ea74c96efb2f55', 5, 1, 'LaraPassport', '[]', 1, '2021-01-30 16:06:10', '2021-01-30 16:06:10', '2022-01-30 16:06:10'),
('6c2f4f695cba285fb99456fe9a4378ad3289d6078ad6ec39164c751f98507850152083c919a41fca', 360, 1, 'LaraPassport', '[]', 1, '2021-01-30 16:09:00', '2021-01-30 16:09:00', '2022-01-30 16:09:00'),
('aa886dce5716e276a535685182d0266d9d1dd0214b8c08267b6f26179b60f3ceccca5dcc7a362153', 339, 1, 'LaraPassport', '[]', 1, '2021-01-30 16:59:06', '2021-01-30 16:59:06', '2022-01-30 16:59:06'),
('c9dc299fd73d7c017fa01d038a4940aa1f94a71ad337f718ebd25fb294d8fb941fccfb8acff9a97d', 339, 1, 'LaraPassport', '[]', 1, '2021-01-30 17:00:18', '2021-01-30 17:00:18', '2022-01-30 17:00:18'),
('b9e3d2836f0589745d4fff5e7b40d1c6a7a8cd64f5a0f9e87ffd3ceddbe0f670f0ddffb5ea21ba02', 339, 1, 'LaraPassport', '[]', 1, '2021-01-30 17:01:20', '2021-01-30 17:01:20', '2022-01-30 17:01:20'),
('3b20324607d9759b76d38b775b8e20a8aef5c3a3c5c4dc7a006e2b16f8167b79408b9b057c0c7c7b', 339, 1, 'LaraPassport', '[]', 1, '2021-01-30 17:02:16', '2021-01-30 17:02:16', '2022-01-30 17:02:16'),
('4f6935df94386b48ff3b8fdb1784b89f1e55fa701007ef5a80be20bdfc86be40ecca75570c77b6af', 339, 1, 'LaraPassport', '[]', 1, '2021-01-30 18:28:33', '2021-01-30 18:28:33', '2022-01-30 18:28:33'),
('51cea11b56534c5118feeb7be4454869203eb5f34a075cf6553aa09c7183ef674d9c4c58c59396c9', 344, 1, 'LaraPassport', '[]', 1, '2021-01-30 18:32:46', '2021-01-30 18:32:46', '2022-01-30 18:32:46'),
('31b152d916d86c63fae5a43698263075c41e24207a57999a2b32b3022a49afa743ab65cf5a4b5357', 340, 1, 'LaraPassport', '[]', 1, '2021-01-30 21:09:30', '2021-01-30 21:09:30', '2022-01-30 21:09:30'),
('9a79e8db6ecbeeec171f23f6161500d28a78e972669aefe606082fd3dcd24a3dbe93dd01901dc643', 339, 1, 'LaraPassport', '[]', 1, '2021-01-30 21:20:09', '2021-01-30 21:20:09', '2022-01-30 21:20:09'),
('689a85ef7d86e73627438831d8e91e8c3ec2baf71764e22b3921c501e8ccc0ea80e13919ca301145', 339, 1, 'LaraPassport', '[]', 1, '2021-02-02 18:23:28', '2021-02-02 18:23:28', '2022-02-02 18:23:28'),
('683c4f977146d35d52a0d795a24aacbcf55b6d80c0e0140c158916992aa5ea365b021e50f6935719', 340, 1, 'LaraPassport', '[]', 1, '2021-02-02 18:42:47', '2021-02-02 18:42:47', '2022-02-02 18:42:47'),
('ae0469746b0ad322c34615534a6c35ebeb6f64d95f5410f7e269569fc72f5930adb85d50bc0703c2', 344, 1, 'LaraPassport', '[]', 1, '2021-02-02 18:45:15', '2021-02-02 18:45:15', '2022-02-02 18:45:15'),
('ed889b267dee2fcdc105fa4455ecd07be074d9817915034f180961252a70441062470836526c1a1d', 4, 1, 'LaraPassport', '[]', 1, '2021-02-02 19:00:54', '2021-02-02 19:00:54', '2022-02-02 19:00:54'),
('2aa933e4a0c35a853d64ea45062ebf7fb659dd13c6d2e2fb8e8ba94a0e02c6274e02a72e07137006', 339, 1, 'LaraPassport', '[]', 1, '2021-02-03 13:52:06', '2021-02-03 13:52:06', '2022-02-03 13:52:06'),
('dad1f4d60d387261c6334ab27a4a3a91d0aaed2a7448beca07921db56cfc5f016a57d27743b087e5', 340, 1, 'LaraPassport', '[]', 1, '2021-02-03 13:54:08', '2021-02-03 13:54:08', '2022-02-03 13:54:08'),
('2ba8381bdeafe9f49df1deb7be4d41026ae4d1eb32d574e0b2e6eacaabd8cc7069c71d75b93a0557', 344, 1, 'LaraPassport', '[]', 1, '2021-02-03 13:58:08', '2021-02-03 13:58:08', '2022-02-03 13:58:08'),
('3f9849da114af664e6de248189dc665955027f6b3a9fdcf046b61914971af0010b26d24837e9de28', 339, 1, 'LaraPassport', '[]', 1, '2021-02-03 14:21:47', '2021-02-03 14:21:47', '2022-02-03 14:21:47'),
('a3aee74dd83bf48616c29d3cddab48b59289a73f42a79647d52a09c0274264cea14156f103b904c9', 340, 1, 'LaraPassport', '[]', 1, '2021-02-03 14:43:59', '2021-02-03 14:43:59', '2022-02-03 14:43:59'),
('5380c6c3f9bef91bb5847df625d888737263976f6b691c5961409096c9ca5deff4319d79687931c8', 339, 1, 'LaraPassport', '[]', 1, '2021-02-03 14:47:35', '2021-02-03 14:47:35', '2022-02-03 14:47:35'),
('6eda454f1ed3f84c7311ee1bd0565b0371d7ab5658fbb060841048b087bcdc100dd20fe6c53bd8a8', 344, 1, 'LaraPassport', '[]', 0, '2021-02-03 14:52:45', '2021-02-03 14:52:45', '2022-02-03 14:52:45'),
('f38eddb8513e71e6e9a88b701435f1a9fc440a08d80ab5c9e51db1d68ec2760dd2931aaafb097762', 340, 1, 'LaraPassport', '[]', 1, '2021-02-03 21:54:24', '2021-02-03 21:54:24', '2022-02-03 21:54:24'),
('6f61dd6ff549dec96ce1198368a4aba1827181327643796676d936c09630ecc65914faefc4f3304b', 341, 1, 'LaraPassport', '[]', 1, '2021-02-03 21:56:26', '2021-02-03 21:56:26', '2022-02-03 21:56:26'),
('61eb49ab9663ea6cfa8d9c0ace7a12a04a5fdc1fd08e84d1673618f67184ae07350572ab76da80c8', 339, 1, 'LaraPassport', '[]', 1, '2021-02-03 21:57:39', '2021-02-03 21:57:39', '2022-02-03 21:57:39'),
('3fb7dcf8ad64de6a330b8a987578f75d5d4991fef8fc06862ef64314a4eca19e0a50a284ceb0e1a3', 340, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:00:07', '2021-02-03 22:00:07', '2022-02-03 22:00:07'),
('9a12127f7d5401f8105ed26fb6d3748bbf3904bec7ce01ab1f1567fc2ae0ec35a540beaaaf7bcbf5', 341, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:01:41', '2021-02-03 22:01:41', '2022-02-03 22:01:41'),
('b4b6079f1f8dcff62bd977cd16e402767dfbc8772125bd91c4f2287b754f4e936f9cb974d3f8b07c', 339, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:02:28', '2021-02-03 22:02:28', '2022-02-03 22:02:28'),
('6a7c3cb435200e50fa538d1fcfb9368f691b9d70efd5d24b34758d65681c1fa9486ee4c0cb49246c', 340, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:05:28', '2021-02-03 22:05:28', '2022-02-03 22:05:28'),
('cdf863529e765f5667cb5c986cad9545ba7ee42129040ca7151691c00d97cfe8dae4f8d497ac8831', 339, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:09:24', '2021-02-03 22:09:24', '2022-02-03 22:09:24'),
('863e16a5c3ee9814cd4d015c279455f833a5ad7677ede7967a96ca65c63825b228ddeb927276b417', 340, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:11:44', '2021-02-03 22:11:44', '2022-02-03 22:11:44'),
('2383b17689d58449e3478d51884cc3b1d7b42ab6ee600d2180392a9303b5ebd5900c49673afd64ac', 341, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:12:36', '2021-02-03 22:12:36', '2022-02-03 22:12:36'),
('21e6370c5d4bd3f5a05d23c902658776613a810c6a9b4f3274080073839c57a2f556e7b86d2d74ba', 339, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:14:13', '2021-02-03 22:14:13', '2022-02-03 22:14:13'),
('cdb9349986cf095d2e84035dab35a30159616bf70c13e819e6a93292e3a4038205ee47b6cf03bf63', 361, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:16:24', '2021-02-03 22:16:24', '2022-02-03 22:16:24'),
('7cbe387c1aac100682b953ce57783bb944f31d5e0e60eacd9798a21183dafa8bc97ab6774a2dea1d', 339, 1, 'LaraPassport', '[]', 1, '2021-02-03 22:18:09', '2021-02-03 22:18:09', '2022-02-03 22:18:09'),
('b7f0ccd72e2bcaddc42698d06564efc6567f30eb953c9970d934747e2f216e3b646d54f150996cdd', 339, 1, 'LaraPassport', '[]', 1, '2021-02-04 00:08:36', '2021-02-04 00:08:36', '2022-02-04 00:08:36'),
('1adf80e1cb3c128a548535d3142c4cd5916f7aaae499418aa20ace88fe27822fad1094fa18c05a85', 340, 1, 'LaraPassport', '[]', 1, '2021-02-04 00:10:33', '2021-02-04 00:10:33', '2022-02-04 00:10:33'),
('af23a4f22273b81df65fd25e7c3e9e4110104545c12f62a4e6277a0c4910ce2e9d6a194b55573f89', 341, 1, 'LaraPassport', '[]', 1, '2021-02-04 00:12:00', '2021-02-04 00:12:00', '2022-02-04 00:12:00'),
('0aefab29787ac54e7481d6197a7b914d2d082b909747cde8cfd73f2357273576c1186f9e18bfd3c0', 339, 1, 'LaraPassport', '[]', 1, '2021-02-04 00:12:55', '2021-02-04 00:12:55', '2022-02-04 00:12:55'),
('b65b51433c0267d9e31ff9fe48ddeba725ecab945cd4c6803af6d40dae4f3bd354d260e726c74f0a', 339, 1, 'LaraPassport', '[]', 1, '2021-02-04 20:00:42', '2021-02-04 20:00:42', '2022-02-04 20:00:42'),
('5c8030ee3b4c0429d95aef41c5364a8f7ee21d69cfba2a0547a73378e031712d773224f5c6324910', 340, 1, 'LaraPassport', '[]', 1, '2021-02-04 20:21:10', '2021-02-04 20:21:10', '2022-02-04 20:21:10'),
('5acb635f7de6f272bc6146f2ce452a3eea43254bc460e5cdd6450b6653ba51a7b7d0ce7ce6cad5cb', 341, 1, 'LaraPassport', '[]', 1, '2021-02-04 20:21:42', '2021-02-04 20:21:42', '2022-02-04 20:21:42'),
('ead95ccee8a6415c20da7a502e1eecc94366564280edfb222ac360e8ba7f71fcfb9c809452600b35', 339, 1, 'LaraPassport', '[]', 1, '2021-02-04 20:22:11', '2021-02-04 20:22:11', '2022-02-04 20:22:11'),
('e6a1f233cd01899742a10c25833f72946378bfec09be9f42601b0417792b229cb0a4e090e10b4e06', 340, 1, 'LaraPassport', '[]', 1, '2021-02-04 20:24:08', '2021-02-04 20:24:08', '2022-02-04 20:24:08'),
('43296aa480b7c494f7b349974598d84116669cd4d65f20c6677bb70561b270f651d8b127c90f8ca8', 341, 1, 'LaraPassport', '[]', 1, '2021-02-04 20:24:40', '2021-02-04 20:24:40', '2022-02-04 20:24:40'),
('d1e5bc3cf8d8c29a8911030471043613f8b7472f047e5bac079dd3cca2e962b10ab445a422e98d77', 339, 1, 'LaraPassport', '[]', 0, '2021-02-04 20:25:09', '2021-02-04 20:25:09', '2022-02-04 20:25:09'),
('e647330d9617558054319098e478c3690ca9822a682e38e2f2c60cbf6015c8d5ebef719214a59daa', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 20:39:37', '2021-02-06 20:39:37', '2022-02-06 20:39:37'),
('77114954a8c75b32fb8050d6b34f1afa676a47ed5cc24f739b6d8d52da3671c8f3d6aabb020d640d', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 20:59:19', '2021-02-06 20:59:19', '2022-02-06 20:59:19'),
('fa96f5b4eb611de11d2328c43166a5832144124f144307cc78dcf5e781a78d61768a3ec9644b4fdc', 340, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:00:20', '2021-02-06 21:00:20', '2022-02-06 21:00:20'),
('eb5fa3fdc8d426b78464558cef2547b3ce0ddb49479039c44abff20b05d327927a43ab7e85244bce', 341, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:00:58', '2021-02-06 21:00:58', '2022-02-06 21:00:58'),
('9ac51db51861b79e53b4ace646fd76843f1a6434bdfa900f384f2c3bf4c036fe0f492960306b7c10', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:01:25', '2021-02-06 21:01:25', '2022-02-06 21:01:25'),
('c309306c4b59caa9d42ba7f325ba81204fde4923e0a1081f470a067042dcfc299b73054a654e324e', 340, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:02:00', '2021-02-06 21:02:00', '2022-02-06 21:02:00'),
('b0c43d979d6a19abdb7aca44f08d87f8714d4404606d8374e8be12632bf51293cdf1a4d4688e4a5f', 4, 1, 'LaraPassport', '[]', 0, '2021-02-06 21:02:19', '2021-02-06 21:02:19', '2022-02-06 21:02:19'),
('851a2c12f34cb854c1286ec078a6912fc32d33e8ce92af947a92078ff6c22cf5a57bd8b81205c81c', 341, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:02:36', '2021-02-06 21:02:36', '2022-02-06 21:02:36'),
('375fabc51bef8e756de328ef115b1e2b4d0f3aa082a942baed1372479cf7cbe80187d4d1140df9b3', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:03:03', '2021-02-06 21:03:03', '2022-02-06 21:03:03'),
('b21b7e07b7ff67426a6454f3d91c43880df8dd126edf8e4fe7cd281ca2f9a2055c322f9fc6e77f66', 340, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:26:58', '2021-02-06 21:26:58', '2022-02-06 21:26:58'),
('2ca148530796286a4467c17d560e133204776d23ce9cbf21f45a22dcc8d34468c4e35d7b60da6e5d', 341, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:27:56', '2021-02-06 21:27:56', '2022-02-06 21:27:56'),
('c1c0b72d0cfc7fab6d2f47db80fc9c2888e85dd1f0e61a5d7fefce949719ad8f0c576e76b4d51e2b', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:34:52', '2021-02-06 21:34:52', '2022-02-06 21:34:52'),
('0f0fa27de30e273d37d1190cd56ed441bb4fff7f9c8d49cbb4a8daf3de772f31277b89321c012a9c', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:42:43', '2021-02-06 21:42:43', '2022-02-06 21:42:43'),
('df612c2845755c9f21be8c34c0aed78d823df4b0975567954598336541790a8996375ae5359adaeb', 341, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:43:12', '2021-02-06 21:43:12', '2022-02-06 21:43:12'),
('8e8ae9c08d8c10f864b41804f391e355dba170beaec4848d900a44db37fe4edc9d97aaf1cef63f8c', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 21:46:58', '2021-02-06 21:46:58', '2022-02-06 21:46:58'),
('023efeaa5dc58f2d8e5736a4fb3fc9d3ae3f97523034ddfbc5540779715cca7e6f8c3c51d5de7d47', 340, 1, 'LaraPassport', '[]', 1, '2021-02-06 22:53:03', '2021-02-06 22:53:03', '2022-02-06 22:53:03'),
('3d568c92481d7cd8d057e2dc60c1f7ad89840eb8c0a5c4413aba22ab95aced6c1142295034fb376d', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 22:55:47', '2021-02-06 22:55:47', '2022-02-06 22:55:47'),
('19d52eaf28dde6512fad5e73b724d81db28e91be8109773f7034a9bb7c5afe33aa973582aa504aaf', 340, 1, 'LaraPassport', '[]', 1, '2021-02-06 22:56:32', '2021-02-06 22:56:32', '2022-02-06 22:56:32'),
('2bd432f2542cec27fa25bfd5b6a3d0db684a9cb19e7c17cc659ef21ed9e3f0d4728c12433ce3980f', 341, 1, 'LaraPassport', '[]', 1, '2021-02-06 22:58:43', '2021-02-06 22:58:43', '2022-02-06 22:58:43'),
('18b186a1018b8a634249b6e44659b6fb4fd9296cd887f91ffa8bc753caf6ae7590416c9f1c94f4da', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 22:59:56', '2021-02-06 22:59:56', '2022-02-06 22:59:56'),
('6536eda73229ec553a4e3a24385e8db63b988ce3403d25d33038e28740b2179e3836a9fd763eeeda', 340, 1, 'LaraPassport', '[]', 1, '2021-02-06 23:05:42', '2021-02-06 23:05:42', '2022-02-06 23:05:42'),
('036bdec0f7ac541a7b2fa901f4068d8cc65004b9e4c5285e16f83f2894f28080c88225ea9f6f4f26', 341, 1, 'LaraPassport', '[]', 1, '2021-02-06 23:11:13', '2021-02-06 23:11:13', '2022-02-06 23:11:13'),
('ecd13171e2189af68c9863e374e531f826325d5d84c91d479d781d4ef095fd319a9d4d8fce97e2f6', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 23:11:58', '2021-02-06 23:11:58', '2022-02-06 23:11:58'),
('3ec19f80c0081b2660ec4b659ba8082283415fa5e7c33540583e45d4728ff0787b58c74459e70b87', 340, 1, 'LaraPassport', '[]', 1, '2021-02-06 23:13:18', '2021-02-06 23:13:18', '2022-02-06 23:13:18'),
('013bd7bff75c80ade0b0236fd82dbf0cc7f8f3071eac9fd11360c9baebd1c6177f5f41ae8184b971', 341, 1, 'LaraPassport', '[]', 1, '2021-02-06 23:14:10', '2021-02-06 23:14:10', '2022-02-06 23:14:10'),
('dfc4c99420171d2ba091e35cd24c890c7fac32ae4c97f39edfb1c71518c6f284b9385d38aa9671e3', 339, 1, 'LaraPassport', '[]', 1, '2021-02-06 23:14:55', '2021-02-06 23:14:55', '2022-02-06 23:14:55'),
('55d4126ec854165e7fed8af3c1aa54c0debfa38e14aeb2712f567f5b92a301115a8f64d7a077d34d', 339, 1, 'LaraPassport', '[]', 0, '2021-02-06 23:29:14', '2021-02-06 23:29:14', '2022-02-06 23:29:14'),
('4a7fc836709963120a35c92d6b493225ab5141c440fa6b60ff0dfe2ca411b3ea70a0d1fb2c155a9e', 339, 1, 'LaraPassport', '[]', 1, '2021-02-08 14:58:30', '2021-02-08 14:58:30', '2022-02-08 14:58:30'),
('519ea34b31c399fbe7bb530d19aee079e2dc9fba37d6eb71ca89a9978acc195cbb5ad0638cb7bbaa', 339, 1, 'LaraPassport', '[]', 0, '2021-02-08 15:14:23', '2021-02-08 15:14:23', '2022-02-08 15:14:23'),
('9ba7266f0885bd48ec23c4de7b59b7a7a0ab246fc907dfa82d0f75db0730aebfbb7d530e0bf657ca', 340, 1, 'LaraPassport', '[]', 1, '2021-02-08 19:31:10', '2021-02-08 19:31:10', '2022-02-08 19:31:10');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6400bd104ecb8cdfb9eee67284c7b6401363b1fda9ba49ed252bdffa745b94f30c734b318d8741f2', 341, 1, 'LaraPassport', '[]', 1, '2021-02-08 19:31:53', '2021-02-08 19:31:53', '2022-02-08 19:31:53'),
('8323daaa6e2c0f66afb6212a58b11ca1bd64159a6bef6bcfb3ba15e9472613165ea3e4ba5ca4238c', 339, 1, 'LaraPassport', '[]', 1, '2021-02-08 19:33:07', '2021-02-08 19:33:07', '2022-02-08 19:33:07'),
('10aeacc073273bbe5f3b32150f57eaab5cf8479e3ba254324f68efa77eada171a0388e21dded1a6f', 340, 1, 'LaraPassport', '[]', 1, '2021-02-08 19:34:57', '2021-02-08 19:34:57', '2022-02-08 19:34:57'),
('2b05b9a552053b6d426e80b26552ef8950c141f1ee5aab78fb98784933ebf271521ab36c1d57bef5', 341, 1, 'LaraPassport', '[]', 1, '2021-02-08 19:36:14', '2021-02-08 19:36:14', '2022-02-08 19:36:14'),
('e118a4f1bd148a9761470d963990e1942d39406b8d0fdbb4964d0a997d220c54c74060ff4b5951b7', 4, 1, 'LaraPassport', '[]', 1, '2021-02-20 21:13:15', '2021-02-20 21:13:15', '2022-02-20 21:13:15'),
('f6d4c2e523344f21e94b4867fc4d1bfb3925a64086f427aeab66619dd5ab9d02a38f9b523a33b7a4', 339, 1, 'LaraPassport', '[]', 0, '2021-02-20 20:33:03', '2021-02-20 20:33:03', '2022-02-20 20:33:03'),
('15c98e4361198c2a6c4b9ac9d7ba79209068c2639581ec5aa9d184cff97d9bde99b12cc92c4614c0', 339, 1, 'LaraPassport', '[]', 1, '2021-02-20 21:05:04', '2021-02-20 21:05:04', '2022-02-20 21:05:04'),
('04284374b19ba515249980509bc3360353a04e27f9d30c410c6ec11de0035d9c67dba73aa540a291', 340, 1, 'LaraPassport', '[]', 1, '2021-02-21 01:07:26', '2021-02-21 01:07:26', '2022-02-21 01:07:26'),
('3d5a05c1f9fab3a3a814a15cb8b4eab96de0fc155f1da348e9367c3be7e9893b2e5d968f8510d6fb', 339, 1, 'LaraPassport', '[]', 0, '2021-02-21 01:41:14', '2021-02-21 01:41:14', '2022-02-21 01:41:14'),
('0b41838dd2bd048d14fa54fafac3c5e0b4384fe62c124ecf0aa04c70f33fecf2fce0370b0d9812a1', 339, 1, 'LaraPassport', '[]', 1, '2021-02-21 10:21:15', '2021-02-21 10:21:15', '2022-02-21 10:21:15'),
('982659fee9c0f3646f510db15229d688ea7e3ad2ec86c42e200babc714213a8b3d3c76b4f7f2529e', 340, 1, 'LaraPassport', '[]', 1, '2021-02-21 10:26:51', '2021-02-21 10:26:51', '2022-02-21 10:26:51'),
('61606f1f728a6c004e9d40fcf358b69f435c449b69519dc032e090fc942545fcbfca11ef6afe5672', 341, 1, 'LaraPassport', '[]', 1, '2021-02-21 10:29:27', '2021-02-21 10:29:27', '2022-02-21 10:29:27'),
('3666337183c46c884e28562d245b23e76e9478f11ba829f0f6738f378e8d0d8fa3e50f1cfbf7a134', 339, 1, 'LaraPassport', '[]', 1, '2021-02-21 10:32:10', '2021-02-21 10:32:10', '2022-02-21 10:32:10'),
('08224df66f21a2a43dd48c1e8a55930138e0f463a8be9cb5ec8779c12cd0987ece3967c928778569', 340, 1, 'LaraPassport', '[]', 1, '2021-02-21 10:48:43', '2021-02-21 10:48:43', '2022-02-21 10:48:43'),
('c32c2f32f43935beb41f0961c2e48c688142a3c294c00982e34e08f89893314a703638ce495902c8', 341, 1, 'LaraPassport', '[]', 1, '2021-02-21 10:51:49', '2021-02-21 10:51:49', '2022-02-21 10:51:49'),
('0cff9b3772731dcf00fb4485bbf83c1aa115da02ccb63b7f8d95739268862906d28e04a89470ed0a', 339, 1, 'LaraPassport', '[]', 1, '2021-02-21 10:53:15', '2021-02-21 10:53:15', '2022-02-21 10:53:15'),
('a538f663278eb103b340a4187b477f6d4aaa60b46075a6deaf76b0ee542e07a16e46e25be3476497', 339, 1, 'LaraPassport', '[]', 0, '2021-02-21 11:34:17', '2021-02-21 11:34:17', '2022-02-21 11:34:17'),
('8ffbe1af02f6604a61ed0c6129255b2f86bb7c2bba5d84eb79fe89fe2c19f3bbd013b6554ce2ea11', 4, 1, 'LaraPassport', '[]', 1, '2021-02-21 17:39:17', '2021-02-21 17:39:17', '2022-02-21 17:39:17'),
('8fce345dcdd8f99c7323780980fd29e2a821b44d01a48d34544b09f1bc5aba3595a72f639f75d643', 339, 1, 'LaraPassport', '[]', 1, '2021-02-21 18:00:08', '2021-02-21 18:00:08', '2022-02-21 18:00:08'),
('bc40f9b79c60b41f741a09ae0aaeda7552dcf1627be7d692a4a18abb536e4e9d4784097637080434', 340, 1, 'LaraPassport', '[]', 1, '2021-02-21 18:08:02', '2021-02-21 18:08:02', '2022-02-21 18:08:02'),
('df363388438ff5b31fe1d79f3b0fd8bf387275241d7e74ed4f4c4da85f4e697d3fad93b23eca78c9', 4, 1, 'LaraPassport', '[]', 1, '2021-02-21 22:53:51', '2021-02-21 22:53:51', '2022-02-21 22:53:51'),
('2886b45403296e31aa21ccb655fb367e574ca4f90c106b072fe81215c7170d77f51d1226af7ea403', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:27:04', '2021-02-22 13:27:04', '2022-02-22 13:27:04'),
('a5b958dbb177b83280a1b14001a7427fbabb1903191486ab121eb94da506eb5ca4aa995f83a0a4c2', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:30:21', '2021-02-22 13:30:21', '2022-02-22 13:30:21'),
('48299928a778228ae868125ef27450b1cbef18a5179ce013dd88fc9adfe111f6c40afcf1fdb2266d', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:35:10', '2021-02-22 13:35:10', '2022-02-22 13:35:10'),
('a1e3201d4765344cda77bfa96541d7dc8af96418788d3ae379c3fba1a50493b03853333c3d98c22d', 341, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:38:11', '2021-02-22 13:38:11', '2022-02-22 13:38:11'),
('f3aad92d31b1577d468c5c4b50e73f8498a5f7d4c51d6dbb19bc2898a00fadee975f6ba457d0bfc7', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:39:08', '2021-02-22 13:39:08', '2022-02-22 13:39:08'),
('635a21c9f4e1796aa332f0092e5cd47bf3add47779f463b87c7397c2e773ec42dfce8f139d297027', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:40:09', '2021-02-22 13:40:09', '2022-02-22 13:40:09'),
('06d3aa01b423c113b7df18d8b0ad79b64b0e6d1a822e23bbd4fa68ded7b5cfb449db3bdff9f8d692', 341, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:42:16', '2021-02-22 13:42:16', '2022-02-22 13:42:16'),
('6b343fc69c09bba72fe71cec9b179b5a22bcfb6c0ab6683db9a6a4fb6c2fe7d47f49516701a6179f', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:43:17', '2021-02-22 13:43:17', '2022-02-22 13:43:17'),
('e620f516f78357e63cfee93a6498314aaaa20b3cbdd3c854e4d3de2cfaf4606de1d799c7bfb83300', 341, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:43:52', '2021-02-22 13:43:52', '2022-02-22 13:43:52'),
('e2bf78c83852fcd12283a0028291d59580a79568003aa3a6d8197fb0596cf9743d3c179dc74b7542', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:46:25', '2021-02-22 13:46:25', '2022-02-22 13:46:25'),
('beec6e1829028aa2d8b9ec7f844003acd2d43b855601750734af7407e7486440ccf589d3891ebff5', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 13:59:02', '2021-02-22 13:59:02', '2022-02-22 13:59:02'),
('1fa0f6f6b911fa32e435a9fecae92f5fd42a7267c95533c65163cfb53d4e29775ef88f6e4d20ecc4', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 14:00:22', '2021-02-22 14:00:22', '2022-02-22 14:00:22'),
('3412be34e3632c4fa30207ae4184612e66ab03f0c4044c0d203bd24a33e531820a1554dbb3798644', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 14:07:34', '2021-02-22 14:07:34', '2022-02-22 14:07:34'),
('448ffec13a2fec6df635dde235d2b4acb4347412cd005af47777b2170c0d2e71a101ab5e087c67ce', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 14:19:15', '2021-02-22 14:19:15', '2022-02-22 14:19:15'),
('94839a7c37799b5be72dc392f993b43170edf4760c5d62dfe8989a60a4d9268ff4e6f8cded4b573d', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 14:35:29', '2021-02-22 14:35:29', '2022-02-22 14:35:29'),
('90ea499d0d632e6f9e43d60ab4ce6aa389ef1b3c9c991001d460bb2c1c0dc79ab9a1ce240c6fceab', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 15:00:14', '2021-02-22 15:00:14', '2022-02-22 15:00:14'),
('e20d46f6367e7e28a5cf9e14e95a4136c407a85f0086e5088e7f69e40efdafa02fa3a70c84850baa', 341, 1, 'LaraPassport', '[]', 1, '2021-02-22 15:01:35', '2021-02-22 15:01:35', '2022-02-22 15:01:35'),
('38a8636a53508e138d4941a8ae90803d88f7b53306187cd89fc7ccf7fa2dd0816096b10c38a544ef', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 16:23:49', '2021-02-22 16:23:49', '2022-02-22 16:23:49'),
('53276cdec1280cd83266e72400061ed90709d69f3bc6622814dfc85c9a09681d9a3984d4001b8b53', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 16:26:00', '2021-02-22 16:26:00', '2022-02-22 16:26:00'),
('b470af3ce4363a6b80c2376caabf30a7ac1b4e73034187ed67ae5e65a5c54d3e5c9b124e99b406d8', 341, 1, 'LaraPassport', '[]', 1, '2021-02-22 16:29:07', '2021-02-22 16:29:07', '2022-02-22 16:29:07'),
('215c3818030d54f3b00cbfba98c801ba1ec4271fb49a9dee84914bbc69f5e42a174da1ed5a7e415d', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 16:36:06', '2021-02-22 16:36:06', '2022-02-22 16:36:06'),
('29acec319c0ef994c3f5cf28e2e06be8176e7e1075f9a355165e2029c463b499ad536d40fd809db4', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 16:38:18', '2021-02-22 16:38:18', '2022-02-22 16:38:18'),
('8bd9f3fec8550e34b350bf1e679a1b7c023d37e16fa1214b1312d08ebe068ffc85f4fe34c88d032a', 341, 1, 'LaraPassport', '[]', 1, '2021-02-22 16:41:03', '2021-02-22 16:41:03', '2022-02-22 16:41:03'),
('0776f68be092460ee563f13a7bdd9ed64595095c9ae01aad3ff6b7e2e6837af131b3825ab9d31a35', 340, 1, 'LaraPassport', '[]', 0, '2021-02-22 17:10:23', '2021-02-22 17:10:23', '2022-02-22 17:10:23'),
('a1772201ba95e173f73d3b905beabee15ccacc7f919e4772f1fc299106b2f63ce61de53b17f4c670', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 20:59:34', '2021-02-22 20:59:34', '2022-02-22 20:59:34'),
('d2facdbf6e12fd976029a179006d10f71ab0515e1ec1e256d86bb6014f9ffb057a70640e3b03c566', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 21:01:08', '2021-02-22 21:01:08', '2022-02-22 21:01:08'),
('2085a7aa2de53d059efeeca08f2308c9f968fe42be54b486ca2809e7762d5b3162ecc59597fcecc5', 339, 1, 'LaraPassport', '[]', 1, '2021-02-22 22:39:43', '2021-02-22 22:39:43', '2022-02-22 22:39:43'),
('8a47c229558ea1905744fbec4cecbb1e13148e462a8529f5ba385822ad5ce5702488c14a7858ac50', 340, 1, 'LaraPassport', '[]', 1, '2021-02-22 22:42:00', '2021-02-22 22:42:00', '2022-02-22 22:42:00'),
('2da00e4596a7f33fba47094a2060068f9886e70ca44bf8a2a9380ce393acb6d743df76bedd030013', 341, 1, 'LaraPassport', '[]', 1, '2021-02-22 22:45:08', '2021-02-22 22:45:08', '2022-02-22 22:45:08'),
('a124c5142846ecf0f980573d1f35af63eeeba079c8bc267941bcd172a37dcd8f63c83b1c740fdb2f', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 14:41:46', '2021-02-24 14:41:46', '2022-02-24 14:41:46'),
('9a1fa32da5056dd4371c104b29fdb48dad1918cd318b38589ed75079860b8a4751e0b96c95c70659', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 14:43:03', '2021-02-24 14:43:03', '2022-02-24 14:43:03'),
('abe1bc9f0982d701f3ee8d1e569b59d0993dcd3eb191aa5a7dbb32ceeeb0a49b2dd53e5553f63f69', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 14:45:07', '2021-02-24 14:45:07', '2022-02-24 14:45:07'),
('0847658205d8e80c62c821376c8fe2cbe92a5517007b587a4eb8cf667fbcc42eec95e89f038ee903', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 14:46:08', '2021-02-24 14:46:08', '2022-02-24 14:46:08'),
('ef923e537e4a2a46c7fb19d4f0ac544f2357435d05e82e688b37703d4bf63cc35e054dbd13bf5d89', 341, 1, 'LaraPassport', '[]', 1, '2021-02-24 14:47:07', '2021-02-24 14:47:07', '2022-02-24 14:47:07'),
('c6d4740278d5ddb97774268454eac72c557383190d3b6ca5a73a3737188068bba5255143c63debe6', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 14:49:55', '2021-02-24 14:49:55', '2022-02-24 14:49:55'),
('ac246183f2294ecc7ff7f89ed2cee9e0a97b65a5d12e0e145ece2c264a0dafccc759c7ff80364cfc', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 14:51:56', '2021-02-24 14:51:56', '2022-02-24 14:51:56'),
('6a70aa5ec8a85bad94e7379af5de57fb166505b956008f320bad20925695b9ec1d596ad62a75cdf2', 341, 1, 'LaraPassport', '[]', 1, '2021-02-24 14:55:19', '2021-02-24 14:55:19', '2022-02-24 14:55:19'),
('21b34d04ca40561339891bf1998d8b69c3c53f177e187973915a73a2ec9b3a7559b7dbf04681e7bc', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 14:59:02', '2021-02-24 14:59:02', '2022-02-24 14:59:02'),
('9a3454c2218ac8a768b843160995f4e47fa4ad44501b4534732c3eb7cf7876fe2a6ba4e7a5b65cc0', 4, 1, 'LaraPassport', '[]', 1, '2021-02-24 15:04:06', '2021-02-24 15:04:06', '2022-02-24 15:04:06'),
('56302a51a51ee63ccc002b4fe433e117992553b5a5e84428aace762213cef505d576cea3d4ccfff3', 4, 1, 'LaraPassport', '[]', 1, '2021-02-24 15:23:32', '2021-02-24 15:23:32', '2022-02-24 15:23:32'),
('5844b7a6fb5dce24cb0a461a2801e1a7f81213bc91f6a18391ae2f7070cadc15d9e981b542c09b7f', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 15:23:50', '2021-02-24 15:23:50', '2022-02-24 15:23:50'),
('a615d4ec2d9d96ad2a62f37ccdd0e4a3b7b597ff67134bea94c7162668dde7755268266685db7296', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 15:55:48', '2021-02-24 15:55:48', '2022-02-24 15:55:48'),
('d98774ab554a9157d1af4beee0965e5b405f282e32a579b0815a099206c0c11947b88e4e45f7a199', 341, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:19:22', '2021-02-24 16:19:22', '2022-02-24 16:19:22'),
('d5c6f65e77de49886c0bcb74f0916537fae7ac7f8cbfd6a710079871c2174bae86e1d191e40d327c', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:21:24', '2021-02-24 16:21:24', '2022-02-24 16:21:24'),
('e8574971134f4f6584543d2834c276c72e4056989647bf8bb0fd87a14851c64e84fe3ceffea90d87', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:25:05', '2021-02-24 16:25:05', '2022-02-24 16:25:05'),
('89f2466049addd2d4003377fb9d3f1f8c42e68ba8892a97874ca772e71c98113ac9fbe4eb5550e71', 341, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:26:37', '2021-02-24 16:26:37', '2022-02-24 16:26:37'),
('ce6c49ecaf11a5d36db9338644b3fcad2b658fb21f63236c5e4dfbe3a22265b9f307e7418f374124', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:28:03', '2021-02-24 16:28:03', '2022-02-24 16:28:03'),
('971119ca0b5e671a0bd60011a3b4cf0b103a27e7d259898666cc6d938f9ff768f0c7aa717e7e9e73', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:29:30', '2021-02-24 16:29:30', '2022-02-24 16:29:30'),
('685747aafdf4c9ce51edd825639980451de2938c9a312965be4ccb45d95f661e50155fd42bf8222c', 341, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:30:25', '2021-02-24 16:30:25', '2022-02-24 16:30:25'),
('766050ab25d785e1a0405d4550ebad66cc13a5246aaac2ea74216346ace7e659a5fb94464a0cbd0e', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:31:29', '2021-02-24 16:31:29', '2022-02-24 16:31:29'),
('d5ec460fb380acc71097929c418030c9b5f68279e9fe48a841309d0643d449fd4daba1daba4757df', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:33:22', '2021-02-24 16:33:22', '2022-02-24 16:33:22'),
('0c0ac1251d091c0e804c3fce4db9a2534199811c5964c0eede7e38c71cb075248dfb07c544917635', 341, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:34:09', '2021-02-24 16:34:09', '2022-02-24 16:34:09'),
('dc798d75fb1e0c48caf0e94fbb7e452798f877f19059fa8afe71c265a27ab981b99405681934e5b4', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:34:49', '2021-02-24 16:34:49', '2022-02-24 16:34:49'),
('2f68c464d69572ba62fa1aff6535721edcfa07ddc244c59744686b07ff77b998e76fad552165bfa8', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:36:30', '2021-02-24 16:36:30', '2022-02-24 16:36:30'),
('4ad7d59bb4cc7c831baa3c06f23d7ae282c2163d2a50bcd74be798f8eda2609138a0529cedfd901e', 341, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:37:42', '2021-02-24 16:37:42', '2022-02-24 16:37:42'),
('547172713ebd54a31e13707316f0b55ba22a25f97e89062b6fafae530c4a67499b6727c1d0aee791', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:38:42', '2021-02-24 16:38:42', '2022-02-24 16:38:42'),
('7a2762d2527889ed5ae1cd871b5b4a97414bd2c97c0915a0e8f96d81a64a0dfe1f3124724f839b14', 340, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:40:05', '2021-02-24 16:40:05', '2022-02-24 16:40:05'),
('0a9a57bc4588a8de440a07a71656318089879a3a6e01a1f6505e5a48f60658988dd4a78dd2fb8871', 339, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:41:49', '2021-02-24 16:41:49', '2022-02-24 16:41:49'),
('6ab9ed716247afe031005b20b2d582bd599c197f9946db2632af476b35ce8fa4d38105c882b1b0cb', 4, 1, 'LaraPassport', '[]', 1, '2021-02-24 16:42:51', '2021-02-24 16:42:51', '2022-02-24 16:42:51'),
('00a6229ce6faa450ff5047b16475ccef6da1bb3c3135707d13b499cabf7197169bb0fb646c6f6932', 4, 1, 'LaraPassport', '[]', 0, '2021-02-24 16:50:49', '2021-02-24 16:50:49', '2022-02-24 16:50:49'),
('786b8203995dcdfe3d229fdf74c859088379b509787d8717c8eb0d027dd04aaa02f508d755c8f0c6', 4, 1, 'LaraPassport', '[]', 0, '2021-02-24 17:04:49', '2021-02-24 17:04:49', '2022-02-24 17:04:49'),
('7db688a8110bf3750cba2f2ea65ab2b6e8aac813a590b75ff24ca7e76f37f4670b9d75e7c7e94b92', 4, 1, 'LaraPassport', '[]', 1, '2021-02-24 22:34:33', '2021-02-24 22:34:33', '2022-02-24 22:34:33'),
('b6326ad7ea426d6ae39faa11b7fdc3abd530be989cb8fec7656ca4430eda21b22a8d9746a4dde49e', 4, 1, 'LaraPassport', '[]', 0, '2021-02-27 11:38:53', '2021-02-27 11:38:53', '2022-02-27 11:38:53'),
('f6b534c173ac24fc0a632fb10d56692028f749f5fee86df3ac03d16e3391f26e4891f2f14b631472', 4, 1, 'LaraPassport', '[]', 0, '2021-02-27 11:46:36', '2021-02-27 11:46:36', '2022-02-27 11:46:36'),
('5ab1f76f5edec2c4980d774567aafe52057e18befa5f24d1954df1bbc3bf9d8406b9cd29a7fe0bb8', 4, 1, 'LaraPassport', '[]', 0, '2021-02-27 17:50:46', '2021-02-27 17:50:46', '2022-02-27 17:50:46'),
('a4004699409347bdc029288bbcecf720361f43e5f82faa262908899b2239af0d8697bda4b2c32792', 4, 1, 'LaraPassport', '[]', 0, '2021-03-02 12:42:33', '2021-03-02 12:42:33', '2022-03-02 12:42:33'),
('79c1e51ddd5589fdf1e62546b91ef4489d2c756a76cb83cd7775fd7abaf42c4e88a79a278db237c5', 5, 1, 'LaraPassport', '[]', 1, '2021-03-03 10:35:37', '2021-03-03 10:35:37', '2022-03-03 10:35:37'),
('ad230b4565918b1e66db980d28a856c9afa0774d30e9ad2f8f7cfb8e9b3f07436321dcde0e6ec978', 4, 1, 'LaraPassport', '[]', 1, '2021-03-03 10:39:32', '2021-03-03 10:39:32', '2022-03-03 10:39:32'),
('8ebd71b909eb1607e91e902c04e2ff705c16e1d5c4d9e26e93c5d0c872702c1d99a040fbe9453196', 339, 1, 'LaraPassport', '[]', 1, '2021-03-03 10:44:04', '2021-03-03 10:44:04', '2022-03-03 10:44:04'),
('efbe81bec927f06ac802665d26373e1cce3646b42e334de158aaf6c0b88c1ba9702dfbe06467da4a', 340, 1, 'LaraPassport', '[]', 1, '2021-03-03 10:46:29', '2021-03-03 10:46:29', '2022-03-03 10:46:29'),
('13fedba76088f44e971e569e6b43404a249402cf69ee935e7cb6874445b2ef9ab172b818ae2252e3', 341, 1, 'LaraPassport', '[]', 1, '2021-03-03 10:47:46', '2021-03-03 10:47:46', '2022-03-03 10:47:46'),
('3656cf680fe231d6c4fdae73875ac2022b5f87195d8128f0e54e63cd73b0ba70724808393c4e4610', 339, 1, 'LaraPassport', '[]', 1, '2021-03-03 10:49:09', '2021-03-03 10:49:09', '2022-03-03 10:49:09'),
('39de42e7c3f55b242bcd39ad7bc7d5f82e57e7b4771f9614ffa583905fb4cac398f740cd8f67fdc8', 340, 1, 'LaraPassport', '[]', 1, '2021-03-03 10:54:38', '2021-03-03 10:54:38', '2022-03-03 10:54:38'),
('d1cfde0e44b47a1feac7c99889dd83a32aaf19f04bca9458091490bffe3e8b47f491be2a9c178669', 341, 1, 'LaraPassport', '[]', 1, '2021-03-03 10:55:48', '2021-03-03 10:55:48', '2022-03-03 10:55:48'),
('2d7ebcc36f98e6233371c100bb5836547c1f5da7ddcdef245edf01b7a4b1dc6ef660e33c5c0886cd', 339, 1, 'LaraPassport', '[]', 1, '2021-03-03 10:57:43', '2021-03-03 10:57:43', '2022-03-03 10:57:43'),
('ca464e28783152410a815d3e839d37fe6467cf7cd68c7e6ca92178f4f143e746ba00ff339fbfb917', 12, 1, 'LaraPassport', '[]', 1, '2021-03-03 11:03:11', '2021-03-03 11:03:11', '2022-03-03 11:03:11'),
('23d7131fcd88485185267f2c9a05b1a53fc5ffc987260738ec3d216144a57c63b80205b7027f74e0', 6, 1, 'LaraPassport', '[]', 1, '2021-03-03 11:04:31', '2021-03-03 11:04:31', '2022-03-03 11:04:31'),
('e4164502c16d47773bed35c745cd652abc41c832af4c132acd1bd27120bce26d0d27b050df20a2d8', 5, 1, 'LaraPassport', '[]', 1, '2021-03-03 11:05:20', '2021-03-03 11:05:20', '2022-03-03 11:05:20'),
('a2500094e2137d33ec44f791affb04bc6892b4d371a3e9a1dc61bd46fd7f59610e53deb6ff28f277', 6, 1, 'LaraPassport', '[]', 1, '2021-03-03 11:07:31', '2021-03-03 11:07:31', '2022-03-03 11:07:31'),
('18f29f0813c11d20ee05bed298e7faf441e0d283a7afde17b7cb4f0ac9bcaf3dc49ce54353af4d17', 4, 1, 'LaraPassport', '[]', 1, '2021-03-03 11:16:03', '2021-03-03 11:16:03', '2022-03-03 11:16:03'),
('87a43f56ac231e9a72c2e19b88b0479ae3904d58e9469182899982de6ccda3b2c6f88d09da56f6cb', 339, 1, 'LaraPassport', '[]', 1, '2021-03-03 11:17:06', '2021-03-03 11:17:06', '2022-03-03 11:17:06'),
('2a70b4bd89908f2696288db292c934e2d2c6d6ed221a9d12d8b8a487626b494e0e02077c499b9bac', 339, 1, 'LaraPassport', '[]', 1, '2021-03-03 11:20:34', '2021-03-03 11:20:34', '2022-03-03 11:20:34'),
('7fc6332eefc7eee4f7fa3582111387b01f0e0ad1b12a1026d31ff25f059b013dc59ac27e2b85cf96', 4, 1, 'LaraPassport', '[]', 0, '2021-03-03 11:35:11', '2021-03-03 11:35:11', '2022-03-03 11:35:11'),
('5380ce064f6aacc65d29eca3deb9b223bea4443c4e7efa6e473c6183cbefd710693afd0b38f52ca6', 4, 1, 'LaraPassport', '[]', 1, '2021-03-03 13:05:58', '2021-03-03 13:05:58', '2022-03-03 13:05:58'),
('6e5799ef08fbe193ea1dcd7da0fdcc984e03dff7378d2957b8833244e4bd7ff752e14a754480fa15', 4, 1, 'LaraPassport', '[]', 1, '2021-03-03 13:06:21', '2021-03-03 13:06:21', '2022-03-03 13:06:21'),
('056697eb05c95ec7b014541e3ee276db3788022cd88ba9576dbcfd8167a1abde61568167ee15fbf7', 339, 1, 'LaraPassport', '[]', 1, '2021-03-03 13:10:20', '2021-03-03 13:10:20', '2022-03-03 13:10:20'),
('899656030446305ca45c24140d92629a7020e3108083a3d8828eae13400b3ea3a19d3c619245d83c', 4, 1, 'LaraPassport', '[]', 1, '2021-03-03 13:12:18', '2021-03-03 13:12:18', '2022-03-03 13:12:18'),
('a0945187c83f27d9bec1807bfb3200270c49a22123e98537e969f3d98766cacc43a0bdffcd1cb73a', 339, 1, 'LaraPassport', '[]', 0, '2021-03-03 13:24:01', '2021-03-03 13:24:01', '2022-03-03 13:24:01'),
('c3d55a6f89248e7b208398f1c66675cc24730fa7a1256be68d8e7098f1a6743d22c6a39ba03ea8fd', 362, 1, 'LaraPassport', '[]', 0, '2021-03-05 14:57:50', '2021-03-05 14:57:50', '2022-03-05 14:57:50'),
('e52ed3a4dc7d6b0d394c37e34599fc15168d8901091213ded968ca45ddb356db1ed2cf2b5747b9cd', 2, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 15:00:12', '2021-03-05 15:00:12', '2022-03-05 15:00:12'),
('bb86af04cf6ccc77723215680e219ba6fca850d35fa29ea3726be24cd1f147bf508b8886c21f3a99', 1, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:05:02', '2021-03-05 15:05:02', '2022-03-05 15:05:02'),
('8ddaa497890e775943f7ea2581a75572c282168cc4c212a01d212cc2b149f9bd96aea7d73aac8e2b', 2, 1, 'LaraPassport', '[]', 0, '2021-03-05 15:06:03', '2021-03-05 15:06:03', '2022-03-05 15:06:03'),
('ee0f9941692a12599c965468668c6f2f09e1bf70d60bbb50b8dcac9a2e282989be4d1262190ef191', 339, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:20:20', '2021-03-05 15:20:20', '2022-03-05 15:20:20'),
('7f97fa4e7c628249dd1194e8bea63e5aad885efc2db43854ad23cecd2a9516e7e8ae9cc8c6d3b9d4', 339, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:23:39', '2021-03-05 15:23:39', '2022-03-05 15:23:39'),
('b7ea705e98f54c4e4198ff86deadb6351f7d67bbac3873d73a349bf1fbc082c91680f1410f10b881', 1, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 15:24:55', '2021-03-05 15:24:55', '2022-03-05 15:24:55'),
('4a85e84bcd5f4ecf40c219582d7d1d4d763ab0684a4e240a7eaf55454f786ea6c6428045f58d994f', 1, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:26:56', '2021-03-05 15:26:56', '2022-03-05 15:26:56'),
('891c19a68c94a76e62f6925f675089d857c619443f3e5b02aa08e741d8393e3a6986a5fe845d5bc5', 339, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:27:46', '2021-03-05 15:27:46', '2022-03-05 15:27:46'),
('ed973ebacb9b8cc0392fd2ec8ebb75ecf426dd26574a5442af485c1e0bc7c1597e5da7638bebe788', 340, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:28:11', '2021-03-05 15:28:11', '2022-03-05 15:28:11'),
('7a12e7072737e0d1acfecbcd10de3a7d9ad7aef5081f64c9e76b00e7f879c6fcf8570f5b195e90bf', 1, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 15:39:43', '2021-03-05 15:39:43', '2022-03-05 15:39:43'),
('3d092ee07cf2c4b0988cf9d71404a7abf9df1e35cbe5f31fa6a9d783360f9da07322346dd2da97db', 2, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:42:03', '2021-03-05 15:42:03', '2022-03-05 15:42:03'),
('8b7ab4f3ea8aa656db2ec4977a4fcd8eca5f6b9805ec58ec375a82977901fddcc96d1f9bffb71eee', 2, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:55:16', '2021-03-05 15:55:16', '2022-03-05 15:55:16'),
('8706d1f711c3b3a5b15af743cc6d038bb2e141862261d4bf8b97b30f5f1cde1a133adf7e83cf77e4', 3, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:55:43', '2021-03-05 15:55:43', '2022-03-05 15:55:43'),
('44dce3260f669ce26e85e16e23ac79bc760b03a394fc3474c709bd1680c437e1470c6450af52474f', 4, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:58:00', '2021-03-05 15:58:00', '2022-03-05 15:58:00'),
('ca475f90dd19fcec3901b4b49821f06da5c90dbc846e2bc3ee6bb9531632fd43729403bdab296e25', 5, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:58:47', '2021-03-05 15:58:47', '2022-03-05 15:58:47'),
('253de181127d80b4bfcf0a20063c64467eae399b9e5800a8c37bd9e6551c71e6f1c7dcf585b51ff5', 7, 1, 'LaraPassport', '[]', 1, '2021-03-05 15:59:18', '2021-03-05 15:59:18', '2022-03-05 15:59:18'),
('aaad3089d928bd955d63a5f49aff297c20b6d924c31998d509ef23c58ed638b36eb76d22d169a95e', 339, 1, 'LaraPassport', '[]', 0, '2021-03-05 16:00:43', '2021-03-05 16:00:43', '2022-03-05 16:00:43'),
('371bef3afbb8f230fa72de88193e4bdfe5066b3a2050c2552df588f2e7174a579ce13f321b7069f4', 2, 1, 'LaraPassport', '[]', 1, '2021-03-05 16:01:42', '2021-03-05 16:01:42', '2022-03-05 16:01:42'),
('6d51a29c799101697859f45107d59198aceca3e5eb25577b85d5e44c5b66aa9ccde4e04feb707976', 1, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 16:03:39', '2021-03-05 16:03:39', '2022-03-05 16:03:39'),
('cb70987b9a0c0ec6d10dbac9594e817236f163aa6d99909c77c5c94f6cf6bbe555485724758fa2b7', 2, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 16:04:21', '2021-03-05 16:04:21', '2022-03-05 16:04:21'),
('247b42745bc558dcac2199d8b1e0ca0172a3672b7365aee205f90ada4e1296feb352554cb35d317e', 2, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 16:06:13', '2021-03-05 16:06:13', '2022-03-05 16:06:13'),
('45fa63f86410cd72394ad4558eae41cd5649955d66bc11486305b8572e16cb1d7605b6565e303898', 3, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 16:07:48', '2021-03-05 16:07:48', '2022-03-05 16:07:48'),
('47cf50542b812b58d22bada1d7e446d45bfa2266fc91b1d81c4976f768cc30030ab7f4374f785cc7', 3, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 16:08:39', '2021-03-05 16:08:39', '2022-03-05 16:08:39'),
('6baea9f1dd596ad2dbe1c944f71d0387927b69614c82c979e1a285bc3f43df1246c6cd7e15396ff0', 8, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 16:09:32', '2021-03-05 16:09:32', '2022-03-05 16:09:32'),
('b618afe5a4fe3a6303e085810373a4f45020a0c8cc94e14c54d372dfed6798d49ea3029afb36b75a', 7, 1, 'LaraPassportVendor', '[]', 1, '2021-03-05 16:10:17', '2021-03-05 16:10:17', '2022-03-05 16:10:17'),
('4a2cdfce43cc48beaa35c04f968cf859ba804a567161305c037141de64cbd1f6952cfbad02436cfe', 36, 1, 'LaraPassport', '[]', 1, '2021-03-05 16:11:12', '2021-03-05 16:11:12', '2022-03-05 16:11:12'),
('40002058561e18abd0a99adcc20a5ffa70c1c7ad804024d16dab8cdb1d47539fecfd08b390fe3ebe', 34, 1, 'LaraPassport', '[]', 1, '2021-03-05 16:12:41', '2021-03-05 16:12:41', '2022-03-05 16:12:41'),
('aeb3235649c2178dfa79308350022f93660e25657dad014bee1aa552cf1da9631b25d4857aabaf2f', 5, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:09:34', '2021-03-05 22:09:34', '2022-03-05 22:09:34'),
('95034145dff9766739202af95ba6afa35a578c050b8bf884e5ed5201229debaf9682d801e2feea5e', 340, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:09:56', '2021-03-05 22:09:56', '2022-03-05 22:09:56'),
('2470876191a352f1d44b100112f419c513baef9b2d1b9f6fb2e850d5a5f08a6431f34cc6d3a64e49', 341, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:12:58', '2021-03-05 22:12:58', '2022-03-05 22:12:58'),
('a41ab54bb52183e03383cbfc912b7a52f76a97d7e7d3ac21982ab41a12f92e65936d02753072fe12', 339, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:14:34', '2021-03-05 22:14:34', '2022-03-05 22:14:34'),
('9beabbb4c97f8e6280ad30d406efb5d9fdb5517b25fbafe190b541f7e332c311cbd596383c506c59', 339, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:20:23', '2021-03-05 22:20:23', '2022-03-05 22:20:23'),
('9682819cd65dfaffc63eceb05f2b724f6edad2c9bb53af997d886b13dc14ae367a4f915106278b98', 339, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:23:26', '2021-03-05 22:23:26', '2022-03-05 22:23:26'),
('fad5f729db499652e1df29275b0fbc9530e4b52bf97f914e90c98adede0dff8a77ca7aea35801ed9', 340, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:26:51', '2021-03-05 22:26:51', '2022-03-05 22:26:51'),
('279e41e7d3ec540a2299a7c6023dbb434d3bae1dd16e88da8377282cbd1d73704c3930cab0eddde8', 341, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:28:36', '2021-03-05 22:28:36', '2022-03-05 22:28:36'),
('d7324a33dc87b6d0eb8cec3edd8bd97db76b2a84c415726e1ae0cb3055f61cf7b47a6d10c9b37d6d', 339, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:29:47', '2021-03-05 22:29:47', '2022-03-05 22:29:47'),
('0a7568d471dd637c72d32bafc55f8f2112a104d1097c6450fc7d5da4659631b9c1768d2e166383ec', 4, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:35:08', '2021-03-05 22:35:08', '2022-03-05 22:35:08'),
('05dd7a61e71877cd09e1bf612a878ce371d0625cb66c95324b11260948a3858bf571719ab5ceb95b', 340, 1, 'LaraPassport', '[]', 0, '2021-03-05 22:39:34', '2021-03-05 22:39:34', '2022-03-05 22:39:34'),
('2eb6696a073773d9327837aa5c433ea2b561729bb5e2c89d29377e989a1ebeb34771241eb3c83dd1', 7, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:47:33', '2021-03-05 22:47:33', '2022-03-05 22:47:33'),
('235fd7f1626859351659e873910b9cc5b49b14c26656a19d36d4779d16086044a6ea9088b05fdb30', 8, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:49:57', '2021-03-05 22:49:57', '2022-03-05 22:49:57'),
('cfe242c5135ee3f3ba24032e020183cfb8f854d517ecf37bbfe40af2a288189560dc04f576051758', 9, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:50:34', '2021-03-05 22:50:34', '2022-03-05 22:50:34'),
('ee6d94d6e373777e7d76635f2c781f77304ab759ade0bcacaecf2ec0fc786c3d9718a76c0602a404', 10, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:51:33', '2021-03-05 22:51:33', '2022-03-05 22:51:33'),
('59681e16a482e6bd1ef9376359a0cff9d011b95f319bfafc3997a09eb2f80d51cb1289f638338975', 11, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:56:16', '2021-03-05 22:56:16', '2022-03-05 22:56:16'),
('d276445c77723a2d858dc915c735a568bf91f9c8ef96362969ad2f05d14e66ea3614c703807eb8bb', 12, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:57:18', '2021-03-05 22:57:18', '2022-03-05 22:57:18'),
('d109845500a75dfdc14af84c3048ef7681f38c98c871930dd12eeaf88d4e33b4c2f6341c66272b22', 13, 1, 'LaraPassport', '[]', 1, '2021-03-05 22:59:10', '2021-03-05 22:59:10', '2022-03-05 22:59:10'),
('c32362d7d5d723a2d11adc0c63161e818f4270766acee63f085b3483e177b4b2a81ab1fffc64cbdf', 14, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:06:42', '2021-03-05 23:06:42', '2022-03-05 23:06:42'),
('2ba77d8cb54a48254013af3c3963eb3f44e90dd5c7aa0d1f0d4fba6756ccadab8d25eedb2f327daf', 15, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:07:41', '2021-03-05 23:07:41', '2022-03-05 23:07:41'),
('20ab5d660c8b577fd3702f3bba9e945fe1d49957bfb71e7bba7929f93152a8b77f7d9b9c6bca56ba', 16, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:09:49', '2021-03-05 23:09:49', '2022-03-05 23:09:49'),
('0bbc009b9b9605e5de86e63008ce0fee251d9ed1c5ff7693165bb58dfea53c724161252f75804660', 17, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:11:55', '2021-03-05 23:11:55', '2022-03-05 23:11:55'),
('16467e1da9d5d4fcd14dca4d69be066b84c88679f1748ff38bad68ff356bf0e571aabc98bb83f9c8', 18, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:13:50', '2021-03-05 23:13:50', '2022-03-05 23:13:50'),
('562071f891c5e7aa0df977f7227f0b08096da962b9c6ffcdf2011f9a9837a878089fc83c85b8bc69', 19, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:14:44', '2021-03-05 23:14:44', '2022-03-05 23:14:44'),
('2c8af9f1728b8dbbb0dead6cab2c438f83e5114919becd20cbce7714bfe20d371b3bcc24d34c0052', 20, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:15:20', '2021-03-05 23:15:20', '2022-03-05 23:15:20'),
('85918f68716024738cc2a33306d0730d652152a6477da1b66eb3c0a2bb16374b95d15372b18df4e8', 20, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:16:28', '2021-03-05 23:16:28', '2022-03-05 23:16:28'),
('3a7c01a8747712123e3fd27dd98c34219f4cc7c5c4c6991fd3477865573eacbbca1051b0431b36fa', 21, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:17:40', '2021-03-05 23:17:40', '2022-03-05 23:17:40'),
('5a136df979f9eed97efe301a1db3ac5311a33afd453ea980e919c337f391541fede317f9f3274bbc', 22, 1, 'LaraPassport', '[]', 1, '2021-03-05 23:23:11', '2021-03-05 23:23:11', '2022-03-05 23:23:11'),
('86f8ff7afb19707244ea438089a8e6d98ce41d1e60cb61291c8d0115acd62df414f97e28ed084830', 23, 1, 'LaraPassport', '[]', 0, '2021-03-05 23:24:20', '2021-03-05 23:24:20', '2022-03-05 23:24:20'),
('27bae58fb35d2de8d9153e53bf03e383264f54e0c090e36d4ebfbf35ed82e8919bde0abcce0b16b6', 339, 1, 'LaraPassport', '[]', 1, '2021-03-06 15:38:51', '2021-03-06 15:38:51', '2022-03-06 15:38:51'),
('553e463ac50dafcc59bac54e3ffd547dec937375ffaaf2b3fc663619909dbc023f1f019e29beedbd', 4, 1, 'LaraPassport', '[]', 1, '2021-03-06 15:45:42', '2021-03-06 15:45:42', '2022-03-06 15:45:42'),
('f1ba8aa32a23794f7aa48f0f2e99c40e815a2920c65cd2fa9338cd9c6d97494ed184adccda267a67', 339, 1, 'LaraPassport', '[]', 0, '2021-03-06 15:46:45', '2021-03-06 15:46:45', '2022-03-06 15:46:45'),
('ca5384ea72d6bda0f9194861872d1848ac370af9227a5c78f660c46b555921521841366627ea9c8b', 339, 1, 'LaraPassport', '[]', 0, '2021-03-06 17:44:06', '2021-03-06 17:44:06', '2022-03-06 17:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'zE7MGhWXrAD7WJY9OWMD35Gi8ZAOmmC8FFDoWbHv', 'http://localhost', 1, 0, 0, '2018-05-29 07:21:10', '2018-05-29 07:21:10'),
(2, NULL, 'Laravel Password Grant Client', 'PVKcwGonZUprLNhiLZoZn0RzL1v993zZSohGdgTr', 'http://localhost', 0, 1, 0, '2018-05-29 07:21:10', '2018-05-29 07:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-05-29 07:21:10', '2018-05-29 07:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets_vendors`
--

CREATE TABLE `password_resets_vendors` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pivot_vendor_vendorusers`
--

CREATE TABLE `pivot_vendor_vendorusers` (
  `id` int(255) UNSIGNED NOT NULL,
  `vendor_id` int(255) UNSIGNED NOT NULL,
  `vendoruser_id` int(255) UNSIGNED NOT NULL,
  `sbm_role` varchar(45) DEFAULT NULL,
  `sim_role` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pivot_vendor_vendorusers`
--

INSERT INTO `pivot_vendor_vendorusers` (`id`, `vendor_id`, `vendoruser_id`, `sbm_role`, `sim_role`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'SBM', NULL, NULL, NULL),
(2, 1, 2, NULL, 'SIM', NULL, NULL),
(3, 2, 3, NULL, 'SIM', NULL, NULL),
(4, 2, 4, NULL, 'SIM', NULL, NULL),
(5, 2, 5, 'SBM', NULL, NULL, NULL),
(6, 3, 6, 'SBM', NULL, NULL, NULL),
(7, 3, 7, NULL, 'SIM', NULL, NULL),
(8, 4, 8, 'Yes', 'No', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_info`
--

CREATE TABLE `product_info` (
  `id` int(254) UNSIGNED NOT NULL,
  `upc` text NOT NULL,
  `name` text,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_info`
--

INSERT INTO `product_info` (`id`, `upc`, `name`, `description`, `created_at`) VALUES
(1, '1-22222-33333-4', 'guitar', 'acustic guitar', NULL),
(2, '5-66666-77777-8', 'guitar', 'acustic guitar', NULL),
(3, '0-00000-00000-0', 'guitar', 'acustic guitar', NULL),
(4, '99999999', 'guitar', 'acustic guitar', NULL),
(5, '', 'guitar', 'acustic guitar', NULL),
(6, '1-22222-33333-4', 'guitar', 'acustic guitar', NULL),
(7, '5-66666-77777-8', 'guitar', 'acustic guitar', NULL),
(8, '1-22222-33333-4', NULL, NULL, NULL),
(9, '5-66666-77777-8', NULL, NULL, NULL),
(10, '0-00000-00000-0', NULL, NULL, NULL),
(11, '1-22222-33333-4', NULL, NULL, NULL),
(12, '5-66666-77777-8', NULL, NULL, NULL),
(13, '0-00000-00000-0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(255) NOT NULL,
  `created_by` int(255) DEFAULT NULL,
  `company_id` int(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `setup_type` varchar(255) DEFAULT NULL,
  `store_setup_cost` varchar(255) DEFAULT NULL,
  `annual_holding_cost_per_unit` varchar(255) DEFAULT NULL,
  `store_under_audit` varchar(45) NOT NULL DEFAULT 'No',
  `start_date` datetime DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `consumed_budget` double DEFAULT '0',
  `po_doa_criterion` varchar(255) DEFAULT NULL,
  `rn_doa_criterion` varchar(255) DEFAULT NULL,
  `auction_types` text,
  `terms_n_conditions` text,
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `initial_end_date` date DEFAULT NULL,
  `initial_value` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `created_by`, `company_id`, `title`, `setup_type`, `store_setup_cost`, `annual_holding_cost_per_unit`, `store_under_audit`, `start_date`, `end_date`, `currency`, `value`, `consumed_budget`, `po_doa_criterion`, `rn_doa_criterion`, `auction_types`, `terms_n_conditions`, `active`, `created_at`, `updated_at`, `initial_end_date`, `initial_value`) VALUES
(1, 2, 1, 'Dubai Main Branch', 'No', '10', '18', 'No', '2019-06-28 00:00:00', '2023-07-01', 'USD,', 10000000, 481510, 'PO value', 'RN line Value', 'Reverse Auction,Sealed Bid', 'fgfkkghggjh', 'Yes', '2019-06-29 09:26:09', '2019-11-05 13:35:41', '2023-07-01', 10000000),
(2, 34, 2, 'Store on Main street ', 'No', NULL, NULL, 'No', '2019-07-06 00:00:00', '2020-08-29', 'AED,', 1490000, 0, 'PO value', 'RN line Value', 'Sealed Bid,Live Auctions', '', 'Yes', '2019-07-06 14:28:02', '2019-07-06 14:28:02', '2020-08-29', 1490000),
(3, 34, 2, 'Showroom on Kenitra Street', 'No', NULL, NULL, 'No', '2019-07-06 00:00:00', '2019-08-31', 'USD,', 550000, 0, 'PO line Value', 'RN Line Unit Rate Value', 'Live Auctions,Sealed Bid', '', 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04', '2019-08-31', 550000),
(4, 34, 3, 'Store on Main street ', 'No', NULL, NULL, 'No', '2019-07-06 00:00:00', '2020-08-29', 'AED,', 1490000, 0, 'PO value', 'RN line Value', 'Sealed Bid,Live Auctions', '', 'Yes', '2019-07-06 14:28:08', '2019-07-06 14:28:08', '2020-08-29', 1490000),
(5, 34, 3, 'Showroom on Kenitra Street', 'No', NULL, NULL, 'No', '2019-07-06 00:00:00', '2019-08-31', 'USD,', 550000, 0, 'PO line Value', 'RN Line Unit Rate Value', 'Live Auctions,Sealed Bid', '', 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10', '2019-08-31', 550000),
(6, 58, 4, 'Project Oppenheimer', 'No', NULL, NULL, 'No', '2018-09-30 00:00:00', '2020-10-31', 'USD,', 100000000, 0, 'PO value', 'RN line Value', 'Live Auctions,Sealed Bid', 'dgfghjjhkjk  jhg.kjh  k poopppp', 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57', '2020-10-31', 100000000),
(7, 58, 4, 'Branch Oul Metha', 'No', NULL, NULL, 'No', '2018-09-19 00:00:00', '2020-10-31', 'SAR,', 500000, 0, 'PO value', 'RN line Value', 'Live Auctions,Sealed Bid', 'hgfghhjh', 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57', '2020-10-31', 500000),
(8, 74, 5, 'Test Se', 'No', NULL, NULL, 'No', '2020-07-30 00:00:00', '2025-08-30', 'SAR,', 50000000, 0, 'PO line Unit Rate Value', 'RN Line Unit Rate Value', 'Live Auctions,Sealed Bid', 'The supplier shall ....', 'Yes', '2020-07-15 10:53:54', '2020-07-15 10:53:54', '2025-08-30', 50000000),
(9, 74, 5, 'Test Pe', 'No', NULL, NULL, 'No', '2020-07-15 00:00:00', '2020-08-31', 'USD,', 15000000, 0, 'PO line Value', 'RN line Value', 'Sealed Bid,Live Auctions', 'Tttsuasibioi o ghh ooo oyyuut ', 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55', '2020-08-31', 15000000),
(35, 33, 7, 'my setup', 'Yes', NULL, NULL, 'No', '2020-09-30 00:00:00', '2020-10-31', 'USD,', 2000, 0, 'PO line Unit Rate Value', 'RN line Value', 'Live Auctions,Sealed Bid', 'jdkjbsdkjkjdskjdsjfsdks', 'Yes', '2020-09-30 22:54:53', '2020-09-30 22:54:53', '2020-10-31', 2000),
(37, 324, 11, 't67', 'Yes', NULL, NULL, 'No', '2020-10-21 00:00:00', '2021-04-30', 'AED', 100700, 700, 'PO line Unit Rate Value', 'RN Line Unit Rate Value', 'Live Auctions', 'asdasdasdsadasdas', 'Yes', '2020-10-06 23:04:38', '2021-03-05 22:29:24', '2020-12-30', 3600);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_enquiries`
--

CREATE TABLE `purchase_enquiries` (
  `id` int(255) UNSIGNED NOT NULL,
  `enquiry_from_item_master` varchar(11) NOT NULL,
  `purchase_enquiry_group_id` int(255) NOT NULL,
  `purchase_enquiry_ingroup_id` int(255) NOT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) DEFAULT NULL,
  `project_id` int(255) NOT NULL,
  `enquiry_type` varchar(255) NOT NULL,
  `store_item_request` varchar(255) NOT NULL DEFAULT 'No',
  `item_id` int(255) DEFAULT NULL,
  `item_description` text,
  `service_description` text,
  `quantity` int(255) DEFAULT NULL,
  `u_o_m` varchar(255) DEFAULT NULL,
  `images` text,
  `p_images` text,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `location_name` text,
  `underlying_transaction` varchar(255) DEFAULT NULL,
  `sourcing_priority` varchar(255) DEFAULT 'Standard',
  `advanced_payment` varchar(255) DEFAULT NULL,
  `retention_percentage` float NOT NULL DEFAULT '0',
  `retention_days` int(255) NOT NULL DEFAULT '0',
  `retention_released` varchar(45) NOT NULL DEFAULT 'No',
  `notes` text,
  `status` varchar(255) NOT NULL DEFAULT 'Created and Assigned to Level 1',
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `approval_level` varchar(255) NOT NULL DEFAULT '1',
  `grouping_id` text NOT NULL,
  `required_documents` text,
  `po_vendor_id` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_enquiries`
--

INSERT INTO `purchase_enquiries` (`id`, `enquiry_from_item_master`, `purchase_enquiry_group_id`, `purchase_enquiry_ingroup_id`, `created_by`, `company_id`, `project_id`, `enquiry_type`, `store_item_request`, `item_id`, `item_description`, `service_description`, `quantity`, `u_o_m`, `images`, `p_images`, `latitude`, `longitude`, `location_name`, `underlying_transaction`, `sourcing_priority`, `advanced_payment`, `retention_percentage`, `retention_days`, `retention_released`, `notes`, `status`, `active`, `approval_level`, `grouping_id`, `required_documents`, `po_vendor_id`, `created_at`, `updated_at`) VALUES
(1, '0', 1, 1, 4, 1, 1, 'Materials', 'No', 16, NULL, NULL, 134, NULL, NULL, NULL, '55.18820878046881', '25.007208021762118', 'DIP Streets 9 & 45. Warehouse 3. Loading Bay', 'Sales\' Order 1188-2019', 'Standard', 'Yes', 8, 23, 'No', 'Please deliver the docs with the item.', 'Request for Proposals Floated', 'Yes', '2', '550235a5-6089-4cb0-a734-20d05805ecba', 'Material Catalogue,Warranty Certificate,Customers Testimonials', NULL, '2019-11-02 05:05:48', '2019-11-02 05:12:29'),
(2, '0', 1, 2, 4, 1, 1, 'Materials', 'No', 15, NULL, NULL, 105, NULL, NULL, NULL, '55.18820878046881', '25.007208021762118', 'DIP Streets 9 & 45. Warehouse 3. Loading Bay', 'Sales\' Order 1188-2019', 'Urgent', 'Yes', 10, 30, 'No', 'Please deliver the docs with the item.', 'Request for Proposals Floated', 'Yes', '2', '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials', NULL, '2019-11-02 05:05:48', '2019-11-02 05:12:29'),
(3, '0', 1, 3, 4, 1, 1, 'Materials', 'No', 14, NULL, NULL, 67, NULL, NULL, NULL, '55.18820878046881', '25.007208021762118', 'DIP Streets 9 & 45. Warehouse 3. Loading Bay', 'Sales\' Order 1188-2019', 'Urgent', 'No', 7, 18, 'No', 'Please deliver the docs with the item.', 'Request for Proposals Floated', 'Yes', '2', '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials', NULL, '2019-11-02 05:05:48', '2019-11-02 05:12:29'),
(4, '0', 1, 4, 4, 1, 1, 'Materials', 'No', 31, 'Lenovo notebook. ThinkPad X1 Carbon. 16GB, i7 processor. 512 GB', NULL, 35, 'box of 3 laptops', NULL, NULL, '55.18820878046881', '25.007208021762118', 'DIP Streets 9 & 45. Warehouse 3. Loading Bay', 'Sales\' Order 1188-2019', 'Urgent', 'Yes', 17, 22, 'No', 'Please deliver the docs with the item.', 'Request for Proposals Floated', 'Yes', '2', '550235a5-6089-4cb0-a734-20d05805ecba', 'Warranty Certificate,Customers Testimonials,Liability Insurance Certificate', NULL, '2019-11-02 05:05:48', '2019-11-02 05:12:29'),
(5, '0', 2, 1, 4, 1, 1, 'Materials', 'No', 13, NULL, NULL, 150, NULL, NULL, NULL, '55.38458939570319', '25.12787010564089', 'Warehouse Ibn  Naffis. Academic City', 'SO-19918-2019', 'Standard', 'Yes', 7, 17, 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '2', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', NULL, '2019-11-05 11:57:03', '2019-11-05 12:49:04'),
(6, '0', 2, 2, 4, 1, 1, 'Materials', 'No', 12, NULL, NULL, 90, NULL, NULL, NULL, '55.38458939570319', '25.12787010564089', 'Warehouse Ibn  Naffis. Academic City', 'SO-19918-2019', 'Standard', 'Yes', 7, 20, 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '2', 'b367300e-49a9-4fae-9fde-74a7e1b83a37', '', NULL, '2019-11-05 11:57:03', '2019-11-05 12:49:04'),
(7, '0', 3, 1, 4, 1, 1, 'Materials', 'No', 32, 'HP Printer Laserjet. B&W. 15 pages per minute', NULL, 19, 'printers', NULL, NULL, '55.42304154414069', '25.34277573891741', 'Sharjah Industrial Area Warehouse #13', 'SO-90-2019', 'Standard', 'Yes', 15, 21, 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '2', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', NULL, '2019-11-05 13:11:05', '2019-11-05 13:28:06'),
(8, '0', 3, 2, 4, 1, 1, 'Materials', 'No', 33, 'ACER Printer Laserjet. B&W. 25 pages per minute', NULL, 45, 'printers', NULL, NULL, '55.42304154414069', '25.34277573891741', 'Sharjah Industrial Area Warehouse #13', 'SO-90-2019', 'Standard', 'Yes', 12, 21, 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '2', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', NULL, '2019-11-05 13:11:05', '2019-11-05 13:28:06'),
(9, '0', 3, 3, 4, 1, 1, 'Materials', 'No', 34, 'GRUNDIG Printer Laserjet. B&W. 25 pages per minute', NULL, 65, 'printers', NULL, NULL, '55.42304154414069', '25.34277573891741', 'Sharjah Industrial Area Warehouse #13', 'SO-90-2019', 'Standard', 'Yes', 43, 35, 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '2', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', NULL, '2019-11-05 13:11:05', '2019-11-05 13:28:06'),
(10, '0', 3, 4, 4, 1, 1, 'Materials', 'No', 35, 'SHARP Printer Laserjet. B&W. 25 pages per minute', NULL, 98, 'printers', NULL, NULL, '55.42304154414069', '25.34277573891741', 'Sharjah Industrial Area Warehouse #13', 'SO-90-2019', 'Standard', 'Yes', 43, 26, 'No', NULL, 'Commercial Evaluation submitted', 'Yes', '2', '32628743-4de8-4a70-92a4-cfd34dbbbfdd', '', NULL, '2019-11-05 13:11:05', '2019-11-05 13:28:06'),
(11, '0', 4, 1, 4, 1, 1, 'Materials', 'No', 12, NULL, NULL, 5, NULL, NULL, NULL, '55.648261270703124', '25.09056463370194', 'Tower 1', 'Work Order 12346', 'Standard', 'Yes', 12, 15, 'No', 'Please ensure that the docs are brought along with the goods', 'Request for Proposals Floated', 'Yes', '2', '59b3b5fb-7570-47ca-86c7-a7c81f3e8da7', 'Testing Certificate,Warranty Certificate,Country of Origin Certificate', NULL, '2020-02-25 11:42:32', '2020-12-10 21:38:39'),
(12, '0', 4, 2, 4, 1, 1, 'Materials', 'No', 11, NULL, NULL, 15, NULL, NULL, NULL, '55.648261270703124', '25.09056463370194', 'Tower 1', 'Work Order 12346', 'Standard', 'Yes', 12, 15, 'No', 'Please ensure that the docs are brought along with the goods', 'Request for Proposals Floated', 'Yes', '2', '59b3b5fb-7570-47ca-86c7-a7c81f3e8da7', 'Testing Certificate,Warranty Certificate,Country of Origin Certificate', NULL, '2020-02-25 11:42:32', '2020-12-10 21:38:39'),
(13, '0', 5, 1, 4, 1, 1, 'Materials', 'No', 6, NULL, NULL, 12, NULL, NULL, NULL, '55.29807206171875', '25.208659540914415', 'Etisalat HQ', 'WO#123', 'Urgent', 'Yes', 5, 20, 'No', 'Please send the docs with the material', 'Request for Proposals Floated', 'Yes', '2', '34efc062-6548-4d08-bb72-9a50a00f6582', 'Material Catalogue,Warranty Certificate,Testing Certificate', NULL, '2020-05-15 07:34:36', '2020-12-11 15:12:06'),
(14, '0', 5, 2, 4, 1, 1, 'Materials', 'No', 7, NULL, NULL, 10, NULL, NULL, NULL, '55.29807206171875', '25.208659540914415', 'Etisalat HQ', 'WO#123', 'Urgent', 'No', 0, 0, 'No', 'Please send the docs with the material', 'Purchase Enquiry Line Rejected By Level 1 and Assigned back to the Originator', 'Yes', '0', '34efc062-6548-4d08-bb72-9a50a00f6582', 'Material Catalogue,Warranty Certificate', NULL, '2020-05-15 07:34:36', '2020-05-15 07:41:48'),
(15, '0', 6, 1, 4, 1, 1, 'Materials', 'No', 5, NULL, NULL, 50, NULL, NULL, NULL, '55.931159219921874', '25.122896700481537', 'Factory Palms,', 'Sales Order #1223456', 'Standard', 'Yes', 5, 15, 'No', 'Please ensure the product comes with the documents', 'Request for Proposals Floated', 'Yes', '2', '25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8', 'Country of Origin Certificate,Material Catalogue,Liability Insurance Certificate', NULL, '2020-06-29 03:21:27', '2020-12-11 14:33:24'),
(16, '0', 6, 2, 4, 1, 1, 'Materials', 'No', 16, NULL, NULL, 20, NULL, NULL, NULL, '55.931159219921874', '25.122896700481537', 'Factory Palms,', 'Sales Order #1223456', 'Standard', 'Yes', 10, 20, 'No', 'Please ensure the product comes with the documents', 'Request for Proposals Floated', 'Yes', '2', '25a4d451-ea1f-4e6d-9bfd-ae9d123a17a8', 'Country of Origin Certificate,Material Catalogue', NULL, '2020-06-29 03:21:27', '2020-12-10 21:50:58'),
(17, '0', 7, 1, 4, 1, 1, 'Materials', 'No', 5, NULL, NULL, 46, NULL, NULL, NULL, '55.593329630078124', '25.091808332793462', 'Building A1', 'Sales Order #12124', 'Standard', 'Yes', 5, 19, 'No', NULL, 'Request for Proposals Floated', 'Yes', '2', 'bd50f6a0-0693-4484-b50a-fcad54dd268b', 'Material Catalogue,Country of Origin Certificate,Liability Insurance Certificate', NULL, '2020-07-02 04:32:32', '2020-12-10 21:50:58'),
(18, '0', 7, 2, 4, 1, 1, 'Materials', 'No', 5, NULL, NULL, 46, NULL, NULL, NULL, '55.1305305578125', '25.117923092879085', 'Building Plam', 'Sales Order #12124', 'Standard', 'Yes', 5, 19, 'No', NULL, 'Request for Proposals Floated', 'Yes', '2', 'bd50f6a0-0693-4484-b50a-fcad54dd268b', 'Material Catalogue,Country of Origin Certificate,Liability Insurance Certificate', NULL, '2020-07-02 04:32:32', '2020-12-10 21:50:58'),
(19, '0', 8, 1, 4, 1, 1, 'Materials', 'No', 5, NULL, NULL, 12, NULL, NULL, NULL, '55.486212930859374', '25.15397716023664', 'Regal Tower, 20th floor. 2008', 'Work Order 12345', 'Standard', 'Yes', 5, 20, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '8511045d-01f7-4a17-89aa-dc0348654887', 'Warranty Certificate,Country of Origin Certificate,Customers Testimonials,Testing Certificate', NULL, '2020-07-20 07:27:24', '2020-07-20 07:27:24'),
(20, '0', 8, 2, 4, 1, 1, 'Materials', 'No', 12, NULL, NULL, 120, NULL, NULL, NULL, '55.486212930859374', '25.15397716023664', 'Regal Tower, 20th floor. 2008', 'Work Order 12345', 'Urgent', 'No', 0, 0, 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '2', '8511045d-01f7-4a17-89aa-dc0348654887', 'Warranty Certificate,Country of Origin Certificate,Customers Testimonials', NULL, '2020-07-20 07:27:24', '2020-09-20 19:18:54'),
(21, '0', 9, 1, 4, 1, 1, 'Materials', 'No', 5, NULL, NULL, 12, NULL, NULL, NULL, '55.76499100703125', '25.194991246402765', 'Warehouse Frame #1', 'Sales Order 123', 'Standard', 'No', 5, 20, 'No', NULL, 'Purchase Enquiry Line Approved by Level 1 and Assigned to Level 2 for Further Approval', 'Yes', '2', '1ff53d69-d606-4e97-b879-ee927957f059', 'Country of Origin Certificate,Warranty Certificate,Material Catalogue', NULL, '2020-07-21 06:02:35', '2020-08-03 09:13:41'),
(22, '0', 9, 2, 4, 1, 1, 'Materials', 'No', 6, NULL, NULL, 25, NULL, NULL, NULL, '55.76499100703125', '25.194991246402765', 'Warehouse Frame #1', 'Sales Order 11', 'Urgent', 'Yes', 10, 20, 'No', NULL, 'Purchase Enquiry Line Rejected By Level 1 and Assigned back to the Originator', 'Yes', '0', '1ff53d69-d606-4e97-b879-ee927957f059', 'Country of Origin Certificate,Warranty Certificate', NULL, '2020-07-21 06:02:35', '2020-08-03 09:14:37'),
(23, '0', 10, 1, 4, 1, 1, 'Materials', 'No', 5, NULL, NULL, 15, NULL, NULL, NULL, '55.52878495234375', '25.03707362062512', 'Store 1', 'Sales Order #12245', 'Standard', 'Yes', 5, 23, 'No', 'please ensure the supporting docs are submitted with the products', 'Created and Assigned to Level 1', 'Yes', '1', '4a51833d-aedb-480b-ae63-9953159abb80', 'Material Catalogue,Country of Origin Certificate,Customers Testimonials', NULL, '2020-08-03 09:08:02', '2020-08-03 09:08:02'),
(24, '0', 10, 2, 4, 1, 1, 'Materials', 'No', 36, 'Montre Suisse', NULL, 20, 'Pieces', NULL, NULL, '55.52878495234375', '25.03707362062512', 'Store 1', 'Sales Order #12245', 'Standard', 'Yes', 5, 23, 'No', 'please ensure the supporting docs are submitted with the products', 'Created and Assigned to Level 1', 'Yes', '1', '4a51833d-aedb-480b-ae63-9953159abb80', 'Material Catalogue,Country of Origin Certificate,Customers Testimonials', NULL, '2020-08-03 09:08:02', '2020-08-03 09:08:02'),
(25, '0', 11, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'descipritonssss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 10, 7, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', 'ebee54c6-f8d7-4756-8f84-05c480dd08a4', '', NULL, '2020-09-18 19:04:47', '2020-09-18 19:04:47'),
(26, '0', 12, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'this is description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 10, 9, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '632f12b4-bdc0-4c72-b597-cb29efeaf07b', 'None', NULL, '2020-09-18 19:14:58', '2020-09-18 19:14:58'),
(27, '0', 13, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'this is descriptions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 10, 10, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '865b3b35-cf94-4f15-b9cf-3714b9e78880', 'None', NULL, '2020-09-18 19:20:32', '2020-09-18 19:20:32'),
(28, '0', 14, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'descsffksdflksdfskdfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 10, 12, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '31af7db5-32ad-43a6-8747-d3c14e2057cf', 'None', NULL, '2020-09-18 19:23:25', '2020-09-18 19:23:25'),
(29, '0', 15, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'desc1122', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 10, 18, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '907969e1-20fd-4fac-87ee-5a2c7319d311', 'None', NULL, '2020-09-18 20:12:54', '2020-09-18 20:12:54'),
(30, '0', 16, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'this desc1122', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 10, 20, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '812b80d1-b18b-4e9a-9fce-57c57ef16aa5', 'None', NULL, '2020-09-18 20:15:10', '2020-09-18 20:15:10'),
(31, '0', 17, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'ffffggg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '123050c4-a79f-4165-932a-50343c133aa9', 'None', NULL, '2020-09-18 21:09:10', '2020-09-18 21:09:10'),
(32, '0', 18, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'helo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 10, 16, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '80948358-1d1f-4e7b-b299-59ad511162f2', 'None', NULL, '2020-09-18 21:15:48', '2020-09-18 21:15:48'),
(33, '0', 19, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'asdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '4a8cfdfb-09c2-406a-928a-179cda2724db', 'None', NULL, '2020-09-18 21:17:22', '2020-09-18 21:17:22'),
(34, '0', 20, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'abc def', NULL, NULL, 'hi', NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '3e0d527b-7d26-463e-8c3a-2a3ffc477330', 'None', NULL, '2020-09-18 21:20:25', '2020-09-18 21:20:25'),
(35, '0', 21, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'imgs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '94a36ff0-b488-4c51-b816-18a3d632cdef', 'None', NULL, '2020-09-18 21:33:13', '2020-09-18 21:33:13'),
(36, '0', 22, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'desceeee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '66d1851f-0a4a-4e20-acb4-fa8ce4219a02', 'None', NULL, '2020-09-18 21:40:25', '2020-09-18 21:40:25'),
(37, '0', 23, 1, 4, 1, 1, 'Service', 'No', 37, 'abcd', 'hello', 0, 'kg', NULL, NULL, NULL, NULL, 'Pakistan', 'abcd1234', 'Standard', 'Yes', 10, 12, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '9aa967e6-abac-441f-a275-9251b56c9579', 'Material Catalogue,Warranty Certificate,Customers Testimonials', NULL, '2020-09-19 03:36:23', '2020-09-19 03:36:23'),
(38, '0', 24, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'hello', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard', NULL, 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '88400d0a-f5fd-434f-a0e5-9e96dfa82a90', 'None', NULL, '2020-09-19 03:38:00', '2020-09-19 03:38:00'),
(40, '0', 25, 1, 4, 1, 1, 'Materials', 'No', 43, 'dfsdfs', NULL, 2, 'Dozen', NULL, NULL, NULL, NULL, NULL, 'PE#12312312', 'Standard', 'No', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', 'c63f465e-c61a-4991-a441-21ab255d38d2', '', NULL, '2020-10-17 00:50:10', '2020-10-17 00:50:10'),
(41, '0', 26, 1, 4, 1, 1, 'Materials', 'No', 44, 'asdasdas', NULL, 3, 'Dozen', NULL, NULL, NULL, NULL, NULL, 'PE#12312321', 'Standard', 'No', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', 'afef49ec-36e1-4c7d-89f6-1f9c6c7deab7', 'Customers Testimonials', NULL, '2020-10-17 00:55:32', '2020-10-17 00:55:32'),
(42, '0', 26, 2, 4, 1, 1, 'Materials', 'No', 45, 'asdasdas', NULL, 2, 'kilo', NULL, NULL, NULL, NULL, NULL, 'PE#123123234', 'Standard', 'No', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', 'afef49ec-36e1-4c7d-89f6-1f9c6c7deab7', '', NULL, '2020-10-17 00:55:32', '2020-10-17 00:55:32'),
(43, '0', 27, 1, 4, 1, 1, 'Service', 'No', NULL, NULL, 'dsadasdasdasdasd', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'Standard', NULL, 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '9a13d5fd-7f3e-4e98-b461-da2cafb05d58', '', NULL, '2020-10-17 00:56:31', '2020-10-17 00:56:31'),
(44, '0', 28, 1, 4, 1, 1, 'Materials', 'No', 6, NULL, NULL, 2, NULL, NULL, '[]', NULL, NULL, NULL, 'PE#1232131245', 'Standard', 'No', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '15ffd073-527d-4f09-b306-d136752b24a0', '', NULL, '2020-10-17 01:15:38', '2020-10-17 01:15:38'),
(45, '0', 29, 1, 4, 1, 1, 'Materials', 'No', 46, 'asdasdasdatrtyt', NULL, 2, 'Liter', NULL, '', NULL, NULL, NULL, 'PE#25453443', 'Standard', 'No', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '2deb97b1-efdd-4da4-b937-68db4186d8e0', '', NULL, '2020-10-17 01:31:39', '2020-10-17 01:31:39'),
(46, '0', 30, 1, 4, 1, 1, 'Materials', 'No', 47, 'sdfsdfdsfs', NULL, 4, 'Dozen', NULL, '[\"profilecf004fdc76fa1a4f25f62e0eb5261ca3198.jpeg\",\"profile65658fde58ab3c2b6e5132a39fae7cb9610.jpeg\"]', NULL, NULL, NULL, 'PE#1231', 'Standard', 'No', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '4431130f-f627-44e7-8e0a-b3ef09ffb0c2', '', NULL, '2020-10-17 01:38:56', '2020-10-17 01:38:56'),
(47, '0', 31, 1, 4, 1, 1, 'Materials', 'No', 48, 'hhhhjjjkk', NULL, 5, 'Liters', NULL, '[\"profile98d6f58ab0dafbb86b083a001561bb34885.jpeg\",\"profile060ad92489947d410d897474079c1477973.jpeg\",\"profilee4bb4c5173c2ce17fd8fcd40041c068f917.jpeg\"]', NULL, NULL, NULL, 'PE#42424242', 'Standard', 'No', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '6970319c-1355-47e1-b140-3757474cefbf', '', NULL, '2020-10-17 01:41:41', '2020-10-17 01:41:41'),
(48, '0', 32, 1, 4, 1, 1, 'Materials', 'No', 49, 'dfsdfdsfsf', NULL, 5, 'Liters', NULL, '[\"profile89f0fd5c927d466d6ec9a21b9ac34ffa351.jpeg\",\"profile7504adad8bb96320eb3afdd4df6e1f60938.jpeg\",\"profile5ef059938ba799aaa845e1c2e8a762bd383.jpeg\",\"profile142949df56ea8ae0be8b5306971900a4660.jpeg\"]', NULL, NULL, NULL, 'PE#575757', 'Standard', 'No', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', 'a8a69fd8-1a25-4a6c-b42e-e5e9e081a160', '', NULL, '2020-10-17 01:45:40', '2020-10-17 01:45:40'),
(49, '0', 33, 1, 4, 1, 1, 'Materials', 'No', 50, 'sadfgdj', NULL, 5, 'kg', NULL, '[\"profile287e03db1d99e0ec2edb90d079e142f3472.jpeg\"]', NULL, NULL, NULL, '123', 'Standard', 'Yes', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '4d57ec07-a600-4c95-8e82-12695fc8a5d2', '', NULL, '2020-11-27 07:09:04', '2020-11-27 07:09:04'),
(50, '0', 34, 1, 4, 1, 1, 'Materials', 'No', 51, 'wwww', NULL, 1, '1', NULL, '[\"profilef57a2f557b098c43f11ab969efe1504b939.jpeg\",\"profile38b3eff8baf56627478ec76a704e9b52865.jpeg\",\"profile7f5d04d189dfb634e6a85bb9d9adf21e441.jpeg\",\"profile4f4adcbf8c6f66dcfc8a3282ac2bf10a866.jpeg\"]', NULL, NULL, NULL, '1', 'Standard', 'No', 0, 0, 'No', NULL, 'Request for Proposals Floated', 'Yes', '2', 'b021f968-69e6-4153-a42b-30e4257cc5a8', '', NULL, '2020-12-11 13:48:05', '2020-12-11 15:12:06'),
(51, '0', 35, 1, 4, 1, 1, 'Materials', 'No', 52, 'qwert', NULL, 1, '1', NULL, '[\"profile2050e03ca119580f74cca14cc6e97462919.jpeg\"]', NULL, NULL, NULL, '1', 'Standard', 'Yes', 0, 0, 'No', NULL, 'Request for Proposals Floated', 'Yes', '2', 'e2034f3f-5363-4c8d-9e63-8808e674c14d', '', NULL, '2020-12-11 15:09:16', '2020-12-11 15:12:06'),
(52, 'Yes', 36, 1, 4, 1, 1, 'Materials', 'No', 7, NULL, NULL, 14, NULL, NULL, '[]', NULL, NULL, NULL, '12', 'Standard', 'Yes', 0, 0, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '83b79d8d-f0a3-4bb7-a9d0-afc3e7c80d80', '', NULL, '2021-02-27 11:58:07', '2021-02-27 11:58:07'),
(53, 'Yes', 37, 1, 4, 1, 1, 'Materials', 'No', 6, NULL, NULL, 45, NULL, NULL, '[]', NULL, NULL, NULL, 'SO-2021/45-167', 'Standard', 'Yes', 5, 19, 'No', NULL, 'Purchase Enquiry Line Fully Approved and Sent for Request For Proposal', 'Yes', '2', '251d7d08-1454-43b4-b412-3e353281a0aa', 'Material Catalogue,Testing Certificate,Customers Testimonials', NULL, '2021-02-27 17:54:20', '2021-03-03 11:11:32'),
(54, 'Yes', 38, 1, 4, 1, 1, 'Materials', 'No', 5, NULL, NULL, 6, NULL, NULL, '[]', NULL, NULL, NULL, 'Sales Order - 18/2021', 'Standard', 'Yes', 16, 16, 'No', 'Good to go', 'Purchase Enquiry Line Cancelled by Originator', 'Yes', '0', 'cb254a50-d3df-4e1a-8c35-3bc49bcd20bb', 'Liability Insurance Certificate,Testing Certificate,MSDS - Material Safety Data Sheet', NULL, '2021-03-03 10:32:03', '2021-03-03 10:40:24'),
(55, 'No', 39, 1, 4, 1, 1, 'Materials', 'No', 53, 'Superman', NULL, 56, 'cartons of 12 bottles', NULL, '[\"profile109a0ca3bc27f3e96597370d5c8cf03d830.jpeg\"]', NULL, NULL, NULL, 'SO-67854', 'Standard', 'No', 6, 10, 'No', NULL, 'Created and Assigned to Level 1', 'Yes', '1', '3b113177-b60d-4f2c-b1a4-0bb44fa11335', 'Material Catalogue,Testing Certificate', NULL, '2021-03-03 13:09:11', '2021-03-03 13:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_enquiry_commerical_evaluation_pivot`
--

CREATE TABLE `purchase_enquiry_commerical_evaluation_pivot` (
  `id` int(255) UNSIGNED NOT NULL,
  `commerical_evaluation_id` int(255) UNSIGNED NOT NULL,
  `pe_id` int(255) UNSIGNED NOT NULL,
  `pe_note` text,
  `ce_pe_notes` text,
  `status` varchar(255) DEFAULT 'Commerical Evaluation Submitted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_enquiry_commerical_evaluation_pivot`
--

INSERT INTO `purchase_enquiry_commerical_evaluation_pivot` (`id`, `commerical_evaluation_id`, `pe_id`, `pe_note`, `ce_pe_notes`, `status`) VALUES
(1, 1, 6, NULL, 'Let\'s retender this', 'Send for a New Request for Proposals'),
(2, 2, 5, NULL, NULL, 'Purchase Order Created'),
(3, 2, 6, NULL, NULL, 'Purchase Order Created'),
(4, 3, 7, NULL, NULL, 'Purchase Order Created'),
(5, 3, 8, NULL, NULL, 'Purchase Order Created'),
(6, 3, 9, NULL, NULL, 'Purchase Order Created'),
(7, 3, 10, NULL, NULL, 'Purchase Order Created');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_enquiry_quantity_changes`
--

CREATE TABLE `purchase_enquiry_quantity_changes` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `approver_id` int(255) NOT NULL,
  `pe_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `approval_level` int(255) NOT NULL,
  `old_quantity` float NOT NULL,
  `new_quantity` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_enquiry_vendor_uploaded_docs`
--

CREATE TABLE `purchase_enquiry_vendor_uploaded_docs` (
  `id` int(255) UNSIGNED NOT NULL,
  `pe_id` int(255) UNSIGNED NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `company_id` int(255) UNSIGNED NOT NULL,
  `vendor_user_id` int(255) UNSIGNED NOT NULL,
  `vendor_id` int(255) UNSIGNED NOT NULL,
  `required_doc_name` text NOT NULL,
  `document_name` text NOT NULL,
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_enquiry_vendor_uploaded_docs`
--

INSERT INTO `purchase_enquiry_vendor_uploaded_docs` (`id`, `pe_id`, `quotation_id`, `company_id`, `vendor_user_id`, `vendor_id`, `required_doc_name`, `document_name`, `active`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 1, 1, 'Warranty Certificate', '1572841109_90_Muaz Malas.jpg', 'Yes', '2019-11-03 22:18:29', '2019-11-03 22:18:29'),
(2, 2, 1, 1, 1, 1, 'Warranty Certificate', '1572841134_23_Muaz Malas.jpg', 'Yes', '2019-11-03 22:18:54', '2019-11-03 22:18:54'),
(3, 1, 1, 1, 1, 1, 'Material Catalogue', '1572841139_89_Muaz Malas.jpg', 'Yes', '2019-11-03 22:18:59', '2019-11-03 22:18:59'),
(4, 4, 1, 1, 1, 1, 'Warranty Certificate', '1572841144_83_Muaz Malas.jpg', 'Yes', '2019-11-03 22:19:04', '2019-11-03 22:19:04'),
(5, 3, 1, 1, 5, 2, 'Warranty Certificate', '1572973994_96_349840D8.tmp', 'Yes', '2019-11-05 11:13:14', '2019-11-05 11:13:14'),
(6, 2, 1, 1, 5, 2, 'Warranty Certificate', '1572974013_8_349840D8.tmp', 'Yes', '2019-11-05 11:13:33', '2019-11-05 11:13:33'),
(7, 4, 1, 1, 5, 2, 'Warranty Certificate', '1572974036_50_349840D8.tmp', 'Yes', '2019-11-05 11:13:56', '2019-11-05 11:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(255) UNSIGNED NOT NULL,
  `purchase_order_group_id` int(255) NOT NULL,
  `purchase_order_ingroup_id` int(255) NOT NULL,
  `company_id` int(255) UNSIGNED NOT NULL,
  `project_id` int(255) UNSIGNED NOT NULL,
  `creator_id` int(255) UNSIGNED NOT NULL,
  `commercial_evaluation_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `vendor_id` int(255) UNSIGNED NOT NULL,
  `notes` text,
  `approval_level` varchar(255) DEFAULT NULL,
  `vendor_approved_at` datetime DEFAULT NULL,
  `vendor_notes` text,
  `status` varchar(255) DEFAULT 'Created and Assigned to Level 1',
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `purchase_order_group_id`, `purchase_order_ingroup_id`, `company_id`, `project_id`, `creator_id`, `commercial_evaluation_id`, `quotation_id`, `vendor_id`, `notes`, `approval_level`, `vendor_approved_at`, `vendor_notes`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 13, 2, 3, 1, NULL, '1', NULL, NULL, 'Created and Assigned to Level 1', 'Yes', '2019-11-05 12:54:45', '2019-11-05 12:54:45'),
(2, 2, 2, 1, 1, 13, 2, 3, 2, NULL, '1', NULL, NULL, 'Created and Assigned to Level 1', 'Yes', '2019-11-05 12:55:57', '2019-11-05 12:55:57'),
(3, 3, 3, 1, 1, 13, 3, 4, 1, NULL, '1', NULL, NULL, 'Created and Assigned to Level 1', 'Yes', '2019-11-05 13:35:41', '2019-11-05 13:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_cancellation_requests`
--

CREATE TABLE `purchase_order_cancellation_requests` (
  `id` int(255) UNSIGNED NOT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  `purchase_order_id` int(255) NOT NULL,
  `receipt_note_id` int(255) NOT NULL,
  `canceled_quantity` float NOT NULL,
  `cancellation_reason` text,
  `notes` text,
  `approval_level` varchar(255) NOT NULL DEFAULT '1',
  `status` varchar(255) DEFAULT 'Created Not Approved',
  `active` varchar(45) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_line_rfi_communications`
--

CREATE TABLE `purchase_order_line_rfi_communications` (
  `id` int(255) UNSIGNED NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `po_id` int(255) NOT NULL,
  `pe_id` int(255) NOT NULL,
  `message` text,
  `read_at` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_purchase_enquiries_pivot`
--

CREATE TABLE `purchase_order_purchase_enquiries_pivot` (
  `id` int(255) UNSIGNED NOT NULL,
  `purchase_order_id` int(255) UNSIGNED NOT NULL,
  `purchase_enquiry_id` int(255) UNSIGNED NOT NULL,
  `approval_level` int(255) NOT NULL DEFAULT '1',
  `status` varchar(255) DEFAULT 'Created Not Approved',
  `approval_notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_order_purchase_enquiries_pivot`
--

INSERT INTO `purchase_order_purchase_enquiries_pivot` (`id`, `purchase_order_id`, `purchase_enquiry_id`, `approval_level`, `status`, `approval_notes`) VALUES
(1, 1, 6, 1, 'Created Not Approved', NULL),
(2, 2, 5, 1, 'Created Not Approved', NULL),
(3, 3, 7, 1, 'Created Not Approved', NULL),
(4, 3, 8, 1, 'Created Not Approved', NULL),
(5, 3, 9, 1, 'Created Not Approved', NULL),
(6, 3, 10, 1, 'Created Not Approved', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_quotation_reposnses_pivot`
--

CREATE TABLE `purchase_order_quotation_reposnses_pivot` (
  `id` int(255) UNSIGNED NOT NULL,
  `purchase_order_id` int(255) NOT NULL,
  `quotation_reponse_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_order_quotation_reposnses_pivot`
--

INSERT INTO `purchase_order_quotation_reposnses_pivot` (`id`, `purchase_order_id`, `quotation_reponse_id`) VALUES
(1, 1, 14),
(2, 2, 15),
(3, 3, 17),
(4, 3, 18),
(5, 3, 19),
(6, 3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `quotationrequests_purchaseenquiries`
--

CREATE TABLE `quotationrequests_purchaseenquiries` (
  `id` int(255) UNSIGNED NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `purchase_enquiry_id` int(255) NOT NULL,
  `status` varchar(255) DEFAULT 'Active',
  `note` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotationrequests_purchaseenquiries`
--

INSERT INTO `quotationrequests_purchaseenquiries` (`id`, `quotation_id`, `purchase_enquiry_id`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Active', NULL, NULL, NULL),
(2, 1, 2, 'Active', NULL, NULL, NULL),
(3, 1, 3, 'Active', NULL, NULL, NULL),
(4, 1, 4, 'Active', NULL, NULL, NULL),
(5, 2, 5, 'Purchase Enquiry has no submitted vendor responses', NULL, NULL, NULL),
(6, 2, 6, 'Commercial Evaluation Submitted', NULL, NULL, NULL),
(7, 3, 5, 'Commercial Evaluation Submitted', NULL, NULL, NULL),
(8, 3, 6, 'Commercial Evaluation Submitted', NULL, NULL, NULL),
(9, 4, 7, 'Commercial Evaluation Submitted', NULL, NULL, NULL),
(10, 4, 8, 'Commercial Evaluation Submitted', NULL, NULL, NULL),
(11, 4, 9, 'Commercial Evaluation Submitted', NULL, NULL, NULL),
(12, 4, 10, 'Commercial Evaluation Submitted', NULL, NULL, NULL),
(13, 5, 12, 'Active', NULL, NULL, NULL),
(14, 5, 11, 'Active', NULL, NULL, NULL),
(15, 6, 17, 'Active', NULL, NULL, NULL),
(16, 6, 16, 'Active', NULL, NULL, NULL),
(17, 6, 18, 'Active', NULL, NULL, NULL),
(18, 7, 50, 'Request for Proposals cancelled', NULL, NULL, NULL),
(19, 7, 15, 'Request for Proposals cancelled', NULL, NULL, NULL),
(20, 7, 13, 'Request for Proposals cancelled', NULL, NULL, NULL),
(21, 8, 15, 'Active', NULL, NULL, NULL),
(22, 9, 50, 'Active', NULL, NULL, NULL),
(23, 9, 13, 'Active', NULL, NULL, NULL),
(24, 9, 51, 'Active', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotationrequests_ratecontractsrequests`
--

CREATE TABLE `quotationrequests_ratecontractsrequests` (
  `id` int(255) UNSIGNED NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `rate_contract_request_id` int(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quotationrequests_vendors`
--

CREATE TABLE `quotationrequests_vendors` (
  `id` int(255) UNSIGNED NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `status` varchar(255) DEFAULT 'Quotation Not Yet Viewed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotationrequests_vendors`
--

INSERT INTO `quotationrequests_vendors` (`id`, `vendor_id`, `quotation_id`, `company_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Offer will be submitted', NULL, NULL),
(2, 2, 1, 1, 'Offer will be submitted', NULL, NULL),
(3, 1, 2, 1, 'Commercial Evaluation Submitted', NULL, NULL),
(4, 2, 2, 1, 'Commercial Evaluation Submitted', NULL, NULL),
(5, 1, 3, 1, 'Commercial Evaluation Submitted', NULL, NULL),
(6, 2, 3, 1, 'Commercial Evaluation Submitted', NULL, NULL),
(7, 1, 4, 1, 'Commercial Evaluation Submitted', NULL, NULL),
(8, 4, 5, 1, 'Request for Proposals Not Yet Viewed', NULL, NULL),
(9, 4, 6, 1, 'Request for Proposals Not Yet Viewed', NULL, NULL),
(10, 4, 7, 1, 'Request for Proposals Not Yet Viewed', NULL, NULL),
(11, 3, 8, 1, 'Request for Proposals Not Yet Viewed', NULL, NULL),
(12, 3, 9, 1, 'Request for Proposals Not Yet Viewed', NULL, NULL),
(13, 4, 9, 1, 'Request for Proposals Not Yet Viewed', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_commerical_evaluations`
--

CREATE TABLE `quotation_commerical_evaluations` (
  `id` int(255) UNSIGNED NOT NULL,
  `commerical_evaluation_group_id` int(255) NOT NULL,
  `commerical_evaluation_ingroup_id` int(255) NOT NULL,
  `evaluator_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `quotation_notes` text,
  `status` varchar(255) DEFAULT 'Commerical Evaluation Submitted',
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_commerical_evaluations`
--

INSERT INTO `quotation_commerical_evaluations` (`id`, `commerical_evaluation_group_id`, `commerical_evaluation_ingroup_id`, `evaluator_id`, `company_id`, `quotation_id`, `quotation_notes`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 12, 1, 2, 'Let\'s do the CE', 'Commercial Evaluation fully executed', 'Yes', '2019-11-05 12:12:21', '2019-11-05 12:17:44'),
(2, 2, 2, 12, 1, 3, 'Let\'s proceed with the CE', 'Commercial Evaluation fully executed', 'Yes', '2019-11-05 12:49:04', '2019-11-05 12:55:57'),
(3, 3, 3, 12, 1, 4, 'Let\'s do the CE', 'Commercial Evaluation fully executed', 'Yes', '2019-11-05 13:28:06', '2019-11-05 13:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_pe_rfi_communication`
--

CREATE TABLE `quotation_pe_rfi_communication` (
  `id` int(255) UNSIGNED NOT NULL,
  `vendor_user_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `user_type` varchar(45) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `pe_id` int(255) NOT NULL,
  `reply_id` int(255) DEFAULT NULL,
  `message` text,
  `read_at` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_rc_rfi_communication`
--

CREATE TABLE `quotation_rc_rfi_communication` (
  `id` int(255) UNSIGNED NOT NULL,
  `vendor_user_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `user_type` varchar(45) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `rc_id` int(255) NOT NULL,
  `reply_id` int(255) DEFAULT NULL,
  `message` text,
  `read_at` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_requests`
--

CREATE TABLE `quotation_requests` (
  `id` int(255) UNSIGNED NOT NULL,
  `quotation_group_id` int(255) NOT NULL,
  `quotation_ingroup_id` int(255) NOT NULL,
  `rfp_name` text,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  `quotation_type` varchar(45) NOT NULL,
  `quotation_for` varchar(45) NOT NULL DEFAULT 'PE',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime NOT NULL,
  `sourcing_type` varchar(45) NOT NULL,
  `rfi_start_date` datetime DEFAULT NULL,
  `rfi_end_date` datetime DEFAULT NULL,
  `cancellation_notes` text,
  `status` varchar(45) DEFAULT 'RFQ Floated',
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_requests`
--

INSERT INTO `quotation_requests` (`id`, `quotation_group_id`, `quotation_ingroup_id`, `rfp_name`, `created_by`, `company_id`, `project_id`, `quotation_type`, `quotation_for`, `start_date`, `end_date`, `sourcing_type`, `rfi_start_date`, `rfi_end_date`, `cancellation_notes`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Testing Tender 3', 12, 1, 1, 'Materials', 'PE', '2019-11-02 00:00:00', '2019-11-09 23:59:59', 'Sealed Bid', '2019-11-02 00:00:00', '2019-11-07 23:59:59', NULL, 'Request for Proposals Floated', 'Yes', '2019-11-02 05:12:29', '2019-11-02 05:17:03'),
(2, 2, 2, 'Testing 2 (1 line without bids)', 12, 1, 1, 'Materials', 'PE', '2019-11-05 00:00:00', '2019-11-15 23:59:59', 'Sealed Bid', '2019-11-05 00:00:00', '2019-11-14 23:59:59', NULL, 'Commercial Evaluation Submitted', 'Yes', '2019-11-05 12:04:44', '2019-11-05 12:12:21'),
(3, 3, 3, 'Test 3', 12, 1, 1, 'Materials', 'PE', '2019-11-05 00:00:00', '2019-11-14 23:59:59', 'Sealed Bid', '2019-11-06 00:00:00', '2019-11-12 23:59:59', NULL, 'Commercial Evaluation SubmittedCommercial Eva', 'Yes', '2019-11-05 12:21:50', '2019-11-05 12:49:04'),
(4, 4, 4, 'testing 4', 12, 1, 1, 'Materials', 'PE', '2019-11-05 00:00:00', '2019-11-15 23:59:59', 'Sealed Bid', '2019-11-06 00:00:00', '2019-11-14 23:59:59', NULL, 'Commercial Evaluation Submitted', 'Yes', '2019-11-05 13:20:06', '2019-11-05 13:28:06'),
(5, 5, 5, 'zdfasd', 12, 1, 1, 'Materials', 'PE', '2020-12-11 00:00:00', '2021-01-29 23:59:59', 'Sealed Bid', '2020-12-18 00:00:00', '2021-01-13 23:59:59', NULL, 'Request for Proposals Queued', 'Yes', '2020-12-10 21:38:39', '2020-12-10 21:38:39'),
(6, 6, 6, 'ww', 12, 1, 1, 'Materials', 'PE', '2020-12-11 00:00:00', '2021-01-29 23:59:59', 'Sealed Bid', '2020-12-15 00:00:00', '2021-01-22 23:59:59', NULL, 'Request for Proposals Queued', 'Yes', '2020-12-10 21:50:58', '2020-12-10 21:50:58'),
(7, 7, 7, 'sd', 12, 1, 1, 'Materials', 'PE', '2020-12-17 00:00:00', '2021-01-22 23:59:59', 'Sealed Bid', '2020-12-23 00:00:00', '2021-01-14 23:59:59', 'asdfghj', 'Request for Proposals cancelled', 'Yes', '2020-12-11 14:21:47', '2020-12-11 14:24:18'),
(8, 8, 8, 'sdf', 12, 1, 1, 'Materials', 'PE', '2020-12-16 00:00:00', '2021-01-20 23:59:59', 'Sealed Bid', '2020-12-23 00:00:00', '2021-01-20 23:59:59', NULL, 'Request for Proposals Queued', 'Yes', '2020-12-11 14:33:24', '2020-12-11 14:33:24'),
(9, 9, 9, 'sdf', 12, 1, 1, 'Materials', 'PE', '2020-12-12 00:00:00', '2021-01-27 23:59:59', 'Sealed Bid', '2020-12-16 00:00:00', '2021-01-21 23:59:59', NULL, 'Request for Proposals Queued', 'Yes', '2020-12-11 15:12:06', '2020-12-11 15:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_responses`
--

CREATE TABLE `quotation_responses` (
  `id` int(255) UNSIGNED NOT NULL,
  `response_by` int(255) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `purchase_enquiry_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `unit_rate` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `lead_days` int(255) DEFAULT NULL,
  `advanced_percentage` float DEFAULT NULL,
  `validity_date` datetime DEFAULT NULL,
  `notes` text,
  `uploaded_files` text,
  `status` varchar(45) NOT NULL DEFAULT 'FABO',
  `active` varchar(45) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_responses`
--

INSERT INTO `quotation_responses` (`id`, `response_by`, `vendor_id`, `company_id`, `purchase_enquiry_id`, `quotation_id`, `unit_rate`, `price`, `currency`, `lead_days`, `advanced_percentage`, `validity_date`, `notes`, `uploaded_files`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 10, 1340, 'USD', 7, 0, '2019-12-04 08:22:02', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-03 22:22:31', '2019-11-03 22:22:31'),
(2, 1, 1, 1, 2, 1, 10, 1050, 'USD', 7, 0, '2019-12-04 08:22:02', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-03 22:22:31', '2019-11-03 22:22:31'),
(3, 1, 1, 1, 3, 1, 10, 670, 'USD', 7, 0, '2019-12-04 08:22:02', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-03 22:22:31', '2019-11-03 22:22:31'),
(4, 1, 1, 1, 4, 1, 10, 350, 'USD', 7, 0, '2019-12-04 08:22:02', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-03 22:22:31', '2019-11-03 22:22:31'),
(5, 5, 2, 1, 1, 1, NULL, NULL, 'USD', NULL, 0, '2020-01-04 21:15:10', NULL, 'DocsUploadRequired', 'FABO', 'Yes', '2019-11-05 11:15:35', '2019-11-05 11:15:35'),
(6, 5, 2, 1, 2, 1, 150, 15750, 'USD', 17, 10, '2020-01-04 21:15:10', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 11:15:35', '2019-11-05 11:15:35'),
(7, 5, 2, 1, 3, 1, 107, 7169, 'USD', 7, 0, '2020-01-04 21:15:10', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 11:15:35', '2019-11-05 11:15:35'),
(8, 5, 2, 1, 4, 1, 67, 2345, 'USD', 10, 21, '2020-01-04 21:15:10', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 11:15:35', '2019-11-05 11:15:35'),
(9, 1, 1, 1, 5, 2, NULL, NULL, 'USD', NULL, 0, '2019-12-20 22:06:41', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 12:07:21', '2019-11-05 12:07:21'),
(10, 1, 1, 1, 6, 2, 175, 15750, 'USD', 9, 10, '2019-12-20 22:06:41', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 12:07:21', '2019-11-05 12:07:21'),
(11, 5, 2, 1, 5, 2, NULL, NULL, 'USD', NULL, 0, '2019-12-05 22:08:07', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 12:09:05', '2019-11-05 12:09:05'),
(12, 5, 2, 1, 6, 2, 169, 15210, 'USD', 19, 11, '2019-12-05 22:08:07', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 12:09:05', '2019-11-05 12:09:05'),
(13, 1, 1, 1, 5, 3, 156, 23400, 'USD', 18, 15, '2020-01-04 22:27:21', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 12:27:29', '2019-11-05 12:27:29'),
(14, 1, 1, 1, 6, 3, 185, 16650, 'USD', 11, 10, '2020-01-04 22:27:21', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 12:27:29', '2019-11-05 12:27:29'),
(15, 5, 2, 1, 5, 3, 156, 23400, 'USD', 25, 9.2, '2019-12-20 22:29:12', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 12:29:50', '2019-11-05 12:29:50'),
(16, 5, 2, 1, 6, 3, 189, 17010, 'USD', 20, 8.5, '2019-12-20 22:29:12', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 12:29:50', '2019-11-05 12:29:50'),
(17, 1, 1, 1, 7, 4, 289, 5491, 'USD', 30, 10, '2020-01-04 23:23:19', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 13:23:38', '2019-11-05 13:23:38'),
(18, 1, 1, 1, 8, 4, 359, 16155, 'USD', 25, 20, '2020-01-04 23:23:19', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 13:23:38', '2019-11-05 13:23:38'),
(19, 1, 1, 1, 9, 4, 419, 27235, 'USD', 25, 20, '2020-01-04 23:23:19', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 13:23:38', '2019-11-05 13:23:38'),
(20, 1, 1, 1, 10, 4, 342, 33516, 'USD', 30, 10, '2020-01-04 23:23:19', NULL, 'NoUploadsRequired', 'FABO', 'Yes', '2019-11-05 13:23:38', '2019-11-05 13:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_response_tracker`
--

CREATE TABLE `quotation_response_tracker` (
  `id` int(255) UNSIGNED NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_response_tracker`
--

INSERT INTO `quotation_response_tracker` (`id`, `vendor_id`, `quotation_id`, `company_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'FABO Submitted', '2019-11-02 05:12:29', '2019-11-03 22:22:31'),
(2, 2, 1, 1, 'FABO Submitted', '2019-11-02 05:12:29', '2019-11-05 11:15:35'),
(3, 1, 2, 1, 'FABO Submitted', '2019-11-05 12:04:44', '2019-11-05 12:07:21'),
(4, 2, 2, 1, 'FABO Submitted', '2019-11-05 12:04:44', '2019-11-05 12:09:05'),
(5, 1, 3, 1, 'FABO Submitted', '2019-11-05 12:21:50', '2019-11-05 12:27:29'),
(6, 2, 3, 1, 'FABO Submitted', '2019-11-05 12:21:50', '2019-11-05 12:29:50'),
(7, 1, 4, 1, 'FABO Submitted', '2019-11-05 13:20:06', '2019-11-05 13:23:38'),
(8, 4, 5, 1, 'Request for Proposals Not Yet Viewed', '2020-12-10 21:38:39', '2020-12-10 21:38:39'),
(9, 4, 6, 1, 'Request for Proposals Not Yet Viewed', '2020-12-10 21:50:58', '2020-12-10 21:50:58'),
(10, 4, 7, 1, 'Request for Proposals Not Yet Viewed', '2020-12-11 14:21:47', '2020-12-11 14:21:47'),
(11, 3, 8, 1, 'Request for Proposals Not Yet Viewed', '2020-12-11 14:33:24', '2020-12-11 14:33:24'),
(12, 3, 9, 1, 'Request for Proposals Not Yet Viewed', '2020-12-11 15:12:06', '2020-12-11 15:12:06'),
(13, 4, 9, 1, 'Request for Proposals Not Yet Viewed', '2020-12-11 15:12:06', '2020-12-11 15:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `rate_contracts`
--

CREATE TABLE `rate_contracts` (
  `id` int(255) UNSIGNED NOT NULL,
  `rate_contract_group_id` int(255) NOT NULL,
  `rate_contract_ingroup_id` int(255) NOT NULL,
  `company_id` int(255) UNSIGNED NOT NULL,
  `project_id` int(255) UNSIGNED NOT NULL,
  `creator_id` int(255) UNSIGNED NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `vendor_id` int(255) UNSIGNED NOT NULL,
  `notes` text,
  `approval_level` varchar(255) DEFAULT NULL,
  `vendor_approved_at` datetime DEFAULT NULL,
  `vendor_notes` text,
  `status` varchar(255) NOT NULL DEFAULT 'Created Not Approved',
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_contract_line_rfi_communications`
--

CREATE TABLE `rate_contract_line_rfi_communications` (
  `id` int(255) UNSIGNED NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `rc_id` int(255) NOT NULL,
  `rcr_id` int(255) NOT NULL,
  `message` text,
  `read_at` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_contract_quotation_responses`
--

CREATE TABLE `rate_contract_quotation_responses` (
  `id` int(255) UNSIGNED NOT NULL,
  `response_by` int(255) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `item_id` int(255) NOT NULL,
  `rate_contract_request_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `unit_rate` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `lead_days` int(255) DEFAULT NULL,
  `advanced_percentage` float DEFAULT NULL,
  `validity_date` datetime DEFAULT NULL,
  `notes` text,
  `uploaded_files` text,
  `status` varchar(45) NOT NULL DEFAULT 'FABO',
  `active` varchar(45) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_contract_rate_contract_quotation_responses_pivot`
--

CREATE TABLE `rate_contract_rate_contract_quotation_responses_pivot` (
  `id` int(255) UNSIGNED NOT NULL,
  `rate_contract_id` int(255) NOT NULL,
  `rate_contract_quotation_response_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_contract_rate_contract_request_pivot`
--

CREATE TABLE `rate_contract_rate_contract_request_pivot` (
  `id` int(255) UNSIGNED NOT NULL,
  `rate_contract_id` int(255) UNSIGNED NOT NULL,
  `rate_contract_request_id` int(255) UNSIGNED NOT NULL,
  `approval_level` int(255) NOT NULL DEFAULT '1',
  `status` varchar(255) DEFAULT 'Created Not Approved',
  `approval_notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_contract_requests`
--

CREATE TABLE `rate_contract_requests` (
  `id` int(255) UNSIGNED NOT NULL,
  `rate_contract_request_group_id` int(255) NOT NULL,
  `rate_contract_request_ingroup_id` int(255) NOT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) DEFAULT NULL,
  `project_id` int(255) DEFAULT NULL,
  `item_id` int(255) DEFAULT NULL,
  `item_description` text,
  `rc_start_period` datetime DEFAULT NULL,
  `rc_end_period` datetime DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `u_o_m` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `location_name` text,
  `advanced_payment` varchar(255) DEFAULT NULL,
  `notes` text,
  `status` varchar(255) NOT NULL DEFAULT 'Created and Assigned to Level 1',
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `approval_level` varchar(255) NOT NULL DEFAULT '1',
  `grouping_id` text NOT NULL,
  `required_documents` text,
  `po_vendor_id` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_contract_request_commerical_evaluation_pivot`
--

CREATE TABLE `rate_contract_request_commerical_evaluation_pivot` (
  `id` int(255) UNSIGNED NOT NULL,
  `commerical_evaluation_id` int(255) UNSIGNED NOT NULL,
  `rc_id` int(255) UNSIGNED NOT NULL,
  `rc_note` text,
  `status` varchar(255) DEFAULT 'Commerical Evaluation Submitted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_contract_request_quantity_changes`
--

CREATE TABLE `rate_contract_request_quantity_changes` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `approver_id` int(255) NOT NULL,
  `pe_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `approval_level` int(255) NOT NULL,
  `old_quantity` float NOT NULL,
  `new_quantity` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_contract_request_vendor_uploaded_docs`
--

CREATE TABLE `rate_contract_request_vendor_uploaded_docs` (
  `id` int(255) UNSIGNED NOT NULL,
  `rc_id` int(255) UNSIGNED NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `company_id` int(255) UNSIGNED NOT NULL,
  `vendor_user_id` int(255) UNSIGNED NOT NULL,
  `vendor_id` int(255) UNSIGNED NOT NULL,
  `required_doc_name` text NOT NULL,
  `document_name` text NOT NULL,
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_notes`
--

CREATE TABLE `receipt_notes` (
  `id` int(255) UNSIGNED NOT NULL,
  `receipt_note_group_id` int(255) NOT NULL,
  `receipt_note_ingroup_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  `pe_id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `po_id` int(255) NOT NULL,
  `quotation_response_id` int(255) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `quantity_to_be_received` float NOT NULL,
  `invoicing_status` varchar(255) DEFAULT 'Invoice Not Submitted',
  `status` varchar(255) DEFAULT 'Not Yet Shipped',
  `active` varchar(45) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_note_receivings`
--

CREATE TABLE `receipt_note_receivings` (
  `id` int(255) UNSIGNED NOT NULL,
  `rn_receiving_group_id` int(255) NOT NULL,
  `rn_receiving_ingroup_id` int(255) NOT NULL,
  `received_by` int(255) NOT NULL,
  `rn_id` int(255) NOT NULL,
  `received_quantity` float NOT NULL,
  `value_of_received_quantity` float NOT NULL,
  `quantity_to_complete_receiving` float NOT NULL,
  `receiving_rentention_amount` float NOT NULL DEFAULT '0',
  `note` text,
  `current_approval_level` int(255) NOT NULL DEFAULT '1',
  `received_by_store` varchar(45) NOT NULL DEFAULT 'No',
  `received_by_store_user_id` int(255) DEFAULT NULL,
  `received_by_store_at` datetime DEFAULT NULL,
  `received_by_store_notes` text,
  `status` varchar(255) DEFAULT 'Received Not Approved',
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_note_receiving_invoices`
--

CREATE TABLE `receipt_note_receiving_invoices` (
  `id` int(255) UNSIGNED NOT NULL,
  `invoice_validated_by` int(255) DEFAULT NULL,
  `company_id` int(255) NOT NULL,
  `vendor_user_id` int(255) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `rn_id` int(255) NOT NULL,
  `max_invoicable_amount` float NOT NULL,
  `invoice_amount` float NOT NULL,
  `vendor_doc_name` text NOT NULL,
  `document_safe_name` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Invoice Uploaded',
  `active` varchar(45) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recommends`
--

CREATE TABLE `recommends` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_id` bigint(20) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recommends`
--

INSERT INTO `recommends` (`id`, `name`, `email`, `ref_id`, `description`, `created_at`, `updated_at`) VALUES
(4, 'umer', 'test1@test.com', 4, 'newuser', '2020-09-04 21:03:19', '2020-09-04 21:03:19'),
(5, 'umer bilal', 'umerbilal.leo@gmail.com', 4, 'new user', '2020-09-04 23:21:11', '2020-09-04 23:21:11'),
(6, 'farooq', 'farooq@stackbuffers.com', 4, 'hellow', '2020-09-06 18:56:07', '2020-09-06 18:56:07'),
(7, 'abc', 'test123@test.com', 5, 'dfsdfsd', '2020-10-05 05:46:51', '2020-10-05 05:46:51'),
(10, 'Samad', 'ansarisamad360@gamil.com', 339, 'this is testing', '2020-12-09 12:36:48', '2020-12-09 12:36:48'),
(11, 'samad', 'ansarisamad360@gmail.com', 339, 'qwerqweerqwer', '2020-12-09 12:38:01', '2020-12-09 12:38:01'),
(12, 'samad', 'ansarismaad360@gmail.com', 339, 'asldfjl', '2020-12-09 12:59:37', '2020-12-09 12:59:37'),
(15, 'smad', 'ansarisamad360@gmail.com', 339, 'ljlkj', '2020-12-09 13:02:49', '2020-12-09 13:02:49'),
(16, 'samad', 'ansarisamad360@gamil.com', 339, 'aldkjflakj', '2020-12-09 13:04:30', '2020-12-09 13:04:30'),
(18, 'samad', 'ansarisamad360@gmail.com', 339, 'alsdfjalsdkj', '2020-12-09 13:07:26', '2020-12-09 13:07:26'),
(19, 'ssamad', 'ansarisamad360@gmail.com', 339, 'alsdjfalsdkjf', '2020-12-09 13:16:39', '2020-12-09 13:16:39'),
(20, 'samad', 'ansarisamad360@gmail.com', 339, 'aldsjf', '2020-12-09 13:20:01', '2020-12-09 13:20:01'),
(30, 'smada', 'abdulsammadyounas@gmail.com', 339, 'asldfjalsdfjl', '2020-12-09 13:45:21', '2020-12-09 13:45:21'),
(31, 'samad', 'ansarisamad360@gmail.com', 339, 'aldskjfalsdjflaj', '2020-12-09 13:46:33', '2020-12-09 13:46:33'),
(32, 'Nouman Malik', 'mightylover84@gmail.com', 339, 'this is testing mails', '2020-12-09 13:47:55', '2020-12-09 13:47:55'),
(33, 'samd', 'ansarisamad360@gmail.com', 12, 'abc', '2020-12-10 11:56:00', '2020-12-10 11:56:00'),
(34, 'smad', 'ansarisamad360@gmail.com', 12, 'adsfasdf', '2020-12-10 11:59:09', '2020-12-10 11:59:09'),
(62, 'smad', 'ansarisamad360@gmail.com', 12, 'sldkfjalsdkjf', '2020-12-10 21:23:12', '2020-12-10 21:23:12'),
(63, 'samad', 'abdulsammadyounas+1@gmail.com', 12, 'alskdjfalsdkjf', '2020-12-10 21:25:41', '2020-12-10 21:25:41'),
(64, 'samad', 'ansarisamad360@gmail.com', 12, 'alsdjfalsdkjf', '2020-12-10 21:27:55', '2020-12-10 21:27:55'),
(65, 'samad', 'ansarisamad360@gmail.com', 12, 'alsdkjfalsdkjf', '2020-12-10 21:30:16', '2020-12-10 21:30:16'),
(66, 'nouman', 'mightylover84@gmail.com', 339, 'adfasdfasd', '2020-12-11 13:15:27', '2020-12-11 13:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(255) NOT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) DEFAULT NULL,
  `project_id` int(255) DEFAULT NULL,
  `user_id` int(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_level` int(255) NOT NULL,
  `ended_at` datetime DEFAULT NULL,
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `created_by`, `company_id`, `project_id`, `user_id`, `role_name`, `role_level`, `ended_at`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 1, 'SAD', 1, NULL, 'Yes', '2019-06-27 17:37:44', '2019-06-27 17:37:44'),
(2, 1, 1, NULL, 2, 'CAD', 1, NULL, 'Yes', '2019-06-28 02:24:18', '2019-06-29 09:26:09'),
(3, 2, 1, 1, 3, 'CAD', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(4, 2, 1, 1, 4, 'PRO', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(5, 2, 1, 1, 5, 'PRV', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(6, 2, 1, 1, 6, 'PRV', 2, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(7, 2, 1, 1, 7, 'ALMR', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(8, 2, 1, 1, 8, 'LMA', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(9, 2, 1, 1, 9, 'ALMV', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(10, 2, 1, 1, 10, 'ALMV', 2, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(11, 2, 1, 1, 11, 'ALMV', 3, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(12, 2, 1, 1, 12, 'RFQM', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(13, 2, 1, 1, 13, 'POO', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(14, 2, 1, 1, 14, 'POV', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(15, 2, 1, 1, 15, 'POV', 2, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(16, 2, 1, 1, 16, 'POV', 3, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(17, 2, 1, 1, 17, 'RNO', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(18, 2, 1, 1, 18, 'RNV', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(19, 2, 1, 1, 19, 'RNV', 2, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(20, 2, 1, 1, 20, 'RNV', 3, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(21, 2, 1, 1, 21, 'SLM', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(22, 2, 1, 1, 22, 'RCCO', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(23, 2, 1, 1, 23, 'RCCV', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(24, 2, 1, 1, 24, 'RCCV', 2, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(25, 2, 1, 1, 25, 'RCCV', 3, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(26, 2, 1, 1, 26, 'RCO', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(27, 2, 1, 1, 27, 'RCV', 1, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(28, 2, 1, 1, 28, 'RCV', 2, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(29, 2, 1, 1, 29, 'RCV', 3, NULL, 'Yes', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(30, 1, NULL, NULL, 31, 'CAD', 1, NULL, 'Yes', '2019-06-29 12:59:07', '2019-06-29 12:59:07'),
(32, 1, 7, NULL, 33, 'CAD', 1, NULL, 'Yes', '2019-07-06 10:38:09', '2020-09-28 21:00:09'),
(35, 34, 2, 2, 35, 'PRO', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(37, 34, 2, 2, 36, 'PRV', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(39, 34, 2, 2, 37, 'PRV', 2, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(42, 34, 2, 2, 38, 'ALMR', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(44, 34, 2, 2, 39, 'LMA', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(46, 34, 2, 2, 40, 'ALMV', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(47, 34, 2, 2, 41, 'ALMV', 2, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(50, 34, 2, 2, 42, 'RFQM', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(52, 34, 2, 2, 43, 'POO', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(54, 34, 2, 2, 44, 'POV', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(55, 34, 2, 2, 45, 'POV', 2, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(58, 34, 2, 2, 46, 'RNO', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(59, 34, 2, 2, 47, 'RNV', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(61, 34, 2, 2, 48, 'RNV', 2, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(64, 34, 2, 2, 49, 'SLM', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(65, 34, 2, 2, 50, 'INV', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(68, 34, 2, 2, 51, 'RCCO', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(69, 34, 2, 2, 52, 'RCCV', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(71, 34, 2, 2, 53, 'RCCV', 2, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(74, 34, 2, 2, 54, 'RCO', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(75, 34, 2, 2, 55, 'RCV', 1, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(77, 34, 2, 2, 56, 'RCV', 2, NULL, 'Yes', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(81, 34, 2, 3, 35, 'PRO', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(83, 34, 2, 3, 35, 'PRO', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(85, 34, 2, 3, 36, 'PRV', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(87, 34, 2, 3, 36, 'PRV', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(89, 34, 2, 3, 37, 'PRV', 2, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(91, 34, 2, 3, 37, 'PRV', 2, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(94, 34, 2, 3, 38, 'ALMR', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(96, 34, 2, 3, 38, 'ALMR', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(98, 34, 2, 3, 39, 'LMA', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(100, 34, 2, 3, 39, 'LMA', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(102, 34, 2, 3, 40, 'ALMV', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(104, 34, 2, 3, 40, 'ALMV', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(105, 34, 2, 3, 41, 'ALMV', 2, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(107, 34, 2, 3, 41, 'ALMV', 2, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(110, 34, 2, 3, 42, 'RFQM', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(112, 34, 2, 3, 42, 'RFQM', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(114, 34, 2, 3, 43, 'POO', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(116, 34, 2, 3, 43, 'POO', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(118, 34, 2, 3, 44, 'POV', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(120, 34, 2, 3, 44, 'POV', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(121, 34, 2, 3, 45, 'POV', 2, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(123, 34, 2, 3, 45, 'POV', 2, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(126, 34, 2, 3, 46, 'RNO', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(128, 34, 2, 3, 46, 'RNO', 1, NULL, 'Yes', '2019-07-06 14:28:06', '2019-07-06 14:28:06'),
(129, 34, 2, 3, 47, 'RNV', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(131, 34, 2, 3, 47, 'RNV', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(133, 34, 2, 3, 48, 'RNV', 2, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(135, 34, 2, 3, 48, 'RNV', 2, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(138, 34, 2, 3, 49, 'SLM', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(140, 34, 2, 3, 49, 'SLM', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(141, 34, 2, 3, 50, 'INV', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(143, 34, 2, 3, 50, 'INV', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(146, 34, 2, 3, 51, 'RCCO', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(148, 34, 2, 3, 51, 'RCCO', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(149, 34, 2, 3, 52, 'RCCV', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(151, 34, 2, 3, 52, 'RCCV', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(153, 34, 2, 3, 53, 'RCCV', 2, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(155, 34, 2, 3, 53, 'RCCV', 2, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(158, 34, 2, 3, 54, 'RCO', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(160, 34, 2, 3, 54, 'RCO', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(161, 34, 2, 3, 55, 'RCV', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(163, 34, 2, 3, 55, 'RCV', 1, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(165, 34, 2, 3, 56, 'RCV', 2, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(167, 34, 2, 3, 56, 'RCV', 2, NULL, 'Yes', '2019-07-06 14:28:07', '2019-07-06 14:28:07'),
(170, 34, 3, 4, 35, 'PRO', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(172, 34, 3, 4, 36, 'PRV', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(174, 34, 3, 4, 37, 'PRV', 2, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(177, 34, 3, 4, 38, 'ALMR', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(179, 34, 3, 4, 39, 'LMA', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(181, 34, 3, 4, 40, 'ALMV', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(182, 34, 3, 4, 41, 'ALMV', 2, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(185, 34, 3, 4, 42, 'RFQM', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(187, 34, 3, 4, 43, 'POO', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(189, 34, 3, 4, 44, 'POV', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(190, 34, 3, 4, 45, 'POV', 2, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(193, 34, 3, 4, 46, 'RNO', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(194, 34, 3, 4, 47, 'RNV', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(196, 34, 3, 4, 48, 'RNV', 2, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(199, 34, 3, 4, 49, 'SLM', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(200, 34, 3, 4, 50, 'INV', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(203, 34, 3, 4, 51, 'RCCO', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(204, 34, 3, 4, 52, 'RCCV', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(206, 34, 3, 4, 53, 'RCCV', 2, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(209, 34, 3, 4, 54, 'RCO', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(210, 34, 3, 4, 55, 'RCV', 1, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(212, 34, 3, 4, 56, 'RCV', 2, NULL, 'Yes', '2019-07-06 14:28:10', '2019-07-06 14:28:10'),
(216, 34, 3, 5, 35, 'PRO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(218, 34, 3, 5, 35, 'PRO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(220, 34, 3, 5, 36, 'PRV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(222, 34, 3, 5, 36, 'PRV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(224, 34, 3, 5, 37, 'PRV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(226, 34, 3, 5, 37, 'PRV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(229, 34, 3, 5, 38, 'ALMR', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(231, 34, 3, 5, 38, 'ALMR', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(233, 34, 3, 5, 39, 'LMA', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(235, 34, 3, 5, 39, 'LMA', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(237, 34, 3, 5, 40, 'ALMV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(239, 34, 3, 5, 40, 'ALMV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(240, 34, 3, 5, 41, 'ALMV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(242, 34, 3, 5, 41, 'ALMV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(245, 34, 3, 5, 42, 'RFQM', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(247, 34, 3, 5, 42, 'RFQM', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(249, 34, 3, 5, 43, 'POO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(251, 34, 3, 5, 43, 'POO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(253, 34, 3, 5, 44, 'POV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(255, 34, 3, 5, 44, 'POV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(256, 34, 3, 5, 45, 'POV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(258, 34, 3, 5, 45, 'POV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(261, 34, 3, 5, 46, 'RNO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(263, 34, 3, 5, 46, 'RNO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(264, 34, 3, 5, 47, 'RNV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(266, 34, 3, 5, 47, 'RNV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(268, 34, 3, 5, 48, 'RNV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(270, 34, 3, 5, 48, 'RNV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(273, 34, 3, 5, 49, 'SLM', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(275, 34, 3, 5, 49, 'SLM', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(276, 34, 3, 5, 50, 'INV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(278, 34, 3, 5, 50, 'INV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(281, 34, 3, 5, 51, 'RCCO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(283, 34, 3, 5, 51, 'RCCO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(284, 34, 3, 5, 52, 'RCCV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(286, 34, 3, 5, 52, 'RCCV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(288, 34, 3, 5, 53, 'RCCV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(290, 34, 3, 5, 53, 'RCCV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(293, 34, 3, 5, 54, 'RCO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(295, 34, 3, 5, 54, 'RCO', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(296, 34, 3, 5, 55, 'RCV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(298, 34, 3, 5, 55, 'RCV', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(300, 34, 3, 5, 56, 'RCV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(302, 34, 3, 5, 56, 'RCV', 2, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(304, 1, NULL, NULL, 32, 'CAD', 1, NULL, 'Yes', '2019-07-06 14:28:12', '2019-07-06 14:28:12'),
(306, 1, 3, 4, 34, 'CAD', 1, NULL, 'Yes', '2019-07-06 12:35:54', '2019-07-06 12:35:54'),
(307, 1, 3, 5, 34, 'CAD', 1, NULL, 'Yes', '2019-07-06 12:35:54', '2019-07-06 12:35:54'),
(308, 1, NULL, NULL, 57, 'CAD', 1, NULL, 'Yes', '2019-07-24 14:26:47', '2019-07-24 14:26:47'),
(309, 1, 4, NULL, 58, 'CAD', 1, NULL, 'Yes', '2019-09-07 02:27:04', '2019-09-07 03:10:57'),
(310, 58, 4, 6, 58, 'CAD', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(311, 58, 4, 6, 59, 'PRO', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(312, 58, 4, 6, 58, 'PRV', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(313, 58, 4, 6, 59, 'PRV', 2, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(314, 58, 4, 6, 59, 'ALMR', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(315, 58, 4, 6, 60, 'ALMR', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(316, 58, 4, 6, 58, 'ALMR', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(317, 58, 4, 6, 59, 'LMA', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(318, 58, 4, 6, 60, 'ALMV', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(319, 58, 4, 6, 60, 'RFQM', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(320, 58, 4, 6, 60, 'POO', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(321, 58, 4, 6, 59, 'POV', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(322, 58, 4, 6, 60, 'RNO', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(323, 58, 4, 6, 58, 'RNV', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(324, 58, 4, 6, 58, 'SLM', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(325, 58, 4, 6, 59, 'INV', 1, NULL, 'Yes', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(326, 58, 4, 7, 58, 'CAD', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(327, 58, 4, 7, 58, 'CAD', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(328, 58, 4, 7, 59, 'PRO', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(329, 58, 4, 7, 59, 'PRO', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(330, 58, 4, 7, 58, 'PRV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(331, 58, 4, 7, 58, 'PRV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(332, 58, 4, 7, 59, 'PRV', 2, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(333, 58, 4, 7, 59, 'PRV', 2, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(334, 58, 4, 7, 59, 'ALMR', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(335, 58, 4, 7, 60, 'ALMR', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(336, 58, 4, 7, 58, 'ALMR', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(337, 58, 4, 7, 59, 'ALMR', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(338, 58, 4, 7, 60, 'ALMR', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(339, 58, 4, 7, 58, 'ALMR', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(340, 58, 4, 7, 59, 'LMA', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(341, 58, 4, 7, 59, 'LMA', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(342, 58, 4, 7, 60, 'ALMV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(343, 58, 4, 7, 60, 'ALMV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(344, 58, 4, 7, 60, 'RFQM', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(345, 58, 4, 7, 60, 'RFQM', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(346, 58, 4, 7, 60, 'POO', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(347, 58, 4, 7, 60, 'POO', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(348, 58, 4, 7, 59, 'POV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(349, 58, 4, 7, 59, 'POV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(350, 58, 4, 7, 60, 'RNO', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(351, 58, 4, 7, 60, 'RNO', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(352, 58, 4, 7, 58, 'RNV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(353, 58, 4, 7, 58, 'RNV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(354, 58, 4, 7, 58, 'SLM', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(355, 58, 4, 7, 58, 'SLM', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(356, 58, 4, 7, 59, 'INV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(357, 58, 4, 7, 59, 'INV', 1, NULL, 'Yes', '2019-09-07 03:10:58', '2019-09-07 03:10:58'),
(358, 1, NULL, NULL, 61, 'CAD', 1, NULL, 'Yes', '2019-10-30 07:12:36', '2019-10-30 07:12:36'),
(359, 1, NULL, NULL, 62, 'CAD', 1, NULL, 'Yes', '2020-01-14 02:08:04', '2020-01-14 02:08:04'),
(360, 1, NULL, NULL, 63, 'CAD', 1, NULL, 'Yes', '2020-01-14 03:08:02', '2020-01-14 03:08:02'),
(361, 1, NULL, NULL, 64, 'CAD', 1, NULL, 'Yes', '2020-01-22 07:07:28', '2020-01-22 07:07:28'),
(362, 1, NULL, NULL, 65, 'CAD', 1, NULL, 'Yes', '2020-01-27 17:39:35', '2020-01-27 17:39:35'),
(363, 1, NULL, NULL, 66, 'CAD', 1, NULL, 'Yes', '2020-02-16 03:14:45', '2020-02-16 03:14:45'),
(364, 1, NULL, NULL, 67, 'CAD', 1, NULL, 'Yes', '2020-02-16 03:59:08', '2020-02-16 03:59:08'),
(365, 1, NULL, NULL, 68, 'CAD', 1, NULL, 'Yes', '2020-02-16 04:31:35', '2020-02-16 04:31:35'),
(366, 1, NULL, NULL, 69, 'CAD', 1, NULL, 'Yes', '2020-05-15 07:10:39', '2020-05-15 07:10:39'),
(367, 1, NULL, NULL, 70, 'CAD', 1, NULL, 'Yes', '2020-06-29 02:34:09', '2020-06-29 02:34:09'),
(368, 1, NULL, NULL, 71, 'CAD', 1, NULL, 'Yes', '2020-07-02 04:18:43', '2020-07-02 04:18:43'),
(369, 1, NULL, NULL, 72, 'CAD', 1, NULL, 'Yes', '2020-07-07 04:41:55', '2020-07-07 04:41:55'),
(370, 1, NULL, NULL, 73, 'CAD', 1, NULL, 'Yes', '2020-07-07 06:01:04', '2020-07-07 06:01:04'),
(371, 1, 5, NULL, 74, 'CAD', 1, NULL, 'Yes', '2020-07-14 08:26:15', '2020-07-15 10:53:54'),
(372, 74, 5, 8, 74, 'CAD', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(373, 74, 5, 8, 75, 'PRO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(374, 74, 5, 8, 76, 'PRV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(375, 74, 5, 8, 75, 'ALMR', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(376, 74, 5, 8, 77, 'LMA', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(377, 74, 5, 8, 74, 'ALMV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(378, 74, 5, 8, 74, 'RFQM', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(379, 74, 5, 8, 75, 'POO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(380, 74, 5, 8, 76, 'POV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(381, 74, 5, 8, 75, 'RNO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(382, 74, 5, 8, 76, 'RNV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(383, 74, 5, 8, 78, 'SLM', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(384, 74, 5, 8, 78, 'INV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(385, 74, 5, 8, 75, 'RCCO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(386, 74, 5, 8, 76, 'RCCV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(387, 74, 5, 8, 78, 'RCO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(388, 74, 5, 8, 77, 'RCV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(389, 74, 5, 9, 74, 'CAD', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(390, 74, 5, 9, 74, 'CAD', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(391, 74, 5, 9, 75, 'PRO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(392, 74, 5, 9, 75, 'PRO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(393, 74, 5, 9, 76, 'PRV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(394, 74, 5, 9, 76, 'PRV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(395, 74, 5, 9, 75, 'ALMR', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(396, 74, 5, 9, 75, 'ALMR', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(397, 74, 5, 9, 77, 'LMA', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(398, 74, 5, 9, 77, 'LMA', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(399, 74, 5, 9, 74, 'ALMV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(400, 74, 5, 9, 74, 'ALMV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(401, 74, 5, 9, 74, 'RFQM', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(402, 74, 5, 9, 74, 'RFQM', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(403, 74, 5, 9, 75, 'POO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(404, 74, 5, 9, 75, 'POO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(405, 74, 5, 9, 76, 'POV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(406, 74, 5, 9, 76, 'POV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(407, 74, 5, 9, 75, 'RNO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(408, 74, 5, 9, 75, 'RNO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(409, 74, 5, 9, 76, 'RNV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(410, 74, 5, 9, 76, 'RNV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(411, 74, 5, 9, 78, 'SLM', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(412, 74, 5, 9, 78, 'SLM', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(413, 74, 5, 9, 78, 'INV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(414, 74, 5, 9, 78, 'INV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(415, 74, 5, 9, 75, 'RCCO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(416, 74, 5, 9, 75, 'RCCO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(417, 74, 5, 9, 76, 'RCCV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(418, 74, 5, 9, 76, 'RCCV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(419, 74, 5, 9, 78, 'RCO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(420, 74, 5, 9, 78, 'RCO', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(421, 74, 5, 9, 77, 'RCV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(422, 74, 5, 9, 77, 'RCV', 1, NULL, 'Yes', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(423, 1, NULL, NULL, 79, 'CAD', 1, NULL, 'Yes', '2020-07-20 06:33:04', '2020-07-20 06:33:04'),
(424, 1, NULL, NULL, 80, 'CAD', 1, NULL, 'Yes', '2020-07-21 05:36:09', '2020-07-21 05:36:09'),
(425, 1, NULL, NULL, 81, 'CAD', 1, NULL, 'Yes', '2020-08-03 08:36:53', '2020-08-03 08:36:53'),
(426, 1, NULL, NULL, 82, 'CAD', 1, NULL, 'Yes', '2020-08-26 18:45:31', '2020-08-26 18:45:31'),
(427, 1, NULL, NULL, 83, 'CAD', 1, NULL, 'Yes', '2020-08-26 18:47:18', '2020-08-26 18:47:18'),
(428, 1, NULL, NULL, 84, 'CAD', 1, NULL, 'Yes', '2020-08-26 18:51:44', '2020-08-26 18:51:44'),
(429, 1, NULL, NULL, 85, 'CAD', 1, NULL, 'Yes', '2020-08-26 18:52:33', '2020-08-26 18:52:33'),
(430, 1, NULL, NULL, 86, 'CAD', 1, NULL, 'Yes', '2020-08-26 18:55:38', '2020-08-26 18:55:38'),
(431, 1, NULL, NULL, 87, 'CAD', 1, NULL, 'Yes', '2020-08-26 18:57:09', '2020-08-26 18:57:09'),
(434, 1, NULL, NULL, 90, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:03:36', '2020-08-26 19:03:36'),
(435, 1, NULL, NULL, 91, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:04:38', '2020-08-26 19:04:38'),
(436, 1, NULL, NULL, 92, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:05:27', '2020-08-26 19:05:27'),
(437, 1, NULL, NULL, 93, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:06:04', '2020-08-26 19:06:04'),
(438, 1, NULL, NULL, 94, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:07:04', '2020-08-26 19:07:04'),
(439, 1, NULL, NULL, 95, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:07:50', '2020-08-26 19:07:50'),
(440, 1, NULL, NULL, 96, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:09:39', '2020-08-26 19:09:39'),
(441, 1, NULL, NULL, 97, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:11:24', '2020-08-26 19:11:24'),
(442, 1, NULL, NULL, 98, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:12:56', '2020-08-26 19:12:56'),
(443, 1, NULL, NULL, 99, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:13:58', '2020-08-26 19:13:58'),
(444, 1, NULL, NULL, 100, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:14:29', '2020-08-26 19:14:29'),
(445, 1, NULL, NULL, 101, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:15:07', '2020-08-26 19:15:07'),
(446, 1, NULL, NULL, 102, 'CAD', 1, NULL, 'Yes', '2020-08-26 19:17:41', '2020-08-26 19:17:41'),
(447, 1, NULL, NULL, 103, 'CAD', 1, NULL, 'Yes', '2020-08-26 21:07:25', '2020-08-26 21:07:25'),
(448, 1, NULL, NULL, 104, 'CAD', 1, NULL, 'Yes', '2020-08-26 21:26:52', '2020-08-26 21:26:52'),
(449, 1, NULL, NULL, 105, 'CAD', 1, NULL, 'Yes', '2020-09-04 21:55:37', '2020-09-04 21:55:37'),
(450, 1, NULL, NULL, 106, 'CAD', 1, NULL, 'Yes', '2020-09-04 21:58:52', '2020-09-04 21:58:52'),
(451, 1, NULL, NULL, 107, 'CAD', 1, NULL, 'Yes', '2020-09-04 22:01:23', '2020-09-04 22:01:23'),
(452, 1, NULL, NULL, 108, 'CAD', 1, NULL, 'Yes', '2020-09-04 22:03:50', '2020-09-04 22:03:50'),
(453, 1, NULL, NULL, 109, 'CAD', 1, NULL, 'Yes', '2020-09-04 22:05:33', '2020-09-04 22:05:33'),
(454, 1, NULL, NULL, 110, 'CAD', 1, NULL, 'Yes', '2020-09-04 22:08:34', '2020-09-04 22:08:34'),
(455, 1, NULL, NULL, 111, 'CAD', 1, NULL, 'Yes', '2020-09-04 23:18:18', '2020-09-04 23:18:18'),
(456, 1, NULL, NULL, 112, 'CAD', 1, NULL, 'Yes', '2020-09-04 23:25:18', '2020-09-04 23:25:18'),
(457, 1, NULL, NULL, 113, 'CAD', 1, NULL, 'Yes', '2020-09-04 23:32:46', '2020-09-04 23:32:46'),
(458, 1, NULL, NULL, 114, 'CAD', 1, NULL, 'Yes', '2020-09-05 01:49:52', '2020-09-05 01:49:52'),
(459, 1, NULL, NULL, 115, 'CAD', 1, NULL, 'Yes', '2020-09-06 18:57:45', '2020-09-06 18:57:45'),
(460, 1, NULL, NULL, 116, 'CAD', 1, NULL, 'Yes', '2020-09-08 21:16:39', '2020-09-08 21:16:39'),
(461, 1, NULL, NULL, 117, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:28:20', '2020-09-11 02:28:20'),
(462, 1, NULL, NULL, 118, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:36:31', '2020-09-11 02:36:31'),
(463, 1, NULL, NULL, 119, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:40:13', '2020-09-11 02:40:13'),
(464, 1, NULL, NULL, 120, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:41:03', '2020-09-11 02:41:03'),
(465, 1, NULL, NULL, 121, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:41:25', '2020-09-11 02:41:25'),
(466, 1, NULL, NULL, 122, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:47:51', '2020-09-11 02:47:51'),
(467, 1, NULL, NULL, 123, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:48:30', '2020-09-11 02:48:30'),
(468, 1, NULL, NULL, 124, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:49:34', '2020-09-11 02:49:34'),
(469, 1, NULL, NULL, 125, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:52:04', '2020-09-11 02:52:04'),
(470, 1, NULL, NULL, 126, 'CAD', 1, NULL, 'Yes', '2020-09-11 02:52:54', '2020-09-11 02:52:54'),
(571, 33, 7, 33, 33, 'PRV', 1, NULL, 'Yes', '2020-09-30 22:29:27', '2020-09-30 22:29:27'),
(591, 33, 7, 34, 33, 'PRV', 1, NULL, 'Yes', '2020-09-30 22:32:25', '2020-09-30 22:32:25'),
(608, 33, 7, 35, 302, 'CAD', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(609, 33, 7, 35, 303, 'CAD', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(610, 33, 7, 35, 304, 'PRO', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(611, 33, 7, 35, 33, 'PRV', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(612, 33, 7, 35, 305, 'ALMR', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(613, 33, 7, 35, 306, 'LMA', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(614, 33, 7, 35, 307, 'ALMV', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(615, 33, 7, 35, 308, 'RFQM', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(616, 33, 7, 35, 309, 'POO', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(617, 33, 7, 35, 310, 'POV', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(618, 33, 7, 35, 311, 'RNO', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(619, 33, 7, 35, 312, 'RNV', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(620, 33, 7, 35, 313, 'SLM', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(621, 33, 7, 35, 314, 'INV', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(622, 33, 7, 35, 303, 'ASTMGR', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(623, 33, 7, 35, 315, 'SIIRPT', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(624, 33, 7, 35, 316, 'RTIRS', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(625, 33, 7, 35, 317, 'ATSIRS', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(626, 33, 7, 35, 318, 'RTSI', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(627, 33, 7, 35, 319, 'ATSI', 1, NULL, 'Yes', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(628, 1, NULL, NULL, 320, 'CAD', 1, NULL, 'Yes', '2020-09-30 23:22:46', '2020-09-30 23:22:46'),
(629, 1, 8, NULL, 321, 'CAD', 1, NULL, 'Yes', '2020-09-30 23:54:25', '2020-10-01 00:05:13'),
(630, 1, 9, NULL, 322, 'CAD', 1, NULL, 'Yes', '2020-10-01 00:19:21', '2020-10-01 00:20:08'),
(631, 1, 10, NULL, 323, 'CAD', 1, NULL, 'Yes', '2020-10-01 00:49:55', '2020-10-01 00:50:22'),
(632, 1, 11, NULL, 324, 'CAD', 1, NULL, 'Yes', '2020-10-06 22:51:58', '2020-10-06 22:52:48'),
(633, 324, 11, 36, 324, 'CAD', 1, NULL, 'Yes', '2020-10-06 23:03:31', '2020-10-06 23:03:31'),
(659, 324, 11, 37, 324, 'CAD', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(660, 324, 11, 37, 332, 'PRO', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(661, 324, 11, 37, 333, 'PRV', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(662, 324, 11, 37, 334, 'PRV', 2, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(663, 324, 11, 37, 334, 'ALMR', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(664, 324, 11, 37, 335, 'LMA', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(665, 324, 11, 37, 333, 'ALMV', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(666, 324, 11, 37, 336, 'ALMV', 2, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(667, 324, 11, 37, 337, 'RFQM', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(668, 324, 11, 37, 335, 'POO', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(669, 324, 11, 37, 336, 'POV', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(670, 324, 11, 37, 333, 'RNO', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(671, 324, 11, 37, 337, 'RNV', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(672, 324, 11, 37, 338, 'SLM', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(673, 324, 11, 37, 332, 'INV', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(674, 324, 11, 37, 332, 'RCCO', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(675, 324, 11, 37, 338, 'RCCV', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(676, 324, 11, 37, 334, 'RCO', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(677, 324, 11, 37, 338, 'RCV', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(678, 324, 11, 37, 332, 'ASTMGR', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(679, 324, 11, 37, 334, 'ASTMGR', 2, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(680, 324, 11, 37, 333, 'SIIRPT', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(681, 324, 11, 37, 332, 'RTIRS', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(682, 324, 11, 37, 334, 'ATSIRS', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(683, 324, 11, 37, 335, 'RTSI', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(684, 324, 11, 37, 338, 'ATSI', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(685, 324, 11, 37, 339, 'SUBO', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(686, 324, 11, 37, 340, 'SUBV', 1, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(687, 324, 11, 37, 341, 'SUBV', 2, NULL, 'Yes', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(688, 1, 12, NULL, 343, 'CAD', 1, NULL, 'Yes', '2020-12-08 14:37:30', '2020-12-08 14:38:22'),
(689, 1, 13, NULL, 344, 'CAD', 1, NULL, 'Yes', '2020-12-10 12:02:08', '2021-01-14 09:31:31'),
(690, 344, 13, 38, 344, 'CAD', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(692, 344, 13, 38, 345, 'PRV', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(693, 344, 13, 38, 346, 'ALMR', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(694, 344, 13, 38, 347, 'LMA', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(695, 344, 13, 38, 347, 'ALMV', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(696, 344, 13, 38, 348, 'RFQM', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(697, 344, 13, 38, 73, 'POO', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(698, 344, 13, 38, 349, 'POV', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(699, 344, 13, 38, 350, 'RNO', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(700, 344, 13, 38, 351, 'RNV', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(701, 344, 13, 38, 352, 'SLM', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(702, 344, 13, 38, 339, 'SUBO', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(703, 344, 13, 38, 340, 'SUBV', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(704, 344, 13, 38, 354, 'INV', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(705, 344, 13, 38, 355, 'RCCO', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(706, 344, 13, 38, 356, 'RCCV', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(707, 344, 13, 38, 357, 'RCO', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(708, 344, 13, 38, 358, 'RCV', 1, NULL, 'Yes', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(709, 1, 14, NULL, 359, 'CAD', 1, NULL, 'Yes', '2021-01-22 11:03:16', '2021-01-22 11:04:12'),
(710, 1, 15, NULL, 360, 'CAD', 1, NULL, 'Yes', '2021-01-30 11:24:23', '2021-01-30 11:26:31'),
(711, 1, 16, NULL, 361, 'CAD', 1, NULL, 'Yes', '2021-02-03 22:16:24', '2021-02-03 22:18:28'),
(712, 1, 17, NULL, 362, 'CAD', 1, NULL, 'Yes', '2021-03-05 14:57:48', '2021-03-05 15:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `set_up_budget_requests`
--

CREATE TABLE `set_up_budget_requests` (
  `id` int(255) NOT NULL,
  `budget_request_group_id` int(255) NOT NULL,
  `budget_request_ingroup_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  `requester_id` int(255) NOT NULL,
  `request_amount` double DEFAULT '0',
  `first_request_amount` double DEFAULT NULL,
  `request_end_date` date DEFAULT NULL,
  `pro_ini_value` double DEFAULT NULL,
  `pro_ini_consumed_budget` double DEFAULT NULL,
  `budget_description` text,
  `budget_link` text,
  `file1` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Assigned to Validator level 1',
  `active` varchar(255) NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `very_first_initial_end_date` date DEFAULT NULL,
  `very_first_initial_amount` double DEFAULT NULL,
  `first_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `set_up_budget_requests`
--

INSERT INTO `set_up_budget_requests` (`id`, `budget_request_group_id`, `budget_request_ingroup_id`, `company_id`, `project_id`, `requester_id`, `request_amount`, `first_request_amount`, `request_end_date`, `pro_ini_value`, `pro_ini_consumed_budget`, `budget_description`, `budget_link`, `file1`, `file2`, `file3`, `status`, `active`, `created_at`, `updated_at`, `very_first_initial_end_date`, `very_first_initial_amount`, `first_end_date`) VALUES
(1, 1, 1, 11, 37, 339, 0, NULL, '2024-01-01', 500700, 700, 'rrtt', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-22 16:25:14', '2021-02-22 16:29:29', '2023-08-01', 500000, '2024-01-01'),
(2, 2, 2, 11, 37, 339, 500, 500, '2021-02-27', 500700, 700, 'no need', NULL, '', '', '', 'Approved by Validator Level 1 and Assigned to Validator Level 2 for Approval', 'yes', '2021-02-22 16:36:24', '2021-02-22 16:40:04', '2024-01-01', 500000, '2021-02-27'),
(3, 3, 3, 11, 37, 339, 0, NULL, '2022-01-01', 500700, 700, 'dhdtf gvy', NULL, '', '', '', 'Assigned to Validator level 1', 'yes', '2021-02-22 21:00:23', '2021-02-22 21:00:23', '2024-01-01', 500000, '2022-01-01'),
(4, 4, 4, 11, 37, 339, 0, NULL, '2025-01-01', 500700, 700, 'ggg uuj ljjk', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-22 22:40:29', '2021-02-22 22:47:15', '2024-01-01', 500000, '2025-01-01'),
(5, 5, 5, 11, 37, 339, 0, NULL, '2022-03-01', 500700, 700, 'gtv2', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 14:42:24', '2021-02-24 14:49:15', '2025-01-01', 500000, '2022-03-01'),
(6, 6, 6, 11, 37, 339, 7000000, 7000000, '2021-02-24', 500700, 700, 'GTV3', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 14:51:24', '2021-02-24 14:57:56', '2022-03-01', 500000, NULL),
(7, 7, 7, 11, 37, 339, 560000, 560000, '2030-01-01', 7000700, 700, 'GTV4', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 15:54:05', '2021-02-24 16:20:41', '2021-02-24', 7000000, '2030-01-01'),
(8, 8, 8, 11, 37, 339, 0, NULL, '2022-02-28', 560700, 700, 'gtv3', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 16:22:13', '2021-02-24 16:27:22', '2030-01-01', 560000, '2022-02-28'),
(9, 9, 9, 11, 37, 339, 890000, 890000, '2021-02-24', 560700, 700, 'ark', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 16:28:36', '2021-02-24 16:31:00', '2022-02-28', 560000, NULL),
(10, 10, 10, 11, 37, 339, 750000, 750000, '2021-02-24', 890700, 700, 'rak', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 16:32:39', '2021-02-24 16:34:27', '2021-02-24', 890000, NULL),
(11, 11, 11, 11, 37, 339, 10000000, 10000000, '2026-02-28', 750700, 700, 'HJK', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-02-24 16:35:34', '2021-02-24 16:38:14', '2021-02-24', 750000, '2026-02-28'),
(12, 12, 12, 11, 37, 339, 1000000, 1000000, '2028-02-29', 10000700, 700, 'TDC', NULL, '', '', '', 'Rejected By Validator at Level 1', 'yes', '2021-02-24 16:39:39', '2021-02-24 16:40:59', '2026-02-28', 10000000, '2028-02-29'),
(13, 13, 13, 11, 37, 339, 4550000, 4550000, '2021-03-31', 10000700, 700, 'urgently needed', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-03-03 10:45:03', '2021-03-03 10:48:17', '2026-02-28', 10000000, '2021-03-31'),
(14, 14, 14, 11, 37, 339, 0, NULL, '2022-12-31', 4550700, 700, 'Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you. Please expedite. Thank you.', NULL, '', '', '', 'Request Cancelled By Originator', 'yes', '2021-03-03 10:51:20', '2021-03-03 10:58:32', '2021-03-31', 4550000, '2022-12-31'),
(15, 15, 15, 11, 37, 339, 65880000, 65880000, NULL, 4550700, 700, 'Please review and approve', NULL, '', '', '', 'Assigned to Validator level 1', 'yes', '2021-03-03 10:59:56', '2021-03-03 10:59:56', '2021-03-31', 4550000, NULL),
(16, 16, 16, 11, 37, 339, 19900856, 19900856, '2021-03-25', 4550700, 700, 'Pls amend the Set-up information', NULL, '', '', '', 'Assigned to Validator level 1', 'yes', '2021-03-03 13:11:04', '2021-03-03 13:11:04', '2021-03-31', 4550000, '2021-03-25'),
(17, 17, 17, 11, 37, 339, 50000, 50000, '2021-03-31', 4550700, 700, 'note', NULL, '', '', '', 'Assigned to Validator level 1', 'yes', '2021-03-03 14:01:07', '2021-03-03 14:01:07', '2021-03-31', 4550000, '2021-03-31'),
(18, 18, 18, 11, 37, 339, 7689000, 7689000, '2021-03-26', 4550700, 700, 'Pls do this', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-03-05 21:20:36', '2021-03-05 22:13:42', '2021-03-31', 4550000, '2021-03-26'),
(19, 19, 19, 11, 37, 339, 100000, 100000, '2021-04-30', 7689700, 700, 'xyzt', NULL, '', '', '', 'Fully Approved by Validator Level 2 and the Set-up Budget is Updated', 'yes', '2021-03-05 22:24:50', '2021-03-05 22:29:19', '2021-03-26', 7689000, '2021-04-30'),
(20, 20, 20, 11, 37, 339, 500000, 500000, '2022-03-31', 100700, 700, 'test12', NULL, '', '', '', 'Assigned to Validator level 1', 'yes', '2021-03-06 17:53:54', '2021-03-06 17:53:54', '2021-04-30', 100000, '2022-03-31');

-- --------------------------------------------------------

--
-- Table structure for table `stockitems_purchaseenquiries`
--

CREATE TABLE `stockitems_purchaseenquiries` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_item_id` int(255) NOT NULL,
  `purchase_enquiry_id` int(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stockitems_stockitemrequests`
--

CREATE TABLE `stockitems_stockitemrequests` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_item_id` int(255) NOT NULL,
  `stock_item_request_id` int(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_issuance_records`
--

CREATE TABLE `stock_issuance_records` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_issuance_record_group_id` int(255) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `company_id` int(255) DEFAULT NULL,
  `stock_item_issue_request_id` int(255) DEFAULT NULL,
  `issued_quantity` float NOT NULL,
  `issue_date` datetime DEFAULT NULL,
  `notes` text,
  `status` varchar(255) NOT NULL DEFAULT 'Requested Pending Approval',
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_items`
--

CREATE TABLE `stock_items` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_item_group_id` int(255) NOT NULL,
  `stock_item_ingroup_id` int(255) NOT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  `bin` varchar(255) DEFAULT NULL,
  `shelf` varchar(255) DEFAULT NULL,
  `rack` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `alley` varchar(255) DEFAULT NULL,
  `item_id` int(255) NOT NULL,
  `pe_generation_type` varchar(45) NOT NULL,
  `replenish_level` varchar(45) NOT NULL,
  `replenish_quantity` varchar(45) NOT NULL,
  `stock_level` varchar(255) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime NOT NULL,
  `notes` text,
  `approval_level` int(255) NOT NULL DEFAULT '1',
  `status` varchar(45) DEFAULT 'Created Pending Store Manager Approval',
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_item_issue_requests`
--

CREATE TABLE `stock_item_issue_requests` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_item_issuance_request_group_id` int(255) DEFAULT NULL,
  `stock_item_issuance_request_ingroup_id` int(255) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `company_id` int(255) DEFAULT NULL,
  `project_id` int(255) DEFAULT NULL,
  `stock_item_id` int(255) DEFAULT NULL,
  `quantity` float NOT NULL,
  `location_name` text NOT NULL,
  `latitude` text,
  `longitude` text,
  `notes` text,
  `approval_level` varchar(255) NOT NULL DEFAULT '1',
  `status` varchar(255) NOT NULL DEFAULT 'Requested Pending Approval',
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_item_requests`
--

CREATE TABLE `stock_item_requests` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_item_request_group_id` int(255) NOT NULL,
  `stock_item_request_ingroup_id` int(255) NOT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) DEFAULT NULL,
  `project_id` int(255) DEFAULT NULL,
  `item_id` int(255) DEFAULT NULL,
  `item_description` text,
  `si_start_period` datetime DEFAULT NULL,
  `si_end_period` datetime DEFAULT NULL,
  `consumption_frequency` varchar(255) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `u_o_m` varchar(255) DEFAULT NULL,
  `notes` text,
  `status` varchar(255) NOT NULL DEFAULT 'Created and Assigned to Level 1',
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `approval_level` varchar(255) NOT NULL DEFAULT '1',
  `grouping_id` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_item_return_requests`
--

CREATE TABLE `stock_item_return_requests` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_item_return_request_group_id` int(255) DEFAULT NULL,
  `stock_item_return_request_ingroup_id` int(255) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `company_id` int(255) DEFAULT NULL,
  `stock_item_issue_request_id` int(255) DEFAULT NULL,
  `stock_issuance_record_id` int(255) DEFAULT NULL,
  `stock_item_id` int(255) DEFAULT NULL,
  `returned_quantity` float NOT NULL,
  `notes` text,
  `approval_level` varchar(255) NOT NULL DEFAULT '1',
  `return_decision` varchar(255) DEFAULT NULL,
  `return_note` text,
  `status` varchar(255) NOT NULL DEFAULT 'Requested Pending Approval',
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer_requests`
--

CREATE TABLE `stock_transfer_requests` (
  `id` int(255) UNSIGNED NOT NULL,
  `stock_transfer_request_group_id` int(255) DEFAULT NULL,
  `stock_transfer_request_ingroup_id` int(255) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `company_id` int(255) DEFAULT NULL,
  `from_project_id` int(255) DEFAULT NULL,
  `to_project_id` int(255) DEFAULT NULL,
  `stock_item_id` int(255) DEFAULT NULL,
  `quantity` float NOT NULL,
  `location_name` text NOT NULL,
  `latitude` text,
  `longitude` text,
  `transfer_date` datetime DEFAULT NULL,
  `notes` text,
  `approval_level` varchar(255) NOT NULL DEFAULT '1',
  `status` varchar(255) NOT NULL DEFAULT 'Created Pending Approval',
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `system_error_log`
--

CREATE TABLE `system_error_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `env` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('DEBUG','INFO','NOTICE','WARNING','ERROR','CRITICAL','ALERT','EMERGENCY') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INFO',
  `context` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'user_image.png',
  `login_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'Yes',
  `onboarding` tinyint(4) DEFAULT '1',
  `step` int(11) NOT NULL DEFAULT '0',
  `ref_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `name`, `email`, `designation`, `phone_number`, `address`, `picture`, `login_image`, `password`, `remember_token`, `active`, `onboarding`, `step`, `ref_id`, `created_at`, `updated_at`) VALUES
(1, 0, 'Muaz Malas', 'muazmalas@gmail.com', 'System Administrator', NULL, NULL, 'user_image.png', NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', 'OuQ0c1hxCaMoeNWPu8jp6SdwpayoDBy8psGuZUfN7cCyGNfncxWjax9BIuGh', 'Yes', 0, 0, '0', '2019-06-27 17:37:44', '2019-07-31 12:43:51'),
(2, 1, 'Aimad El Habti', 'aimad_el_habti@yahoo.fr', 'Owner', NULL, NULL, '1564987556admin.jpg', 'image5711607942459png', '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'Jd8gvVXuAxFA3BwJNUYiyjsqMawMbGnoWpVZ2XRobkzA257HzIfjiuMqJMyj', 'Yes', 0, 0, '0', '2019-06-28 02:24:18', '2020-12-14 12:40:59'),
(3, 1, 'John Admin', 'John.Admin@demo.ae', 'Customer Application Administrator', NULL, NULL, 'user_image.png', 'image8991601912407jpg', '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2020-10-05 05:40:07'),
(4, 1, 'John PEO', 'John.PEO@demo.ae', 'Engineer', NULL, NULL, '1569866591Muaz Malas.jpg', 'image1211599809389jpg', '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'CKz6BWdgOSQAwed8xgDEIaDtaDrDlg9AFn4MTNitaC3MxXeiShH6wRT26wKD', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2020-09-10 21:29:49'),
(5, 1, 'John PEV1', 'John.PEV1@demo.ae', 'Manager Operations', NULL, NULL, '159911175640imgk.jpg', 'image5221601631456jpg', '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '2djPru7FrP2Pic1gEKSIM0COtxBl0tStRZJLzwa1itCg5KjMXuCVqVJRLy40', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2020-10-01 23:37:36'),
(6, 1, 'John PEV2', 'JohnPEV2@demo.ae', 'Director Operations', NULL, NULL, '1568576945Muaz Malas.jpg', 'image1551601630358jpg', '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'ewCeeOtWGWXYdxB1y4pm8Q9hV9KpnFqtGkrRHCctvwHPNudOd7mpdNoANzCa', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2020-10-01 23:19:18'),
(7, 1, 'John LOMDem', 'John.LOMDem@demo.ae', 'CoE Manager', NULL, NULL, '1564987868photo-Request to update LoM.jpg', 'image3621601912429jpg', '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'B3vlUlnPZwkMtmkefjl6lJVPubsNonLAhtZX3eERZnimYG1o8wCytB7ltghY', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2020-10-05 05:40:29'),
(8, 1, 'John LOMAdmin', 'John.LOMAdmin@demo.ae', 'CoE Director', NULL, NULL, '1564989691photo-LoM adminstrator.jpg', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'TZuSpSKtDbcWA6D8F3A3RUKfoerL4Fknuv5WgKHLDoywvZUFDyJwfYjUDYmq', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2019-08-05 02:21:31'),
(9, 1, 'John LOMVal1', 'John.LOMVal1@demo.ae', 'LoM validator', NULL, NULL, '1564991933photo-LoM Validator 1.jpg', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'fCD1gGpXc4qhHy8hznS4pKyrNPE5GUBsCnO9zrocasBC22VGWxXOgBb2l73r', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2019-08-05 02:58:53'),
(10, 1, 'John LOMVal2', 'John.LOMVal2@demo.ae', 'LoM Validator', NULL, NULL, '1564993626photo-LoM Validator 2.jpg', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'AyspaEKd6DBnajmmwpSXC5JnHHCx3dCm0AzKx4IN8Nci0DHqUnNZDYvzEHZ3', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2019-08-05 03:27:06'),
(11, 1, 'John LOMVal3', 'John.LOMVal3@demo.ae', 'LoM Validator', NULL, NULL, '1564993811photo-LoM Validator 3.jpg', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '2vDjePK5RB3kA9XbBeziigRPjm7HU5932VbNGSJcxzqFNpNFU4q5lAg9Q17j', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2019-08-05 03:30:11'),
(12, 1, 'John RFP', 'John.RFP@demo.ae', 'Buyer', NULL, NULL, '1569871008Muaz Malas.jpg', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'TZe5WlirjsufOKLXbWsZwqtDGIrPA7Vwj8hlIETI64Tn4gyylBZfSvnf9Pjw', 'Yes', 0, 0, '0', '2019-06-29 09:26:09', '2019-09-30 14:16:48'),
(13, 1, 'John POO', 'JohnPOO@demo.ae', 'Project Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'VKCZvG0cxF9wROHPVuzRuG5pTTcrP7vRSTvgFmuRk7juf8lnFgNGr3bsjRNt', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-06-29 09:26:10'),
(14, 1, 'John POV1', 'John.POV1@demo.ae', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'a8WvArJW19Y6M1Zhr2qTOUpMj78bfTTc8tQTbR0C4cQlURaJb7Of1IOvfl4N', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-06-29 09:26:10'),
(15, 1, 'John. POV2', 'John.POV2@demo.ae', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-06-29 09:26:10'),
(16, 1, 'John. POV3', 'John.POV3@demo.ae', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-06-29 09:26:10'),
(17, 1, 'John RNO', 'John.RNO@demo.ae', 'Engineer Project', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '0abeWCtSN5WxhwKkHh92L6k626MOjDvWr6BxCcR2ChgQOE6qVjz3QiPLXThW', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-06-29 09:26:10'),
(18, 1, 'John RNV1', 'John.RNV1@demo.ae', 'Project Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-06-29 09:26:10'),
(19, 1, 'John RNV2', 'John.RNV2@demo.ae', 'Project Ass. Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-06-29 09:26:10'),
(20, 1, 'John RNV3', 'John.RNV3@demo.ae', 'Project Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-06-29 09:26:10'),
(21, 1, 'John VQ', 'John.VQ@demo.ae', 'Buyer 2', NULL, NULL, '1564986715vendor qualifier.jpg', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'RLHR0qPNxWviBlNiTEKPxk3fix57OUawhmnSw312tcUplbaLiChQwRh6Fxuq', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-08-05 01:31:55'),
(22, 1, 'John RCRO', 'John.RCRO@demo.ae', 'Procurement Executive', NULL, NULL, '1563779328Contract.jpeg', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'AMnwCzHUWZ0uTSXdqse3agckMFVLTm3XrA9XJxAOYJvZ1AAFWxhOQmMf6Cbz', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-07-22 02:08:48'),
(23, 1, 'John RCRV', 'John.RCRV1@demo.ae', 'Manager- CoE', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'ZJooGzsUZshSVOdbR4V4e5Uk58NbHjT40mLbkmmUuE3UJApgM5i9MUYLeg7z', 'Yes', 0, 0, '0', '2019-06-29 09:26:10', '2019-06-29 09:26:10'),
(24, 1, 'John RCRV2', 'John.RCRV2@demo.ae', 'Director CoE', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(25, 1, 'John RCRV3', 'John.RCRV3@demo.ae', 'VP CoE', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(26, 1, 'John RCO', 'Joh.RCO@demo.ae', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(27, 1, 'John RCV1', 'John.RCV1@demo.ae', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(28, 1, 'John RCV2', 'John.RCV2@demo.ae', 'Sr. Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(29, 1, 'John RCV3', 'John.RCV3@demo.ae', 'Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 09:26:11', '2019-06-29 09:26:11'),
(31, NULL, 'King Arthur', 'kingarthur4ever@gmail.com', 'OOO', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-06-29 12:59:07', '2019-06-29 12:59:07'),
(32, NULL, 'John', 'john.wayne@demo.ae', 'Wayne', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 03:03:06', '2019-07-06 03:03:06'),
(33, 7, 'Test', 'test@test.com', 'test', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 10:38:09', '2020-09-30 22:56:02'),
(34, 3, 'Bill Payne', 'Bill.Payne@demo.ae', 'Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', 'kxjbcCYXQPd0S9MuL5tBGLVJoNQ1dwL8pDmvamWokza0DP4cp0DSizLYWxie', 'Yes', 0, 0, '0', '2019-07-06 12:35:54', '2019-07-06 14:28:08'),
(35, 2, 'PEO', 'PEO@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:02', '2019-07-06 14:28:02'),
(36, 2, 'PEV1', 'PEV1@demo.com', 'manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:02', '2019-07-06 14:28:02'),
(37, 2, 'PEV2', 'PEV2@demo.com', 'Sr. Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:02', '2019-07-06 14:28:02'),
(38, 2, 'LoMURO', 'LoMURO@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(39, 2, 'LoMAdm', 'LoMAdm@demo.com', 'Administrator', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(40, 2, 'LoMV1', 'LoMv1@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(41, 2, 'LoMV2', 'LoMV2@demo.com', 'Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(42, 2, 'RfP', 'RfP@demo.com', 'A. VP', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(43, 2, 'POO', 'POO@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(44, 2, 'POV1', 'POV1@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(45, 2, 'POV2', 'POV2@demo.ae', 'Sr. Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(46, 2, 'RNO', 'RNO@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(47, 2, 'RNV1', 'RNV1@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(48, 2, 'RNV2', 'RNV2@demo.com', 'Sr. Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:03', '2019-07-06 14:28:03'),
(49, 2, 'VenQualification', 'VenQualification@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(50, 2, 'InvCh', 'InvCh@demo.com', 'A/P Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(51, 2, 'RCCRO', 'RCCRO@demo.com', 'Engineer', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(52, 2, 'RCCRV1', 'RCCRV1@demo.com', 'Manger', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(53, 2, 'RCCRV2', 'RCCRV2@demo.com', 'Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(54, 2, 'RCO', 'RCO@demo.com', 'Sr. Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(55, 2, 'RCV1', 'RCV1@demo.com', 'manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(56, 2, 'RCV2', 'RCV2@demo.com', 'Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', '8ZohsuDtGqogdS49uWtN1xFUrcUUr6MPyVGD6RhwRXFZ7oWI07bBTtHShOG4', 'Yes', 0, 0, '0', '2019-07-06 14:28:04', '2019-07-06 14:28:04'),
(57, NULL, 'Harry Potter', 'harry.potter@demo.com', 'Boss', NULL, NULL, 'user_image.png', NULL, '$2y$10$4CXlMRl18JzWE2QLHckaru2utM1FUZVCT1gGg6AjyStjczI8tM162', NULL, 'Yes', 0, 0, '0', '2019-07-24 14:26:47', '2019-07-24 14:26:47'),
(58, 4, 'Bill John', 'Bill.John@demo.ae', 'Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$SqfRcmwUpcE.LWEEM3Tyi.81UnoS3Ka7fob8dWmlbuomp9b4jTBh2', NULL, 'Yes', 0, 0, '0', '2019-09-07 02:27:04', '2019-09-07 03:10:57'),
(59, 4, 'Ali El Habti', 'alielhabti6@gmail.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$o5VdoJr21m0w61i.TCPEpuvbkkHB1bPQbR0lJ6S8rmgmB4JXJwu3u', NULL, 'Yes', 0, 0, '0', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(60, 4, 'Aya El Habti', 'aya@demo.ae', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$WiKGYwAnL14yxUicmc9TYuyp/6YEBn4Zr1uws2HfZqBIeh0W2ocd2', NULL, 'Yes', 0, 0, '0', '2019-09-07 03:10:57', '2019-09-07 03:10:57'),
(61, NULL, 'Abdelghafour Madi', 'madi-abdelghafour@hotmail.com', 'Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$6rAqH5SrJt5kW9OsfpK.gOzb3Qxihq.vv7ea8aX/SaHDvZyWqexoC', NULL, 'Yes', 0, 0, '0', '2019-10-30 07:12:36', '2019-10-30 07:12:36'),
(62, NULL, 'John Wick', 'john.wick@tristar.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$av9clBwd4ahzbBIE2EXmyOwBtUY86V.o.DbnUmgZOpn6aBr4BSiTC', NULL, 'Yes', 0, 0, '0', '2020-01-14 02:08:04', '2020-01-14 02:08:04'),
(63, NULL, 'Billy Ocean', 'aimad.elhabti@asuite-me.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$NV9DkBRYlhxObQyQiwMR/ueYduHK4ZpM/6JmcK7li52nY5yoXjN1.', NULL, 'Yes', 0, 0, '0', '2020-01-14 03:08:02', '2020-01-14 03:08:02'),
(64, NULL, 'King Arthur', 'muazmalas@yahoo.com', 'IT', NULL, NULL, 'user_image.png', NULL, '$2y$10$kc1XKwasVzJx5w4TtpqBpuLpQmX49NAVw3NOgDAAWKsSh6K/pZM3.', NULL, 'Yes', 0, 0, '0', '2020-01-22 07:07:28', '2020-01-22 07:07:28'),
(65, NULL, 'Mohammad ALi', 'mohammad.ali.akmal@gmail.com', 'Chief Overlord', NULL, NULL, 'user_image.png', NULL, '$2y$10$fTtryAVm6/ond97p2dgAEe7.MkTXJNE8harWF2DbNmeyzoCR2Q9Yq', NULL, 'Yes', 0, 0, '0', '2020-01-27 17:39:35', '2020-01-27 17:39:35'),
(66, NULL, 'Jerry Bruckeinhmer', 'j.bruk@emaar.ae', 'Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$jHiJjTrEzP1ltqrHnpwniOSbD0lf06WQ9V2HfCP2WpNhl5dSrnBLa', NULL, 'Yes', 0, 0, '0', '2020-02-16 03:14:45', '2020-02-16 03:14:45'),
(67, NULL, 'kollo', 'k.jerry@hotmail.com', 'jerry', NULL, NULL, 'user_image.png', NULL, '$2y$10$BzNYcAi4Ll/FZr/nmZMudO/VA/6lRdDxZE4Mka8Y2eLQ9T2AJQLKu', NULL, 'Yes', 0, 0, '0', '2020-02-16 03:59:08', '2020-02-16 03:59:08'),
(68, NULL, 'HJ', 'HJ@emaar.ae', 'JH', NULL, NULL, 'user_image.png', NULL, '$2y$10$ZkTfDDdg384mBa9uBtOc3eOUmilvI0AuC189X0W4RV9uMxaP/URay', NULL, 'Yes', 0, 0, '0', '2020-02-16 04:31:35', '2020-02-16 04:31:35'),
(69, NULL, 'Ali', 'ali.sadik@gmail.com', 'Sadik', NULL, NULL, 'user_image.png', NULL, '$2y$10$Hql9mq5SLBh5867bmO9w4e2VkjexISNzcjTVq.4/Jirvy1PpcIf1u', NULL, 'Yes', 0, 0, '0', '2020-05-15 07:10:39', '2020-05-15 07:10:39'),
(70, NULL, 'Jim Skills', 'jim.skills@demo.com', 'Director of Procurement', NULL, NULL, 'user_image.png', NULL, '$2y$10$oeuBoKLWI1PcJx4j0vzni.dEEjqb68CP.TNcQTTMPpdVkg6LSv44y', NULL, 'Yes', 0, 0, '0', '2020-06-29 02:34:09', '2020-06-29 02:34:09'),
(71, NULL, 'Jim', 'jim.costa@demo.com', 'Costa', NULL, NULL, 'user_image.png', NULL, '$2y$10$.Z.ovzr.qJlT.6YdiqSDF.IdCDjTHd0iz1i2gb5QJpzLMNrsTWq/C', NULL, 'Yes', 0, 0, '0', '2020-07-02 04:18:43', '2020-07-02 04:18:43'),
(72, NULL, 'UDAAN TECH', 'info@udaantechnologies.com', 'IT HEAD', NULL, NULL, 'user_image.png', NULL, '$2y$10$UQsCa32R.uIW.blQX.8c4uVe1tlwLujVaOSJfT.q3NBSm4a9bf/Ii', NULL, 'Yes', 0, 0, '0', '2020-07-07 04:41:55', '2020-07-07 04:41:55'),
(73, NULL, 'Abc', 'abc@gmail.com', 'Hi', NULL, NULL, 'user_image.png', NULL, '$2y$10$TAuUOp6JOctoAlo.R6lLouF9yQywd8EZC9mq0kdNZaheDPQt3.Lz6', NULL, 'Yes', 0, 0, '0', '2020-07-07 06:01:04', '2020-07-07 06:01:04'),
(74, 5, 'Billy', 'billy.walsh@demo.uk', 'Walsh', NULL, NULL, 'user_image.png', NULL, '$2y$10$ocZXeYz1iu9PQtzkmEYp9uiXuVNVjysr72RSeUMN7FMG.WA9wLeY6', NULL, 'Yes', 0, 0, '0', '2020-07-14 08:26:15', '2020-07-15 10:53:54'),
(75, 5, 'jim stokes', 'jim.stokes@advansale.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$INejrtl2BBIvgtLBNE5UiuH5CSwgjy2Z9A0.u02nZ2l9g.Vc/7hQm', NULL, 'Yes', 0, 0, '0', '2020-07-15 10:53:54', '2020-07-15 10:53:54'),
(76, 5, 'Michael Yep', 'Michael.Yep@demo.uk', 'Manager ', NULL, NULL, 'user_image.png', NULL, '$2y$10$uZfzHa501vP5NAcR9SMugOZBFCQlg1kKrQdq2oE/bt0syG2SQEQ2C', NULL, 'Yes', 0, 0, '0', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(77, 5, 'Johanna Trent', 'Johanna.Trent@demo.uk', 'LoM Administrator', NULL, NULL, 'user_image.png', NULL, '$2y$10$4pMGU9bHdKijTp3wRX/3hO8ImXKfKdfET3UEwPneaZU5hUomS/B9m', NULL, 'Yes', 0, 0, '0', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(78, 5, 'William Tell', 'William.Tell@demo.uk', 'Vendors Coordinator', NULL, NULL, 'user_image.png', NULL, '$2y$10$3ok0i9PwlxmALNeyEcYuFumG1qoG0/9l3mNnpYGajAYpgAHZ7Rnlq', NULL, 'Yes', 0, 0, '0', '2020-07-15 10:53:55', '2020-07-15 10:53:55'),
(79, NULL, 'Joe Doe', 'joe.doe@demo.ae', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$7fl1OReL6S/I08II6lnaTu7DBf5kntDcgYyre6eEKpvm8N6OTk2LK', NULL, 'Yes', 0, 0, '0', '2020-07-20 06:33:04', '2020-07-20 06:33:04'),
(80, NULL, 'Joe Doe', 'Joe.doe@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$cG2Uv2HzB./endkJTXnud.oZCuwzRJN9noRhwW4amM.YaMLmR4vCu', NULL, 'Yes', 0, 0, '0', '2020-07-21 05:36:09', '2020-07-21 05:36:09'),
(81, NULL, 'Ali', 'ali.raiyu@demo.com', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$QOZZWPPjFaPOOom8QeTROONyqVkAmVEjd4Z1yOEFGkJgBzsE12K7G', NULL, 'Yes', 0, 0, '0', '2020-08-03 08:36:53', '2020-08-03 08:36:53'),
(116, NULL, 'test 66', 'test66@test.com', 'dd', NULL, NULL, 'user_image.png', NULL, '$2y$10$Q2VpRbRVM1O.pr9jtU.6.e.OPCmXk0sU98M4BiO.d8XeQ/tlW32CW', NULL, 'Yes', 0, 0, '4', '2020-09-08 21:16:39', '2020-09-08 21:16:39'),
(115, NULL, 'farooq', 'farooq@stackbuffers.com', 'vela', NULL, NULL, 'user_image.png', NULL, '$2y$10$qoiLZNF5BXqwIfR/MYjc/.W3ZOnR8NvEzIxDfeXND4eG9CMknDrBq', NULL, 'Yes', 0, 0, '4', '2020-09-06 18:57:45', '2020-09-06 18:57:45'),
(114, NULL, 'umer bilal', 'umerbilal.leo@gmail.com', 'developer', NULL, NULL, 'user_image.png', NULL, '$2y$10$hNMZW1AtcZwH18F.tt3XreOtIdr.LDdVY.QfMJGH6n.8lfNKDXehi', NULL, 'Yes', 0, 0, '0', '2020-09-05 01:49:52', '2020-09-05 01:49:52'),
(126, NULL, 'test32', 'test555@gmail.com', 'ddd', NULL, NULL, 'user_image.png', NULL, '$2y$10$zE5GqSVrtS49wc2Pxk87RubIf/df3TOxokNFj6wG8FsFI2McmcQS6', NULL, 'Yes', 0, 0, '4', '2020-09-11 02:52:54', '2020-09-11 02:52:54'),
(317, 7, 'strv', 'strv@test.com', 'STRV', NULL, NULL, 'user_image.png', NULL, '$2y$10$XjYLPnHz2xCSBH/iogj4jucaNaRptdRMqaEqrYAaui/3ncLMxdvkq', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(316, 7, 'stmro', 'stmro@test.com', 'STMRO', NULL, NULL, 'user_image.png', NULL, '$2y$10$pV0w1fZHGfKptw1s4kU9GOE8JC98q69Lozta4GcjwkHLwIvEKRyUa', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(315, 7, 'sicr', 'sicr@test.com', 'SICR', NULL, NULL, 'user_image.png', NULL, '$2y$10$harrU8mmPEyD4xtEioMtJOx3CePcRNQnzWFYlwsDhLXKpo8r7a046', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(314, 7, 'icr', 'icr@test.com', 'ICR', NULL, NULL, 'user_image.png', NULL, '$2y$10$ZNqfPZ4.pcBxbMT4p1GeSOGIM50cP5Liwu.1T9iSpRfZZCk6lGJ2y', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(313, 7, 'vqa', 'vqa@test.com', 'VQA', NULL, NULL, 'user_image.png', NULL, '$2y$10$/esq0LvVRohOiVbeS6YacepjETYuqzwtNe4f.JXzawv7PBDuT5nM.', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(312, 7, 'poy', 'poy@test.com', 'PNV', NULL, NULL, 'user_image.png', NULL, '$2y$10$a3etNNXfKocgfQ9TvEM7L.O7M5FQM59kCPklSemAcfYfwVLH19fTW', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(311, 7, 'lol', 'lol@test.com', 'RNo', NULL, NULL, 'user_image.png', NULL, '$2y$10$4Ky3sWLehoxxZ1C9pS6c0eSE5VD04wFBinFf9EdkxHvJkgr7lI6dC', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(310, 7, 'zah', 'zah@test.com', 'POV', NULL, NULL, 'user_image.png', NULL, '$2y$10$9heTTcjJzX.DRbGbCHSA9Oq4KWcetszCpQ2y3Pd5SofuJdxpl4dAi', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:55', '2020-09-30 22:54:55'),
(309, 7, 'papu', 'papu@test.com', 'POO', NULL, NULL, 'user_image.png', NULL, '$2y$10$AO7FyFgTabWwETkvSjyIpuIGy..rkXBgf/RhC4MKmX2jOSRDMrYFm', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(308, 7, 'opi', 'opi@test.com', 'RPA', NULL, NULL, 'user_image.png', NULL, '$2y$10$68APyQZXfyaimew2sDOKsuZ5fqwdwfyBLRhXhv1djyL5dtC3uUvjW', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(307, 7, 'wpo', 'wpo@test.com', 'LMV', NULL, NULL, 'user_image.png', NULL, '$2y$10$QfsOXZQF6qBcEY24pA6.heZ7u0xeRcHdHZIRAxeptqvDUpqiLUaEi', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(306, 7, 'plo', 'plo@test.com', 'LMA', NULL, NULL, 'user_image.png', NULL, '$2y$10$qKg28nk7.hPNfyxfxawDpeGmfE0.FXaIQ63B6ecQAj0fGCgifkshK', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(305, 7, 'fog', 'fog@test.com', 'LMURO', NULL, NULL, 'user_image.png', NULL, '$2y$10$CGXNp3AQx5MkKdva02Oa9e2dQfoLT1m0hMq1mEviGnB1coqWqmuA6', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(304, 7, 'ded', 'ded@test.com', 'PEO', NULL, NULL, 'user_image.png', NULL, '$2y$10$nVxOskSu7A/gp2cUX/dVDOiR9KDiP9tR2FFiDhXByuYM8tTzx42NO', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:54', '2020-09-30 22:54:54'),
(303, 7, 'stm', 'stm@test.com', 'STM', NULL, NULL, 'user_image.png', NULL, '$2y$10$eY6TmFXe2ZQlCJ65xC5laueoofjcjhkMmo2oQjczzHfF/LwbsUL.G', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(302, 7, 'adi', 'adminstrator@test.com', 'adminstrator', NULL, NULL, 'user_image.png', NULL, '$2y$10$vGnPHPJPSbstRC5hqrMVXuzdPzPyXCaiolDWp2Ncb1yZ2JUNcxgqG', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:53', '2020-09-30 22:54:53'),
(318, 7, 'ituro', 'ituro@test.com', 'ITURO', NULL, NULL, 'user_image.png', NULL, '$2y$10$PQkrc08BgbQjlyiOQ8k/HO7qFkMmpuytmfSciAszOQn9dQHUY.DVC', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(319, 7, 'siturv', 'siturv@test.com', 'SITURV', NULL, NULL, 'user_image.png', NULL, '$2y$10$G8GI9HGeIvMCcgzKwmuHs.Ti/DjQLZ/twZyhYh8zURL5KmYL7saPO', NULL, 'Yes', 0, 0, '0', '2020-09-30 22:54:56', '2020-09-30 22:54:56'),
(322, 9, 'mytest', 'mytest@test.com', 'CEO', NULL, NULL, 'user_image.png', NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', NULL, 'Yes', 0, 1, '0', '2020-10-01 00:19:20', '2020-10-01 00:20:08'),
(323, 10, 'newacc', 'newacc@test.com', 'CEO', NULL, NULL, 'user_image.png', NULL, '$2y$10$0M.ncWJ0k9hB11LSOMW7sOmewNAMktpZ/XyVO6oFiFkGouzxZ5HES', NULL, 'Yes', 1, 3, '0', '2020-10-01 00:49:55', '2020-10-01 00:51:45'),
(324, 11, 'test67', 'test67@test.com', 'CEO', NULL, NULL, 'user_image.png', NULL, '$2y$10$68sgZGpp7FPpltCMUOUqbe1tPXpq4nlRp8wyyBFcOVuHyyKEuC5dq', NULL, 'Yes', 0, 4, '0', '2020-10-06 22:51:57', '2020-10-06 23:04:42'),
(338, 11, 'emp7', 'emp7@test.com', 'erw', NULL, NULL, 'user_image.png', NULL, '$2y$10$7vjrXiCQfakrIv6oH0VW6.2adyw7sEL0r.b88FnDNVAhp9dac3LO2', NULL, 'Yes', 1, 0, '0', '2020-10-06 23:04:40', '2020-10-06 23:04:40'),
(337, 11, 'emp4', 'emp4@test.com', 'asdaz', NULL, NULL, 'user_image.png', NULL, '$2y$10$5ly1CQ6EtF3/DQKqwCPGHe6C0hJO0Vd/N854eFjNjHBW3ctTAa.Fq', NULL, 'Yes', 1, 0, '0', '2020-10-06 23:04:39', '2020-10-06 23:04:39'),
(336, 11, 'emp6', 'emp6@test.com', 'ghj', NULL, NULL, 'user_image.png', NULL, '$2y$10$iXD7CcS9yU6W52gjuzOMFeAwCthiFVtOUZkImC84Ez5xqSazwOJnC', NULL, 'Yes', 1, 0, '0', '2020-10-06 23:04:39', '2020-10-06 23:04:39'),
(335, 11, 'emp5', 'emp5@test.com', 'tyuty', NULL, NULL, 'user_image.png', NULL, '$2y$10$5UIA5NhNWxFZbNGVoPOHweFrACHz9xJm4TJ5Q22TsQWliocne4IHG', NULL, 'Yes', 1, 0, '0', '2020-10-06 23:04:39', '2020-10-06 23:04:39'),
(334, 11, 'emp3', 'emp3@test.com', 'jkjk', NULL, NULL, 'user_image.png', NULL, '$2y$10$b/cdsYuC6k1pBstsJFj73Or0J5BJrJquQWlQfflOXPt07Cs9Tr.qq', NULL, 'Yes', 1, 0, '0', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(333, 11, 'emp2', 'emp@test.com', 'ssdd', NULL, NULL, 'user_image.png', NULL, '$2y$10$JGiSkywPz2iu5jNLcyI5DeKJUaWKTLYn7exdSvhYGbd5Dp4XIFv6m', NULL, 'Yes', 1, 0, '0', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(332, 11, 'emp 1', 'emp1@test.com', 'apa', NULL, NULL, 'user_image.png', NULL, '$2y$10$GlW/wccRTL1TNDtqusc./OANNPETxxUV0RZT5Lxx6AztpNY16rzy6', NULL, 'Yes', 1, 0, '0', '2020-10-06 23:04:38', '2020-10-06 23:04:38'),
(339, 11, 'John SUBO', 'john.subo@demo.ae', 'apa', NULL, NULL, '1612011587Napo.JPG', 'image1641612375369jfif', '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', NULL, 'Yes', 0, 4, '0', '2020-10-06 23:04:38', '2021-02-03 22:02:49'),
(340, 11, 'John SUBV1', 'john.subv1@demo.ae', 'apa', NULL, NULL, '1612375564Logo.JPG', NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', NULL, 'Yes', 0, 3, '0', '2020-10-06 23:04:38', '2021-02-03 22:06:04'),
(341, 11, 'John SUBV2', 'john.subv2@demo.ae', 'apa', NULL, NULL, 'user_image.png', NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', NULL, 'Yes', 0, 4, '0', '2020-10-06 23:04:38', '2020-12-08 13:31:02'),
(343, 12, 'Samad', 'ansarisamad360+1@gmail.com', 'abc', NULL, NULL, 'user_image.png', NULL, '$2y$10$F.Oyutwuwsb86osPQpWtMeZrt4HODRF8zS2/I5BjW5jzPHrhl7xjG', NULL, 'Yes', 1, 3, '0', '2020-12-08 14:37:30', '2020-12-09 20:36:04'),
(344, 13, 'admin', 'admin@admin.com', 'admin', NULL, NULL, 'user_image.png', NULL, '$2y$10$RQ9pYI7bCFXAK62sWSo4I.TxXBMXMDycCaszq/VMze2OJZIs.8vke', NULL, 'Yes', 1, 4, '12', '2020-12-10 12:02:08', '2021-01-16 09:12:48'),
(345, 13, 'asdf', 'plo@gmail.com', 'asdf', NULL, NULL, 'user_image.png', NULL, '$2y$10$grJl5tzeTeNfzmf3lcmhJO5Y9csImpsWbSZilxaO7oFSm8NywA/cS', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:04', '2021-01-16 09:12:04'),
(346, 13, 'fa', 'oiuyyt@gmail.com', 'fa', NULL, NULL, 'user_image.png', NULL, '$2y$10$1iAfT.W4cHazZqD/VIpPC.afA4ickITRaQKg3UhCzVAVjF8Ii4E62', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(347, 13, 'ads', 'mnbvc@gmail.com', 'ads', NULL, NULL, 'user_image.png', NULL, '$2y$10$CB4ja37pmbF64CgFFTNhd.aLGJepyEtfhjrsGN5ZEijtpeB2mZWlW', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(348, 13, 'sdf', 'qwer@gmail.com', 'sdf', NULL, NULL, 'user_image.png', NULL, '$2y$10$ZghBUjN1tBW4qA6XE.HTd.xJADkxfX0w177q9.O367/SbVlhAh91m', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(349, 13, 'd', 'aqib@gmail.com', 'd', NULL, NULL, 'user_image.png', NULL, '$2y$10$0wNUtFn.9yByfxv8ym/xN.akRvDlVF3XFU31mHSJ0YnmOCu9AnrNu', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(350, 13, 'samad', 'samad@gmail.com', 'samad', NULL, NULL, 'user_image.png', NULL, '$2y$10$8ZLId2y.HTca.gv6AXbiHeg9sEO8Bp4ln7jwdqE70e3o.hZM0XLUG', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(351, 13, 'ali', 'ali@gmail.com', 'ali', NULL, NULL, 'user_image.png', NULL, '$2y$10$4EPKGGvQOfx5oFzIiu7ihuvuyfFG18dGnT5WucgkPUzPLlyzz30te', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:05', '2021-01-16 09:12:05'),
(352, 13, 'asdf', 'qwert@gmail.com', 'asdf', NULL, NULL, 'user_image.png', NULL, '$2y$10$DVN5TzTCdD4w6T3fZ5pguOfa5JMG7C6idEWwXiSGjR0xM7NRDNlBC', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(353, 13, 'sdf', 'nclc@gmail.com', 'sdf', NULL, NULL, 'user_image.png', NULL, '$2y$10$iy3Q1.i4Iz9EQo2mTEevMe6A0nLkPXJKe09oq5/olFBipBSKUQXSC', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(354, 13, 'asdf', 'john@gmail.com', 'asdf', NULL, NULL, 'user_image.png', NULL, '$2y$10$B/Lb/9LWFNOEAo/R1k1ZJOrlTfDMuOSaS9HuknYMZItc2nUFRHhj.', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(355, 13, 'fa', 'qaz@gmail.com', 'fa', NULL, NULL, 'user_image.png', NULL, '$2y$10$U1fgNXy2g2vNPD8yfR4giOaxRkYU9iz1ZfQjzDYJ9R3l/ZM0Pn0Q.', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(356, 13, 'asdf', 'zxx@gmail.com', 'asdf', NULL, NULL, 'user_image.png', NULL, '$2y$10$my0BmAbZqH/pJN54iZQCe.ZvR2pZhy2eN14NnMeKE.pUKSq4GKdXy', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(357, 13, 'df', 'edfv@gmail.com', 'df', NULL, NULL, 'user_image.png', NULL, '$2y$10$mr9.vLwcK.cdkAPZUA3GjOm3f7eXqDLwv92X5SrLMS3Ff5cyyULcK', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(358, 13, 'asdf', 'qwwer@gmail.com', 'asdf', NULL, NULL, 'user_image.png', NULL, '$2y$10$ktdgooa67iJ1d4J1tRgflepjMz.ag69gpVfA4SGnaivEALDSd660u', NULL, 'Yes', 1, 0, '0', '2021-01-16 09:12:06', '2021-01-16 09:12:06'),
(359, 14, 'Samad Younas', 'abc@demo.ae', 'abc', NULL, NULL, 'user_image.png', NULL, '$2y$10$04SYgio.NH9gQ4btLRLN8u9Dy3/tplwDCjNkOnV2SUOku.w0KWGIO', NULL, 'Yes', 1, 3, '0', '2021-01-22 11:03:16', '2021-01-22 11:57:42'),
(360, 15, 'Ray Donovan', 'Ray.Donovan@test.ae', 'Director', NULL, NULL, 'user_image.png', NULL, '$2y$10$CHfEcx2NVshSu8f.wD/HdOmz/r00QZjVbPIylAswshzkJNFWrP/iy', NULL, 'Yes', 0, 4, '0', '2021-01-30 11:24:23', '2021-01-30 16:55:01'),
(361, 16, 'Ben Jerry', 'ben.jerry@demo.tech', 'Manager', NULL, NULL, 'user_image.png', NULL, '$2y$10$XHa7bPAKwrquOX9.Hguo3Oc0yeOBhx9E/Z7rOA.wGFoCdEoXo9Ei6', NULL, 'Yes', 1, 3, '0', '2021-02-03 22:16:24', '2021-02-03 22:26:18'),
(362, 17, 'Muhammad Talha', 'talha@manageglobally.io', 'user', NULL, NULL, 'user_image.png', NULL, '$2y$10$.Svf/PlEYbrqsjQNOE90Ku6jZ478ASwrfuLkvlmwtwkZTR7.qjyOi', NULL, 'Yes', 0, 4, '0', '2021-03-05 14:57:47', '2021-03-05 16:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(255) UNSIGNED NOT NULL,
  `company_id` int(255) NOT NULL,
  `created_by` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rep_name` varchar(255) NOT NULL,
  `rep_title` text,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `po_box` varchar(255) DEFAULT NULL,
  `phone` text,
  `mobile` text,
  `url` text,
  `lic_num` varchar(255) DEFAULT NULL,
  `lic_expiry_date` datetime DEFAULT NULL,
  `officer_name` varchar(255) DEFAULT NULL,
  `officer_phone` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_iban` varchar(255) DEFAULT NULL,
  `turnover` varchar(255) DEFAULT NULL,
  `open_since` varchar(255) DEFAULT NULL,
  `sold_brands` text,
  `exculsive_brands` text,
  `vendor_type` varchar(255) DEFAULT NULL,
  `vendor_score` varchar(45) DEFAULT NULL,
  `provided_service` text,
  `linked_item_templates` text,
  `notes` text,
  `status` varchar(45) NOT NULL DEFAULT 'Valid Vendor Qualification',
  `active` varchar(45) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `company_id`, `created_by`, `name`, `rep_name`, `rep_title`, `address`, `city`, `country`, `po_box`, `phone`, `mobile`, `url`, `lic_num`, `lic_expiry_date`, `officer_name`, `officer_phone`, `bank_name`, `bank_iban`, `turnover`, `open_since`, `sold_brands`, `exculsive_brands`, `vendor_type`, `vendor_score`, `provided_service`, `linked_item_templates`, `notes`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 'Namshi LLC', 'Johnny B. Weismuller', NULL, 'Street 20D, Compound 6, Dubai', '', '', '117774', '0097143323895', '547650065', 'https://www.namshi-me.com', 'SAE-332134590', '2021-07-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IT Installtion Services', NULL, NULL, 'Good Standing', 'Yes', '2019-07-23 03:17:19', '2019-08-27 03:18:41'),
(2, 1, 21, 'Philips plc.', 'Jo Ray', NULL, 'Burj Khalifa, 103rd floor, Suite 1.', '', '', '888900', '009714342679', '971502548900', 'https://www.philips.co.uk', 'WE-SA-1234568', '2023-07-06 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MEP Serives', NULL, NULL, 'Good Standing', 'Yes', '2019-07-23 03:44:20', '2019-07-23 03:44:20'),
(3, 1, 21, 'Siemens AG', 'Willem Krugger', NULL, 'Etihad Tower, 56th floor. Suite 12. Abu Dhabi. UAE', '', '', '785560', '00712334689', '0097154332363', 'https://www.siemens.com', 'RTW-44457', '2017-07-10 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Good Standing', 'Yes', '2019-07-23 03:53:14', '2019-07-23 03:53:14'),
(4, 1, 21, 'Centrica plc.', 'Bill Ray', 'Commercial Director', 'one main street', 'Casablanca', 'United Kingdom', '112356', '00212-7762954', '00212-7762998', 'https://www.centrica.com/', 'TN-4453689', '2021-08-07 00:00:00', 'Iain Conn', '00212-44789368', 'HSBC Limited', '77884321SN90', '35,000,000 US$', '1923', NULL, 'ITT, KSB, Lowara', 'o Wholesaler and Distributor', NULL, 'Supply of Electrical Spare Parts,Professional (Legal, Marketing, Consultancy, Design, Project Management, Security, Gardening, Cleaning…) Services', NULL, 'No additional notes.', 'Good Standing', 'Yes', '2019-08-04 02:25:08', '2019-08-04 02:25:08'),
(5, 1, 21, 'Dalkia LLC.', 'Luc Besson', 'Directeur Commercial', '67, Boulvard Hausman', 'Paris', 'France', '9984578', '00214-4432589', '00214-7753254', 'https://www.dalkia.fr/en', '6677-FRPA-1914', '2022-08-07 00:00:00', 'Guy Stephan', '00214-77112456', 'Societe Generale', '556TYU-9906567', '6,670,000,000 Euros', '1914', 'Perkins', 'Perkins', 'Franchisor', NULL, NULL, NULL, 'First year of operations In our shores', 'Good Standing', 'Yes', '2019-08-04 02:43:02', '2019-08-04 02:43:02'),
(6, 1, 21, 'Dalkia LLC.', 'Luc Besson', 'Directeur Commercial', '67, Boulvard Hausman', 'Paris', 'France', '9984578', '00214-4432589', '00214-7753254', NULL, '6677-FRPA-1914', '2022-08-07 00:00:00', 'Guy Stephan', '00214-77112456', 'Societe Generale', '556TYU-9906567', '6,670,000,000 Euros', '1914', 'Perkins', 'Perkins', 'Franchisor', NULL, NULL, NULL, 'First year of operations in our country.', 'Good Standing', 'No', '2019-08-04 02:44:26', '2019-08-27 03:20:25'),
(7, 1, 21, 'Dalkia LLC.', 'Luc Besson', 'Directeur Commercial', '67, Boulvard Hausman', 'Paris', 'France', '9984578', '00214-4432589', '00214-7753254', NULL, '6677-FRPA-1914', '2022-08-07 00:00:00', 'Guy Stephan', '00214-77112456', 'Societe Generale', '556TYU-9906567', '6,670,000,000 Euros', '1914', 'Perkins', 'Perkins', 'Franchisor', NULL, NULL, NULL, NULL, 'Good Standing', 'No', '2019-08-04 02:45:06', '2019-08-27 03:20:29'),
(8, 1, 21, 'Dalkia LLC.', 'Luc Besson', 'Directeur Commercial', '67, Boulvard Hausman', 'Paris', 'France', '9984578', '00214-4432589', '00214-7753254', NULL, '6677-FRPA-1914', '2022-08-07 00:00:00', 'Guy Stephan', '00214-77112456', 'Societe Generale', '556TYU-9906567', '6,670,000,000 Euros', '1914', 'Perkins', 'Perkins', 'Franchisor', NULL, NULL, NULL, NULL, 'Good Standing', 'No', '2019-08-04 02:45:40', '2019-08-27 03:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_itemtemplates`
--

CREATE TABLE `vendor_itemtemplates` (
  `id` int(255) UNSIGNED NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `template_id` int(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_qualification_docs`
--

CREATE TABLE `vendor_qualification_docs` (
  `id` int(255) UNSIGNED NOT NULL,
  `created_by` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `document_name` text NOT NULL,
  `auto_generated_name` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_qualification_docs`
--

INSERT INTO `vendor_qualification_docs` (`id`, `created_by`, `company_id`, `vendor_id`, `document_name`, `auto_generated_name`, `created_at`, `updated_at`) VALUES
(2, 21, 1, 5, 'General T&C.docx', '1564904582General T&C.docx', '2019-08-04 02:43:02', '2019-08-04 02:43:02'),
(3, 21, 1, 5, 'Logo. Alfresco.png', '1564904582Logo. Alfresco.png', '2019-08-04 02:43:02', '2019-08-04 02:43:02'),
(4, 21, 1, 6, 'AYA.png.webp', '1564904666AYA.png.webp', '2019-08-04 02:44:26', '2019-08-04 02:44:26'),
(5, 21, 1, 6, 'General T&C.docx', '1564904666General T&C.docx', '2019-08-04 02:44:26', '2019-08-04 02:44:26'),
(6, 21, 1, 6, 'Logo. Alfresco.png', '1564904666Logo. Alfresco.png', '2019-08-04 02:44:26', '2019-08-04 02:44:26'),
(7, 21, 1, 7, 'AYA.png.webp', '1564904706AYA.png.webp', '2019-08-04 02:45:06', '2019-08-04 02:45:06'),
(8, 21, 1, 7, 'General T&C.docx', '1564904706General T&C.docx', '2019-08-04 02:45:06', '2019-08-04 02:45:06'),
(9, 21, 1, 7, 'Logo. Alfresco.png', '1564904706Logo. Alfresco.png', '2019-08-04 02:45:06', '2019-08-04 02:45:06'),
(10, 21, 1, 8, 'AYA.png.webp', '1564904740AYA.png.webp', '2019-08-04 02:45:40', '2019-08-04 02:45:40'),
(11, 21, 1, 8, 'General T&C.docx', '1564904740General T&C.docx', '2019-08-04 02:45:40', '2019-08-04 02:45:40'),
(12, 21, 1, 8, 'Logo. Alfresco.png', '1564904740Logo. Alfresco.png', '2019-08-04 02:45:40', '2019-08-04 02:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_users`
--

CREATE TABLE `vendor_users` (
  `id` int(255) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `picture` varchar(255) DEFAULT 'user_image.png',
  `login_image` varchar(255) DEFAULT NULL,
  `phone_number` text,
  `address` text,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `active` varchar(45) DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_users`
--

INSERT INTO `vendor_users` (`id`, `name`, `email`, `picture`, `login_image`, `phone_number`, `address`, `password`, `remember_token`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Namshi John', 'Namshi.John@demo.ae', '1570279698Muaz Malas.jpg', 'image9701600165190jpg', NULL, NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', 'OuQ0c1hxCaMoeNWPu8jp6SdwpayoDBy8psGuZUfN7cCyGNfncxWjax9BIuGh', 'Yes', '2019-07-23 04:13:59', '2020-09-15 00:19:50'),
(2, 'Namshi Bill Invoice', 'Namshi.billInvoice@demo.ae', 'user_image.png', NULL, NULL, NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', 'OuQ0c1hxCaMoeNWPu8jp6SdwpayoDBy8psGuZUfN7cCyGNfncxWjax9BIuGh', 'Yes', '2019-07-23 04:17:20', '2019-07-23 04:17:20'),
(3, 'Philips Bill Invoice', 'Philips.billInvoice@demo.ae', 'user_image.png', NULL, NULL, NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', 'OuQ0c1hxCaMoeNWPu8jp6SdwpayoDBy8psGuZUfN7cCyGNfncxWjax9BIuGh', 'Yes', '2019-07-23 04:22:34', '2019-07-23 04:22:34'),
(4, 'Philips Bill Invoice', 'Philips.billInvoice@demo.ae', 'user_image.png', NULL, NULL, NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', 'OuQ0c1hxCaMoeNWPu8jp6SdwpayoDBy8psGuZUfN7cCyGNfncxWjax9BIuGh', 'No', '2019-07-23 04:22:34', '2019-07-23 04:24:04'),
(5, 'Philips John', 'Philips.John@demo.ae', 'user_image.png', NULL, NULL, NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', 'OuQ0c1hxCaMoeNWPu8jp6SdwpayoDBy8psGuZUfN7cCyGNfncxWjax9BIuGh', 'Yes', '2019-07-23 04:24:52', '2019-07-23 04:24:52'),
(6, 'Siemens John', 'Siemen.John@demo.ae', 'user_image.png', NULL, NULL, NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', 'OuQ0c1hxCaMoeNWPu8jp6SdwpayoDBy8psGuZUfN7cCyGNfncxWjax9BIuGh', 'Yes', '2019-07-23 04:26:17', '2019-07-23 04:26:17'),
(7, 'Siemens Bill Invoice', 'Siemen.billinvoice@demo.ae', 'user_image.png', NULL, NULL, NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', 'OuQ0c1hxCaMoeNWPu8jp6SdwpayoDBy8psGuZUfN7cCyGNfncxWjax9BIuGh', 'Yes', '2019-07-23 04:27:01', '2019-07-23 04:27:01'),
(8, 'Bill Ray', 'bill.ray@centrica.co.uk', 'user_image.png', NULL, NULL, NULL, '$2y$10$6HWMPWf/qcNYozCFjSG5a.r3B.xWLpbR0WWh6we3aZ121HhYuGptm', 'OuQ0c1hxCaMoeNWPu8jp6SdwpayoDBy8psGuZUfN7cCyGNfncxWjax9BIuGh', 'Yes', '2019-08-04 02:28:48', '2019-08-04 02:28:48');

-- --------------------------------------------------------

--
-- Table structure for table `volume_discount`
--

CREATE TABLE `volume_discount` (
  `id` int(255) NOT NULL,
  `quotation_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `vendor_user_id` int(255) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `from_value` float NOT NULL,
  `to_value` float NOT NULL,
  `precentage_value` float NOT NULL,
  `active` varchar(255) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `budget_master`
--
ALTER TABLE `budget_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_master_setup`
--
ALTER TABLE `budget_master_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charts`
--
ALTER TABLE `charts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `excel_tamplate`
--
ALTER TABLE `excel_tamplate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `excel_user`
--
ALTER TABLE `excel_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financial_limits`
--
ALTER TABLE `financial_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_checks`
--
ALTER TABLE `health_checks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `health_checks_resource_slug_index` (`resource_slug`),
  ADD KEY `health_checks_target_slug_index` (`target_slug`),
  ADD KEY `health_checks_created_at_index` (`created_at`);

--
-- Indexes for table `histories_budgetcreationrequest`
--
ALTER TABLE `histories_budgetcreationrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories_budgetmaster`
--
ALTER TABLE `histories_budgetmaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories_itemcreationrequest`
--
ALTER TABLE `histories_itemcreationrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories_itemmaster`
--
ALTER TABLE `histories_itemmaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories_purchaseenquiry`
--
ALTER TABLE `histories_purchaseenquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories_ratecontractrequest`
--
ALTER TABLE `histories_ratecontractrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories_stockitem`
--
ALTER TABLE `histories_stockitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories_stockitemrequest`
--
ALTER TABLE `histories_stockitemrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories_vendor`
--
ALTER TABLE `histories_vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_budget_master`
--
ALTER TABLE `history_budget_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_item_master`
--
ALTER TABLE `history_item_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_purchase_enquiry`
--
ALTER TABLE `history_purchase_enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_purchase_order`
--
ALTER TABLE `history_purchase_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_purchase_order_cancellation`
--
ALTER TABLE `history_purchase_order_cancellation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_rate_contract`
--
ALTER TABLE `history_rate_contract`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_rate_contract_request`
--
ALTER TABLE `history_rate_contract_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_stock_item`
--
ALTER TABLE `history_stock_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_stock_item_issue_request`
--
ALTER TABLE `history_stock_item_issue_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_stock_item_request`
--
ALTER TABLE `history_stock_item_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_stock_item_return_request`
--
ALTER TABLE `history_stock_item_return_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_stock_transfer`
--
ALTER TABLE `history_stock_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histroy_rn_receiving`
--
ALTER TABLE `histroy_rn_receiving`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_master`
--
ALTER TABLE `item_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_master_setup`
--
ALTER TABLE `item_master_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_requests`
--
ALTER TABLE `item_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `laravel_logs`
--
ALTER TABLE `laravel_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laravel_logs_application_index` (`application`),
  ADD KEY `laravel_logs_instance_index` (`instance`),
  ADD KEY `laravel_logs_channel_index` (`channel`),
  ADD KEY `laravel_logs_level_index` (`level`),
  ADD KEY `laravel_logs_created_by_index` (`created_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

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
-- Indexes for table `pivot_vendor_vendorusers`
--
ALTER TABLE `pivot_vendor_vendorusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_enquiries`
--
ALTER TABLE `purchase_enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_enquiry_commerical_evaluation_pivot`
--
ALTER TABLE `purchase_enquiry_commerical_evaluation_pivot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_enquiry_quantity_changes`
--
ALTER TABLE `purchase_enquiry_quantity_changes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_enquiry_vendor_uploaded_docs`
--
ALTER TABLE `purchase_enquiry_vendor_uploaded_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_cancellation_requests`
--
ALTER TABLE `purchase_order_cancellation_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_line_rfi_communications`
--
ALTER TABLE `purchase_order_line_rfi_communications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_purchase_enquiries_pivot`
--
ALTER TABLE `purchase_order_purchase_enquiries_pivot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_quotation_reposnses_pivot`
--
ALTER TABLE `purchase_order_quotation_reposnses_pivot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotationrequests_purchaseenquiries`
--
ALTER TABLE `quotationrequests_purchaseenquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotationrequests_ratecontractsrequests`
--
ALTER TABLE `quotationrequests_ratecontractsrequests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotationrequests_vendors`
--
ALTER TABLE `quotationrequests_vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_commerical_evaluations`
--
ALTER TABLE `quotation_commerical_evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_pe_rfi_communication`
--
ALTER TABLE `quotation_pe_rfi_communication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_rc_rfi_communication`
--
ALTER TABLE `quotation_rc_rfi_communication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_requests`
--
ALTER TABLE `quotation_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_responses`
--
ALTER TABLE `quotation_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_response_tracker`
--
ALTER TABLE `quotation_response_tracker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_contracts`
--
ALTER TABLE `rate_contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_contract_line_rfi_communications`
--
ALTER TABLE `rate_contract_line_rfi_communications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_contract_quotation_responses`
--
ALTER TABLE `rate_contract_quotation_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_contract_rate_contract_quotation_responses_pivot`
--
ALTER TABLE `rate_contract_rate_contract_quotation_responses_pivot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_contract_rate_contract_request_pivot`
--
ALTER TABLE `rate_contract_rate_contract_request_pivot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_contract_requests`
--
ALTER TABLE `rate_contract_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_contract_request_commerical_evaluation_pivot`
--
ALTER TABLE `rate_contract_request_commerical_evaluation_pivot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_contract_request_quantity_changes`
--
ALTER TABLE `rate_contract_request_quantity_changes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_contract_request_vendor_uploaded_docs`
--
ALTER TABLE `rate_contract_request_vendor_uploaded_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipt_notes`
--
ALTER TABLE `receipt_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipt_note_receivings`
--
ALTER TABLE `receipt_note_receivings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipt_note_receiving_invoices`
--
ALTER TABLE `receipt_note_receiving_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommends`
--
ALTER TABLE `recommends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_up_budget_requests`
--
ALTER TABLE `set_up_budget_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockitems_purchaseenquiries`
--
ALTER TABLE `stockitems_purchaseenquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockitems_stockitemrequests`
--
ALTER TABLE `stockitems_stockitemrequests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_issuance_records`
--
ALTER TABLE `stock_issuance_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_items`
--
ALTER TABLE `stock_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_item_issue_requests`
--
ALTER TABLE `stock_item_issue_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_item_requests`
--
ALTER TABLE `stock_item_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_item_return_requests`
--
ALTER TABLE `stock_item_return_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_transfer_requests`
--
ALTER TABLE `stock_transfer_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_error_log`
--
ALTER TABLE `system_error_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_itemtemplates`
--
ALTER TABLE `vendor_itemtemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_qualification_docs`
--
ALTER TABLE `vendor_qualification_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_users`
--
ALTER TABLE `vendor_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volume_discount`
--
ALTER TABLE `volume_discount`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=686;

--
-- AUTO_INCREMENT for table `budget_master`
--
ALTER TABLE `budget_master`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `budget_master_setup`
--
ALTER TABLE `budget_master_setup`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charts`
--
ALTER TABLE `charts`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `excel_tamplate`
--
ALTER TABLE `excel_tamplate`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `excel_user`
--
ALTER TABLE `excel_user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `financial_limits`
--
ALTER TABLE `financial_limits`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `health_checks`
--
ALTER TABLE `health_checks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories_budgetcreationrequest`
--
ALTER TABLE `histories_budgetcreationrequest`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `histories_budgetmaster`
--
ALTER TABLE `histories_budgetmaster`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `histories_itemcreationrequest`
--
ALTER TABLE `histories_itemcreationrequest`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories_itemmaster`
--
ALTER TABLE `histories_itemmaster`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `histories_purchaseenquiry`
--
ALTER TABLE `histories_purchaseenquiry`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `histories_ratecontractrequest`
--
ALTER TABLE `histories_ratecontractrequest`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories_stockitem`
--
ALTER TABLE `histories_stockitem`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories_stockitemrequest`
--
ALTER TABLE `histories_stockitemrequest`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories_vendor`
--
ALTER TABLE `histories_vendor`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_budget_master`
--
ALTER TABLE `history_budget_master`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `history_item_master`
--
ALTER TABLE `history_item_master`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_purchase_enquiry`
--
ALTER TABLE `history_purchase_enquiry`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `history_purchase_order`
--
ALTER TABLE `history_purchase_order`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `history_purchase_order_cancellation`
--
ALTER TABLE `history_purchase_order_cancellation`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_rate_contract`
--
ALTER TABLE `history_rate_contract`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_rate_contract_request`
--
ALTER TABLE `history_rate_contract_request`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_stock_item`
--
ALTER TABLE `history_stock_item`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_stock_item_issue_request`
--
ALTER TABLE `history_stock_item_issue_request`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_stock_item_request`
--
ALTER TABLE `history_stock_item_request`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_stock_item_return_request`
--
ALTER TABLE `history_stock_item_return_request`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_stock_transfer`
--
ALTER TABLE `history_stock_transfer`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histroy_rn_receiving`
--
ALTER TABLE `histroy_rn_receiving`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_master`
--
ALTER TABLE `item_master`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `item_master_setup`
--
ALTER TABLE `item_master_setup`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `item_requests`
--
ALTER TABLE `item_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laravel_logs`
--
ALTER TABLE `laravel_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `pivot_vendor_vendorusers`
--
ALTER TABLE `pivot_vendor_vendorusers`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_info`
--
ALTER TABLE `product_info`
  MODIFY `id` int(254) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `purchase_enquiries`
--
ALTER TABLE `purchase_enquiries`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `purchase_enquiry_commerical_evaluation_pivot`
--
ALTER TABLE `purchase_enquiry_commerical_evaluation_pivot`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_enquiry_quantity_changes`
--
ALTER TABLE `purchase_enquiry_quantity_changes`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_enquiry_vendor_uploaded_docs`
--
ALTER TABLE `purchase_enquiry_vendor_uploaded_docs`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchase_order_cancellation_requests`
--
ALTER TABLE `purchase_order_cancellation_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_line_rfi_communications`
--
ALTER TABLE `purchase_order_line_rfi_communications`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_purchase_enquiries_pivot`
--
ALTER TABLE `purchase_order_purchase_enquiries_pivot`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchase_order_quotation_reposnses_pivot`
--
ALTER TABLE `purchase_order_quotation_reposnses_pivot`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quotationrequests_purchaseenquiries`
--
ALTER TABLE `quotationrequests_purchaseenquiries`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `quotationrequests_ratecontractsrequests`
--
ALTER TABLE `quotationrequests_ratecontractsrequests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotationrequests_vendors`
--
ALTER TABLE `quotationrequests_vendors`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `quotation_commerical_evaluations`
--
ALTER TABLE `quotation_commerical_evaluations`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quotation_pe_rfi_communication`
--
ALTER TABLE `quotation_pe_rfi_communication`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_rc_rfi_communication`
--
ALTER TABLE `quotation_rc_rfi_communication`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_requests`
--
ALTER TABLE `quotation_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `quotation_responses`
--
ALTER TABLE `quotation_responses`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `quotation_response_tracker`
--
ALTER TABLE `quotation_response_tracker`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `rate_contracts`
--
ALTER TABLE `rate_contracts`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_contract_line_rfi_communications`
--
ALTER TABLE `rate_contract_line_rfi_communications`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_contract_quotation_responses`
--
ALTER TABLE `rate_contract_quotation_responses`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_contract_rate_contract_quotation_responses_pivot`
--
ALTER TABLE `rate_contract_rate_contract_quotation_responses_pivot`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_contract_rate_contract_request_pivot`
--
ALTER TABLE `rate_contract_rate_contract_request_pivot`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_contract_requests`
--
ALTER TABLE `rate_contract_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_contract_request_commerical_evaluation_pivot`
--
ALTER TABLE `rate_contract_request_commerical_evaluation_pivot`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_contract_request_quantity_changes`
--
ALTER TABLE `rate_contract_request_quantity_changes`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_contract_request_vendor_uploaded_docs`
--
ALTER TABLE `rate_contract_request_vendor_uploaded_docs`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt_notes`
--
ALTER TABLE `receipt_notes`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt_note_receivings`
--
ALTER TABLE `receipt_note_receivings`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt_note_receiving_invoices`
--
ALTER TABLE `receipt_note_receiving_invoices`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recommends`
--
ALTER TABLE `recommends`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=713;

--
-- AUTO_INCREMENT for table `set_up_budget_requests`
--
ALTER TABLE `set_up_budget_requests`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `stockitems_purchaseenquiries`
--
ALTER TABLE `stockitems_purchaseenquiries`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stockitems_stockitemrequests`
--
ALTER TABLE `stockitems_stockitemrequests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_issuance_records`
--
ALTER TABLE `stock_issuance_records`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_items`
--
ALTER TABLE `stock_items`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_item_issue_requests`
--
ALTER TABLE `stock_item_issue_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_item_requests`
--
ALTER TABLE `stock_item_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_item_return_requests`
--
ALTER TABLE `stock_item_return_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_transfer_requests`
--
ALTER TABLE `stock_transfer_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_error_log`
--
ALTER TABLE `system_error_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=363;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vendor_itemtemplates`
--
ALTER TABLE `vendor_itemtemplates`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_qualification_docs`
--
ALTER TABLE `vendor_qualification_docs`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vendor_users`
--
ALTER TABLE `vendor_users`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `volume_discount`
--
ALTER TABLE `volume_discount`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
