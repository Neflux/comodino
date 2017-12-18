CREATE TABLE `anoncart` (
  `Quantity` int(11) NOT NULL,
  `AddDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AnonID` varchar(32) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ShopID` int(11) NOT NULL,
  PRIMARY KEY (`AnonID`,`ProductID`,`ShopID`),
  KEY `ProductID` (`ProductID`,`ShopID`),
  CONSTRAINT `anoncart_ibfk_1` FOREIGN KEY (`ProductID`, `ShopID`) REFERENCES `shopproduct` (`ProductID`, `ShopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8