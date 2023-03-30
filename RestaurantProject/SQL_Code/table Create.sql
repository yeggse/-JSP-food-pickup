CREATE TABLE `t3_account` (
  `id` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `kind` varchar(20) DEFAULT NULL,
  `phonenum` varchar(20) DEFAULT NULL,
  `acc` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `frontregisnum` int DEFAULT NULL,
  `afterregisnum` int DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `resname` varchar(20) DEFAULT NULL,
  `resnum` int DEFAULT NULL,
  `reskind` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `region1` varchar(45) DEFAULT NULL,
  `resad` varchar(45) DEFAULT NULL,
  `resphone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_board` (
  `noticenum` int NOT NULL AUTO_INCREMENT,
  `boardtype` varchar(45) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `hits` int DEFAULT NULL,
  `creatorid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`noticenum`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_board_img` (
  `noticenum` int NOT NULL,
  `image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_reserve` (
  `no` int NOT NULL AUTO_INCREMENT,
  `resnum` int DEFAULT NULL,
  `resname` varchar(45) DEFAULT NULL,
  `ordererid` varchar(20) DEFAULT NULL,
  `menuname` varchar(200) DEFAULT NULL,
  `menunum` int DEFAULT NULL,
  `orderer` varchar(20) DEFAULT NULL,
  `pickuptime` varchar(20) DEFAULT NULL,
  `payment` varchar(20) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `review` varchar(4000) DEFAULT NULL,
  `salecomple` varchar(20) DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `reskind` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_reskind` (
  `reskind` varchar(20) NOT NULL,
  PRIMARY KEY (`reskind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_resmenu` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `reskind` varchar(45) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `menuname` varchar(45) DEFAULT NULL,
  `introduce` varchar(4000) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `supply` int DEFAULT NULL,
  `orderer` int DEFAULT NULL,
  `pickuptime` varchar(45) DEFAULT NULL,
  `resnum` int DEFAULT NULL,
  `soldout` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_resmenu_img` (
  `picture` varchar(45) DEFAULT NULL,
  `idx` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_restaurant` (
  `t3_idx` int NOT NULL AUTO_INCREMENT,
  `resnum` int DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `region1` varchar(45) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `reskind` varchar(20) DEFAULT NULL,
  `resname` varchar(20) DEFAULT NULL,
  `resphone` varchar(45) DEFAULT NULL,
  `resadd` varchar(4000) DEFAULT NULL,
  `resopen` varchar(45) DEFAULT NULL,
  `resacc` varchar(4000) DEFAULT NULL,
  `grade` int DEFAULT NULL,
  PRIMARY KEY (`t3_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_review` (
  `reviewnum` int NOT NULL AUTO_INCREMENT,
  `categori` varchar(20) DEFAULT NULL,
  `resnum` int DEFAULT NULL,
  `title` varchar(4000) DEFAULT NULL,
  `writedate` varchar(200) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `reskind` varchar(45) DEFAULT NULL,
  `create_id` varchar(45) DEFAULT NULL,
  `resname` varchar(45) DEFAULT NULL,
  `answer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reviewnum`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_review_answer` (
  `reviewnum` int NOT NULL,
  `comments` varchar(4000) DEFAULT NULL,
  `writer` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`reviewnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t3_review_img` (
  `reviewnum` int NOT NULL,
  `img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reviewnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t_area` (
  `idx` int NOT NULL,
  `si` varchar(45) DEFAULT NULL,
  `gu` varchar(45) DEFAULT NULL,
  `dong` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

