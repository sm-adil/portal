-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: ccDB
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(1000) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(30) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'<p>The Brooklyn Bridge looms majestically over New York City&rsquo;s East River, linking the two boroughs of Manhattan and Brooklyn. Since 1883, its granite towers and steel cables have offered a safe and scenic passage to millions of commuters and tourists, trains and bicycles, pushcarts and cars. The bridge&rsquo;s construction took 14 years, involved 600 workers and cost $15 million. Now more than 125 years old, this iconic feature of the New York City skyline still carries roughly 150,000 vehicles and pedestrians every day.</p>','2018-10-23 18:56:35','Brooklyn Bridge','adil','https://picsum.photos/2500/1667?image=744'),(4,'<p>The first photographic process &mdash; heliography &mdash; was invented around 1824 by Nic&eacute;phore Ni&eacute;pce. Images were obtained with bitumen of Judea spread on a silver plate after an exposure time of several days.<br />In 1829, Ni&eacute;pce associated Louis Jacques Mand&eacute; Daguerre to his research.</p><p>In 1832, they put the last touches, using a residue of lavender oil distillation, by means of a second process producing images in a one day exposure time.</p>','2018-10-23 19:21:28','Photography','niyaz','https://picsum.photos/1200/800?image=435'),(5,'<p>Although coffee is referred to as a bean, it is actually the seed of a piece of fruit, known as a coffee cherry. They were termed &lsquo;beans&rsquo;, as they resemble the appearance of actual beans. The cherries are hand picked, and the seed is separated from the fruit. There are various methods of achieving this, with some allowing the fruit to dry first, and others removing the seed much sooner. By varying the amount of time the fruit is allowed to dry on the seed, these methods impact the flavor of the finished product. After the &lsquo;beans&rsquo; are dried, the unroasted product is called &lsquo;green coffee&rsquo;.</p>','2018-10-23 19:49:58','Coffee','adil','https://picsum.photos/959/635?image=425'),(7,'<p>NASA stands for National Aeronautics and Space Administration. NASA is a U.S. government agency that is responsible for science and technology related to air and space. The Space Age started in 1957 with the launch of the Soviet satellite Sputnik.</p><p>NASA opened for business on Oct. 1, 1958. The agency was created to oversee U.S. space exploration and aeronautics research.</p><p>The administrator is in charge of NASA. The NASA administrator is nominated by the president and confirmed by a vote in the Senate.</p>','2018-10-24 14:51:47','NASA','adil','https://picsum.photos/4928/3280?image=967'),(8,'<p>Jellyfish are transparent and made up of 95 percent water, so you&rsquo;d think there isn&rsquo;t much to them. But you&rsquo;d be wrong. <a href=\"https://ocean.si.edu/jellyfish-and-comb-jellies\">Jellyfish</a> are more complex than you&rsquo;d think&mdash;and one of their most fascinating parts is their stinging cells. Located on their tentacles, jellyfish&#39;s <a target=\"_blank\" href=\"http://www.smithsonianmag.com/science-nature/whats-behind-that-jellyfish-sting-2844876/?no-ist\">stinging cells</a> are called cnidocytes. They are small compartments that house a mini needle-like stinger. When an outside force triggers a stinger, the cell opens, letting ocean water rush in. This causes the stinger to shoot out into what triggered the action; once it&rsquo;s there, venom is released. All of this happens within a millionth of a second.</p>','2018-10-24 15:15:14','Jellyfish','adil','https://picsum.photos/3500/2333?image=1069'),(9,'<p>&ldquo;Impostor syndrome can be defined as a collection of feelings of inadequacy that persist even in face of information that indicates that the opposite is true. It is experienced internally as chronic self-doubt, and feelings of intellectual fraudulence.&rdquo;</p><p>The nature of software development is fast-paced, fluid, and always in flux. It&rsquo;s what makes building software so challenging, interesting, and fun. But that also means that you&rsquo;re constantly faced with things you don&rsquo;t know. And even the things that you don&rsquo;t know (and everyone says you &ldquo;need to know ASAP&rdquo;) are changing before you can even <em>start</em> to know them.</p>','2018-10-24 15:18:20','Imposter Syndrome','niyaz','https://picsum.photos/5616/3744?image=4'),(10,'<p><strong>Railroad</strong>. a permanent <strong>road</strong> laid with <strong>rails</strong>, commonly in one or more pairs of continuous lines forming a track or tracks, on which locomotives and cars are run for the transportation of passengers, freight, and mail.</p>','2018-10-24 15:25:53','Railroad','niyaz','https://picsum.photos/3264/2176?image=155'),(11,'<p><em><strong>The Vampire Diaries</strong></em> is an American <a href=\"https://en.wikipedia.org/wiki/Supernatural_fiction\">supernatural</a> <a href=\"https://en.wikipedia.org/wiki/Drama_(film_and_television)\">drama</a> television series developed by <a href=\"https://en.wikipedia.org/wiki/Kevin_Williamson_(screenwriter)\">Kevin Williamson</a> and <a href=\"https://en.wikipedia.org/wiki/Julie_Plec\">Julie Plec</a>, based on the popular <a href=\"https://en.wikipedia.org/wiki/The_Vampire_Diaries_(novel_series)\">book series of the same name</a> written by <a href=\"https://en.wikipedia.org/wiki/L._J._Smith_(author)\">L. J. Smith</a>.</p>','2018-10-27 06:14:37','Vampire Diaries!','meem','https://images-na.ssl-images-amazon.com/images/I/91m58lek2WL._RI_.jpg');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'$5$rounds=535000$F8.EY61AtAvHcycF$Gu9tkW1k1F5e9oKdLXwi/ZAQbOXkqHplKUaSot55iC9','2018-10-23 18:34:23','adil','a@mail.com'),(2,'$5$rounds=535000$PP0c6Pk8QxQtnMWj$FPxrm13jokFzfmjk8R39tm3Kvi33/jwOsQRMr7979a1','2018-10-24 13:46:14','niyaz','niyaz@mail.com'),(3,'$5$rounds=535000$Xfk/tkqQB9RFVdKK$EJYsuDZ7oM/oiwl5z5gjEwhsx16SLf0Q0zX7HEj30eD','2018-10-24 15:42:12','mubeena','mubeena@mail.com'),(4,'$5$rounds=535000$1TxFUIjRy3oTwK2M$KevgpUUsmFY4a6PkS9P9b5kBJ.V9vcyj1d3utCIs8S7','2018-10-27 06:11:47','meem','meem@mail.com'),(5,'$5$rounds=535000$nkYK817aP5Jxx8MF$CId8DhXgD/jF5fx03Xnxg9nossRFGZZEsb5So53nZh7','2018-10-29 09:40:31','nikhil','nikhil@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-10 10:32:37
