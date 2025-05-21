CREATE DATABASE `mysql-chal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `mysql-chal`.UserTypes (
	id BIGINT auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT UserTypes_UNIQUE UNIQUE KEY (name)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


-- `mysql-chal`.Users definition
CREATE TABLE `Users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_type_id` bigint NOT NULL,
  `username` varchar(255) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Users_UNIQUE` (`username`),
  KEY `Users_UserTypes_FK` (`user_type_id`),
  CONSTRAINT `Users_UserTypes_FK` FOREIGN KEY (`user_type_id`) REFERENCES `UserTypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `mysql-chal`.Scores (
	user_id BIGINT NOT NULL,
	game_name varchar(255) NOT NULL,
	score BIGINT NOT NULL,
	last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
	id BIGINT NULL,
	PRIMARY KEY (user_id,game_name),
	CONSTRAINT Scores_Users_FK FOREIGN KEY (id) REFERENCES `mysql-chal`.Users(id) ON DELETE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `mysql-chal`.UserTypes (name) VALUES
	 ('Dev'),
	 ('User');


INSERT INTO `mysql-chal`.Users (user_type_id,username,last_updated) VALUES
	 (2,'Wolven531','2025-05-21 04:16:49'),
	 (1,'Roughnick','2025-05-21 04:16:49'),
	 (1,'Jhectf','2025-05-21 04:16:49'),
	 (2,'Zorven','2025-05-21 04:16:49'),
	 (2,'Merlin1320','2025-05-21 04:16:49');
