CREATE TABLE users
(
    user_id    INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户唯一标识符',
    username   VARCHAR(50)  NOT NULL COMMENT '用户登录名，必须唯一',
    email      VARCHAR(100) NOT NULL COMMENT '用户电子邮箱地址，必须唯一',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建账户的时间'
) COMMENT='存储平台用户基本信息的表';

CREATE TABLE orders
(
    order_id     INT AUTO_INCREMENT PRIMARY KEY COMMENT '订单唯一标识符',
    user_id      INT          NOT NULL COMMENT '下单用户的唯一标识符，关联到users表',
    product_name VARCHAR(100) NOT NULL COMMENT '订单中产品的名称',
    quantity     INT          NOT NULL COMMENT '订单中产品的数量',
    order_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建的时间',
    FOREIGN KEY (user_id) REFERENCES users (user_id) COMMENT '外键，关联到users表的user_id'
) COMMENT='存储用户订单信息的表';

INSERT INTO users (username, email, created_at) VALUES
('张三', 'zhangsan@example.com', '2024-02-01 10:00:00'),
('李四', 'lisi@example.com', '2024-02-02 11:00:00'),
('王五', 'wangwu@example.com', '2024-02-03 12:00:00'),
('赵六', 'zhaoliu@example.com', '2024-02-04 13:00:00'),
('孙七', 'sunqi@example.com', '2024-02-05 14:00:00'),
('周八', 'zhouba@example.com', '2024-02-06 15:00:00'),
('吴九', 'wujiu@example.com', '2024-02-07 16:00:00'),
('郑十', 'zhengshi@example.com', '2024-02-08 17:00:00'),
('刘一', 'liuyi@example.com', '2024-02-09 18:00:00'),
('杨二', 'lianger@example.com', '2024-02-10 19:00:00');

INSERT INTO orders (user_id, product_name, amount, order_date) VALUES
(1, 'iPhone 15 Pro', 7999.00, '2024-02-11 10:30:00'),
(2, 'MacBook Air M2', 9999.00, '2024-02-12 11:45:00'),
(3, 'AirPods Pro', 1899.00, '2024-02-13 09:20:00'),
(4, 'iPad Pro 11寸', 6499.00, '2024-02-14 14:10:00'),
(5, 'Apple Watch S9', 3199.00, '2024-02-15 16:50:00'),
(6, 'PlayStation 5', 4299.00, '2024-02-16 18:30:00'),
(7, 'Nintendo Switch OLED', 2599.00, '2024-02-17 13:40:00'),
(8, 'Kindle Paperwhite', 1199.00, '2024-02-18 15:10:00'),
(9, '机械键盘 Cherry MX', 699.00, '2024-02-19 20:05:00'),
(10, 'Sony WH-1000XM5', 2999.00, '2024-02-20 22:00:00'),
(1, '三星 49寸超宽屏显示器', 7999.00, '2024-02-21 12:30:00'),
(2, '罗技 MX Master 3S', 899.00, '2024-02-22 09:20:00'),
(3, 'Bose SoundLink Revolve+', 1799.00, '2024-02-23 17:45:00'),
(4, '小米 13 Ultra', 6499.00, '2024-02-24 14:00:00'),
(5, '华为 MatePad 11', 3199.00, '2024-02-25 15:10:00'),
(6, 'AMD Ryzen 9 7950X', 4699.00, '2024-02-26 10:30:00'),
(7, 'NVIDIA RTX 4090', 12999.00, '2024-02-27 11:00:00'),
(8, 'LG C3 OLED 55寸电视', 8999.00, '2024-02-28 18:40:00'),
(9, 'Intel Core i9 13900K', 4499.00, '2024-02-29 20:50:00'),
(10, '联想 Legion Pro 7', 11999.00, '2024-03-01 13:20:00'),
(1, '三星 Galaxy Z Fold5', 10999.00, '2024-03-02 17:00:00'),
(2, '索尼 A7 IV 相机', 16999.00, '2024-03-03 09:50:00'),
(3, 'DJI Mini 3 Pro 无人机', 5999.00, '2024-03-04 22:10:00'),
(4, '佳能 EOS R6', 14999.00, '2024-03-05 10:20:00'),
(5, '苹果 Mac Studio', 17999.00, '2024-03-06 11:30:00'),
(6, 'AMD Radeon RX 7900 XTX', 8499.00, '2024-03-07 19:40:00'),
(7, '雷蛇猎魂光蛛 V2', 1299.00, '2024-03-08 21:15:00'),
(8, '戴尔 XPS 17', 15999.00, '2024-03-09 16:50:00'),
(9, '微软 Surface Pro 9', 8999.00, '2024-03-10 08:20:00'),
(10, 'AirPods Max', 4399.00, '2024-03-11 18:30:00'),
(1, '罗技 G Pro X Superlight', 1099.00, '2024-03-12 09:00:00'),
(2, '联想 ThinkPad X1 Carbon', 11999.00, '2024-03-13 22:50:00'),
(3, 'BOSE QC45', 2399.00, '2024-03-14 15:40:00'),
(4, 'Sony Bravia XR A95K', 23999.00, '2024-03-15 17:20:00'),
(5, '海信 U8H 75寸', 12999.00, '2024-03-16 10:30:00'),
(6, '华硕 ROG Zephyrus G14', 10999.00, '2024-03-17 20:40:00'),
(7, '三星 T7 Shield 2TB', 1299.00, '2024-03-18 11:55:00'),
(8, '西部数据 SN850X 2TB', 1799.00, '2024-03-19 16:20:00'),
(9, '铁三角 ATH-M50XBT2', 1599.00, '2024-03-20 19:10:00'),
(10, 'HyperX Cloud Alpha Wireless', 999.00, '2024-03-21 23:00:00');

