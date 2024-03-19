-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u8
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 21 2020 г., 14:13
-- Версия сервера: 5.5.62-0+deb8u1
-- Версия PHP: 5.6.40-0+deb8u8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `gs1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authlog`
--

CREATE TABLE IF NOT EXISTS `authlog` (
`id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `city` text NOT NULL,
  `country` text NOT NULL,
  `code` text NOT NULL,
  `datetime` datetime NOT NULL,
  `status` int(1) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

CREATE TABLE IF NOT EXISTS `games` (
`game_id` int(10) NOT NULL,
  `game_name` varchar(32) DEFAULT NULL,
  `game_code` varchar(8) DEFAULT NULL,
  `game_query` varchar(32) DEFAULT NULL,
  `image_url` text NOT NULL,
  `game_min_slots` int(8) DEFAULT NULL,
  `game_max_slots` int(8) DEFAULT NULL,
  `game_min_port` int(8) DEFAULT NULL,
  `game_max_port` int(8) DEFAULT NULL,
  `game_price` decimal(10,2) DEFAULT NULL,
  `game_status` int(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `games`
--

INSERT INTO `games` (`game_id`, `game_name`, `game_code`, `game_query`, `image_url`, `game_min_slots`, `game_max_slots`, `game_min_port`, `game_max_port`, `game_price`, `game_status`) VALUES
(1, 'San Andreas: Multiplayer', 'samp', 'samp', '', 50, 1000, 7777, 9999, 1.00, 1),
(2, 'Criminal Russia: Multiplayer', 'crmp', 'samp', '', 50, 500, 3335, 7000, 1.00, 1),
(3, 'United Multiplayer', 'unit', 'samp', '', 50, 500, 7777, 9999, 1.00, 1),
(4, 'Multi Theft Auto: Multiplayer', 'mta', 'mtasa', '', 50, 1000, 25020, 80520, 1.00, 1),
(5, 'MineCraft: PE', 'mcpe', 'mcpe', '', 10, 100, 12410, 55641, 5.00, 1),
(6, 'MineCraft', 'mine72', 'mine', '', 10, 100, 12410, 55641, 7.00, 1),
(7, 'Counter Strike 1.6', 'cs', 'cs', '', 6, 32, 27016, 30550, 4.00, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `inbox`
--

CREATE TABLE IF NOT EXISTS `inbox` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_firstname` varchar(15) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `text` text,
  `status` int(1) NOT NULL,
  `inbox_date_add` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
`invoice_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `invoice_ammount` decimal(10,2) DEFAULT NULL,
  `invoice_status` int(1) DEFAULT NULL,
  `invoice_date_add` datetime DEFAULT NULL,
  `system` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
`location_id` int(10) NOT NULL,
  `location_name` varchar(32) DEFAULT NULL,
  `location_ip` varchar(15) DEFAULT NULL,
  `location_ip2` varchar(15) DEFAULT NULL,
  `location_user` varchar(32) DEFAULT NULL,
  `location_password` varchar(32) DEFAULT NULL,
  `location_status` int(1) DEFAULT NULL,
  `location_cpu` varchar(128) NOT NULL DEFAULT '0',
  `location_ram` varchar(128) NOT NULL DEFAULT '0',
  `location_hdd` varchar(128) NOT NULL DEFAULT '0',
  `location_hddold` varchar(128) NOT NULL DEFAULT '0',
  `location_players` varchar(128) NOT NULL DEFAULT '0',
  `location_upd` datetime NOT NULL,
  `location_uptime` varchar(128) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`news_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT '0',
  `news_title` varchar(32) DEFAULT NULL,
  `news_text` char(255) NOT NULL,
  `news_date_add` datetime DEFAULT NULL,
  `look` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `place` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news_category`
--

CREATE TABLE IF NOT EXISTS `news_category` (
`category_id` int(11) NOT NULL,
  `category_name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `category_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `news_messages`
--

CREATE TABLE IF NOT EXISTS `news_messages` (
`news_message_id` int(10) NOT NULL,
  `news_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `news_message` text,
  `news_message_date_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `promo`
--

CREATE TABLE IF NOT EXISTS `promo` (
`id` int(11) NOT NULL,
  `cod` text,
  `uses` int(11) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `skidka` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `serverlog`
--

CREATE TABLE IF NOT EXISTS `serverlog` (
`log_id` int(11) NOT NULL,
  `reason` text CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `servers`
--

CREATE TABLE IF NOT EXISTS `servers` (
`server_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `game_id` int(10) DEFAULT NULL,
  `location_id` int(10) DEFAULT NULL,
  `server_slots` int(8) DEFAULT NULL,
  `server_port` int(8) DEFAULT NULL,
  `server_password` varchar(32) DEFAULT NULL,
  `server_status` int(1) DEFAULT NULL,
  `server_cpu_load` float NOT NULL DEFAULT '0',
  `server_ram_load` float NOT NULL DEFAULT '0',
  `server_date_reg` datetime DEFAULT NULL,
  `server_date_end` datetime DEFAULT NULL,
  `db_pass` varchar(32) DEFAULT NULL,
  `server_mysql` int(11) DEFAULT NULL,
  `rcon_password` varchar(32) DEFAULT NULL,
  `server_install` int(11) NOT NULL,
  `fastdl_status` int(11) NOT NULL,
  `repozitory_item` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `servers_adap`
--

CREATE TABLE IF NOT EXISTS `servers_adap` (
  `game_id` int(11) DEFAULT NULL,
  `adap_url` text CHARACTER SET utf8 NOT NULL,
  `adap_name` text CHARACTER SET utf8 NOT NULL,
  `adap_status` int(11) DEFAULT NULL,
  `adap_arch` text CHARACTER SET utf8 NOT NULL,
  `adap_textx` text CHARACTER SET utf8 NOT NULL,
  `adap_img` text CHARACTER SET utf8 NOT NULL,
  `adap_patch` text CHARACTER SET utf8 NOT NULL,
  `adap_price` text,
  `adap_category` int(1) DEFAULT NULL,
`adap_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `servers_adap`
--

INSERT INTO `servers_adap` (`game_id`, `adap_url`, `adap_name`, `adap_status`, `adap_arch`, `adap_textx`, `adap_img`, `adap_patch`, `adap_price`, `adap_category`, `adap_id`) VALUES
(2, 'http://hos7.ru/mods/repo/crmp03e.tar', 'CRMP 0.3e', 1, 'crmp03e.tar', 'Смена версии игры на CR:MP 0.3e', 'https://hos7.ru/mods/repo_img/crmp03e.png', '/', '0', 0, 1),
(2, 'http://hos7.ru/mods/repo/crmp037.tar', 'CRMP 0.3.7', 1, 'crmp037.tar', 'Смена версии игры на CR:MP 0.3.7', 'https://hos7.ru/mods/repo_img/crmp037.png', '/', '0', 0, 2),
(1, 'http://hos7.ru/mods/repo/samp03e.tar', 'SAMP 0.3e', 1, 'samp03e.tar', 'Смена версии игры на SAMP 0.3e', 'https://hos7.ru/mods/repo_img/samp03e.png', '/', '0', 0, 3),
(1, 'http://hos7.ru/mods/repo/samp03dl.tar', 'SAMP 0.3dl', 1, 'samp03dl.tar', 'Смена версии игры на SAMP 0.3dl', 'https://hos7.ru/mods/repo_img/samp03dl.png', '/', '0', 0, 4),
(1, 'http://hos7.ru/mods/repo/samp037.tar', 'SAMP 0.3.7', 1, 'samp037.tar', 'Смена версии игры на SAMP 0.3.7', 'https://hos7.ru/mods/repo_img/samp037.png', '/', '0', 0, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `servers_firewalls`
--

CREATE TABLE IF NOT EXISTS `servers_firewalls` (
`firewall_id` int(10) NOT NULL,
  `server_id` int(8) DEFAULT NULL,
  `server_ip` text,
  `firewall_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `servers_mods`
--

CREATE TABLE IF NOT EXISTS `servers_mods` (
  `game_id` int(11) DEFAULT NULL,
  `mod_url` text CHARACTER SET utf8 NOT NULL,
  `mod_name` text CHARACTER SET utf8 NOT NULL,
  `mod_act` int(11) DEFAULT NULL,
  `mod_status` int(11) DEFAULT NULL,
  `mod_arch` text CHARACTER SET utf8 NOT NULL,
  `mod_textx` text CHARACTER SET utf8 NOT NULL,
  `mod_img` text CHARACTER SET utf8 NOT NULL,
  `mod_price` text,
`mod_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `servers_mods`
--

INSERT INTO `servers_mods` (`game_id`, `mod_url`, `mod_name`, `mod_status`, `mod_arch`, `mod_textx`, `mod_img`, `mod_price`, `mod_set`, `mod_id`) VALUES
(1, 'https://resource.hackchik.ru/hostinpl/mods/florence.tar', 'Arizona RP', 2, 1, 'florence.tar', 'Игровой мод Arizona RP Florence, для SAMP 0.3.7', 'https://resource.hackchik.ru/no.png', '100', 1),
(1, 'https://resource.hackchik.ru/hostinpl/mods/virginia.tar', 'Virginia RP', 2, 1, 'virginia.tar', 'Игровой мод Virginia RP, для SAMP 0.3.7', 'https://resource.hackchik.ru/no.png', '100', 2),
(1, 'https://resource.hackchik.ru/hostinpl/mods/absolute.tar', 'Absolute RP', 2, 1, 'absolute.tar', 'Игровой мод Absolute RP, для SAMP 0.3.7', 'https://resource.hackchik.ru/no.png', '100', 3),
(1, 'https://resource.hackchik.ru/hostinpl/mods/arizona.tar', 'Arizona RP', 1, 'arizona.tar', 'Игровой мод Arizona RP, для SAMP 0.3.7', 'https://resource.hackchik.ru/no.png', '0', 0, 4),
(1, 'https://resource.hackchik.ru/hostinpl/mods/diamond-rp.tar', 'Diamond RP', 1, 'diamond-rp.tar', 'Игровой мод Diamond RP, для SAMP 0.3.7', 'https://resource.hackchik.ru/no.png', '0', 0, 5),
(1, 'https://resource.hackchik.ru/hostinpl/mods/evolverp.tar', 'Evolve RP', 1, 'evolverp.tar', 'Игровой мод Evolve RP, для SAMP 0.3.7', 'https://resource.hackchik.ru/no.png', '0', 0, 6),
(1, 'https://resource.hackchik.ru/hostinpl/mods/heavilyrp.tar', 'Heavily RP', 1, 'heavilyrp.tar', 'Игровой мод Heavily RP, для SAMP 0.3.7', 'https://resource.hackchik.ru/no.png', '0', 0, 7),
(1, 'https://resource.hackchik.ru/hostinpl/mods/samp-mobile.tar', 'SAMP MOBILE', 1, 'samp-mobile.tar', 'Игровой мод SAMP MOBILE, для SAMP 0.3.7', 'https://resource.hackchik.ru/no.png', '0', 0, 8),
(1, 'https://resource.hackchik.ru/hostinpl/mods/samprp.tar', 'Samp RP', 1, 'samprp.tar', 'Игровой мод Samp RP, для SAMP 0.3.7', 'https://resource.hackchik.ru/no.png', '0', 0, 9),
(2, 'https://resource.hackchik.ru/hostinpl/mods/capsrp.tar', 'Caps RP', 1, 'capsrp.tar', 'Игровой мод Caps RP, для CRMP 0.3e и CRMP 0.3.7', 'https://resource.hackchik.ru/no.png', '0', 0, 10),
(2, 'https://resource.hackchik.ru/hostinpl/mods/countyrp.tar', 'County RP', 1, 'countyrp.tar', 'Игровой мод County RP, для CRMP 0.3e', 'https://resource.hackchik.ru/no.png', '0', 0, 11),
(2, 'https://resource.hackchik.ru/hostinpl/mods/justrp.tar', 'Just RP', 1, 'justrp.tar', 'Игровой мод Just RP, для CRMP 0.3e', 'https://resource.hackchik.ru/no.png', '0', 0, 12),
(2, 'https://resource.hackchik.ru/hostinpl/mods/rayonrp.tar', 'Rayon RP', 1, 'rayonrp.tar', 'Игровой мод Rayon RP, для CRMP 0.3e и CRMP 0.3.7', 'https://resource.hackchik.ru/no.png', '10', 1, 13),
(2, 'https://resource.hackchik.ru/hostinpl/mods/severerp.tar', 'Severe RP', 1, 'severerp.tar', 'Игровой мод Severe RP, для CRMP 0.3e и CRMP 0.3.7', 'https://resource.hackchik.ru/no.png', '0', 0, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `servers_owners`
--

CREATE TABLE IF NOT EXISTS `servers_owners` (
`owner_id` int(10) NOT NULL,
  `server_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `owner_status` int(11) NOT NULL,
  `owner_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `servers_stats`
--

CREATE TABLE IF NOT EXISTS `servers_stats` (
  `server_id` int(11) DEFAULT NULL,
  `server_stats_date` datetime DEFAULT NULL,
  `server_stats_players` int(11) DEFAULT NULL,
  `server_stats_cpu` int(11) NOT NULL,
  `server_stats_ram` int(11) NOT NULL,
  `server_stats_hdd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
`ticket_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `ticket_name` varchar(32) DEFAULT NULL,
  `ticket_status` int(1) DEFAULT NULL,
  `ticket_date_add` datetime DEFAULT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tickets_category`
--

CREATE TABLE IF NOT EXISTS `tickets_category` (
`category_id` int(11) NOT NULL,
  `category_name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `category_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `tickets_images`
--

CREATE TABLE IF NOT EXISTS `tickets_images` (
  `ticket_id` int(10) DEFAULT NULL,
  `image` text NOT NULL,
  `image_date` datetime DEFAULT NULL,
`image_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tickets_messages`
--

CREATE TABLE IF NOT EXISTS `tickets_messages` (
`ticket_message_id` int(10) NOT NULL,
  `ticket_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `ticket_message` text,
  `ticket_message_date_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(10) NOT NULL,
  `user_email` varchar(96) DEFAULT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `user_firstname` varchar(32) DEFAULT NULL,
  `user_lastname` varchar(32) DEFAULT NULL,
  `user_status` int(1) DEFAULT NULL,
  `user_balance` decimal(10,2) DEFAULT NULL,
  `user_restore_key` varchar(32) DEFAULT NULL,
  `user_access_level` int(1) DEFAULT NULL,
  `user_date_reg` datetime DEFAULT NULL,
  `user_img` varchar(250) NOT NULL DEFAULT '/application/public/img/user.png',
  `user_online_date` text NOT NULL,
  `user_promo_date` date NOT NULL,
  `user_activate` int(1) NOT NULL,
  `key_activate` text NOT NULL,
  `ref` int(11) NOT NULL,
  `rmoney` decimal(10,2) DEFAULT NULL,
  `user_vk_id` varchar(96) DEFAULT NULL,
  `test_server` varchar(2) NOT NULL DEFAULT '2',
  `user_promised_pay` int(11) NOT NULL DEFAULT '0',
  `user_last_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_mods`
--
CREATE TABLE IF NOT EXISTS `users_mods` (
`ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `waste`
--

CREATE TABLE IF NOT EXISTS `waste` (
`waste_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `waste_ammount` decimal(10,2) DEFAULT NULL,
  `waste_status` int(1) DEFAULT NULL,
  `waste_usluga` varchar(120) DEFAULT NULL,
  `waste_date_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authlog`
--
ALTER TABLE `authlog`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
 ADD PRIMARY KEY (`game_id`);

--
-- Индексы таблицы `inbox`
--
ALTER TABLE `inbox`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `invoices`
--
ALTER TABLE `invoices`
 ADD PRIMARY KEY (`invoice_id`);

--
-- Индексы таблицы `locations`
--
ALTER TABLE `locations`
 ADD PRIMARY KEY (`location_id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`news_id`);

--
-- Индексы таблицы `news_category`
--
ALTER TABLE `news_category`
 ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `news_messages`
--
ALTER TABLE `news_messages`
 ADD PRIMARY KEY (`news_message_id`);

--
-- Индексы таблицы `promo`
--
ALTER TABLE `promo`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `serverlog`
--
ALTER TABLE `serverlog`
 ADD PRIMARY KEY (`log_id`);

--
-- Индексы таблицы `servers`
--
ALTER TABLE `servers`
 ADD PRIMARY KEY (`server_id`);

--
-- Индексы таблицы `servers_adap`
--
ALTER TABLE `servers_adap`
 ADD PRIMARY KEY (`adap_id`);

--
-- Индексы таблицы `servers_firewalls`
--
ALTER TABLE `servers_firewalls`
 ADD PRIMARY KEY (`firewall_id`);

--
-- Индексы таблицы `servers_mods`
--
ALTER TABLE `servers_mods`
 ADD PRIMARY KEY (`mod_id`);

--
-- Индексы таблицы `servers_owners`
--
ALTER TABLE `servers_owners`
 ADD PRIMARY KEY (`owner_id`);

--
-- Индексы таблицы `tickets`
--
ALTER TABLE `tickets`
 ADD PRIMARY KEY (`ticket_id`);

--
-- Индексы таблицы `tickets_category`
--
ALTER TABLE `tickets_category`
 ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `tickets_images`
--
ALTER TABLE `tickets_images`
 ADD PRIMARY KEY (`image_id`);

--
-- Индексы таблицы `tickets_messages`
--
ALTER TABLE `tickets_messages`
 ADD PRIMARY KEY (`ticket_message_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `users_mods`
--
ALTER TABLE `users_mods`
 ADD PRIMARY KEY (`ID`);
--
-- Индексы таблицы `waste`
--
ALTER TABLE `waste`
 ADD PRIMARY KEY (`waste_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authlog`
--
ALTER TABLE `authlog`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
MODIFY `game_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `inbox`
--
ALTER TABLE `inbox`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `invoices`
--
ALTER TABLE `invoices`
MODIFY `invoice_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `locations`
--
ALTER TABLE `locations`
MODIFY `location_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
MODIFY `news_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `news_category`
--
ALTER TABLE `news_category`
MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `news_messages`
--
ALTER TABLE `news_messages`
MODIFY `news_message_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `promo`
--
ALTER TABLE `promo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `serverlog`
--
ALTER TABLE `serverlog`
MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `servers`
--
ALTER TABLE `servers`
MODIFY `server_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `servers_adap`
--
ALTER TABLE `servers_adap`
MODIFY `adap_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `servers_firewalls`
--
ALTER TABLE `servers_firewalls`
MODIFY `firewall_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `servers_mods`
--
ALTER TABLE `servers_mods`
MODIFY `mod_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `servers_owners`
--
ALTER TABLE `servers_owners`
MODIFY `owner_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tickets`
--
ALTER TABLE `tickets`
MODIFY `ticket_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tickets_category`
--
ALTER TABLE `tickets_category`
MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tickets_images`
--
ALTER TABLE `tickets_images`
MODIFY `image_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tickets_messages`
--
ALTER TABLE `tickets_messages`
MODIFY `ticket_message_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users_mods`
--
ALTER TABLE `users_mods`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `waste`
--
ALTER TABLE `waste`
MODIFY `waste_id` int(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
