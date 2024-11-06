drop database phones;
create database phones;
use phones;

CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(50)
);

CREATE TABLE user (
	user_name VARCHAR(50),
	user_password VARCHAR(50)
);

CREATE TABLE phone (
    phone_id INT PRIMARY KEY AUTO_INCREMENT,
    phone_name VARCHAR(50),
    phone_price DOUBLE,
    phone_storage INT,
    phone_status VARCHAR(50),
    phone_origin VARCHAR(50),
    brand_id INT,
    FOREIGN KEY (brand_id)
        REFERENCES brand (brand_id)
);

insert into user(user_name, user_password) values("admin", "admin"), ("member", "member");

insert into brand(brand_name) values("Iphone"), ("Samsung"), ("Oppo"), ("Huawei"), ("Vivo"), ("Xiaomi");

insert into phone(phone_name,phone_price,phone_storage,phone_status,phone_origin,brand_id)
 values ("Iphone 16 Promax", 2000, 512, "Hàng mới", "Việt Nam", 1),
 ("Iphone 16 Plus", 1600, 256, "Hàng mới", "Singapore", 1),
 ("Iphone 16 Plus", 1600, 256, "Hàng đã sử dụng", "Singapore", 1),
 ("Iphone 16", 1000, 128, "Hàng đã sử dụng", "Việt Nam", 1),
 ("Samsung Galaxy Z Fold 6", 1800, 256, "Hàng mới", "Trung Quốc", 2),
 ("Samsung Galaxy Z Flip 6", 1500, 512, "Hàng mới", "Hàn Quốc", 2);
