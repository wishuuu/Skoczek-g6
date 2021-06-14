-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Cze 2021, 13:12
-- Wersja serwera: 10.4.19-MariaDB
-- Wersja PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `skoczek_g6`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `game`
--

CREATE TABLE `game` (
  `ID` int(10) NOT NULL,
  `moves` varchar(400) DEFAULT NULL,
  `white` int(10) NOT NULL,
  `black` int(10) NOT NULL,
  `winner` int(10) NOT NULL,
  `date` date NOT NULL,
  `tournamentID` int(10) NOT NULL,
  `tableID` int(10) DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Zrzut danych tabeli `game`
--

INSERT INTO `game` (`ID`, `moves`, `white`, `black`, `winner`, `date`, `tournamentID`, `tableID`, `time`) VALUES
(30, 'e4 d5\nexd4 Qxd5', 8, 11, 8, '2021-06-14', 20, NULL, NULL),
(31, NULL, 7, 9, 0, '2021-06-14', 20, NULL, NULL),
(32, NULL, 1, 6, 0, '2021-06-14', 20, NULL, NULL),
(33, NULL, 5, 2, 0, '2021-06-14', 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tournament`
--

CREATE TABLE `tournament` (
  `ID` int(10) NOT NULL,
  `date` date NOT NULL,
  `place` varchar(255) NOT NULL,
  `winner` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `numOfTables` int(10) DEFAULT NULL,
  `isOpen` tinyint(1) NOT NULL,
  `organiserID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Zrzut danych tabeli `tournament`
--

INSERT INTO `tournament` (`ID`, `date`, `place`, `winner`, `name`, `numOfTables`, `isOpen`, `organiserID`) VALUES
(20, '2021-06-14', 'testowe', NULL, 'test', NULL, 0, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID` int(10) NOT NULL,
  `nickname` varchar(16) NOT NULL,
  `ranking` int(10) DEFAULT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `isOrganiser` tinyint(1) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID`, `nickname`, `ranking`, `firstName`, `lastName`, `email`, `isOrganiser`, `password`) VALUES
(1, 'wiszowaty', 1000, 'Oskar', 'Wiszowaty', 'ppwiszu@gmail.com', 0, 'wiszowaty'),
(2, 'leosiak', 1000, 'Wojciech', 'Osiak', 'costam@jakistam.com', 0, 'osiakosiak'),
(3, 'lysy', 1000, 'Konrad', 'Lipski', 'lysy@mail', 0, 'lysy'),
(4, 'admin', NULL, 'Krzystof', 'Bosak', 'admin@admin', 1, 'admin'),
(5, 'test1', 500, 'test', 'test', 'test@mail.com', 0, 'test'),
(6, 'test2', 600, 'test', 'test', 'test2@mail.com', 0, 'test'),
(7, 'test3', 750, 'test', 'test', 'test3@mail.com', 0, 'test'),
(8, 'test4', 2000, 'test', 'test', 'test4@mail.com', 0, 'test'),
(9, 'test5', 1500, 'test', 'test', 'test5@mail.com', 0, 'test'),
(10, 'test6', 1200, 'test', 'test', 'test', 0, 'test'),
(11, 'test10', 800, 'Andrzej', 'test', 'test10@test.com', 0, 'test');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_tournament`
--

CREATE TABLE `user_tournament` (
  `userID` int(10) NOT NULL,
  `tournamentID` int(10) NOT NULL,
  `inInvitationAccepted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Zrzut danych tabeli `user_tournament`
--

INSERT INTO `user_tournament` (`userID`, `tournamentID`, `inInvitationAccepted`) VALUES
(5, 20, 1),
(6, 20, 1),
(7, 20, 1),
(8, 20, 1),
(9, 20, 1),
(1, 20, 1),
(2, 20, 1),
(11, 20, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indeksy dla tabeli `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indeksy dla tabeli `user_tournament`
--
ALTER TABLE `user_tournament`
  ADD KEY `userID` (`userID`),
  ADD KEY `tournamentID` (`tournamentID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `game`
--
ALTER TABLE `game`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT dla tabeli `tournament`
--
ALTER TABLE `tournament`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
