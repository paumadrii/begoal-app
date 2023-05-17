-- Borrado de todo
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS psychologists;
DROP TABLE IF EXISTS users_psychologists;
DROP TABLE IF EXISTS books;


DROP EXTENSION IF EXISTS "uuid-ossp";

-- Creacion de tablas y extensiones

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TABLE IF NOT EXISTS users(
id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
name TEXT  NULL,
last_name TEXT  NULL,
age TEXT  NULL,
city TEXT NULL,
phone_number TEXT NULL,
email TEXT UNIQUE NOT NULL,
password TEXT NOT NULL,
marital_status TEXT NULL,
occupation TEXT NULL,
clinic_history TEXT,
monitoring TEXT
);


CREATE TABLE IF NOT EXISTS psychologists (
id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
name TEXT NULL,
last_name TEXT  NULL,
age TEXT  NULL,
city TEXT  NULL,
phone_number TEXT NULL,
email TEXT UNIQUE NOT NULL,
password TEXT NOT NULL,
license_number INTEGER  NULL,
biography TEXT,
specialties TEXT,
education TEXT,
photo TEXT
);

CREATE TABLE IF NOT EXISTS users_psychologists (
psychologists_id uuid REFERENCES psychologists
ON UPDATE CASCADE
ON DELETE CASCADE,
users_id uuid REFERENCES users (id)
ON UPDATE CASCADE
ON DELETE CASCADE,
patient_file TEXT,
patient_record TEXT,
CONSTRAINT users_psychologists_id PRIMARY KEY (psychologists_id, users_id)
);

CREATE TABLE IF NOT EXISTS books (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    psychologists_id uuid REFERENCES psychologists (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    users_id uuid REFERENCES users (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    day DATE NOT NULL,
    hour TIME NOT NULL,
    channel TEXT NOT NULL,
    price smallint
);
