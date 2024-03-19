-- Создание базы данных
CREATE DATABASE test_cifral_db;

-- Создание таблицы пользователей
CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR (50), email VARCHAR (50), phone VARCHAR (50), access_rights_user_level VARCHAR (50));

-- Создание таблицы отчётов
CREATE TABLE reports (id SERIAL PRIMARY KEY, name VARCHAR (50), number VARCHAR (50), access_rights_access_level INT); 

-- Создание таблицы соответсвия уровней доступа
CREATE TABLE access_rights (access_level INT PRIMARY KEY, user_level VARCHAR (50));

-- Создание заависимостей уровней доступа
INSERT INTO access_rights (access_level, user_level) VALUES (1, 'admin'), (2, 'moderator'), (3, 'user');

-- Добавление пользователей
INSERT INTO users (name, email, phone, access_rights_user_level) VALUES 
    ('John Smith', 'john@example.com', '123-456-7890', 'admin'), 
    ('Emma Johnson', 'emma@example.com', '234-567-8901', 'moderator'), 
    ('Michael Brown', 'michael@example.com', '345-678-9012', 'moderator'), 
    ('Sarah Miller', 'sarah@example.com', '456-789-0123', 'user'), 
    ('David Wilson', 'david@example.com', '567-890-1234', 'user'), 
    ('Jennifer Davis', 'jennifer@example.com', '678-901-2345', 'user'), 
    ('Daniel Martinez', 'daniel@example.com', '789-012-3456', 'user');

-- Добавление отчётов
INSERT INTO reports (name, number, access_rights_access_level) VALUES 
    ('report_1', '001', 1), 
    ('report_2', '002', 1), 
    ('report_3', '003', 1), 
    ('report_4', '004', 2), 
    ('report_5', '005', 2), 
    ('report_6', '006', 3), 
    ('report_7', '007', 3);

-- Получение всех отчетов доступных пользователю в соответствии с его уровнем доступа. Например для "John Smith" - все отчёты доступные для admin и ниже
SELECT * FROM reports WHERE access_rights_access_level >= (SELECT access_rights.access_level FROM users JOIN access_rights ON users.access_rights_user_level=access_rights.user_level WHERE name='John Smith');

-- Создание таблицы зависимостей пользователей и отчётов
CREATE TABLE users_reports (id SERIAL PRIMARY KEY, user_id INT, report_id INT);

-- Назначение отчётов пользователям
INSERT INTO users_reports (user_id, report_id) VALUES 
    (1, 1), 
    (1, 2), 
    (1, 3), 
    (1, 6), 
    (2, 1), 
    (2, 3), 
    (2, 5), 
    (3, 7), 
    (3, 4), 
    (6, 4), 
    (6, 5), 
    (6, 6);

-- Получение всех отчётов назначенных конкретному пользователю
SELECT reports.* FROM reports JOIN users_reports ON reports.id=users_reports.report_id WHERE users_reports.user_id = (SELECT id FROM users WHERE name='John Smith');

-- Изменение номера телефона для пользователя с id: 1
UPDATE users SET phone='111-222-333' WHERE id=1;

-- Выбор пользователей с уровнем доступа "moderator"
SELECT * FROM users WHERE access_rights_user_level='moderator';