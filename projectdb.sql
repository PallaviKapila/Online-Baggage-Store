-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2019 at 10:03 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `carttable`
--

CREATE TABLE `carttable` (
  `Sr No` int(10) NOT NULL,
  `ProdID` int(10) NOT NULL,
  `ProdName` varchar(100) NOT NULL,
  `Rate` double NOT NULL,
  `Qty` double NOT NULL,
  `TC` double NOT NULL,
  `Pic` varchar(100) NOT NULL,
  `Username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carttable`
--

INSERT INTO `carttable` (`Sr No`, `ProdID`, `ProdName`, `Rate`, `Qty`, `TC`, `Pic`, `Username`) VALUES
(2, 6, 'gdwsjh', -246.79999999999995, 4, -987.1999999999998, 'noimage.png', 'pankajkapila110@gmail.com'),
(3, 4, 'xyz', -246.79999999999995, 5, -1233.9999999999998, 'noimage.png', 'pankajkapila110@gmail.com'),
(4, 4, 'xyz', -246.79999999999995, 9, -2221.2, 'noimage.png', 'pankajkapila110@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Name` varchar(100) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Phone` varchar(40) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Name`, `Username`, `Phone`, `Password`, `Message`) VALUES
('Pankaj', 'pankajkapila110@gmail.com', '9417409129', 'Pankaj123!', 'sjazmkjsw');

-- --------------------------------------------------------

--
-- Table structure for table `managecat`
--

CREATE TABLE `managecat` (
  `CatID` int(10) NOT NULL,
  `CatName` varchar(50) NOT NULL,
  `CatPic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `managecat`
--

INSERT INTO `managecat` (`CatID`, `CatName`, `CatPic`) VALUES
(103, 'Collections', '15636412286099.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `manageprod`
--

CREATE TABLE `manageprod` (
  `CatID` int(10) NOT NULL,
  `SubCatID` int(10) NOT NULL,
  `ProdID` int(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Rate` int(50) NOT NULL,
  `Discount` int(50) NOT NULL,
  `Stock` int(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `ProdPic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manageprod`
--

INSERT INTO `manageprod` (`CatID`, `SubCatID`, `ProdID`, `Name`, `Rate`, `Discount`, `Stock`, `Description`, `ProdPic`) VALUES
(103, 10, 4, 'xyz', 1234, 120, 400, 'ashhamznk', 'noimage.png'),
(103, 10, 6, 'gdwsjh', 1234, 120, 96, 'sakjhash', 'noimage.png'),
(103, 13, 7, 'Marquam Laptop Handbag 18.4\"', 2000, 10, 100, 'Keep your laptop computer well-protected and your everyday business essentials stylishly organized in the Clark & Mayfield Marquam 18.4\" Laptop Tote. This lightweight and durable nylon bag features contrasting faux leather buckle detail and trim, sturdy silver-toned hardware, and enough room to store everything but the kitchen sink! ', '1563759201489l1.png'),
(103, 13, 8, 'Florence Ladies Roller Tote', 5000, 20, 50, 'Transport your light business travel essentials comfortably and stylishly in the Florence Roller Tote. This smooth and luxurious wheeled tote is perfect for use as a carry-on.', '1563759472172l2.png'),
(103, 13, 9, 'Women\'s Laptop Tote', 8000, 15, 40, 'A simple and professional laptop tote makes the daily commute a little bit easier and a lot more stylish. The Le Donne Leather Women\'s Laptop/Handbag Brief is made from full grain vacquetta cowhide and has multiple pockets to hold all your essentials inside.', '1563759583144l3.png'),
(103, 13, 10, 'Savvy Laptop Tote 2.0 with RFID Security', 4500, 18, 30, 'Perfect for the daily commute or weekend travel, this laptop tote has a classic look that can be carried on any occasion. The eBags Savvy Laptop Tote 2.0 with RFID Security is made from soft nylon fabric and features a classic shape in a large silhouette with a zip top closure, a protective laptop pocket, and a foam-padded pocket to hold documents, a tablet, or a small second laptop. ', '1563759745062l4.png'),
(103, 13, 11, 'Bellevue Laptop Handbag 18.4\"', 5200, 10, 20, 'Tote your laptop and other essentials for a casual workday or a weekend trip inside this sleek nylon shoulder bag from Clark & Mayfield. The Clark & Mayfield Bellevue Laptop Handbag 18.4\" is made from durable nylon fabric and features a sleek design with genuine leather accents and trim, dual top handles, and an adjustable, detachable shoulder strap. ', '1563759914968l5.png'),
(103, 13, 12, 'Let\'s Compare Laptop Totes', 5500, 20, 40, 'Tote your laptop to and from work or school inside this sleek shoulder bag from Kenneth Cole Reaction. The Kenneth Cole Reaction Let\'s Compare Laptop Totes is made from pebbled PU faux leather and features a classic shape with contrast accent stitching, a logo plate on the front, and two rounded top handles that can be carried comfortably on the shoulder.', '1563760156074l6.png'),
(103, 13, 13, 'Laptop Hobo- Exclusive Colors', 20000, 40, 20, 'The daily commute can be hectic but this stylish hobo makes it a little bit easier by organizing everything you need for the long day ahead. The Piel Laptop Hobo is made from soft naked leather and features contrast stitching with two leather straps that give it a classic look.', '1563760279514l7.png'),
(103, 13, 14, 'Laptop Travel Tote', 18000, 40, 25, 'With a classic look that never goes out of style, this rich leather tote offers fashion and function for all types of travel. The Piel Laptop Travel Tote bag is crafted from full grain leather and features an elegant design with multiple storage pockets and two rounded top handles that can be toted by hand or carried over the shoulder. ', '1563760427536l8.png'),
(103, 13, 15, 'Sellwood Metro Laptop Handbag 15.6\"', 10000, 20, 25, 'Pack up for the daily commute in a stylish nylon laptop tote with plenty of room for all of your important personal and professional items. The Clark & Mayfield Sellwood 15.6\" Laptop Tote is made from lightweight and durable ballistic nylon with a shimmery sheen, contrast handles, and contrast accent trim.', '1563760652988l9.png'),
(103, 13, 16, 'Premium Leather 15.6\" Laptop Carryall', 6000, 10, 20, 'Sized to hold a 15.6\" laptop, this tote bag is perfect for the daily commute or the occasional trip out of town. The SOLO Premium Leather 15.6\" Laptop Carryall is beautifully crafted from rich leather and features a large shape with metal feet to protect the bottom, multiple pockets for organized storage, and two top handles that make it comfortable to carry', '1563760737305l10.png'),
(103, 13, 17, 'Laptop Business Tote', 17000, 20, 15, 'Keep your laptop computer stylishly and luxuriously protected in the Piel Computer Business Tote. This smooth and supple naked leather bag has a zip top opening into a spacious, lined main compartment with a padded and secured laptop computer section, plenty of room for your files and documents, and an organizational compartment with credit card slots.', '1563760836849l11.png'),
(103, 13, 18, 'Fauna Executive Tote', 13000, 20, 40, 'Fauna executive tote.', '1563760916267l16.png'),
(103, 12, 19, 'W Series Lake Forest Leather Women\'s 15\" Laptop Case', 12000, 25, 18, 'Keep your laptop computer well-protected and your other everyday business essentials elegantly organized in the McKlein USA W Series Lake Forest Leather Women\'s 15.4\" Laptop Case. This soft, smooth, supple, and luxurious Italian leather bag is available in several fashion colors and has a top zip closure.', '1563761027298br1.png'),
(103, 12, 20, 'Audrey RFID Brera Briefcase', 25000, 40, 50, 'Carry your laptop and a few other essentials in style inside this sophisticated leather computer brief from Lodis. The Lodis Audrey Brera Brief with Computer Compartment is made from soft grain Italian leather and features a sleek design in a structured silhouette with two top handles and a detachable shoulder strap that offers versatile carrying options.', '1563761118491br2.png'),
(103, 12, 21, 'Francine Collection - London Leather Case', 18000, 40, 30, 'The classic and refined styling of this briefcase makes it perfect for the professional woman on the go. The Women In Business Francine Collection - London Leather Case is crafted from top grain genuine leather and offers a streamlined, elegant look for the daily commute or occasional business trip. ', '1563761321515br7.png'),
(103, 12, 22, 'Briefcase', 30000, 50, 30, 'Hand tooled detailing adds texture and a touch of western style to this rich leather briefcase from Ropin West. The Ropin West Briefcase is crafted from full grain cowhide leather and features a classic shape and an elegant design with hand tooled detailing on the front pocket, two sturdy top handles, and a shoulder strap that makes it comfortable to carry.', '1563761291949br3.png'),
(103, 12, 23, 'Pauline Laptop Briefcase', 9000, 15, 50, 'A diamond quilted texture adds a stylish touch to this versatile laptop briefcase from Hedgren. The Hedgren Pauline Laptop Briefcase is made from durable nylon taffeta fabric and features a diamond quilted design with a small front logo, two rounded top handles, and a detachable strap that makes it comfortable to carry. ', '1563761837913br4.png'),
(103, 12, 24, 'Classic Herringbone Laptop Tote (Small) - 14.1\"PC / 15\"MacBook Pro', 7500, 15, 35, 'A sophisticated alternative to a traditional laptop bag, this tote offers fashion and function for the stylish professional on the go. The Mobile Edge Classic Herringbone Laptop Tote (Small) - 14.1\"PC / 15\" MacBook Pro is made from polyester fabric with a herringbone inspired pattern, contrast solid accents and trim, and multiple pockets for organization.', '1563761897623br5.png'),
(103, 12, 25, 'Classic Herringbone ScanFast Checkpoint-Friendly Element 17\" Laptop Briefcase', 9250, 20, 40, 'With a sophisticated design that never goes out of style, this laptop briefcase is perfect for the professional on the go. The Mobile Edge Classic Herringbone ScanFast Checkpoint-Friendly Element 17\" Laptop Briefcase is made from a combination of Koskin leather and herringbone fabric and features a stylish two-tone design with accent stitching, two rounded top handles, and a detachable shoulder strap that offers versatile carrying options. ', '1563761986297br6.png'),
(103, 12, 26, 'Leopard 17\" Laptop Case', 4000, 10, 40, 'With function and fashion in mind, this World Traveler 17-inch laptop case makes the commute a breeze. A convenient detachable and adjustable shoulder strap offers instant versatility, while the carefully lined interior keeps the computer safe and secure.', '1563762063192br8.png'),
(103, 12, 27, 'London Shoulder Bag', 9300, 40, 26, 'Our sophisticated London Shoulder bag is a showstopper guranteed to turn heads wherever you go. Our stylish padded pocket will secure your laptop up to 15.6\" along with a padded pocket for your tablet device up to 10.1\" by an adjustable protective strap leaving your mind at total ease. Carry the London with the luxe shoulder strap during the day and by the handles at night making a fashion statement. ', '1563762160866br9.png'),
(103, 12, 28, 'Ladies Three Compartment Tablet Friendly Brief', 26000, 40, 50, 'Contrast leather accents add a touch of sophistication to this refined leather brief from Derek Alexander. The Derek Alexander Ladies Three Compartment Tablet Friendly Brief is crafted from top grain cowhide leather and features a small shape with contrast color trim, two rounded top handles, and a detachable strap that offers versatile carrying options. ', '1563762251156br10.png'),
(103, 12, 29, 'Jeanie Laptop Bag', 2700, 10, 50, 'arry your laptop in comfort and style inside this versatile and durable nylon case. The J World Jeanie Laptop Bag is made from nylon and Duraceltex fabrics and is available in a variety of solid colors and pretty prints that add a stylish touch to your travel routine. This laptop case has a wraparound top zipper closure and a padded interior that protects your laptop.', '1563762324582br14.png'),
(103, 12, 30, 'ScanFast Checkpoint Friendly Women\'s Element Laptop Bag - 16\"PC / 17\" MacBook Pro', 7700, 20, 40, 'Be prepared and look professional with all your important business items stored inside this convenient laptop briefcase. The Mobile Edge 16\"PC/17\" MacBook Pro ScanFast Checkpoint Friendly Women\'s Element Laptop Bag features a rich suede exterior with faux leather trim and a satin interior lining. This laptop bag has a dedicated padded laptop section designed with TSA regulations in mind that make it easier to move through security checkpoints. ', '1563762435571br16.png'),
(103, 12, 31, 'Zebra 17\" Laptop Case', 3800, 25, 45, 'With function and fashion in mind, this World Traveler 17-inch laptop case makes the commute a breeze. A convenient detachable and adjustable shoulder strap offers instant versatility, while the carefully lined interior keeps the computer safe and secure.', '1563762579586br17.png'),
(103, 12, 32, '14\" Slim Liberator Notebook Case', 3880, 25, 50, 'The Slim Liberator is a functional, lightweight, roomy notebook tote that is perfect for the woman on the move.', '1563766346994br18.png'),
(103, 12, 33, 'Capri Messenger Shoulder Bag for 14-15\"Devices', 5500, 15, 40, 'Keep your laptop and other essentials within easy reach when you\'re on the go with this contemporary messenger bag from Lencca. The Lencca Capri Messenger Shoulder Bag for 14-15\" Devices is made from water repellent coated twill and features a small shape with interior and exterior storage pockets, chrome hardware, and an adjustable padded strap that can be carried over the shoulder or slung across the body for hands-free travel.', '1563766724505br15.png'),
(103, 1, 34, 'Women Multicolor Hand-held Bag', 1290, 80, 40, 'It carry on A4 size note or books and it can carry 1 litre bottle also .', '1563767679998hb1.png'),
(103, 1, 35, 'Women Blue Hand-held Bag', 1999, 90, 45, 'Women Blue Hand-held Bag spacious enough .', '1563767960706hb2.png'),
(103, 1, 36, 'Women Green Hand-held Bag', 4470, 70, 45, ' Material Synthetic Leather Number of Pockets 4 Width 12 cm Height 24 cm Depth 24 cm Weight 410 g Closure Zip Pack of 1', '1563768250525hb3.png'),
(103, 1, 37, 'Women Brown Shoulder Bag', 1500, 70, 42, 'Capacity 20 L Water Resistant Yes Material Synthetic Leather Width 16 inch Height 16 inch Closure Zip Pack of 1', '1563768668586hb4.png'),
(103, 1, 38, 'Women Beige Shoulder Bag', 2500, 46, 20, 'COLA Satchel Medium ALMOND Number of Compartments 1 Sales Package 1 Material Synthetic Leather Width 135 mm Height 220 mm Depth 350 mm Weight 400 g Closure Zip Pack of 1 Faux Leather::Metal Plate Branding::Flat Grab Handles::Top Zip Closure::Multiple Compartments::Internal Oraganizers::Adjustable and detachable sling handle::Easy Access Back Zipper Pocket::Caprese Lining', '1563769065890hb6.png'),
(103, 1, 39, 'Women Blue Shoulder Bag', 999, 70, 15, ' Fashion Shoulder bag Number of Compartments 2 Capacity 5 kg Sales Package 1 Material Synthetic Leather Number of Pockets 8 Width 36 cm Height 29 cm Closure Zip Pack of 1 Other Features This stylish Shoulder Bag Make your appearance more elegant with this; Stylish Handbag.', '1563769270807hb5.png'),
(103, 1, 40, 'Women Multicolor Shoulder Bag', 1300, 46, 8, ' WMN Core Shopper Number of Compartments 1 Capacity 14 L Material Polyester Width 36 cm Height 31 cm Closure Zip', '1563769681181hb7.png'),
(103, 1, 41, 'Women Pink Satchel', 4700, 68, 30, 'Ruby Satchel Medium Dull Pink Number of Compartments 2 Sales Package 1 Satchel Material Synthetic Leather Number of Pockets 2 Width 32.5 cm Height 32 cm Depth 32 cm Weight 400 g Closure Zip Pack of 1 Other Body Features Top Zip Closure Other Features Faux Leather', '1563769894880hb8.png'),
(103, 1, 42, 'Women Grey Hand-held Bag', 3100, 46, 40, 'Elegant Handheld Bag Number of Compartments 1 Material Synthetic Leather Width 33 cm Height 32 cm Closure Zip Pack of 1', '1563770102521hb9.png'),
(103, 1, 43, 'Women Blue Hand-held Bag', 2200, 15, 22, 'Material: PU ( Wg. 499 g ) Colour: Sky Blue ( Number of Pocket.0 ) Product Dimension(L x W x H): 36 cm x 28 cm x 11.68 cm Closure Type: Zipper. ( Number of Compartments.1 ) Strap Type:Adjustable Strap AND Strap is Only One And Use both product (Shoulder Bag and small sling bag) small sling bag Dimension is -L 20 x H 19 x W 5 CM', '1563770402684hb10.png'),
(103, 2, 44, 'Women Brown Shoulder Bag', 3400, 60, 20, 'Lo5 Gentle Y G Z E Stella Mustard (Mustard) L2 Number of Compartments 2 Sales Package 1 Shoulder Bag Material Synthetic Leather Number of Pockets 2 Width 39.37 cm Height 27.94 cm Depth 27.94 cm Weight 400 g Closure Zip Pack of 1', '1563770834094sb1.png'),
(103, 2, 45, 'Women Pink Shoulder Bag', 999, 70, 19, 'This stylish Shoulder Bag Make your appearance more elegant with this; Stylish Handbag. Flaunt your rich taste by carrying this bag with excellent finish, it will elevate your fashion quotient in no time. The design of the bag is trendy yet simple. Made up of strong material for daily usage, Desiged as per latest requirement of end user.', '1563771123694sb2.png'),
(103, 2, 46, 'Women Pink Shoulder Bag', 999, 70, 45, 'This beautiful durable bag will definitely grab attention of all the people. It has high durability as it has completely different and very attractive design which makes it elegant and stylish. The Outer and Inner Smooth Finish Interface Makes it Premium.The bag comes with spacious compartments that are enough to keep your belongings. Carrying this bag at office or party will surely make you go popular.', '1563771550172sb4.png'),
(103, 2, 47, 'Women Brown Shoulder Bag', 3100, 68, 40, ' Austen Satchel Medium Tan Number of Compartments 2 Sales Package 1 Satchel Material Synthetic Leather Number of Pockets 2 Width 34.5 cm Height 27 cm Depth 27 cm Weight 400 g Closure Zip Pack of 1 Other Body Features Internal Organizers Other Features Faux Leather', '1563771861936sb5.png'),
(103, 2, 48, 'Women Multicolor Shoulder Bag', 2000, 80, 9, 'This stylish Shoulder Bag REYAZ@JAIBUN from is best to carry to work to add an element of style to your office wear.Made from premium. It is compact to store your important things with ease.Made From outer material PU and inner material From Fabric. Furthermore, they feature Zip closure are best suited for a casual and partywear occasion.', '1563772174448sb6.png'),
(103, 2, 49, 'Women Tan Shoulder Bag', 4000, 76, 15, 'Number of Compartments 2 Capacity 3 kg Sales Package 1 Shoulder Bag Water Resistant No Bag Design Solid Material Synthetic Leather Number of Pockets 5 Width 13 cm Height 28 cm Depth 28 cm Weight 400 g Closure Zip Pack of 1 Domestic Warranty 3 Months Made from the premium of leatherette for the supple feel, this hobo from Lino Perros is a great idea for an understated glamour to your attire.', '1563772383790sb7.png'),
(103, 2, 50, 'Women White Shoulder Bag', 3780, 62, 20, 'Diana Korr Offers A Quick Edit Of The Runways - Pinpointing The Must Have Looks Of The Season Translating What Is Fun, Hip And Of The Moment. It Is Trend Right Shoulder Bag / Tote That You Will Reach For In Your Closet Again And Again. Diana Korr Is Sure To Be Your Trusted Resource For Everyday Chic Style.', '1563772564840sb8.png'),
(103, 2, 51, 'Women Beige Shoulder Bag', 4000, 72, 20, 'Diana Korr offers a quick edit of the runways - pinpointing the must have looks of the season translating what is fun, hip and of the moment. It is trend right hand bag / satchel that you will reach for in your closet again and again. Diana Korr is sure to be your trusted resource for everyday chic style.', '1563772614114sb9.png'),
(103, 2, 52, 'Women White Shoulder Bag', 1500, 51, 25, 'The Elegant Looks Of The Bag Will Make Add On To Your Appearance. If You Love Exclusive Fashion Accessories, Then This Bag Will Surely Appeal To You. It Also Allows Ample Space To Accommodate Daily Essentials In An Organised Manner. Made Up Of Strong Material And Good Quality Zips. Its and ideal Ms or Mrs valentine gift. Buy for yourselves or your loved ones', '1563772706318sb10.png'),
(103, 2, 53, 'Women Grey Shoulder Bag', 4000, 85, 23, 'Rajni Fashion Shoulder Bag will give you a stylish look ,Which gives smooth touch of a synthetic leather handbag.This Bag is made from superior-quality.Excellent bag for any occasion like leisure, business, school, party,office, shopping, traveling, etc. Perfect gift choice. Suitable for any occasion with casual and simple design.', '1563772835638sb11.png'),
(103, 7, 54, 'Mosaic Check-in Luggage - 26 inch  (Red)', 10000, 71, 20, 'Checkered Ideal For Men & Women Number of Wheels 4 Water Resistant Yes Closure Zipper Number of Pockets 1 Other Body Features Scratch Resistant, Light weight, Fixed Combination Lock, 360 Degree Smooth Wheeling System, Push Button Multi-Stage Trolley, Twin Side Packing, Zipper, Retractable Handle, Polyster Lining, 5 Years International Warranty Body Type, Material Hard Body, Polycarbonate Capacity, Weight 78 L, 3 kg Color Red External Width 46 cm External Height 66 cm External Depth 30 cm', '1563773670974lb1.png'),
(103, 7, 55, 'STAR 65 4W RED Expandable Check-in Luggage - 26 inch  (Red)', 8300, 51, 20, 'Pattern Solid Locking Mechanism Number Lock Ideal For Men & Women Number of Wheels 4 Water Resistant No Closure ZIPPER Number of Pockets 1 Sales Package 1 Body Type, Material Soft Body, Polyester Capacity, Weight 90 L, 3 kg Color Red External Width 40 cm External Height 65 cm External Depth 30 cm', '1563773757774lb2.png'),
(103, 7, 56, 'Suitcase Trolley /Travel/ Tourist Bag Check-in Luggage - 24 inch  (Black)', 8000, 68, 50, 'Pattern Solid Locking Mechanism Number Lock Ideal For Men & Women Number of Wheels 2 Water Resistant Yes Season Suitable For All Season Closure Zipper Number of Pockets 3 Sales Package Set of 2 luggage Body Type, Material Soft Body, Polyester Capacity, Weight 65 L, 4 kg Color Black External Width 16 inch External Height 24 inch External Depth 8 inch Generic Name Suitcases', '1563795555534lb3.png'),
(103, 7, 57, 'Photon Strolly 65 360 Mab Check-in Luggage - 25 inch  (Blue)', 7000, 61, 80, 'Pattern Solid Locking Mechanism Number Lock Ideal For Men & Women Number of Wheels 4 Water Resistant No Body Type, Material Hard Body Capacity, Weight 59 L, 3.4 kg Color Blue External Width 48 cm External Height 30 cm External Depth 66 cm Warranty Summary 5 Years Convi-pack for organized and convenient packing, Fixed combination lock,Textured scratch-resistant surface,Stylish, Spacious with carbon fibre texture, 360 Degree 4W Spinner,Light weight.', '1563795721117lb4.png'),
(103, 7, 58, 'Mosaic Check-in Luggage - 26 inch  (Black)', 9900, 70, 50, ' Scratch Resistant, Light weight, Fixed Combination Lock, 360 Degree Smooth Wheeling System, Push Button Multi-Stage Trolley, Twin Side Packing, Zipper, Retractable Handle, Polyster Lining, 5 Years International Warranty', '1563799784466lb5.png'),
(103, 7, 59, '65 L TRAVEL BACKPACK FOR OUTDOOR SPORT HIKING TREKKING BAG CAMPING RUCKSACK Rucksack - 65 L  (Black)', 9900, 63, 40, 'Series New Series Ideal For Men & Women Bag Size 65 L Size in inch 30 inch Material Polyester Closure Zip Laptop Sleeve Yes Style Code 1254 Color Code Grey With Rain Cover No Number of Compartments 5 Number of Pockets 7 Material Polyester Waterproof Yes Hip Strap Yes', '1563800042540lb6.png'),
(103, 7, 60, 'Gear Up 9103 Rucksack, Hiking & Trekking Backpack Rucksack - 50 L  (Multicolor)', 4000, 55, 20, 'Men & Women Size in inch 60 cm Trolley Support No Occasion Backpacking, Travel, Camping, Daytrip, Hiking Material Nylon Closure Buckle, Drawstring Laptop Sleeve Yes Compatible Laptop Size 15 Style Code 9103Camo Color Code Camouflage With Rain Cover Yes Number of Compartments 2 Number of Pockets 5 Material Nylon Waterproof Yes', '1563800140797lb7.png'),
(103, 7, 61, 'Aerodynamic Rucksack - 80 L  (Green)', 4500, 54, 25, 'Men & Women Bag Size XL Size in inch 34 inch Trolley Support No Occasion Trekking, Expidition, Camping, Day Trip, Hiking Material Nylon Closure Drawstring Laptop Sleeve No Style Code 9106_aq Color Code Black With Rain Cover Yes Number of Compartments 2 Number of Pockets 5 Material Nylon Waterproof Yes', '1563800259484lb8.png'),
(103, 7, 62, 'Skybags 20 inch/50 cm Italy Duffel Strolley Bag  (Blue)', 3660, 59, 20, 'Men & Women Capacity 20 L Size 20 inch / 50 cm Cabin Size Yes Material Nylon Color Blue Closure Zip Expandable Feature No Style Code DFTITA52BLU Color Code Blue Number of Compartments 1 Number of Wheels and Pockets No. of Wheels: 2, No. of Pockets: 2 Pattern Textured Other Body Features 1 Loop Handle at Side, 1 Main, 2 Zipper Pockets at Front, Dual Handle, 1 Detachable Adjustable Shoulder Strap, 1 Expandable Handle', '1563800332158lb10.png'),
(103, 7, 63, 'Leather Land Premium Rolla DUFFEL Bag In TAN Travel Duffel Bag  (Brown)', 3100, 51, 15, ' Travel Duffel Bag Ideal For Men & Women Capacity 55 L Cabin Size Yes Material PU Color Brown Expandable Feature No Style Code ROLLA Color Code TAN Number of Compartments 1 Number of Wheels and Pockets No. of Wheels: 0 LIGHT WEIGHT, Water Proof Dimensions L x B x D: 11 inch x 18 inch x 8 inch Weight 745 g Warranty Summary Only on Manufacturing Defects', '1563800747741lb9.png'),
(103, 3, 64, 'Anushka collection Women Black Tote', 2300, 68, 20, 'Number of Compartments 1 Capacity 30 L Sales Package 1 Material Artificial Leather Width 18 inch Height 32 inch Depth 53 inch Weight 500 g Closure Zip Other Features Water resistant Domestic Warranty 1 double handle', '1563804658922t1.png'),
(103, 3, 65, 'Women Black Tote', 4500, 72, 10, 'Faux Leather::Metal Plate Branding::Flat Grab Handles::Top Zip Closure::Multiple Compartments::Internal Oraganizers::Adjustable and detachable sling handle::Easy Access Back Pocket::Caprese LiningTRUETRUE', '1563804846772t2.png'),
(103, 3, 66, 'Women Black Tote', 2500, 50, 10, 'Give a classy touch to your ensemble with this trendy TOTE by Lavie. Displaying a herringbone print, thin handles and an adjustable and detachable sling belt, this bag opens to a large compartment and multiple utility pockets with smooth sliding zippers.', '1563805038376t3.png'),
(103, 3, 67, 'Women Blue Tote', 5000, 66, 20, 'Number of Compartments 2 Sales Package 1 Tote Material Synthetic Leather Number of Pockets 2 Width 280 mm Height 210 mm Depth 32.5 cm Weight 350 g Closure Zip Pack of 1 Other Body Features Top Zip Closure Other Features Faux Leather', '1563805200779t4.png'),
(103, 3, 68, 'Women Brown Tote', 4500, 70, 20, '2 Sales Package 1 Tote Material Synthetic Leather Number of Pockets 2 Width 45 cm Height 28.5 cm Depth 33 cm Weight 450 g Closure Zip Pack of 1 Other Body Features Easy Access Back Pocket Other Features Flat Shoulder Strap', '1563805345047t5.png'),
(103, 3, 69, 'Women Blue Tote', 5000, 66, 20, 'Number of Compartments 2 Sales Package 1 Tote Material Synthetic Leather Number of Pockets 2 Width 270 mm Height 210 mm Depth 32.5 cm Weight 350 g Closure Zip Pack of 1 Other Body Features Top Zip Closure Other Features Faux Leather', '1563805531707t6.png'),
(103, 4, 70, 'Green Women Sling Bag', 2500, 50, 20, 'Glam up your look by carrying this smart and elegant sling bag from Deniza which is made from premium faux leather. The beautiful flap pocket in the front adds to its glamour and utility quotient. Golden metal accessories make the bag even more attractive and eye-catching. This bag will allow you to stuff all your essentials with ease.', '1563805987775sl1.png'),
(103, 4, 71, 'Brown Women Sling Bag', 3000, 77, 25, 'Look uber stylish and trendy by wearing this handbag for women from Women\'s Mark. Made from polyurethane (pu), this handbag is capacious and perfect for keeping your everyday essentials. Pair this bag with casuals of your liking to look smart. Strap Type:Adjustable Strap AND Strap is Only One And Use both product (hand held Bag and smal sling bag + CLUTCH)', '1563806254204sl2.png'),
(103, 4, 72, 'Women Black Sling Bag', 3500, 74, 20, 'Glam up your look by carrying this smart and elegant sling bag from Roseberries which is made from premium faux leather. The beautiful flap pocket in the front adds to its glamour and utility quotient. Golden metal accessories make the bag even more attractive and eye-catching. This bag will allow you to stuff all your essentials with ease.', '1563806437322sl3.png'),
(103, 4, 73, 'Green, Gold Women Sling Bag', 2000, 56, 10, 'Model Name Phoenix Sling Small Pista Bag Size Small Closure Zipper Pattern Solid Other Body Features Flap Closure Pack of 1 Sales Package 1 Sling Bag Width 19.5 cm Height 11.5 cm Weight 250 g Domestic Warranty 6 Months', '1563806827733sl5.png'),
(103, 4, 74, 'Blue Women Sling Bag', 2100, 58, 20, ' For a perfect look on a casual day out carry this sling bag designed by Lavie. Enhance the radiant look by coupling it with a matching tank top of your choice and cozy high heels.', '1563809468819sl6.png'),
(103, 4, 75, 'Beige Women Sling Bag', 759, 5, 10, 'The cream color sling bag from the house of Women marks is must have in your accessory collection. It has ample compartments to keep all the stuff in place. When carried with a sexy dress, it will add glamour to your personality. The stylish color Clutch will definitely make you look trendy. The design of the change pocket is unique. It has enough space to keep things organized. #Women marks bag made for #Cute lady #MADE IN INDIA', '1563809868173sl4.png'),
(103, 5, 76, 'Party, Casual Multicolor Clutch', 2000, 85, 20, 'ROYAL FLORAL PRINT COMBO PACK Number of Card Slots 2 Closure Flap with magnetic button, Magnetic button Pattern Decorative Sketch Sales Package PACK OF 2 CLUTCH Material Synthetic Leather Number of Compartments 3 Width 17 cm Height 20 cm Generic Name Clutches Country of Origin India', '1563810015166cl1.png'),
(103, 5, 77, 'Party, Formal, Casual Black Clutch', 1200, 58, 20, 'Clutch Size in Number 7.5 inch Number of Card Slots 11 Closure Magnetic Snap Button Pattern Printed Other Features ID Slot Material Synthetic Leather Number of Compartments 6 Width 1.2 inch Height 3.7 inch Weight 160 g Warranty Summary 1 Year Domestic Warranty Domestic Warranty 1 Year', '1563810324303cl2.png'),
(103, 5, 78, 'Party, Formal, Casual Multicolor Clutch', 450, 36, 20, 'â?¢Go Ethnic with this most stunning clutch made of Cotton. â?¢This Hand bag is perfect for every occasion. Be it Casual or Formal. â?¢Crafted with Trend and Perfection. â?¢Having Compact size for effortless Portability. â?¢Featuring Spacious Compartments for all your needed essentials and valuable items. â?¢A magnificent Combo of Trend and Utility. â?¢This Clutch goes well with Indian Outfits.', '1563810562661cl3.png'),
(103, 5, 79, 'Casual Pink Clutch', 1100, 54, 20, 'Turn heads in this colored wallet which has a funky all over pattern. It is ideal for storing a large number of cards, bills and coins in a secure and organized manner. This wallet is a must have item in your accessories collection.', '1563810655553cl4.png'),
(103, 5, 80, 'Casual Clutch', 1700, 62, 20, 'Featuring quilted design, this trendy wallet from the house of butterflies is an ideal pick for casual and formal use. This wallet is made up of PU and has an excellet finish.', '1563810759679cl5.png'),
(103, 5, 81, 'Casual Blue, Yellow Clutch', 2000, 60, 10, 'Model Name Printed Type Clutch Number of Card Slots 12 Closure Magnetic Snap Pattern Printed Sales Package 1 Clutch Material Synthetic Leather Number of Compartments 4 Width 21.59 mm Height 10.16 mm Weight 200 g', '1563816149788cl6.png'),
(103, 6, 82, 'Women Casual Brown Artificial Leather Wallet  (11 Card Slots)', 1390, 50, 20, '1 Other Body Features Wallet with symmetrical lines for a proper printed look. Other Features Multiple cardholders for convenience. Number of Card Slots 11 Material Artificial Leather Width 19 cm Height 10 cm Weight 3.5 g Back zipper for adding essentials separately.', '1563816255420w1.png'),
(103, 6, 83, 'Women Ethnic, Evening/Party Gold Artificial Leather Wallet', 3500, 76, 10, 'One Clutch Number of Card Slots 0 Material Artificial Leather Width 18 cm Height 10 cm Weight 0.25 g Domestic Warranty 3 Months The shimmer detail adds to this beautiful clutch from Lino Perros and spacious interior makes it both functional and elegant.', '1563816383493w2.png'),
(103, 6, 84, 'Women Casual Blue Artificial Leather Wallet  (7 Card Slots)', 2300, 70, 10, 'Model Name WYER873040M2 Sales Package 1 Other Body Features Soft leather finish collapsible wallet Other Features V shaped front flap with button Number of Card Slots 7 Material Artificial Leather Width 2 cm Height 11 cm Weight 2 g Detachable wristlet and back pocket', '1563816459610w3.png'),
(103, 6, 85, 'Women Black Artificial Leather Wallet  (8 Card Slots)', 999, 62, 20, 'Model Name Black Wallet Number of Card Slots 8 Material Artificial Leather Width 3 cm Height 10 cm Generic Name Wallet Card Wallets', '1563816519854w3.png'),
(103, 6, 86, 'Women Multicolor Artificial Leather Wallet  (11 Card Slots)', 2000, 75, 20, 'Model Name Wallet Number of Card Slots 11 Material Artificial Leather Width 19 cm Height 9 cm Not Covered in Warranty This warranty covers only manufacturing defects Domestic Warranty 1 Year high quality genuine leather', '1563816581101w5.png'),
(103, 6, 87, 'Women Trendy Brown Artificial Leather Wallet  (10 Card Slots)', 1500, 44, 20, 'Model Name WYFC864033N2 Sales Package 1 Other Body Features Wallet with contrast pattern on front. Other Features Tassel on front for a chic look. Number of Card Slots 10 Material Artificial Leather Width 19 cm Height 10 cm Weight 3.5 g Multiple cardholders for organization.', '1563816635698w6.png'),
(103, 11, 88, 'Canvas Stylish Backpack Bag for College Girls 18 L Backpack  (Multicolor)', 1300, 57, 20, '1 Canvas Backpack Type Backpack Ideal For Women Trolley Support No Laptop Sleeve No With Rain Cover No Style Code TR-Backpack-PW002 Color Code Multicolor Color Multicolor Material, Waterproof Material: Canvas, Waterproof: Yes Number of Compartments 2 Pattern Printed Capacity 18 L Dimensions W x H: 10 x 16 inch', '1563817120756bc1.png'),
(103, 11, 89, 'Women & Girls Stylish Backpack', 999, 47, 15, 'A durable and superior Canvas quality backpack with new stylish Solid look to give it a little bling. OUTSIDE, it has a basic shape with designer look Flap closure. INSIDE, it has compartments. The images are provided from all angles to give you a complete visual view to help you buy with full confidence. An all-purpose backpack with Three pocket and Compartment that can be used for Office, College, Shopping or just for Everyday Use.', '1563817269069bc2.png'),
(103, 11, 90, 'Printed Canvas Backpack', 999, 62, 20, 'Type Backpack Ideal For Women Trolley Support No Laptop Sleeve No With Rain Cover No Style Code DHPS313 Color Code Grey Color Multicolor Material, Waterproof Material: Canvas, Waterproof: No Number of Compartments 1 Number of Pockets 2 Pattern Printed Capacity 10 L Dimensions W x H: 16 x 16 in Generic Name Backpacks', '1563817678841bc3.png'),
(103, 11, 91, 'Artificial Leather Backpack ', 1700, 80, 20, 'Backpack Ideal For Women Trolley Support No Laptop Sleeve No With Rain Cover No Style Code LBAG205 Color Code Red Color Red', '1563817773178bc4.png'),
(103, 11, 92, 'Leather Girls College Bag 7 L Backpack  (Red)', 900, 72, 20, '  Number of Contents 1 Backpack Bag Type Backpack Ideal For Women Trolley Support No Laptop Sleeve No With Rain Cover No Style Code AAR-2 POCKET Color Code maroon', '1563817987080bc5.png'),
(103, 11, 93, 'Casual College Backpack Bag ', 999, 50, 20, 'Backpack Ideal For Women Trolley Support No Laptop Sleeve No With Rain Cover No Style Code JNU-JAMBU BAG COLORS Color Code Black', '1563818087431bc6.png');

-- --------------------------------------------------------

--
-- Table structure for table `managesubcat`
--

CREATE TABLE `managesubcat` (
  `SubCatID` int(10) NOT NULL,
  `CatID` int(10) NOT NULL,
  `SubCatName` varchar(100) NOT NULL,
  `SubCatPic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `managesubcat`
--

INSERT INTO `managesubcat` (`SubCatID`, `CatID`, `SubCatName`, `SubCatPic`) VALUES
(1, 103, 'Handbags', '15636410662421.jpg'),
(2, 103, 'Shoulder Bags', '15636410823402.jpg'),
(3, 103, 'Totes', '15636411150173.jpg'),
(4, 103, 'Sling Bags', '15636411332194.jpg'),
(5, 103, 'Clutches', '15636411480195.jpg'),
(6, 103, 'Wallets', '15636411704066.jpg'),
(7, 103, 'Luggage & Travel', '15636411875977.jpg'),
(11, 103, 'Backpacks', '15636412831268.jpg'),
(12, 103, 'Briefcase', '156364145190010.jpg'),
(13, 103, 'Laptop Bags', '156364157755511.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `Sr No` int(10) NOT NULL,
  `ProdID` int(10) NOT NULL,
  `ProdName` varchar(100) NOT NULL,
  `Rate` double NOT NULL,
  `Qty` double NOT NULL,
  `TC` double NOT NULL,
  `Pic` varchar(100) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `OrderID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`Sr No`, `ProdID`, `ProdName`, `Rate`, `Qty`, `TC`, `Pic`, `Username`, `OrderID`) VALUES
(1, 45, 'Women Pink Shoulder Bag', 299.70000000000005, 6, 1798.2000000000003, '1563771123694sb2.png', 'pallavikapila110@gmail.com', 1),
(2, 89, 'Women & Girls Stylish Backpack', 529.47, 5, 2647.3500000000004, '1563817269069bc2.png', 'pallavikapila110@gmail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ordertable`
--

CREATE TABLE `ordertable` (
  `OrderID` int(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `PMode` varchar(50) NOT NULL,
  `BankName` varchar(50) NOT NULL,
  `CardNo` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ExpDt` varchar(10) NOT NULL,
  `CVV` varchar(10) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `BillAmt` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `OrderDt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertable`
--

INSERT INTO `ordertable` (`OrderID`, `Address`, `PMode`, `BankName`, `CardNo`, `Name`, `ExpDt`, `CVV`, `Username`, `BillAmt`, `Status`, `OrderDt`) VALUES
(1, '110 type 3 sector 5 naya nangal', 'online', 'VISA', '7894561232145698', 'pallavi', '05 22', '856', 'pallavikapila110@gmail.com', '1798.2000000000003', 'Payment received, processing', '2019-07-23'),
(2, '20 Jaswant Nagar ', 'online', 'VISA', '4562000085694123', 'pallavi', '05 22', '856', 'pallavikapila110@gmail.com', '2647.3500000000004', 'Payment received, processing', '2019-07-23');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `Name` varchar(50) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`Name`, `Username`, `Phone`, `Gender`, `Password`, `UserType`) VALUES
('Bobby', 'bobby@gmail.com', '1234567892', 'Male', 'Bobby123!', 'admin'),
('Pallavi', 'pallavi@gmail.com', '78569347852', 'Female', 'Pallavi123!', 'normal'),
('Pallavi Kapila', 'pallavikapila100@gmail.com', '1234567891', 'Female', 'Pallavi123!', 'normal'),
('Pallavi', 'pallavikapila110@gmail.com', '8847513003', 'Female', 'Pallavi123!', 'admin'),
('Pallavi Kapila', 'pallavikapila111@gmail.com', '8872050191', 'Female', 'Pallavi123!', 'normal'),
('Pankaj', 'pankajkapila110@gmail.com', '9417409129', 'Male', 'Pankaj123!', 'normal'),
('Parbhat', 'parbhatkapila28@gmail.com', '8963214562', 'Male', 'Parbhat123!', 'normal'),
('poonam', 'poonamkapila11@gmail.com', '8726931522', 'Female', 'Poonam123!', 'normal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carttable`
--
ALTER TABLE `carttable`
  ADD PRIMARY KEY (`Sr No`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `managecat`
--
ALTER TABLE `managecat`
  ADD PRIMARY KEY (`CatID`);

--
-- Indexes for table `manageprod`
--
ALTER TABLE `manageprod`
  ADD PRIMARY KEY (`ProdID`);

--
-- Indexes for table `managesubcat`
--
ALTER TABLE `managesubcat`
  ADD PRIMARY KEY (`SubCatID`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`Sr No`);

--
-- Indexes for table `ordertable`
--
ALTER TABLE `ordertable`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`Username`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carttable`
--
ALTER TABLE `carttable`
  MODIFY `Sr No` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `managecat`
--
ALTER TABLE `managecat`
  MODIFY `CatID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `manageprod`
--
ALTER TABLE `manageprod`
  MODIFY `ProdID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `managesubcat`
--
ALTER TABLE `managesubcat`
  MODIFY `SubCatID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `Sr No` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ordertable`
--
ALTER TABLE `ordertable`
  MODIFY `OrderID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
