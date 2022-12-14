CREATE DATABASE `cinema`;

CREATE TABLE `cinema_halls` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `capacity` int NOT NULL,
                                `description` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`id`)
);

CREATE TABLE `movies` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `description` varchar(255) DEFAULT NULL,
                          `title` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `email` varchar(255) DEFAULT NULL,
                         `password` varchar(255) DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
);

CREATE TABLE `shopping_carts` (
                                  `id` bigint NOT NULL,
                                  PRIMARY KEY (`id`),
                                  CONSTRAINT `FKc1fbrvff059ke4p8ce3hu38oa` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
);

CREATE TABLE `movie_sessions` (
                                  `id` bigint NOT NULL AUTO_INCREMENT,
                                  `show_time` datetime(6) DEFAULT NULL,
                                  `cinema_hall_id` bigint DEFAULT NULL,
                                  `movie_id` bigint DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `FKfqu527x0e0675k7vkm21ghv08` (`cinema_hall_id`),
                                  KEY `FKatpmn0h31nwhwdgd0ogr8q6kj` (`movie_id`),
                                  CONSTRAINT `FKatpmn0h31nwhwdgd0ogr8q6kj` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
                                  CONSTRAINT `FKfqu527x0e0675k7vkm21ghv08` FOREIGN KEY (`cinema_hall_id`) REFERENCES `cinema_halls` (`id`)
);

CREATE TABLE `orders` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `order_time` datetime(6) DEFAULT NULL,
                          `user_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
                          CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE `roles` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `name` (`name`)
);

CREATE TABLE `users_roles` (
                               `user_id` bigint NOT NULL,
                               `role_name` bigint NOT NULL,
                               PRIMARY KEY (`user_id`,`role_name`),
                               KEY `FKfddtbwrqg5sal9y57yyol7579` (`role_name`),
                               CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                               CONSTRAINT `FKfddtbwrqg5sal9y57yyol7579` FOREIGN KEY (`role_name`) REFERENCES `roles` (`id`)
);

CREATE TABLE `tickets` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `movie_session_id` bigint DEFAULT NULL,
                           `user_id` bigint DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `FKidxabarcn97kf9acrcqokf1r9` (`movie_session_id`),
                           KEY `FK4eqsebpimnjen0q46ja6fl2hl` (`user_id`),
                           CONSTRAINT `FK4eqsebpimnjen0q46ja6fl2hl` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                           CONSTRAINT `FKidxabarcn97kf9acrcqokf1r9` FOREIGN KEY (`movie_session_id`) REFERENCES `movie_sessions` (`id`)
);

CREATE TABLE `orders_tickets` (
                                  `order_id` bigint NOT NULL,
                                  `ticket_id` bigint NOT NULL,
                                  UNIQUE KEY `UK_4l081u6j1tuvch26evaekjihi` (`ticket_id`),
                                  KEY `FKjoggp5iyq5fqbtxi5r1m2wlty` (`order_id`),
                                  CONSTRAINT `FKhpx6qk3psnomt9t2aig2nunfq` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
                                  CONSTRAINT `FKjoggp5iyq5fqbtxi5r1m2wlty` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
);

CREATE TABLE `shopping_carts_tickets` (
                                          `shopping_cart_id` bigint NOT NULL,
                                          `ticket_id` bigint NOT NULL,
                                          UNIQUE KEY `UK_eusu1u2g6d73fcjvox629ct9y` (`ticket_id`),
                                          KEY `FKm5n3i4h3nk1p1yqywkn1kpej6` (`shopping_cart_id`),
                                          CONSTRAINT `FKaw8rn6oivawiyro857w06we16` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
                                          CONSTRAINT `FKm5n3i4h3nk1p1yqywkn1kpej6` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_carts` (`id`)
);




