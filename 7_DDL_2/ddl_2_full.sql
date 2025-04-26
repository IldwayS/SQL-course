DROP TABLE exam;

CREATE TABLE exam
(
	exam_id int serial UNIQUE NOT NULL,
	exam_name varchar(256),
	exam_date date
);

--SELECT *
--FROM information_schema.key_column_usage
--WHERE table_name = 'exam'
--AND table_schema = 'public'
--and column_name = 'exam_id';

ALTER TABLE exam
DROP CONSTRAINT exam_exam_id_key;

ALTER TABLE exam
ADD PRIMARY KEY(exam_id);

CREATE TABLE person
(
	person_id int PRIMARY KEY,
	person_first_name varchar(32),
	person_last_name varchar(32)
);

CREATE TABLE passports
(
	passport_id int PRIMARY KEY,
	serial_number int NOT NULL,
	registration text,
	person_id int,

	CONSTRAINT fk_person_id FOREIGN KEY(person_id) REFERENCES person(person_id)
);

CREATE TABLE book
(
	book_id int PRIMARY KEY
);

ALTER TABLE book
ADD COLUMN weight decimal CONSTRAINT chk_book_weight CHECK(
	weight > 0 AND 
	weight < 100
);

SELECT *
FROM book;

INSERT INTO book
VALUES (2, 100);

DROP TABLE student;

CREATE TABLE student
(
	student_id GENERATED ALWAYS AS IDENTITY NOT NULL,
	student_full_name varchar(256),
	study_year int DEFAULT 1
);

INSERT INTO student (student_full_name)
VALUES ('OBAMA петрович');

SELECT *
FROM student;

SELECT *
FROM information_schema.key_column_usage
WHERE table_name = 'student'
AND table_schema = 'public'
and column_name = 'study_year';

ALTER TABLE student
ALTER COLUMN study_year
DROP DEFAULT;

ALTER TABLE products
ADD CONSTRAINT chk_unit_price CHECK (unit_price > 0);

CREATE SEQUENCE IF NOT EXISTS seq_product_id 
START WITH 78
OWNED BY products.product_id;

ALTER TABLE products
ALTER COLUMN product_id SET DEFAULT nextval('seq_product_id');

INSERT INTO products (product_name, supplier_id, category_id,
quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES ('prod', 1, 1, 1, 1, 1, 1, 1, 0)
RETURNING product_id