-- Insercion de filas "USERS"
INSERT INTO users (
    name, last_name, age, city, phone_number, email, password, marital_status, occupation, clinic_history, monitoring
) VALUES (
    'Manuela','Olaya Herrera', '23', 'Madrid', '674844410', 'noexiste11@gmail.com','jd993dkdk', 'Soltera', 'Estudiante','null', 'null'  
);

INSERT INTO users (
    name, last_name, age, city, phone_number, email, password, marital_status, occupation, clinic_history, monitoring
) VALUES (
    'Ana','Madrigal Corcho', '23', 'Madrid', '674844410', 'noexiste2@gmail.com','djfkjsfjsj', 'Soltera', 'Profesora', 'null', 'null'  
);

INSERT INTO users (
    name, last_name, age, city, phone_number, email, password, marital_status, occupation, clinic_history, monitoring
) VALUES (
    'Paulina','Madridejos Fernandez', '35', 'Barcelona', '674844410', 'paumadejos90909@outlook.com', '1234455', 'Soltera', 'Estudiante', 'null', 'null'  
);

-- Insercion de filas "PSYCHOLOGISTS"

INSERT INTO psychologists (
    name, last_name, age, city, phone_number, email, password, license_number, biography, specialties, education, photo
) VALUES (
    'Rosmary', 'Mendez Alcazar', '26', 'Madrid', '674844410', 'noexiste3@gmail.com', 'pinpinela', '2799', 'NULL', 'Depresion, duelo, crecimiento personal','Universidad Europea','null'
);

INSERT INTO psychologists (
    name, last_name, age, city, phone_number, email, password, license_number, biography, specialties, education, photo
) VALUES (
    'Eduardo', 'Cristo del Rey', '40', 'Barcelona', '674844410', 'noexiste4@gmail.com', 'potasio', '2765', 'NULL', 'Autismo, Trastorno obsesivo','Universidad de Catalunya','null'
);

INSERT INTO psychologists (
    name, last_name, age, city, phone_number, email, password, license_number, biography, specialties, education, photo
) VALUES (
    'Rigoberta', 'Guadalupe Salado', '35', 'Madrid', '674844410', 'noexiste5@gmail.com', 'cuchara33', '9343', 'NULL', 'Ansiedad, Suicidio, Alto rendimiento','Universidad Complutense, Master en Oxford','null'
);

-- Insert into USERS_PSYCHOLOGISTS

INSERT INTO users_psychologists(
    psychologists_id, users_id, patient_file, patient_record
) VALUES (
    (SELECT id FROM psychologists WHERE name LIKE 'Rosmary'),(
        SELECT id FROM users WHERE name LIKE 'Ana'
    ),
     'null',
     'null'
);

INSERT INTO users_psychologists(
    psychologists_id, users_id, patient_file, patient_record
) VALUES (
    (SELECT id FROM psychologists WHERE name LIKE 'Eduardo'),(
        SELECT id FROM users WHERE name LIKE 'Paulina'
    ), 
    'null',
    'null'
);

INSERT INTO users_psychologists(
    psychologists_id, users_id, patient_file, patient_record
) VALUES (
    (SELECT id FROM psychologists WHERE name LIKE 'Rigoberta'),(
        SELECT id FROM users WHERE name LIKE 'Manuela'
    ), 
    'null',
    'null'
);

-- Insert into BOOKS

INSERT INTO books (
    psychologists_id, users_id, day, hour, channel, price
) VALUES (
    (SELECT id FROM psychologists WHERE name LIKE 'Rosmary'),
    (SELECT id FROM users WHERE name LIKE 'Ana'),
    '2023-05-16',
    '10:15',
    40,00
);