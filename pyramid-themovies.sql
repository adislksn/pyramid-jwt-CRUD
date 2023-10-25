-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Okt 2023 pada 11.50
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pyramid-themovies`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `jwt_token` text NOT NULL,
  `refresh_token` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `jwt_token`, `refresh_token`, `created_at`) VALUES
(2, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NzE2Mn0.ws1UXwJF9sE-PGX08aR3xF9cZyKTmgl95CqAV0n5ckc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NTQyMn0.yJJwNpChUxoEw2f0F8WpiEONaqSaV1RC2_wzByx0whY', '2023-10-22 09:02:42'),
(3, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NzE4N30.0JXwYctaUq8jPPNqDuCMPaOEL2EpsZvTBKAG6wZeRd4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NTQ0N30.qbfr9_Cg4RRnHs9OzEXn0sfSxIxrDwhaXYdLWvqtS5g', '2023-10-22 09:03:07'),
(4, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NzIwOX0.NgTnBGRB3f4f3vhubmJj9RuPCmTgy37g1yk8HBRmU7w', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NTQ2OX0.XwLY6Xnffr8JfQivMkLERIkIeByU89aIjw7vE1irUSo', '2023-10-22 09:03:29'),
(5, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NzYxNX0.ZKDNbkEGEQgUHjv6oLFcIj8AqgAPK3g8o2cZHFqTKDc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NTg3NX0.ImhJqBPS-bZmkvEhZ83_ds3lIszhtskbpB0_ECHDMCo', '2023-10-22 09:10:15'),
(6, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2ODg0NH0.H3tOXVdzAxzp6-J-iwSuPBK3mKIUBdvQA4_jfnAG-z0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NzEwNH0.-yBwMYPGE1ZG1Z35FOaYDtR0ci52NFX3TuuY19OAxg8', '2023-10-22 09:30:44'),
(7, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2OTA3N30.KTHvLlFN3rFVQTww-_5YMVZubmHOew5hLVHX4xJaYIk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NzMzN30.DtyE1s_uxjSOA0-mCARKSXjwWd0lJhjLnkDM7sUtza4', '2023-10-22 09:34:37'),
(8, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2OTEzMX0.ecLnfZTffMI09G5xiqYLecrOXBT4ePEp1kNsjjCD1KI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NzM5MX0.t0RgPnoG4CWZhtoklkZav25c28pU90QTw78hHWslI7o', '2023-10-22 09:35:31'),
(9, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2OTI1M30.1X0j0kvzksu1Dv4Z8jmIXleF3gq2Idr2x49vn7ae-eo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NzUxM30.er7_mJ3xs4i3VrH2gI01p_TMRxp2MoRjabemSB7h-VY', '2023-10-22 09:37:33'),
(10, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2OTQ2MH0.mRWlOZHc2rXxuLuKGw8dkNfTisVnqPkfpKSWkIEfSFQ', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2NzcyMH0.twHi0X4ttXMc7lem6garB2zs4xvvJfVap5TR1VYy85g', '2023-10-22 09:41:00'),
(11, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2OTcyNn0.uH97XGwX6BoPIDl58K11lD-S8BJ3_fW-K6ocBHckNwM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk2Nzk4Nn0.Qq7G5G7DO5vj8xFaKB_ZU7wvjE2H8D3ZGUEmbPxbcHg', '2023-10-22 09:45:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, '123', '123');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
