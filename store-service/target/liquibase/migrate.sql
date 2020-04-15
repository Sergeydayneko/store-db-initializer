-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: src/main/resources/liquibase/liquibase-changelog-master.xml
-- Ran at: 3/26/20, 8:02 PM
-- Against: postgres@jdbc:postgresql://localhost:5431/store
-- Liquibase version: 3.8.7
-- *********************************************************************

-- Lock Database
UPDATE databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = 'node-master (172.17.0.1)', LOCKGRANTED = '2020-03-26 20:02:19.772' WHERE ID = 1 AND LOCKED = FALSE;

-- Changeset src/main/resources/liquibase/changelog/01-create-brand-table.xml::pr-1::sdayneko
CREATE TABLE purchase_management.brand (brand_id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, brand_name VARCHAR(50) NOT NULL, CONSTRAINT brand_pkey PRIMARY KEY (brand_id), UNIQUE (brand_id), UNIQUE (brand_name));

INSERT INTO databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('pr-1', 'sdayneko', 'src/main/resources/liquibase/changelog/01-create-brand-table.xml', NOW(), 1, '8:f8ad2d6d8f4e6f0096161dc301286cbb', 'createTable tableName=brand', '', 'EXECUTED', NULL, NULL, '3.8.7', '5242140805');

-- Changeset src/main/resources/liquibase/changelog/02-create-type-table.xml::pr-2::sdayneko
CREATE TABLE purchase_management.type (type_id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, type_name VARCHAR(255) NOT NULL, CONSTRAINT type_pkey PRIMARY KEY (type_id), UNIQUE (type_id), UNIQUE (type_name));

INSERT INTO databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('pr-2', 'sdayneko', 'src/main/resources/liquibase/changelog/02-create-type-table.xml', NOW(), 2, '8:db1ff35164079aedd049c4efbd465f5b', 'createTable tableName=type', '', 'EXECUTED', NULL, NULL, '3.8.7', '5242140805');

-- Changeset src/main/resources/liquibase/changelog/03-create-product-table.xml::pr-3::sdayneko
CREATE TABLE purchase_management.product (product_id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, product_name VARCHAR(100) NOT NULL, product_type INTEGER, product_brand INTEGER, CONSTRAINT product_pkey PRIMARY KEY (product_id), CONSTRAINT brand_fkey FOREIGN KEY (product_brand) REFERENCES purchase_management.brand(brand_id), CONSTRAINT type_fkey FOREIGN KEY (product_type) REFERENCES purchase_management.type(type_id), UNIQUE (product_id));

INSERT INTO databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('pr-3', 'sdayneko', 'src/main/resources/liquibase/changelog/03-create-product-table.xml', NOW(), 3, '8:62fe4402e8b140e8824ccc78663c7ad7', 'createTable tableName=product', '', 'EXECUTED', NULL, NULL, '3.8.7', '5242140805');

-- Changeset src/main/resources/liquibase/changelog/04-create-address-table.xml::pr-4::sdayenko
CREATE TABLE purchase_management.address (address_id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, street_name VARCHAR(50) NOT NULL, street_number INTEGER NOT NULL, CONSTRAINT address_pk PRIMARY KEY (address_id), UNIQUE (address_id), UNIQUE (street_name));

INSERT INTO databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('pr-4', 'sdayenko', 'src/main/resources/liquibase/changelog/04-create-address-table.xml', NOW(), 4, '8:51b2ef3e4e08631e7f8a80d6831664e9', 'createTable tableName=address', '', 'EXECUTED', NULL, NULL, '3.8.7', '5242140805');

-- Changeset src/main/resources/liquibase/changelog/05-create-store-point-table.xml::pr-5::sdayneko
CREATE TABLE purchase_management.store_point (store_point_id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, store_point_name VARCHAR(100) NOT NULL, store_point_address_id INTEGER NOT NULL, CONSTRAINT store_point_id_pk PRIMARY KEY (store_point_id), CONSTRAINT store_point_address_fk FOREIGN KEY (store_point_address_id) REFERENCES purchase_management.address(address_id), UNIQUE (store_point_address_id), UNIQUE (store_point_id));

INSERT INTO databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('pr-5', 'sdayneko', 'src/main/resources/liquibase/changelog/05-create-store-point-table.xml', NOW(), 5, '8:7108e9cefbfb0d5ccffaa7668bb4b8ee', 'createTable tableName=store_point', '', 'EXECUTED', NULL, NULL, '3.8.7', '5242140805');

-- Changeset src/main/resources/liquibase/changelog/06-create-linked-store-product-table.xml::pr-6::sdayneko
CREATE TABLE purchase_management.linked_store_product (product_id INTEGER NOT NULL, store_id INTEGER NOT NULL, CONSTRAINT linked_product_fk FOREIGN KEY (product_id) REFERENCES purchase_management.product(product_id), CONSTRAINT linked_store_fk FOREIGN KEY (store_id) REFERENCES purchase_management.store_point(store_point_id));

INSERT INTO databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('pr-6', 'sdayneko', 'src/main/resources/liquibase/changelog/06-create-linked-store-product-table.xml', NOW(), 6, '8:e87bc549fe14937a7a763b3bf4cdd662', 'createTable tableName=linked_store_product', '', 'EXECUTED', NULL, NULL, '3.8.7', '5242140805');

-- Release Database Lock
UPDATE databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;
