/*BASE DE DATOS*/
CREATE DATABASE store;

/*TABLA DE CLIENTES*/
CREATE TABLE client(
    id_client INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    adreess VARCHAR(100),
    country VARCHAR(50),
    email VARCHAR(100),
    cellphone VARCHAR(12),
    telephone VARCHAR(12),
    job_title VARCHAR(100),
    gender VARCHAR(6),
    college VARCHAR(200)
) PARTITION BY LIST (gender);

/*TABLA DE PRODUCTOS*/
CREATE TABLE product(
    id_product INT,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
) PARTITION BY RANGE (price);


/*TABLAS SECUNDARIAS*/
CREATE TABLE client_partiton_male PARTITION OF client FOR VALUES IN ('Male', 'MALE');
CREATE TABLE client_partiton_female PARTITION OF client FOR VALUES IN ('Female', 'FEMALE');


CREATE TABLE product_partition_1 PARTITION OF product FOR VALUES FROM (1.00) TO (3000.00);
CREATE TABLE product_partition_2 PARTITION OF product FOR VALUES FROM (3000.01) TO (6000.00);
CREATE TABLE product_partition_3 PARTITION OF product FOR VALUES FROM (6000.01) TO (10000.00);

/*RESTRICCIONES*/
ALTER TABLE client_partiton_male ADD CONSTRAINT partition_male_check CHECK (gender = 'Male' OR gender = 'MALE');
ALTER TABLE client_partiton_female ADD CONSTRAINT partition_female_check CHECK (gender = 'Female' OR gender = 'FEMALE');


ALTER TABLE product_partition_1 ADD CONSTRAINT partition_1_check CHECK (price >= 1.00 AND price <= 3000.00);
ALTER TABLE product_partition_2 ADD CONSTRAINT partition_2_check CHECK (price >= 3000.01 AND price <= 6000.00);
ALTER TABLE product_partition_3 ADD CONSTRAINT partition_3_check CHECK (price >= 6000.01 AND price <= 10000.00);