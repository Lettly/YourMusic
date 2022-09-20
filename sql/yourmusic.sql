-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Set 20, 2022 alle 10:38
-- Versione del server: 10.3.34-MariaDB-0ubuntu0.20.04.1
-- Versione PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yourmusic`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `blacklist`
--

CREATE TABLE `blacklist` (
  `id` varchar(6) NOT NULL,
  `canzone_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `coda`
--

CREATE TABLE `coda` (
  `id` varchar(6) NOT NULL,
  `canzone_id` text NOT NULL,
  `data_aggiunta` int(10) NOT NULL,
  `utente_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `cronologia`
--

CREATE TABLE `cronologia` (
  `id` varchar(6) NOT NULL,
  `canzone_id` text NOT NULL,
  `n_like` int(11) DEFAULT NULL,
  `data_aggiunta` int(10) NOT NULL,
  `data_riproduzione` int(10) NOT NULL,
  `utente_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `like_messi`
--

CREATE TABLE `like_messi` (
  `id` int(11) NOT NULL,
  `coda_FK` varchar(6) NOT NULL,
  `utente_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `opzioni`
--

CREATE TABLE `opzioni` (
  `id` int(4) NOT NULL,
  `timeout_canzone` int(11) NOT NULL,
  `whitelist_enable` int(1) NOT NULL,
  `valore_like` int(11) NOT NULL,
  `token` text NOT NULL,
  `refresh_token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `opzioni`
--

INSERT INTO `opzioni` (`id`, `timeout_canzone`, `whitelist_enable`, `valore_like`, `token`, `refresh_token`) VALUES
(1, 180, 0, 60, 'BQBX5I37cjGlkuFpMOVFhZPnBRrBzslfW6MXB2OFwMgMYBt0oa3dyQ9jFjtVyKOVF7cxslSHbkfIXyL0wacTCo-73AIEBhDM7pD5m1ALHMKlVTPgu1rkYp6HvUk9IHdb-1HlXY_VUdqw37YWaN1B09jW-vdQ3u_C29BELykKDeZSBdx1VB_SJ1QJja9orRRJlag9y4PI6wWe9j7mwguEsVnAOdxSpInbR8nhc3tEHj0LaVH7XHR_k721S-gqQWVJ7rkcaUV4v8lygnlBT6l1mmJzFmk', 'AQBinsP3ObGiUrdrOYdZgPj0sL7i0zlT4duFZQc2wROEJ7t51CeLYu0mq1sz00WAhAas2yEUpC5JesF4dcS3q0b-YGsshm8YHBIJw5yORno8EAeov1SeYAQY6RrrFJ0FJOk');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` int(11) NOT NULL,
  `nickname` varchar(15) NOT NULL,
  `email` text NOT NULL,
  `passwd` text NOT NULL,
  `ruolo` varchar(32) NOT NULL,
  `session_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `whitelist`
--

CREATE TABLE `whitelist` (
  `id` varchar(6) NOT NULL,
  `canzone_id` text NOT NULL,
  `nome_canzone` text NOT NULL,
  `artista_canzone` text NOT NULL,
  `durata_canzone` int(11) NOT NULL,
  `album_canzone` text NOT NULL,
  `explicit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `coda`
--
ALTER TABLE `coda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utente_FK` (`utente_FK`);

--
-- Indici per le tabelle `cronologia`
--
ALTER TABLE `cronologia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utente_FK` (`utente_FK`);

--
-- Indici per le tabelle `like_messi`
--
ALTER TABLE `like_messi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coda_FK` (`coda_FK`),
  ADD KEY `utente_FK` (`utente_FK`);

--
-- Indici per le tabelle `opzioni`
--
ALTER TABLE `opzioni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `like_messi`
--
ALTER TABLE `like_messi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `opzioni`
--
ALTER TABLE `opzioni`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `coda`
--
ALTER TABLE `coda`
  ADD CONSTRAINT `coda_ibfk_1` FOREIGN KEY (`utente_FK`) REFERENCES `utente` (`id`);

--
-- Limiti per la tabella `cronologia`
--
ALTER TABLE `cronologia`
  ADD CONSTRAINT `cronologia_ibfk_1` FOREIGN KEY (`utente_FK`) REFERENCES `utente` (`id`);

--
-- Limiti per la tabella `like_messi`
--
ALTER TABLE `like_messi`
  ADD CONSTRAINT `like_messi_ibfk_1` FOREIGN KEY (`coda_FK`) REFERENCES `coda` (`id`),
  ADD CONSTRAINT `like_messi_ibfk_2` FOREIGN KEY (`utente_FK`) REFERENCES `utente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
