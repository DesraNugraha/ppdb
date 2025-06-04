-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2025 at 09:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppdb_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` char(36) NOT NULL,
  `student_id` char(36) NOT NULL,
  `school_id` char(36) NOT NULL,
  `program_id` char(36) NOT NULL,
  `application_number` varchar(32) NOT NULL,
  `status` enum('draft','submitted','review','accepted','rejected','waitlist') DEFAULT 'draft',
  `submitted_at` timestamp NULL DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `reviewer_notes` text DEFAULT NULL,
  `priority_order` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `application_id` char(36) NOT NULL,
  `document_type` varchar(64) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` int(11) DEFAULT NULL,
  `mime_type` varchar(64) DEFAULT NULL,
  `status` enum('pending','uploaded','verified','rejected') DEFAULT 'pending',
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(16) DEFAULT 'info',
  `read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` char(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('student','admin','operator') NOT NULL DEFAULT 'student',
  `phone` varchar(32) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `email`, `full_name`, `role`, `phone`, `created_at`, `updated_at`, `password`) VALUES
('', 'desra13@gmail.com', 'Desra', 'student', '12345678910', '2025-06-04 06:03:39', '2025-06-04 06:03:39', '$2y$10$Hjebd'),
('b0609ca3-5132-4835-b58c-bfd2c10f8211', 'penny.pebriani02@gmail.com', 'Desra', 'student', '0857222223333', '2025-06-04 06:14:35', '2025-06-04 06:14:35', '$2y$10$XD3K.');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` char(36) NOT NULL,
  `school_id` char(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(16) NOT NULL,
  `description` text DEFAULT NULL,
  `quota` int(11) NOT NULL DEFAULT 0,
  `registration_fee` decimal(10,2) DEFAULT 0.00,
  `status` varchar(16) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `principal_name` varchar(128) DEFAULT NULL,
  `accreditation` varchar(8) DEFAULT 'B',
  `status` varchar(16) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `type`, `address`, `phone`, `email`, `principal_name`, `accreditation`, `status`, `created_at`, `updated_at`) VALUES
('e54a6a77-4108-11f0-a8dd-ecf4bb4178ff', 'SMA Negeri 1 Jakarta', 'SMA', 'Jl. Merdeka No. 123, Jakarta Pusat', '021-1234567', 'sman1jkt@edu.id', 'Dr. Budi Santoso, M.Pd', 'A', 'active', '2025-06-04 05:57:44', '2025-06-04 05:57:44'),
('e54d0984-4108-11f0-a8dd-ecf4bb4178ff', 'SMK Negeri 2 Jakarta', 'SMK', 'Jl. Teknologi No. 456, Jakarta Selatan', '021-7654321', 'smkn2jkt@edu.id', 'Dra. Siti Nurhaliza, M.M', 'A', 'active', '2025-06-04 05:57:44', '2025-06-04 05:57:44'),
('e54d0b52-4108-11f0-a8dd-ecf4bb4178ff', 'SMA Negeri 5 Jakarta', 'SMA', 'Jl. Pendidikan No. 789, Jakarta Timur', '021-9876543', 'sman5jkt@edu.id', 'Prof. Ahmad Rahman, Ph.D', 'B', 'active', '2025-06-04 05:57:44', '2025-06-04 05:57:44');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `nik` varchar(32) NOT NULL,
  `nisn` varchar(32) DEFAULT NULL,
  `birth_place` varchar(128) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `religion` enum('islam','kristen','katolik','hindu','buddha','konghucu') NOT NULL,
  `address` text DEFAULT NULL,
  `previous_school` varchar(255) NOT NULL,
  `previous_school_address` text DEFAULT NULL,
  `graduation_year` int(11) NOT NULL,
  `average_score` decimal(4,2) DEFAULT NULL,
  `father_name` varchar(128) DEFAULT NULL,
  `mother_name` varchar(128) DEFAULT NULL,
  `father_occupation` varchar(128) DEFAULT NULL,
  `mother_occupation` varchar(128) DEFAULT NULL,
  `parent_income` varchar(128) DEFAULT NULL,
  `parent_phone` varchar(32) DEFAULT NULL,
  `profile_complete` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `nik`, `nisn`, `birth_place`, `birth_date`, `gender`, `religion`, `address`, `previous_school`, `previous_school_address`, `graduation_year`, `average_score`, `father_name`, `mother_name`, `father_occupation`, `mother_occupation`, `parent_income`, `parent_phone`, `profile_complete`, `created_at`, `updated_at`) VALUES
('', 'b0609ca3-5132-4835-b58c-bfd2c10f8211', '15141312', '12131415', 'Bandung', '2006-12-31', 'male', 'islam', 'jln.Cisaranten', 'SMP BINAHAAPAN', 'Cinambo', 2024, 85.00, 'dodi', 'fitri', 'kantoran', 'guru', '2.5-5 juta', '0888777222', 1, '2025-06-04 06:14:35', '2025-06-04 06:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` char(36) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `description` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `key`, `value`, `description`, `updated_at`) VALUES
('e47fc417-4108-11f0-a8dd-ecf4bb4178ff', 'academic_year', '2024/2025', 'Current academic year', '2025-06-04 05:57:43'),
('e47fd630-4108-11f0-a8dd-ecf4bb4178ff', 'registration_start', '2024-05-01', 'Registration start date', '2025-06-04 05:57:43'),
('e47fd75a-4108-11f0-a8dd-ecf4bb4178ff', 'registration_end', '2024-05-31', 'Registration end date', '2025-06-04 05:57:43'),
('e47fd865-4108-11f0-a8dd-ecf4bb4178ff', 'max_applications', '3', 'Maximum applications per student', '2025-06-04 05:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('student','admin','operator') DEFAULT 'student',
  `phone` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `email_verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `full_name`, `role`, `phone`, `is_active`, `email_verified`, `created_at`, `updated_at`) VALUES
(1, 'penny.pebriani02@gmail.com', '$2y$10$GdsBuewXVqqbiARNHSQbAO1KfxYthku/L6LT3FiSkWQJrqS8RThQ2', 'Desra', 'student', '0857222223333', 1, 0, '2025-06-04 06:29:47', '2025-06-04 07:08:39'),
(2, 'alifanwr978@gmail.com', '$2y$10$4ZnBh3K.3mdLZFVdov92o.duEzpveDay/MaWx38PH3toWZNTwMTKW', 'Rista', 'admin', '08648363473', 1, 0, '2025-06-04 07:04:23', '2025-06-04 07:08:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `application_number` (`application_number`),
  ADD KEY `idx_applications_student_id` (`student_id`),
  ADD KEY `idx_applications_school_id` (`school_id`),
  ADD KEY `idx_applications_program_id` (`program_id`),
  ADD KEY `idx_applications_status` (`status`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_documents_application_id` (`application_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notifications_user_id` (`user_id`),
  ADD KEY `idx_notifications_read` (`read`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `nisn` (`nisn`),
  ADD KEY `idx_students_user_id` (`user_id`),
  ADD KEY `idx_students_nik` (`nik`),
  ADD KEY `idx_students_nisn` (`nisn`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
