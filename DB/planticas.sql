-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-03-2018 a las 10:22:49
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planticas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cultivo`
--

CREATE TABLE `cultivo` (
  `idCultivo` int(11) NOT NULL,
  `nomComun` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `perCosecha` varchar(45) NOT NULL,
  `fechaInicio` int(11) NOT NULL,
  `fechaFin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cultivo`
--

INSERT INTO `cultivo` (`idCultivo`, `nomComun`, `tipo`, `perCosecha`, `fechaInicio`, `fechaFin`) VALUES
(1, 'Acelga', 'Hortaliza', '60', 10, 1),
(2, 'Ajo', 'Hortaliza', '180', 1, 12),
(3, 'Berenjena', 'Hortaliza', '180', 3, 4),
(4, 'Calabacin', 'Hortaliza', '120', 2, 5),
(5, 'Cebolla', 'Hortaliza', '120', 2, 3),
(6, 'Lechuga', 'Hortaliza', '60', 1, 12),
(7, 'Nabos', 'Hortaliza', '90', 1, 12),
(8, 'Pepino', 'Hortaliza', '90', 1, 12),
(9, 'Pimiento', 'Hortaliza', '180', 1, 5),
(10, 'Zanahoria', 'Hortaliza', '120', 1, 12),
(11, 'Fresones', 'Fruta', '365', 4, 8),
(12, 'Sandía', 'Fruta', '150', 1, 5),
(13, 'Guisantes', 'Legumbre', '150', 9, 8),
(14, 'Judías', 'Legumbre', '90', 2, 10),
(15, 'Lavanda', 'Aromática/Medicinal', '120', 3, 6),
(16, 'Albahaca', 'Aromática/Medicinal', '60', 3, 5),
(17, 'Tomillo', 'Aromática/Medicinal', '90', 9, 5),
(18, 'Valeriana', 'Aromática/Medicinal', '60', 7, 10),
(19, 'Boniato', 'Tubérculo/Raíz', '150', 2, 4),
(20, 'Patata', 'Tubérculo/Raíz', '120', 1, 12),
(21, 'Remolacha', 'Tubérculo/Raíz', '120', 1, 12);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cultivo_huerto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cultivo_huerto` (
`nomComun` varchar(45)
,`tipo` varchar(45)
,`perCosecha` varchar(45)
,`idSiembra` int(11)
,`fechaSiembra` timestamp
,`huerto_idHuerto` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huerto`
--

CREATE TABLE `huerto` (
  `idHuerto` int(11) NOT NULL,
  `nomHuerto` varchar(45) NOT NULL DEFAULT 'Nuevo Huerto',
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `huerto`
--

INSERT INTO `huerto` (`idHuerto`, `nomHuerto`, `idUsuario`) VALUES
(4, 'El Huerto de Pepe', 3),
(5, 'El otro Huerto de Pepe', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mes`
--

CREATE TABLE `mes` (
  `idMes` int(11) NOT NULL,
  `nomMes` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mes`
--

INSERT INTO `mes` (`idMes`, `nomMes`) VALUES
(4, 'Abril'),
(8, 'Agosto'),
(12, 'Diciembre'),
(1, 'Enero'),
(2, 'Febrero'),
(7, 'Julio'),
(6, 'Junio'),
(3, 'Marzo'),
(5, 'Mayo'),
(11, 'Noviembre'),
(10, 'Octubre'),
(9, 'Septiembre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siembra`
--

CREATE TABLE `siembra` (
  `idSiembra` int(11) NOT NULL,
  `cultivo_idCultivo` int(11) NOT NULL,
  `huerto_idHuerto` int(11) NOT NULL,
  `fechaSiembra` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `siembra`
--

INSERT INTO `siembra` (`idSiembra`, `cultivo_idCultivo`, `huerto_idHuerto`, `fechaSiembra`) VALUES
(33, 1, 4, '2018-03-20 09:12:38'),
(34, 4, 4, '2018-03-20 09:12:40'),
(35, 8, 4, '2018-03-20 09:12:43'),
(36, 12, 4, '2018-03-20 09:12:45'),
(37, 12, 4, '2018-03-20 09:12:48'),
(38, 17, 4, '2018-03-20 09:12:51'),
(39, 10, 5, '2018-03-20 09:13:05'),
(40, 1, 5, '2018-03-20 09:13:07'),
(41, 2, 5, '2018-03-20 09:13:08'),
(42, 12, 5, '2018-03-20 09:13:11'),
(43, 19, 5, '2018-03-20 09:13:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `alias` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `passw` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `alias`, `email`, `passw`) VALUES
(3, 'pepe_perez', 'pepeperez@gmail.com', 'pepe_perez');

-- --------------------------------------------------------

--
-- Estructura para la vista `cultivo_huerto`
--
DROP TABLE IF EXISTS `cultivo_huerto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cultivo_huerto`  AS  select `cultivo`.`nomComun` AS `nomComun`,`cultivo`.`tipo` AS `tipo`,`cultivo`.`perCosecha` AS `perCosecha`,`siembra`.`idSiembra` AS `idSiembra`,`siembra`.`fechaSiembra` AS `fechaSiembra`,`siembra`.`huerto_idHuerto` AS `huerto_idHuerto` from (`cultivo` left join `siembra` on((`cultivo`.`idCultivo` = `siembra`.`cultivo_idCultivo`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cultivo`
--
ALTER TABLE `cultivo`
  ADD PRIMARY KEY (`idCultivo`),
  ADD KEY `fk_cultivo_mes1_idx` (`fechaInicio`),
  ADD KEY `fk_cultivo_mes2_idx` (`fechaFin`);

--
-- Indices de la tabla `huerto`
--
ALTER TABLE `huerto`
  ADD PRIMARY KEY (`idHuerto`),
  ADD KEY `fk_huerto_usuario_idx` (`idUsuario`);

--
-- Indices de la tabla `mes`
--
ALTER TABLE `mes`
  ADD PRIMARY KEY (`idMes`),
  ADD UNIQUE KEY `nomMes_UNIQUE` (`nomMes`);

--
-- Indices de la tabla `siembra`
--
ALTER TABLE `siembra`
  ADD PRIMARY KEY (`idSiembra`),
  ADD KEY `fk_cultivo_has_huerto_huerto1_idx` (`huerto_idHuerto`),
  ADD KEY `fk_cultivo_has_huerto_cultivo1_idx` (`cultivo_idCultivo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cultivo`
--
ALTER TABLE `cultivo`
  MODIFY `idCultivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `huerto`
--
ALTER TABLE `huerto`
  MODIFY `idHuerto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `mes`
--
ALTER TABLE `mes`
  MODIFY `idMes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `siembra`
--
ALTER TABLE `siembra`
  MODIFY `idSiembra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cultivo`
--
ALTER TABLE `cultivo`
  ADD CONSTRAINT `fk_cultivo_mes1` FOREIGN KEY (`fechaInicio`) REFERENCES `mes` (`idMes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cultivo_mes2` FOREIGN KEY (`fechaFin`) REFERENCES `mes` (`idMes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `huerto`
--
ALTER TABLE `huerto`
  ADD CONSTRAINT `fk_huerto_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `siembra`
--
ALTER TABLE `siembra`
  ADD CONSTRAINT `fk_cultivo_has_huerto_cultivo1` FOREIGN KEY (`cultivo_idCultivo`) REFERENCES `cultivo` (`idCultivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cultivo_has_huerto_huerto1` FOREIGN KEY (`huerto_idHuerto`) REFERENCES `huerto` (`idHuerto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
