-- -----------------------------------------------------
-- Schema shop_for_home
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ShopForHome`;

CREATE SCHEMA `ShopForHome`;
USE `ShopForHome` ;

-- -----------------------------------------------------
-- Table  `ShopForHome`.`cart`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.cart;

 create table hibernate_sequence(next_val BIGINT NOT NULL);
 INSERT INTO hibernate_sequence (next_val) VALUES (4);

CREATE TABLE IF NOT EXISTS `ShopForHome`.`cart`
(
    `user_id` BIGINT(20) NOT NULL,
    CONSTRAINT `cart_pkey1` PRIMARY KEY (`user_id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;
	

-- -----------------------------------------------------
-- Table: `ShopForHome`.`discount`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.`discount`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`discount`
(
    `id` VARCHAR(255) NOT NULL,
    `status` BIGINT(20),
    CONSTRAINT `discount_pkey` PRIMARY KEY (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table: `ShopForHome`.`order_main`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.order_main;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`order_main`
(
    `order_id` BIGINT(20) NOT NULL,
    `buyer_address` VARCHAR(255) ,
    `buyer_email` VARCHAR(255) ,
    `buyer_name` VARCHAR(255) ,
    `buyer_phone` VARCHAR(255) ,
    `create_time` DATETIME(6),
    `order_amount` DECIMAL(19,2) NOT NULL,
    `order_status` INT(11) NOT NULL DEFAULT 0,
    `update_time` DATETIME(6),
    CONSTRAINT `order_main_pkey` PRIMARY KEY (`order_id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table: `ShopForHome`.`product_category`
-- -----------------------------------------------------

-- DROP TABLE IF EXISTS `ShopForHome`.`product_category`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`product_category`
(
    `category_id` INT(11) NOT NULL,
    `category_name` VARCHAR(255) ,
    `category_type` INT(11),
    `create_time` DATETIME(6),
    `update_time` DATETIME(6),
    CONSTRAINT `product_category_pkey` PRIMARY KEY (`category_id`),
    CONSTRAINT `uk_6kq6iveuim6wd90cxo5bksumw` UNIQUE (`category_type`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------	
-- Table: `ShopForHome`.`product_in_order`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.`product_in_order`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`product_in_order`
(
    `id` BIGINT(20) NOT NULL,
    `category_type` INT(11) NOT NULL,
    `count` INT(11),
    `product_description` VARCHAR(255)  NOT NULL,
    `product_icon` VARCHAR(255) ,
    `product_id` VARCHAR(255) ,
    `product_name` VARCHAR(255) ,
    `product_price` DECIMAL(19,2) NOT NULL,
    `product_stock` INT(11),
    `cart_user_id` BIGINT(20),
    `order_id` BIGINT(20),
    CONSTRAINT `product_in_order_pkey` PRIMARY KEY (`id`),
    CONSTRAINT `fkt0sfj3ffasrift1c4lv3ra85e` FOREIGN KEY (`order_id`)
        REFERENCES `ShopForHome`.`order_main` (`order_id`) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT `product_cart_fkey` FOREIGN KEY (`cart_user_id`)
        REFERENCES `ShopForHome`.`cart` (`user_id`) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT `product_in_order_count_check` CHECK (count >= 1),
    CONSTRAINT `product_in_order_product_stock_check` CHECK (product_stock >= 0)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table: `ShopForHome`.`product_info`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.`product_info`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`product_info`
(
    `product_id` VARCHAR(255)  NOT NULL,
    `category_type` INT(11) DEFAULT 0,
    `create_time` DATETIME(6),
    `product_description` VARCHAR(255) ,
    `product_icon` VARCHAR(255) ,
    `product_name` VARCHAR(255)  NOT NULL,
    `product_price` DECIMAL(19,2) NOT NULL,
    `product_status` INT(11) DEFAULT 0,
    `product_stock` INT(11) NOT NULL,
    `update_time` DATETIME(6),
    CONSTRAINT `product_info_pkey` PRIMARY KEY (`product_id`),
    CONSTRAINT `product_info_product_stock_check` CHECK (product_stock >= 0)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table: `ShopForHome`.`users`
-- -----------------------------------------------------

-- DROP TABLE IF EXISTS `ShopForHome`.`users`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`users`
(
    `id` BIGINT(20) NOT NULL auto_increment,
    `active` boolean NOT NULL,
    `address` VARCHAR(255) ,
    `email` VARCHAR(255) ,
    `name` VARCHAR(255) ,
    `password` VARCHAR(255) ,
    `phone` VARCHAR(255) ,
    `role` VARCHAR(255) ,
    CONSTRAINT `users_pkey` PRIMARY KEY (`id`),
    CONSTRAINT `uk_sx468g52bpetvlad2j9y0lptc` UNIQUE (`email`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table: ShopForHome.wishlist
-- -----------------------------------------------------

-- DROP TABLE IF EXISTS `ShopForHome`.`wishlist`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`wishlist`
(
    `id` BIGINT(20) NOT NULL,
    `created_date` DATETIME(6),
    `user_id` BIGINT(20),
    `product_id` VARCHAR(255) ,
    CONSTRAINT `wishlist_pkey` PRIMARY KEY (`id`),
    CONSTRAINT `product_wish_fkey` FOREIGN KEY (`product_id`)
        REFERENCES `ShopForHome`.`product_info` (`product_id`) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT `user_wish_Fkey` FOREIGN KEY (`user_id`)
        REFERENCES `ShopForHome`.`users` (`id`) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Categories
-- -----------------------------------------------------

INSERT INTO `ShopForHome`.`product_category` VALUES (2147483641, 'Perfume', 0, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO `ShopForHome`.`product_category` VALUES (2147483642, 'Shoes', 1, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO `ShopForHome`.`product_category` VALUES (2147483643, 'Mouse Pads', 2, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO `ShopForHome`.`product_category` VALUES (2147483644, 'Keychain', 3, '2022-06-23 23:03:26', '2022-06-23 23:03:26');


-- -----------------------------------------------------
-- Perfume
-- -----------------------------------------------------

INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1000', 'Envy', 'for women EDP 60 ml', 'assets/images/products/books/book-luv2code-1000.png', 0, 100, 5.87, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1001', 'Envy', 'for men EDP 60 ml', 'assets/images/products/books/book-luv2code-1001.png', 0, 100, 1.93, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1002', 'Tommy Hilfiger', 'Men Cologne Spray 100 ml', 'assets/images/products/books/book-luv2code-1002.png', 0, 100, 19.43, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1003', 'Carlton London', 'Women Limited Edition Blush Eau de Parfum- 100 ml', 'assets/images/products/books/book-luv2code-1003.png', 0, 100, 11.04, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1004', 'Denver', 'Men Set of Hamilton Eau de Parfum & Deodorant 60ml + 165ml', 'assets/images/products/books/book-luv2code-1004.png', 0, 100, 5.07, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1005', 'DressBerry', 'Ivory Body Mist 190 ml', 'assets/images/products/books/book-luv2code-1005.png', 0, 100, 2.01, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1006', 'VILLAIN', 'Men Green The Joker Eau De Parfum', 'assets/images/products/books/book-luv2code-1006.png',0, 100, 12.59, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1007', 'GUESS', 'Women Dare Eau De Toilette 100 ml', 'assets/images/products/books/book-luv2code-1007.png', 0, 100, 31.75, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1008', 'BEARDO', 'Beardo Whisky Smoke EDP 100 ml', 'assets/images/products/books/book-luv2code-1008.png', 0, 100, 7.26, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('BOOK-TECH-1009', 'Nautica', 'Men Voyage Eau De Toilette 100 ml', 'assets/images/products/books/book-luv2code-1009.png', 0, 100, 24.13, 0, NOW());



-- -----------------------------------------------------
-- Shoes
-- -----------------------------------------------------
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1000', 'Nike Air Force 1 "07"', 'Men "s Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1000.png', 0, 100, 94.5, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1001', 'Nike Phantom GT2 Academy MG', 'Nike Phantom GT2 Academy MG Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1001.png', 0, 100, 100.9, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1002', 'Nike Phantom GT2 Academy TF', 'Turf Football Shoes Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1002.png', 0, 100, 100.7, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1003', 'Nike Tiempo Legend 9 Academy MG', 'Multi-Ground Football Boot Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1003.png', 0, 100, 88.14, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1004', 'Nike Air Max Flyknit Racer', 'Men"s Shoes Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1004.png', 0, 100, 188.94, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1005', 'Nike Air Zoom G.T. Cut 2', 'Basketball Shoes Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1005.png', 0, 100, 201.5, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1006', 'Nike Air Zoom Pegasus 39 A.I.R.', 'Men"s Road Running Shoes Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1006.png', 0, 100, 149.8, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1007', 'Nike Infinity Run 3 A.I.R. x Hola Lou', 'Men"s Road Running Shoes Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1007.png', 0, 100, 188.9, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1008', 'Nike Waffle One SE', 'Men"s Shoes Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1008.png', 0, 100, 122.1, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1009', 'Nike Zoom Fly 5 A.I.R. Hola Lou', 'Men"s Road Running Shoes Shoe - Size Available UK 7, UK 8, UK 9, UK 10', 'assets/images/products/coffeemugs/coffeemug-luv2code-1009.png', 0, 100, 18.99, 1, NOW());


-- -----------------------------------------------------
-- Mouse Pads
-- -----------------------------------------------------
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1000', 'Mouse Pad - Express', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1000.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1001', 'Mouse Pad - Cherokee', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1001.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1002', 'Mouse Pad - Sweeper', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1002.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1003', 'Mouse Pad - Aspire', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1003.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1004', 'Mouse Pad - Dorian', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1004.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1005', 'Mouse Pad - Columbia', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1005.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1006', 'Mouse Pad - Worthing', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1006.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1007', 'Mouse Pad - Oak Cliff', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1007.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1008', 'Mouse Pad - Tachyon', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1008.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1009', 'Mouse Pad - Pan', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1009.png', 0, 100, 17.99, 2, NOW());


-- -----------------------------------------------------
-- Keychain
-- -----------------------------------------------------
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1000', 'Star Wars The Mandalorian (Silver) ', 'This Character Metal keychain is a must-have for a true fan.Light Weight And Easily Fits Into The Pocket , this makes a perfect gift for your loved once,Sleek and compact design.', 'assets/images/products/luggagetags/luggagetag-luv2code-1000.png', 0, 100, 5.04, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1001', 'Valeyellow Biker Key Chain', 'Valeyellow Biker Key Chain - high-grade scratch-resistant keychain cum wristband for the rider the road’s yet to meet', 'assets/images/products/luggagetags/luggagetag-luv2code-1001.png', 0, 100, 1.15, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1002', 'Marvel Thor Keychain Multicolor', 'This Character keychain is a must-have for a true fan.Light Weight And Easily Fits Into The Pocket , this makes a perfect gift for your loved once,Sleek and compact design.', 'assets/images/products/luggagetags/luggagetag-luv2code-1002.png', 0, 100, 7.56, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1003', 'Marvel Captain America Keychain', 'This Character keychain is a must-have for a true fan.Light Weight And Easily Fits Into The Pocket , this makes a perfect gift for your loved once,Sleek and compact design.', 'assets/images/products/luggagetags/luggagetag-luv2code-1003.png', 0, 100, 7.56, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1004', 'Naruto sage mode PVC Keychain', 'Soft PVC material', 'assets/images/products/luggagetags/luggagetag-luv2code-1004.png', 0, 100, 3.78, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1005', 'Marvel Avengers Metal Keychain', 'This Character Metal keychain is a must-have for a true fan.Light Weight And Easily Fits Into The Pocket , this makes a perfect gift for your loved once,Sleek and compact design.', 'assets/images/products/luggagetags/luggagetag-luv2code-1005.png', 0, 100, 8.82, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1006', 'Marvel Spider-Man Keychain ', 'This Character keychain is a must-have for a true fan.Light Weight And Easily Fits Into The Pocket , this makes a perfect gift for your loved once,Sleek and compact design.', 'assets/images/products/luggagetags/luggagetag-luv2code-1006.png', 0, 100, 4.02, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1007', 'Metal Thor Hammer & Axe ', 'Crafted from quality metal, makes it Strong and Durable with Superior Finish.', 'assets/images/products/luggagetags/luggagetag-luv2code-1007.png', 0, 100, 2.02, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1008', 'Goku Dragnball Keychain', 'Thin & light Poly-carbonate case , Smooth & Glossy surface', 'assets/images/products/luggagetags/luggagetag-luv2code-1008.png', 0, 100, 3.42, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1009', 'Iron man Arc Reactor Keychain', 'Material - Metal Alloy , Size - 11.5 x 5 x 0.5 cm', 'assets/images/products/luggagetags/luggagetag-luv2code-1009.png', 0, 100, 2.96, 3, NOW());


-- -----------------------------------------------------
-- Users
-- -----------------------------------------------------

INSERT INTO `ShopForHome`.`users` VALUES (2147483645, true, 'Plot 2, Shivaji Nagar, Benagluru', 'admin@gmail.com', 'Admin', '$2a$10$LiBwO43TpKU0sZgCxNkWJueq2lqxoUBsX2Wclzk8JQ3Ejb9MWu2Xy', '1234567890', 'ROLE_MANAGER');
