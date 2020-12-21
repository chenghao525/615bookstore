-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: unrealbooks
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_copy`
--

DROP TABLE IF EXISTS `book_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_copy` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`serial_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_copy`
--

LOCK TABLES `book_copy` WRITE;
/*!40000 ALTER TABLE `book_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_suppliers`
--

DROP TABLE IF EXISTS `book_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_suppliers` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_suppliers`
--

LOCK TABLES `book_suppliers` WRITE;
/*!40000 ALTER TABLE `book_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_details` (
  `cart_id` int(11) DEFAULT NULL,
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cart_details_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_details`
--

LOCK TABLES `cart_details` WRITE;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
INSERT INTO `cart_details` VALUES (4,'1975743660',3);
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Item` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventory_amt` int(11) DEFAULT NULL,
  `threshold` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES ('1','Kitchen','USA','Sponge Bob Square Pants Shaped Mug','https://i.ibb.co/DLDP5Sv/Sponge-Bob-Square-Pants-Shaped-Mug-14-00.jpg',50,10,14),('2','Kitchen','USA','Spin The Shot Game','https://i.ibb.co/nMtZhtg/Spin-The-Shot-Game-12-00.jpg',50,10,12),('3','Kitchen','USA','SMEG Standing Mixer','https://i.ibb.co/B6mhMP7/SMEG-Standing-Mixer-459-95.jpg',50,10,460),('4','Kitchen','USA','Sloth Shaped Mug','https://i.ibb.co/zn9fYLT/Sloth-Shaped-Mug-16-00.jpg',50,10,38),('5','Kitchen','USA','Sipski Shower Win Glass Holder','https://i.ibb.co/gyXyskV/Sipski-Shower-Wine-Glass-Holder-18-00.jpg',50,10,18),('6','Kitchen','USA','Rapid Cold Brew Coffee Maker','https://i.ibb.co/pzmRFkm/Rapid-Cold-Brew-Coffee-Maker-130-00.jpg',50,10,130),('7','Kitchen','USA','Noodle Set','https://i.ibb.co/YkQYFs3/Noodle-Set-20-00.jpg',50,10,20),('8','Kitchen','USA','Mini Waffle Maker','https://i.ibb.co/gT47xDC/Mini-Waffle-Maker-18-00.jpg',50,10,18),('9','Kitchen','USA','Mini Rice Cooker','https://i.ibb.co/DzgdNcL/Mini-Rice-Cooker-29-00.jpg',50,10,29),('10','Kitchen','USA','Mini Refrigerator','https://i.ibb.co/GF4kjDN/Mini-Refrigerator-159-00.jpg',50,10,159),('11','Kitchen','Marshall','Marshall Mini Refrigerator','https://i.ibb.co/F4RpDN6/Marshall-Mini-Refrigerator-379-00.jpg',50,10,379),('12','Kitchen','Life Without Plastic','Life WIthout Plastic Stanless Steel Food Storage Canister','https://i.ibb.co/TPRqpVH/Life-Without-Plastic-Stainless-Steel-Food-Storage-Canister-20-00.jpg',50,10,20),('13','Kitchen','Life Without Plastic','Life Without Plastic Juco Sandwich Bag','https://i.ibb.co/vxf0nMG/Life-Without-Plastic-Juco-Sandwich-Bag-10-00.jpg',50,10,10),('14','Kitchen','USA','Keep Cup Cork Brew Travel Coffee Mug','https://i.ibb.co/p0jxgRq/Keep-Cup-Cork-Brew-Travel-Coffee-Mug-26-00.jpg',50,10,26),('15','Kitchen','USA','Ice Cream Pint Maker','https://i.ibb.co/9byqB80/Ice-Cream-Pint-Maker-39-00.jpg',50,10,39),('16','Kitchen','USA','Hello Sayang For Deny Cactus Madness Cutting Board','https://i.ibb.co/K2NB1X3/Hello-Sayang-For-Deny-Cactus-Madness-Cutting-Board-35-00.jpg',50,10,35),('17','Kitchen','USA','Everyday Standing Mixer','https://i.ibb.co/bKwdRxL/Everyday-Standing-Mixer-50-00.jpg',50,10,50),('18','Kitchen','Hario','Hario Buono V60 Pouring Kettle','https://i.ibb.co/YZ0Wy4Q/Hario-Buono-V60-Pouring-Kettle-60-00.jpg',50,10,60),('19','Kitchen','USA','Click Grow Smart Garden','https://i.ibb.co/KD2F1HJ/Click-Grow-Smart-Garden-9-200-00.jpg',50,10,200),('20','Kitchen','USA','Compact Air Fryer','https://i.ibb.co/jwcQhPF/Compact-Air-Fryer-100-00.jpg',50,10,100),('21','Kitchen','BODUM','BODUM Ettore Sottsass Kettle','https://i.ibb.co/tHmNVvf/BODUM-Ettore-Sottsass-Kettle-45-00.jpg',50,10,45),('22','Kitchen','BODUM','BODUM Chambord French Press','https://i.ibb.co/3ry9sHh/BODUM-Chambord-French-Press-40-00.jpg',50,10,40),('23','Kitchen','BODUM','BODUM Ceylon Infusion Jug','https://i.ibb.co/85jvb8Q/BODUM-Ceylon-Infusion-Jug-20-00.jpg',50,10,20),('24','Kitchen','USA','12 Piece Electroplated Flatware Set','https://i.ibb.co/92QLjzp/12-Piece-Electroplated-Flatware-Set-69-00.jpg',50,10,69),('25','Kitchen','USA','12 Piece Modern Dinnerware Set','https://i.ibb.co/sbvdNqg/12-Piece-Modern-Dinnerware-Set-99-00.jpg',50,10,99),('0','Kitchen','USA','Unicorn Tea Infuser','https://i.ibb.co/0cgTYFh/Unicorn-Tea-Infuser-10-00.jpg',50,10,10),('26','Furniture','Wren','Wren Rattan Bookshelf','https://i.ibb.co/RgxVTdr/Wren-Rattan-Bookshelf-399-00.jpg',50,10,399),('27','Furniture','USA','Wire Loop Vanity','https://i.ibb.co/vzCxzGF/Wire-Loop-Vanity-159-00.jpg',50,10,159),('28','Furniture','Winslow','Winslow Sleeper Sofa','https://i.ibb.co/myrfnMN/Winslow-Sleeper-Sofa-649-00.jpg',50,10,649),('29','Furniture','Trixie','Trixie Inflatable Chair','https://i.ibb.co/8MXHJH9/Trixie-Inflatable-Chair-39-00.jpg',50,10,39),('30','Furniture','Vala','Vala Mirror Storage Rack','https://i.ibb.co/ckVNMVL/Vala-Mirror-Storage-Rack-229-00.jpg',50,10,299),('31','Furniture','USA','Triangle Side Table','https://i.ibb.co/K79Xwnj/Triangle-Side-Table-39-00.jpg',50,10,39),('32','Furniture','Reema','Reema Back Cushion','https://i.ibb.co/7kHsvvf/Reema-Back-Cushion-98-00.jpg',50,10,98),('33','Furniture','Pranati','Pranati Carved Headboard','https://i.ibb.co/WB9ngrH/Pranati-Carved-Headboard-498-00.jpg',50,10,498),('34','Furniture','Peyton','Peyton Sofa','https://i.ibb.co/ygy5SSK/Peyton-Sofa-898-00.jpg',50,10,898),('35','Furniture','USA','Modern Boho Media Stand','https://i.ibb.co/qmFzVqg/Modern-Boho-Media-Stand-299-00.jpg',50,10,299),('36','Furniture','Minnie','Minnie Faux Fur Inflatable Chair','https://i.ibb.co/6yYshPq/Minnie-Faux-Fur-Inflatable-Chair-69-00.jpg',50,10,69),('37','Furniture','Marte','Marte Vanity','https://i.ibb.co/0MrWF7m/Marte-Vanity-329-00.jpg',50,10,329),('38','Furniture','Marte','Marte Lounge Chair','https://i.ibb.co/pf629hm/Marte-Lounge-Chair-379-00.jpg',50,10,379),('39','Furniture','Marte','Marte Nightstand','https://i.ibb.co/HVFx9fN/Marte-Nightstand-149-00.jpg',50,10,149),('40','Furniture','Liza','Liza Tapered Mirror','https://i.ibb.co/2N0G8BD/Liza-Tapered-Mirror-129-00.jpg',50,10,129),('41','Furniture','Holly','Holly Valvet Lounge Chair','https://i.ibb.co/Bnw9Qhx/Holly-Velvet-Lounge-Chair-249-00.jpg',50,10,249),('42','Furniture','Haskall','Haskall Breakfast Bar','https://i.ibb.co/PTfcr5m/Haskall-Breakfast-Bar-379-00.jpg',50,10,379),('43','Furniture','Greta','Greta Recycled Leature XL Sleeper Sofa','https://i.ibb.co/4tvVLcx/Greta-Recycled-Leather-XL-Sleeper-Sofa-879-00.jpg',50,10,879),('44','Furniture','Greta','Greta Crushed Valvet XL Sleeper Sofa','https://i.ibb.co/hx67wXJ/Greta-Crushed-Velvet-XL-Sleeper-Sofa-699-00.jpg',50,10,699),('45','Furniture','Graham','Graham Velvet Sofa','https://i.ibb.co/zbd3Ktc/Graham-Velvet-Sofa-1-399-00.jpg',50,10,1399),('46','Furniture','Chloe','Chloe Velvet Arm Chair','https://i.ibb.co/nbbtfK7/Chloe-Velvet-Arm-Chair-229-00.jpg',50,10,229),('47','Furniture','Chamberlin','Chamberlin Velvet Sectional Sofa','https://i.ibb.co/mBXSzQP/Chamberlin-Velvet-Sectional-Sofa-1-099-00.jpg',50,10,1099),('48','Furniture','USA','Basic 2 Seat Papasan Chair','https://i.ibb.co/C6HF0Kp/Basic-2-Seat-Papasan-Chair-169-00.jpg',50,10,169),('49','Furniture','USA','Ashton Mango Wood Mirror','https://i.ibb.co/hYDCFqt/Ashton-Mango-Wood-Mirror-229-00.jpg',50,10,229),('50','Furniture','Alina','Alina Storage Ottoman','https://i.ibb.co/gj6cFMx/Alina-Storage-Ottoman-149-00.jpg',50,10,149),('51','Furniture','Amelia','Amelia 6 Drawer Dresser','https://i.ibb.co/cQR2FQd/Amelia-6-Drawer-Dresser-799-00.jpg',50,10,799),('47','Bath','Wicker','Wicker Corner Hamper','https://i.ibb.co/v1bykHm/Wicker-Corner-Hamper-59-00.jpg',50,10,59),('48','Bath','Tike','Tike Wire Rolling Hamper','https://i.ibb.co/0fSx0Hj/Tike-Wire-Rolling-Hamper-79-00.jpg',50,10,79),('49','Bath','Sienna','Sienna Kilim Bath Mat','https://i.ibb.co/CJKjP85/Sienna-Kilim-Bath-Mat-39-00.jpg',50,10,39),('50','Bath','Plymouth','Plymouth Sliding Storage Mirror','https://i.ibb.co/dgZZ9YC/Plymouth-Sliding-Storage-Mirror-149-00.jpg',50,10,149),('51','Bath','USA','Peachy Clean Bath Mat','https://i.ibb.co/16yz88n/Peachy-Clean-Bath-Mat-39-00.jpg',50,10,39),('52','Bath','Palmistry','Palmistry Bath Mat','https://i.ibb.co/G9YmPgB/Palmistry-Bath-Mat-39-00.jpg',50,10,39),('53','Bath','USA','Metallic Flecked Toilet Seat','https://i.ibb.co/Jqn7Dpw/Metallic-Flecked-Toilet-Seat-69-00.jpg',50,10,69),('54','Bath','USA','Me Time Bamboo Bath Tray','https://i.ibb.co/8zCh5gt/Me-Time-Bamboo-Bath-Tray-Caddy-49-00.jpg',50,10,49),('55','Bath','USA','Magical Thinking Pompom Shower Curtain','https://i.ibb.co/Gx9v93Q/Magical-Thinking-Pompom-Shower-Curtain-59-00.jpg',50,10,59),('56','Bath','KItty','Kitty Toilet Brush','https://i.ibb.co/sthc79V/Kitty-Toilet-Brush-29-00.jpg',50,10,29),('57','Bath','Kitty','Kitty Storage Container','https://i.ibb.co/PhsXvKx/Kitty-Storage-Container-16-00.jpg',50,10,16),('58','Bath','USA','Grid Over THe Cabinet Basket','https://i.ibb.co/MspNCTk/Grid-Over-The-Cabinet-Basket-18-00.jpg',50,10,18),('59','Bath','USA','Get Naked Bath Mat','https://i.ibb.co/X85QR1G/Get-Naked-Bath-Mat-34-00.jpg',50,10,34),('60','Bath','USA','Cats Shower Curtain','https://i.ibb.co/cwhBLR7/Cats-Shower-Curtain-39-00.jpg',50,10,39),('61','Bath','Carter','Carter Triangle BRacket Wall Shelf','https://i.ibb.co/Ks5ZvK0/Carter-Triangle-Bracket-Wall-Shelf-8-00.jpg',50,10,8),('62','Bath','BINO','BINO Round Top Step Trash Can','https://i.ibb.co/QM2dXSq/BINO-Round-Top-Step-Trash-Can-24-00.jpg',50,10,24),('63','Bath','Barrel','Barrel Showerr Caddy','https://i.ibb.co/rmyKBQT/Barrel-Shower-Caddy-49-00.jpg',50,10,49),('64','Bath','USA','Ban do Round Watermelon Beach Towel','https://i.ibb.co/kQYyrqB/ban-do-Round-Watermelon-Beach-Towel-68-00.jpg',50,10,68),('65','Bath','Aura','Aura Hammock Fringe Laundry Bag','https://i.ibb.co/C65n5YW/Aura-Hammock-Fringe-Laundry-Bag-49-00.jpg',50,10,49),('66','Bath','USA','Allover Fruits Shower Curtain','https://i.ibb.co/QPVKqBV/Allover-Fruits-Shower-Curtain-39-00.jpg',50,10,39),('67','Bath','USA','3D LEG Gala Essential Oil Diffuser','https://i.ibb.co/TY20t5V/3-D-LED-Gala-Essential-Oil-Diffuser-65-00.jpg',50,10,65),('68','Bedding','USA','Washed Cotton Tassel Duvet Coverr','https://i.ibb.co/qk8XNJb/Washed-Cotton-Tassel-Duvet-Cover-129-00.jpg',50,10,129),('69','Bedding','USA','T-Shirt Jersey Comforter','https://i.ibb.co/sC62RsB/T-Shirt-Jersey-Comforter-169-00.jpg',50,10,169),('70','Bedding','Skye','Skye Velvet Duvet Cover','https://i.ibb.co/BLgXpgc/Skye-Velvet-Duvet-Cover-119-00.jpg',50,10,119),('71','Bedding','USA','Washed Cotton Crochet Tassel Sham Set','https://i.ibb.co/QK3mbbx/Washed-Cotton-Crochet-Tassel-Sham-Set-39-00.jpg',50,10,39),('72','Bedding','Skye','Skye Crushed Velvet Comforter','https://i.ibb.co/rHgxtJ0/Skye-Crushed-Velvet-Comforter-219-00.jpg',50,10,219),('73','Bedding','Meg','Meg Floral Knot Duvet Cover','https://i.ibb.co/PN4BtW4/Meg-Floral-Knot-Duvet-Cover-89-00.jpg',50,10,89),('74','Bedding','Marget','Marget Tufted Floral Comforter','https://i.ibb.co/tXhm7PP/Margot-Tufted-Floral-Comforter-169-00.jpg',50,10,169),('75','Bedding','USA','Knotted Washed Cotton Duvet COver','https://i.ibb.co/xC1T94h/Knotted-Washed-Cotton-Duvet-Cover-89-00.jpg',50,10,89),('76','Bedding','Eliza','Eliza Border Trim Comforter','https://i.ibb.co/bmJHSyP/Eliza-Border-Trim-Comforter-169-00.jpg',50,10,169),('77','Bedding','USA','Distressed Check Duvet Set','https://i.ibb.co/Lp6VMTZ/Distressed-Check-Duvet-Set-59-00.jpg',50,10,59);
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_details` (
  `transaction_number` int(11) DEFAULT NULL,
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  KEY `transaction_number` (`transaction_number`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`transaction_number`) REFERENCES `orders` (`transaction_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (4,'1975743660',10),(4,'0141439556',10),(5,'1975743660',1),(5,'0141439556',1),(6,'0132162709',2),(6,'1975743660',1),(6,'0141439556',1),(7,'0141439556',1),(7,'1975743660',1),(8,'0132162709',1),(8,'1975743660',1),(8,'0141439556',1),(9,'0132162709',1),(9,'1975743660',1),(9,'0141439556',1),(10,'0132162709',1),(10,'1975743660',1),(10,'0141439556',1),(11,'0132162709',10),(11,'1975743660',10),(11,'0141439556',10),(12,'0132162709',1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `transaction_number` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `final_price` double(11,2) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_number`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2017-12-10',150,9,'2017-12-11 02:36:49'),(2,'2017-12-10',135,9,'2017-12-11 02:38:20'),(3,'2017-12-10',150,9,'2017-12-11 02:39:52'),(4,'2017-12-10',150,9,'2017-12-11 03:37:22'),(5,'2017-12-10',15,9,'2017-12-11 03:50:20'),(6,'2017-12-10',53,9,'2017-12-11 04:00:50'),(7,'2017-12-10',0,9,'2017-12-11 04:04:29'),(8,'2017-12-10',34,9,'2017-12-11 04:10:09'),(9,'2017-12-10',34,9,'2017-12-11 04:23:41'),(10,'2017-12-10',34,9,'2017-12-11 04:30:35'),(11,'2017-12-10',325,9,'2017-12-11 04:31:32'),(12,'2017-12-11',19,9,'2017-12-11 06:32:22'),(13,'2018-11-30',49,36,'2018-11-30 00:36:34');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment` (
  `customer_id` int(11) DEFAULT NULL,
  `card_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `expiration_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (28,'012345678901','164 Tate Student Center, Athens, Ga 30602','credit',777,'12/17'),(9,'012345678901','164 Tate Student Center, Athens, Ga 30602','credit',777,'12/17'),(36,'0000000000000000','1223','credit',123,'10/20');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promotion` (
  `promotion_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES ('15Off','2017-12-31',15),('13Off','2018-01-01',13);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_agency`
--

DROP TABLE IF EXISTS `shipping_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_agency` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `businessphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cellphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_agency`
--

LOCK TABLES `shipping_agency` WRITE;
/*!40000 ALTER TABLE `shipping_agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_info`
--

DROP TABLE IF EXISTS `shipping_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_info` (
  `tracking_number` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_num` int(11) DEFAULT NULL,
  `status` enum('shipped','delivered','processing') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tracking_number`),
  KEY `trans_num` (`trans_num`),
  CONSTRAINT `shipping_info_ibfk_1` FOREIGN KEY (`trans_num`) REFERENCES `orders` (`transaction_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_info`
--

LOCK TABLES `shipping_info` WRITE;
/*!40000 ALTER TABLE `shipping_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplied_by`
--

DROP TABLE IF EXISTS `supplied_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplied_by` (
  `company_id` int(11) DEFAULT NULL,
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `fk_company` (`company_id`),
  CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `book_suppliers` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplied_by`
--

LOCK TABLES `supplied_by` WRITE;
/*!40000 ALTER TABLE `supplied_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplied_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `businessphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cellphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','waiting','suspended') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('customer','admin','business','shipping') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscribed` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `user`
-- --

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES 
(1,'Yunzhi Sun','65E84BE33532FB784C48129675F9EFF3A682B27168C0EA744B2CF58EE02337C5',12345678,'10400 Sugar Crest Ave.','active','ysun106@jhu.edu','admin','n#Xem&*8eaSz1odz','no'),
(2,'Chenghao Sun','EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F',1111234,'3400 N. Charles St.','active','csun34@jhu.edu','shipping','qIs#9gQmE0ztvQo*','no'),
(3,'Rick Grimes','227A3AC227EBC92427DA79FB5AF13AF723C2B624DA6D95C0B8DE1D9CB119F056',1332,'mars','active','yz21527@gmail.edu','customer','bIQ9RtI8!Yf3VpCU','yes'),
(4,'John Snow','227A3AC227EBC92427DA79FB5AF13AF723C2B624DA6D95C0B8DE1D9CB119F056',555,'earth','active','johnsnow@js.com','customer','bIQ9RtI8','no');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- -- Dump completed on 2018-12-01 21:08:08

-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: unrealbooks
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_copy`
--

DROP TABLE IF EXISTS `book_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_copy` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`serial_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_copy`
--

LOCK TABLES `book_copy` WRITE;
/*!40000 ALTER TABLE `book_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_suppliers`
--

DROP TABLE IF EXISTS `book_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_suppliers` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_suppliers`
--

LOCK TABLES `book_suppliers` WRITE;
/*!40000 ALTER TABLE `book_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_details` (
  `cart_id` int(11) DEFAULT NULL,
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cart_details_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_details`
--

LOCK TABLES `cart_details` WRITE;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
INSERT INTO `cart_details` VALUES (4,'1975743660',3);
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

-- DROP TABLE IF EXISTS `Item`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
--  SET character_set_client = utf8mb4 ;
-- CREATE TABLE `Item` (
--   `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `Company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `inventory_amt` int(11) DEFAULT NULL,
--   `threshold` int(11) DEFAULT NULL,
--   `price` int(11) DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `Item`
-- --

-- LOCK TABLES `Item` WRITE;
-- /*!40000 ALTER TABLE `Item` DISABLE KEYS */;
-- INSERT INTO `Item` VALUES ('1','Kitchen','USA','Sponge Bob Square Pants Shaped Mug','https://i.ibb.co/DLDP5Sv/Sponge-Bob-Square-Pants-Shaped-Mug-14-00.jpg',50,10,14),('2','Kitchen','USA','Spin The Shot Game','https://i.ibb.co/nMtZhtg/Spin-The-Shot-Game-12-00.jpg',50,10,12),('3','Kitchen','USA','SMEG Standing Mixer','https://i.ibb.co/B6mhMP7/SMEG-Standing-Mixer-459-95.jpg',50,10,460),('4','Kitchen','USA','Sloth Shaped Mug','https://i.ibb.co/zn9fYLT/Sloth-Shaped-Mug-16-00.jpg',50,10,38),('5','Kitchen','USA','Sipski Shower Win Glass Holder','https://i.ibb.co/gyXyskV/Sipski-Shower-Wine-Glass-Holder-18-00.jpg',50,10,18),('6','Kitchen','USA','Rapid Cold Brew Coffee Maker','https://i.ibb.co/pzmRFkm/Rapid-Cold-Brew-Coffee-Maker-130-00.jpg',50,10,130),('7','Kitchen','USA','Noodle Set','https://i.ibb.co/YkQYFs3/Noodle-Set-20-00.jpg',50,10,20),('8','Kitchen','USA','Mini Waffle Maker','https://i.ibb.co/gT47xDC/Mini-Waffle-Maker-18-00.jpg',50,10,18),('9','Kitchen','USA','Mini Rice Cooker','https://i.ibb.co/DzgdNcL/Mini-Rice-Cooker-29-00.jpg',50,10,29),('10','Kitchen','USA','Mini Refrigerator','https://i.ibb.co/GF4kjDN/Mini-Refrigerator-159-00.jpg',50,10,159),('11','Kitchen','Marshall','Marshall Mini Refrigerator','https://i.ibb.co/F4RpDN6/Marshall-Mini-Refrigerator-379-00.jpg',50,10,379),('12','Kitchen','Life Without Plastic','Life WIthout Plastic Stanless Steel Food Storage Canister','https://i.ibb.co/TPRqpVH/Life-Without-Plastic-Stainless-Steel-Food-Storage-Canister-20-00.jpg',50,10,20),('13','Kitchen','Life Without Plastic','Life Without Plastic Juco Sandwich Bag','https://i.ibb.co/vxf0nMG/Life-Without-Plastic-Juco-Sandwich-Bag-10-00.jpg',50,10,10),('14','Kitchen','USA','Keep Cup Cork Brew Travel Coffee Mug','https://i.ibb.co/p0jxgRq/Keep-Cup-Cork-Brew-Travel-Coffee-Mug-26-00.jpg',50,10,26),('15','Kitchen','USA','Ice Cream Pint Maker','https://i.ibb.co/9byqB80/Ice-Cream-Pint-Maker-39-00.jpg',50,10,39),('16','Kitchen','USA','Hello Sayang For Deny Cactus Madness Cutting Board','https://i.ibb.co/K2NB1X3/Hello-Sayang-For-Deny-Cactus-Madness-Cutting-Board-35-00.jpg',50,10,35),('17','Kitchen','USA','Everyday Standing Mixer','https://i.ibb.co/bKwdRxL/Everyday-Standing-Mixer-50-00.jpg',50,10,50),('18','Kitchen','Hario','Hario Buono V60 Pouring Kettle','https://i.ibb.co/YZ0Wy4Q/Hario-Buono-V60-Pouring-Kettle-60-00.jpg',50,10,60),('19','Kitchen','USA','Click Grow Smart Garden','https://i.ibb.co/KD2F1HJ/Click-Grow-Smart-Garden-9-200-00.jpg',50,10,200),('20','Kitchen','USA','Compact Air Fryer','https://i.ibb.co/jwcQhPF/Compact-Air-Fryer-100-00.jpg',50,10,100),('21','Kitchen','BODUM','BODUM Ettore Sottsass Kettle','https://i.ibb.co/tHmNVvf/BODUM-Ettore-Sottsass-Kettle-45-00.jpg',50,10,45),('22','Kitchen','BODUM','BODUM Chambord French Press','https://i.ibb.co/3ry9sHh/BODUM-Chambord-French-Press-40-00.jpg',50,10,40),('23','Kitchen','BODUM','BODUM Ceylon Infusion Jug','https://i.ibb.co/85jvb8Q/BODUM-Ceylon-Infusion-Jug-20-00.jpg',50,10,20),('24','Kitchen','USA','12 Piece Electroplated Flatware Set','https://i.ibb.co/92QLjzp/12-Piece-Electroplated-Flatware-Set-69-00.jpg',50,10,69),('25','Kitchen','USA','12 Piece Modern Dinnerware Set','https://i.ibb.co/sbvdNqg/12-Piece-Modern-Dinnerware-Set-99-00.jpg',50,10,99),('0','Kitchen','USA','Unicorn Tea Infuser','https://i.ibb.co/0cgTYFh/Unicorn-Tea-Infuser-10-00.jpg',50,10,10),('26','Furniture','Wren','Wren Rattan Bookshelf','https://i.ibb.co/RgxVTdr/Wren-Rattan-Bookshelf-399-00.jpg',50,10,399),('27','Furniture','USA','Wire Loop Vanity','https://i.ibb.co/vzCxzGF/Wire-Loop-Vanity-159-00.jpg',50,10,159),('28','Furniture','Winslow','Winslow Sleeper Sofa','https://i.ibb.co/myrfnMN/Winslow-Sleeper-Sofa-649-00.jpg',50,10,649),('29','Furniture','Trixie','Trixie Inflatable Chair','https://i.ibb.co/8MXHJH9/Trixie-Inflatable-Chair-39-00.jpg',50,10,39),('30','Furniture','Vala','Vala Mirror Storage Rack','https://i.ibb.co/ckVNMVL/Vala-Mirror-Storage-Rack-229-00.jpg',50,10,299),('31','Furniture','USA','Triangle Side Table','https://i.ibb.co/K79Xwnj/Triangle-Side-Table-39-00.jpg',50,10,39),('32','Furniture','Reema','Reema Back Cushion','https://i.ibb.co/7kHsvvf/Reema-Back-Cushion-98-00.jpg',50,10,98),('33','Furniture','Pranati','Pranati Carved Headboard','https://i.ibb.co/WB9ngrH/Pranati-Carved-Headboard-498-00.jpg',50,10,498),('34','Furniture','Peyton','Peyton Sofa','https://i.ibb.co/ygy5SSK/Peyton-Sofa-898-00.jpg',50,10,898),('35','Furniture','USA','Modern Boho Media Stand','https://i.ibb.co/qmFzVqg/Modern-Boho-Media-Stand-299-00.jpg',50,10,299),('36','Furniture','Minnie','Minnie Faux Fur Inflatable Chair','https://i.ibb.co/6yYshPq/Minnie-Faux-Fur-Inflatable-Chair-69-00.jpg',50,10,69),('37','Furniture','Marte','Marte Vanity','https://i.ibb.co/0MrWF7m/Marte-Vanity-329-00.jpg',50,10,329),('38','Furniture','Marte','Marte Lounge Chair','https://i.ibb.co/pf629hm/Marte-Lounge-Chair-379-00.jpg',50,10,379),('39','Furniture','Marte','Marte Nightstand','https://i.ibb.co/HVFx9fN/Marte-Nightstand-149-00.jpg',50,10,149),('40','Furniture','Liza','Liza Tapered Mirror','https://i.ibb.co/2N0G8BD/Liza-Tapered-Mirror-129-00.jpg',50,10,129),('41','Furniture','Holly','Holly Valvet Lounge Chair','https://i.ibb.co/Bnw9Qhx/Holly-Velvet-Lounge-Chair-249-00.jpg',50,10,249),('42','Furniture','Haskall','Haskall Breakfast Bar','https://i.ibb.co/PTfcr5m/Haskall-Breakfast-Bar-379-00.jpg',50,10,379),('43','Furniture','Greta','Greta Recycled Leature XL Sleeper Sofa','https://i.ibb.co/4tvVLcx/Greta-Recycled-Leather-XL-Sleeper-Sofa-879-00.jpg',50,10,879),('44','Furniture','Greta','Greta Crushed Valvet XL Sleeper Sofa','https://i.ibb.co/hx67wXJ/Greta-Crushed-Velvet-XL-Sleeper-Sofa-699-00.jpg',50,10,699),('45','Furniture','Graham','Graham Velvet Sofa','https://i.ibb.co/zbd3Ktc/Graham-Velvet-Sofa-1-399-00.jpg',50,10,1399),('46','Furniture','Chloe','Chloe Velvet Arm Chair','https://i.ibb.co/nbbtfK7/Chloe-Velvet-Arm-Chair-229-00.jpg',50,10,229),('47','Furniture','Chamberlin','Chamberlin Velvet Sectional Sofa','https://i.ibb.co/mBXSzQP/Chamberlin-Velvet-Sectional-Sofa-1-099-00.jpg',50,10,1099),('48','Furniture','USA','Basic 2 Seat Papasan Chair','https://i.ibb.co/C6HF0Kp/Basic-2-Seat-Papasan-Chair-169-00.jpg',50,10,169),('49','Furniture','USA','Ashton Mango Wood Mirror','https://i.ibb.co/hYDCFqt/Ashton-Mango-Wood-Mirror-229-00.jpg',50,10,229),('50','Furniture','Alina','Alina Storage Ottoman','https://i.ibb.co/gj6cFMx/Alina-Storage-Ottoman-149-00.jpg',50,10,149),('51','Furniture','Amelia','Amelia 6 Drawer Dresser','https://i.ibb.co/cQR2FQd/Amelia-6-Drawer-Dresser-799-00.jpg',50,10,799),('47','Bath','Wicker','Wicker Corner Hamper','https://i.ibb.co/v1bykHm/Wicker-Corner-Hamper-59-00.jpg',50,10,59),('48','Bath','Tike','Tike Wire Rolling Hamper','https://i.ibb.co/0fSx0Hj/Tike-Wire-Rolling-Hamper-79-00.jpg',50,10,79),('49','Bath','Sienna','Sienna Kilim Bath Mat','https://i.ibb.co/CJKjP85/Sienna-Kilim-Bath-Mat-39-00.jpg',50,10,39),('50','Bath','Plymouth','Plymouth Sliding Storage Mirror','https://i.ibb.co/dgZZ9YC/Plymouth-Sliding-Storage-Mirror-149-00.jpg',50,10,149),('51','Bath','USA','Peachy Clean Bath Mat','https://i.ibb.co/16yz88n/Peachy-Clean-Bath-Mat-39-00.jpg',50,10,39),('52','Bath','Palmistry','Palmistry Bath Mat','https://i.ibb.co/G9YmPgB/Palmistry-Bath-Mat-39-00.jpg',50,10,39),('53','Bath','USA','Metallic Flecked Toilet Seat','https://i.ibb.co/Jqn7Dpw/Metallic-Flecked-Toilet-Seat-69-00.jpg',50,10,69),('54','Bath','USA','Me Time Bamboo Bath Tray','https://i.ibb.co/8zCh5gt/Me-Time-Bamboo-Bath-Tray-Caddy-49-00.jpg',50,10,49),('55','Bath','USA','Magical Thinking Pompom Shower Curtain','https://i.ibb.co/Gx9v93Q/Magical-Thinking-Pompom-Shower-Curtain-59-00.jpg',50,10,59),('56','Bath','KItty','Kitty Toilet Brush','https://i.ibb.co/sthc79V/Kitty-Toilet-Brush-29-00.jpg',50,10,29),('57','Bath','Kitty','Kitty Storage Container','https://i.ibb.co/PhsXvKx/Kitty-Storage-Container-16-00.jpg',50,10,16),('58','Bath','USA','Grid Over THe Cabinet Basket','https://i.ibb.co/MspNCTk/Grid-Over-The-Cabinet-Basket-18-00.jpg',50,10,18),('59','Bath','USA','Get Naked Bath Mat','https://i.ibb.co/X85QR1G/Get-Naked-Bath-Mat-34-00.jpg',50,10,34),('60','Bath','USA','Cats Shower Curtain','https://i.ibb.co/cwhBLR7/Cats-Shower-Curtain-39-00.jpg',50,10,39),('61','Bath','Carter','Carter Triangle BRacket Wall Shelf','https://i.ibb.co/Ks5ZvK0/Carter-Triangle-Bracket-Wall-Shelf-8-00.jpg',50,10,8),('62','Bath','BINO','BINO Round Top Step Trash Can','https://i.ibb.co/QM2dXSq/BINO-Round-Top-Step-Trash-Can-24-00.jpg',50,10,24),('63','Bath','Barrel','Barrel Showerr Caddy','https://i.ibb.co/rmyKBQT/Barrel-Shower-Caddy-49-00.jpg',50,10,49),('64','Bath','USA','Ban do Round Watermelon Beach Towel','https://i.ibb.co/kQYyrqB/ban-do-Round-Watermelon-Beach-Towel-68-00.jpg',50,10,68),('65','Bath','Aura','Aura Hammock Fringe Laundry Bag','https://i.ibb.co/C65n5YW/Aura-Hammock-Fringe-Laundry-Bag-49-00.jpg',50,10,49),('66','Bath','USA','Allover Fruits Shower Curtain','https://i.ibb.co/QPVKqBV/Allover-Fruits-Shower-Curtain-39-00.jpg',50,10,39),('67','Bath','USA','3D LEG Gala Essential Oil Diffuser','https://i.ibb.co/TY20t5V/3-D-LED-Gala-Essential-Oil-Diffuser-65-00.jpg',50,10,65),('68','Bedding','USA','Washed Cotton Tassel Duvet Coverr','https://i.ibb.co/qk8XNJb/Washed-Cotton-Tassel-Duvet-Cover-129-00.jpg',50,10,129),('69','Bedding','USA','T-Shirt Jersey Comforter','https://i.ibb.co/sC62RsB/T-Shirt-Jersey-Comforter-169-00.jpg',50,10,169),('70','Bedding','Skye','Skye Velvet Duvet Cover','https://i.ibb.co/BLgXpgc/Skye-Velvet-Duvet-Cover-119-00.jpg',50,10,119),('71','Bedding','USA','Washed Cotton Crochet Tassel Sham Set','https://i.ibb.co/QK3mbbx/Washed-Cotton-Crochet-Tassel-Sham-Set-39-00.jpg',50,10,39),('72','Bedding','Skye','Skye Crushed Velvet Comforter','https://i.ibb.co/rHgxtJ0/Skye-Crushed-Velvet-Comforter-219-00.jpg',50,10,219),('73','Bedding','Meg','Meg Floral Knot Duvet Cover','https://i.ibb.co/PN4BtW4/Meg-Floral-Knot-Duvet-Cover-89-00.jpg',50,10,89),('74','Bedding','Marget','Marget Tufted Floral Comforter','https://i.ibb.co/tXhm7PP/Margot-Tufted-Floral-Comforter-169-00.jpg',50,10,169),('75','Bedding','USA','Knotted Washed Cotton Duvet COver','https://i.ibb.co/xC1T94h/Knotted-Washed-Cotton-Duvet-Cover-89-00.jpg',50,10,89),('76','Bedding','Eliza','Eliza Border Trim Comforter','https://i.ibb.co/bmJHSyP/Eliza-Border-Trim-Comforter-169-00.jpg',50,10,169),('77','Bedding','USA','Distressed Check Duvet Set','https://i.ibb.co/Lp6VMTZ/Distressed-Check-Duvet-Set-59-00.jpg',50,10,59);
-- /*!40000 ALTER TABLE `Item` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_details` (
  `transaction_number` int(11) DEFAULT NULL,
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  KEY `transaction_number` (`transaction_number`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`transaction_number`) REFERENCES `orders` (`transaction_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (4,'1975743660',10),(4,'0141439556',10),(5,'1975743660',1),(5,'0141439556',1),(6,'0132162709',2),(6,'1975743660',1),(6,'0141439556',1),(7,'0141439556',1),(7,'1975743660',1),(8,'0132162709',1),(8,'1975743660',1),(8,'0141439556',1),(9,'0132162709',1),(9,'1975743660',1),(9,'0141439556',1),(10,'0132162709',1),(10,'1975743660',1),(10,'0141439556',1),(11,'0132162709',10),(11,'1975743660',10),(11,'0141439556',10),(12,'0132162709',1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment` (
  `customer_id` int(11) DEFAULT NULL,
  `card_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `expiration_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

-- LOCK TABLES `payment` WRITE;
-- /*!40000 ALTER TABLE `payment` DISABLE KEYS */;
-- INSERT INTO `payment` VALUES (28,'012345678901','164 Tate Student Center, Athens, Ga 30602','credit',777,'12/17'),(9,'012345678901','164 Tate Student Center, Athens, Ga 30602','credit',777,'12/17'),(36,'0000000000000000','1223','credit',123,'10/20');
-- /*!40000 ALTER TABLE `payment` ENABLE KEYS */;
-- UNLOCK TABLES;

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (3,'012345678901','3400 Student Center','credit',777,'12/17'),
(4,'32323232','Student Center','credit',777,'12/07');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

-- (5,'343434343','Address','credit',123,'10/20'),
-- (6,'7657657565','Address','credit',123,'10/20'),
-- (7,'3243434','Address','credit',123,'10/20'),
-- (8,'97898779','Address','credit',123,'10/20')
--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promotion` (
  `promotion_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES ('15Off','2017-12-31',15),('13Off','2018-01-01',13);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_agency`
--

DROP TABLE IF EXISTS `shipping_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_agency` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `businessphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cellphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_agency`
--

LOCK TABLES `shipping_agency` WRITE;
/*!40000 ALTER TABLE `shipping_agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_info`
--

DROP TABLE IF EXISTS `shipping_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_info` (
  `tracking_number` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_num` int(11) DEFAULT NULL,
  `status` enum('shipped','delivered','processing') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tracking_number`),
  KEY `trans_num` (`trans_num`),
  CONSTRAINT `shipping_info_ibfk_1` FOREIGN KEY (`trans_num`) REFERENCES `orders` (`transaction_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_info`
--

LOCK TABLES `shipping_info` WRITE;
/*!40000 ALTER TABLE `shipping_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_cart` (
  `customer_id` int(11) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cart_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

-- LOCK TABLES `shopping_cart` WRITE;
-- /*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
-- INSERT INTO `shopping_cart` VALUES (9,33,4),(28,0,19),(31,0,22),(32,0,23),(33,0,24),(36,49,26),(37,0,27),(38,0,28),(39,0,29),(40,0,30);
-- /*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
-- UNLOCK TABLES;

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (3,0,3), (4,0,4), (5,0,5), (6,0,6), (7,0,7), (8,0,8);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplied_by`
--

DROP TABLE IF EXISTS `supplied_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplied_by` (
  `company_id` int(11) DEFAULT NULL,
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `fk_company` (`company_id`),
  CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `book_suppliers` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplied_by`
--

LOCK TABLES `supplied_by` WRITE;
/*!40000 ALTER TABLE `supplied_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplied_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `businessphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cellphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zip_state_taxrate`
--

DROP TABLE IF EXISTS zipcode_state;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE zipcode_state (
    zipcode INTEGER NOT NULL,
    state VARCHAR(2) NOT NULL,
    PRIMARY KEY (zipcode)
);
/*!40101 SET character_set_client = @saved_cs_client */;

------------------------MARYLAND-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_MD //
CREATE PROCEDURE insert_zip_MD()
BEGIN
  DECLARE i INT DEFAULT 21201;
  WHILE i <= 21237 DO
    INSERT INTO zipcode_state (zipcode, state) VALUES (i, "MD");
    SET i = i + 1;
  END WHILE;
END;
//
delimiter ;

CALL insert_zip_MD();

------------------------ALABAMA-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_AL //
CREATE PROCEDURE insert_zip_AL()
BEGIN
  DECLARE i INT DEFAULT 35801;
  WHILE i <= 35816 DO
    INSERT INTO zipcode_state (zipcode, state) VALUES (i, "AL");
    SET i = i + 1;
  END WHILE;
END;
//
delimiter ;

CALL insert_zip_AL();

------------------------Alaska-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_AK //
CREATE PROCEDURE insert_zip_AK()
BEGIN
  DECLARE i INT DEFAULT 99501;
  WHILE i <= 99524 DO
    INSERT INTO zipcode_state (zipcode, state) VALUES (i, "AK");
    SET i = i + 1;
  END WHILE;
END;
//
delimiter ;

CALL insert_zip_AK();

------------------------Arizona-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_AZ //
CREATE PROCEDURE insert_zip_AZ()
BEGIN
  DECLARE i INT DEFAULT 85001;
  WHILE i <= 85055 DO
    INSERT INTO zipcode_state (zipcode, state) VALUES (i, "AZ");
    SET i = i + 1;
  END WHILE;
END;
//
delimiter ;

CALL insert_zip_AZ();

------------------------Arkansas-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_AR //
CREATE PROCEDURE insert_zip_AR()
BEGIN
  DECLARE i INT DEFAULT 72201;
  WHILE i <= 72217 DO
    INSERT INTO zipcode_state (zipcode, state) VALUES (i, "AR");
    SET i = i + 1;
  END WHILE;
END;
//
delimiter ;

CALL insert_zip_AR();

------------------------California-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_CA //
CREATE PROCEDURE insert_zip_CA()
BEGIN
    DECLARE j INT DEFAULT 90001;
    WHILE j <= 90089 DO
        INSERT INTO zipcode_state (zipcode, state) VALUES (j, "CA");
        SET j = j + 1;
    END WHILE;
END;
//
delimiter ;

CALL insert_zip_CA();

------------------------Washington DC-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_DC //
CREATE PROCEDURE insert_zip_DC()
BEGIN
    DECLARE j INT DEFAULT 20001;
    WHILE j <= 20020 DO
        INSERT INTO zipcode_state (zipcode, state) VALUES (j, "DC");
        SET j = j + 1;
    END WHILE;
END;
//
delimiter ;

CALL insert_zip_DC();

------------------------Florida-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_FL //
CREATE PROCEDURE insert_zip_FL()
BEGIN
    DECLARE j INT DEFAULT 33124;
    WHILE j <= 33190 DO
        INSERT INTO zipcode_state (zipcode, state) VALUES (j, "FL");
        SET j = j + 1;
    END WHILE;
END;
//
delimiter ;

CALL insert_zip_FL();

------------------------Georgia-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_GA //
CREATE PROCEDURE insert_zip_GA()
BEGIN
    DECLARE j INT DEFAULT 30301;
    WHILE j <= 30381 DO
        INSERT INTO zipcode_state (zipcode, state) VALUES (j, "GA");
        SET j = j + 1;
    END WHILE;
END;
//
delimiter ;

CALL insert_zip_GA();

------------------------Illinois-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_IL //
CREATE PROCEDURE insert_zip_IL()
BEGIN
    DECLARE j INT DEFAULT 60601;
    WHILE j <= 60641 DO
        INSERT INTO zipcode_state (zipcode, state) VALUES (j, "IL");
        SET j = j + 1;
    END WHILE;
END;
//
delimiter ;

CALL insert_zip_IL();

------------------------NEY YORK-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_NY //
CREATE PROCEDURE insert_zip_NY()
BEGIN
    DECLARE j INT DEFAULT 10001;
    WHILE j <= 10048 DO
        INSERT INTO zipcode_state (zipcode, state) VALUES (j, "NY");
        SET j = j + 1;
    END WHILE;
END;
//
delimiter ;

CALL insert_zip_NY();

------------------------OHIO-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_OH //
CREATE PROCEDURE insert_zip_OH()
BEGIN
    DECLARE j INT DEFAULT 44101;
    WHILE j <= 44179 DO
        INSERT INTO zipcode_state (zipcode, state) VALUES (j, "OH");
        SET j = j + 1;
    END WHILE;
END;
//
delimiter ;

CALL insert_zip_OH();

------------------------Pennsylvania-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_PA //
CREATE PROCEDURE insert_zip_PA()
BEGIN
    DECLARE j INT DEFAULT 15201;
    WHILE j <= 15244 DO
        INSERT INTO zipcode_state (zipcode, state) VALUES (j, "PA");
        SET j = j + 1;
    END WHILE;
END;
//
delimiter ;

CALL insert_zip_PA();

------------------------TEXAS-------------------------
delimiter //
DROP PROCEDURE IF EXISTS insert_zip_TX //
CREATE PROCEDURE insert_zip_TX()
BEGIN
    DECLARE j INT DEFAULT 78701;
    WHILE j <= 78705 DO
        INSERT INTO zipcode_state (zipcode, state) VALUES (j, "TX");
        SET j = j + 1;
    END WHILE;
END;
//
delimiter ;

CALL insert_zip_TX();

------------------------SALE TAX RATE-------------------------
DROP TABLE IF EXISTS state_taxrate;
CREATE TABLE state_taxrate (
    state VARCHAR(2),
    tax_rate FLOAT
);

INSERT INTO state_taxrate VALUES ("MD",0.6),
("AL",0.04),("AK",0.00),("AZ",0.56),("AR",0.65),("CA",0.725),
("DC",0.6),("FL",0.6),("GA",0.4),("IL",0.625),("NY",0.4),("OH",0.575),("PA",0.6),("TX",0.7);

-- DROP TABLE IF EXISTS zipcode_state_taxrate;
-- CREATE TABLE zipcode_state_taxrate (
--     zipcode INTEGER,
--     state VARCHAR(2),
--     tax_rate FLOAT
-- );

-- INSERT INTO zipcode_state_taxrate (
--     SELECT zs.zipcode, zs.state, st.tax_rate
--     FROM  zipcode_state zs, state_taxrate st
--     WHERE zs.state=st.state);

------------------------user-------------------------
-- DROP TABLE IF EXISTS user;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
--  SET character_set_client = utf8mb4 ;
-- CREATE TABLE user (
--     userid int(11) NOT NULL AUTO_INCREMENT,
--     name varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
--     user_name varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
--     password varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
--     registration_date DATETIME NOT NULL,
--     security_question enum('What is the length of your hand in centimeter?','Where is your biggest mole?','What is your shoe size?') NOT NULL,
--     security_answer VARCHAR(255) NOT NULL,
--     most_recent_location VARCHAR(255) NOT NULL,
--     zipcode INTEGER NOT NULL,
--     state VARCHAR(10) NOT NULL,
--     sex varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
--     phone_number VARCHAR(10) DEFAULT NULL,
--     address varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--     status enum('active','waiting','suspended') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--     email varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
--     type enum('customer','admin','business','shipping') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--     verification_code varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--     subscribed enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--     PRIMARY KEY (userid),
--     FOREIGN KEY (zipcode) REFERENCES zipcode_state(zipcode),
--     UNIQUE KEY email (email)
-- ) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

-- LOCK TABLES `user` WRITE;
-- /*!40000 ALTER TABLE `user` DISABLE KEYS */;
-- INSERT INTO `user` VALUES 
-- (1,'Yunzhi Sun','ysun106','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','2020-12-20','What is your shoe size?','38','Baltimore','21202','MD','F',1234,'225 N. Calver St','active','ysun106@jhu.edu','admin','hIWkuPxQcPYKFI6S','no'),
-- (2,'Chenghao Sun','csun34','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','2020-12-20','What is your shoe size?','43','Baltimore','21212','MD','M',834,'JHU campus','active','csun34@jhu.edu','admin','bIQ9RtI8!Yf3VpCU','yes');
-- /*!40000 ALTER TABLE `user` ENABLE KEYS */;
-- UNLOCK TABLES;
-- /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- DROP TABLE IF EXISTS review;
-- CREATE TABLE review (
--     review_id INT(11) AUTO_INCREMENT,
--     -- book_id INT(11) NOT NULL,
--     rating enum('1','2','3','4','5') NOT NULL,
--     userid INT(11) NOT NULL,
--     user_name varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
--     time timestamp NOT NULL,
--     content VARCHAR(255),
--     PRIMARY KEY (review_id), 
--     -- FOREIGN KEY (book_id) REFERENCES books(book_id),
--     FOREIGN KEY (userid) REFERENCES user(userid)
-- );

-- DROP TABLE IF EXISTS books;
-- CREATE TABLE books (
--     book_id INT(11) NOT NULL,
--     quantity INTEGER,
--     title VARCHAR(255) NOT NULL,
--     author VARCHAR(255),
--     author_id VARCHAR(255),
--     author_bio TEXT,
--     authors VARCHAR(255),
--     title_slug VARCHAR(255),
--     author_slug VARCHAR(255),
--     isbn13 VARCHAR(255),
--     isbn10 VARCHAR(255),
--     price VARCHAR(255),
--     format VARCHAR(255),
--     publisher VARCHAR(255),
--     pubdate VARCHAR(255),
--     edition VARCHAR(255),
--     subjects VARCHAR(255),
--     lexile VARCHAR(255),
--     pages VARCHAR(255),
--     dimensions TEXT,
--     overview TEXT,
--     excerpt TEXT,
--     synopsis TEXT,
--     toc TEXT,
--     editorial_reviews TEXT,
--     PRIMARY KEY (book_id)
-- );

-- DROP TABLE IF EXISTS books;
-- CREATE TABLE books (
--     book_id INT(11) NOT NULL,
--     quantity INTEGER,
--     title VARCHAR(255) NOT NULL,
--     author VARCHAR(255),
--     isbn13 VARCHAR(255),
--     isbn10 VARCHAR(255),
--     price DOUBLE(11,2),
--     pubdate VARCHAR(255),
--     subjects VARCHAR(255),
--     format VARCHAR(255),
--     edition VARCHAR(255),
--     pages VARCHAR(255),
--     PRIMARY KEY (book_id)
-- );

-- LOAD DATA LOCAL INFILE '/Users/mohinder/Desktop/book.csv' INTO TABLE books
-- FIELDS TERMINATED BY ','
-- LINES TERMINATED BY '\n' 
-- IGNORE 1 ROWS;

-- DELETE from books where book_id=0 OR book_id=1911;

DROP TABLE IF EXISTS Item;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE Item (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventory_amt` int(11) DEFAULT NULL,
  `threshold` int(11) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOAD DATA LOCAL INFILE '/Users/chenghaosun/Desktop/book.csv' INTO TABLE Item
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

DELETE from Item where id=0 OR id=1911;

-- CREATE VIEW user_shipping_info AS 
--   SELECT name, phone_number, address, email
--   FROM User;

-- GRANT SELECT 
-- ON user
-- TO SELECT * FROM USER WHERE USERID=2;
