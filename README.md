# Database
### Task 1
```sql
CREATE TABLE `customer` (
  `id` int(4) NOT NULL,
  `id_card_number` varchar(16) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `place_of_birth` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `price_room` (
  `id` int(4) NOT NULL,
  `room_type_id` int(4) NOT NULL,
  `price` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `updated_by` varchar(15) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `room_category` (
  `id` int(4) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `room_type` (
  `id` int(4) NOT NULL,
  `room_category_id` int(4) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `stock_room` (
  `id` int(4) NOT NULL,
  `room_type_id` int(4) NOT NULL,
  `stock_total` int(4) DEFAULT NULL,
  `stock_available` int(4) DEFAULT NULL,
  `stock_ordered` int(4) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(15) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `transaction_history` (
  `id` int(4) NOT NULL,
  `number` varchar(15) DEFAULT NULL,
  `customer_id` int(4) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `transaction_history_detail` (
  `id` int(4) NOT NULL,
  `transaction_history_id` int(4) DEFAULT NULL,
  `room_type_id` int(4) DEFAULT NULL,
  `room_ordered` int(4) DEFAULT NULL,
  `quantity` int(4) DEFAULT NULL,
  `price` int(4) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(15) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `price_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price_room_fk` (`room_type_id`);

ALTER TABLE `room_category`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_type_fk` (`room_category_id`);

ALTER TABLE `stock_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_room_fk` (`room_type_id`);

ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_history_fk` (`customer_id`);

ALTER TABLE `transaction_history_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_history_detail_fk` (`transaction_history_id`),
  ADD KEY `transaction_history_detail_fk_1` (`room_type_id`);

ALTER TABLE `price_room`
  ADD CONSTRAINT `price_room_fk` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`);

ALTER TABLE `room_type`
  ADD CONSTRAINT `room_type_fk` FOREIGN KEY (`room_category_id`) REFERENCES `room_category` (`id`);

ALTER TABLE `stock_room`
  ADD CONSTRAINT `stock_room_fk` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`);

ALTER TABLE `transaction_history`
  ADD CONSTRAINT `transaction_history_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

ALTER TABLE `transaction_history_detail`
  ADD CONSTRAINT `transaction_history_detail_fk` FOREIGN KEY (`transaction_history_id`) REFERENCES `transaction_history` (`id`),
  ADD CONSTRAINT `transaction_history_detail_fk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`);
COMMIT;
```
