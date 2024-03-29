CREATE TABLE if not exists Преподаватели (
                                             id INTEGER PRIMARY KEY AUTOINCREMENT,
                                             ФИО VARCHAR(100) NOT NULL,
                                             Пол VARCHAR(10) CHECK (Пол IN ('муж', 'жен')) ,
                                             Дата_рождения DATE NOT NULL,
                                             Наличие_учёной_степени BOOLEAN
);

CREATE TABLE if not exists Студенты (
                                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                                        ФИО VARCHAR(100) NOT NULL,
                                        Пол VARCHAR(10) CHECK (Пол IN ('муж', 'жен')),
                                        Дата_рождения DATE NOT NULL,
                                        Номер_аттестата VARCHAR(20) NOT NULL
);

CREATE TABLE if not exists Группы (
                                      id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      Специализация_id VARCHAR(50) NOT NULL,
                                      Номер_группы VARCHAR(10) NOT NULL,
                                      Курс INT,
                                      FOREIGN KEY (Специализация_id) REFERENCES Специализации(id)
);

CREATE TABLE if not exists Специализации (
                                             id INTEGER PRIMARY KEY AUTOINCREMENT,
                                             Специализация VARCHAR(50) NOT NULL unique
);

CREATE TABLE if not exists Активность (
                                          ID INTEGER PRIMARY KEY,
                                          Студент_id INT,
                                          Группа_id INT,
                                          Поступление DATE,
                                          Отчисление DATE,
                                          PRIMARY KEY (Студент_id, Группа_id),
                                          FOREIGN KEY (Студент_id) REFERENCES Студенты(id),
                                          FOREIGN KEY (Группа_id) REFERENCES Группы(id) ON DELETE RESTRICT
);

CREATE TABLE if not exists Дисциплины (
                                          id INTEGER PRIMARY KEY AUTOINCREMENT,
                                          Дисциплина VARCHAR(100) NOT NULL unique
);

CREATE TABLE IF NOT EXISTS Предметы (
                                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                                        Группа_id INT,
                                        Дисциплина_id INT,
                                        Семестр INT NOT NULL,
                                        Преподаватель_id INT,
                                        Время DATE,
                                        ГодСеместр VARCHAR(6),
                                        UNIQUE (Группа_id, Дисциплина_id, Преподаватель_id),
                                        FOREIGN KEY (Дисциплина_id) REFERENCES Дисциплины(id),
                                        FOREIGN KEY (Группа_id) REFERENCES Группы(id),
                                        FOREIGN KEY (Преподаватель_id) REFERENCES Преподаватели(id)
);

CREATE TABLE if not exists Оценки (
                                      Студент_id INT,
                                      Предмет_id INT,
                                      Тип_оценки VARCHAR(20) CHECK (Тип_оценки IN ('Зачёт', 'Экзамен')),
                                      Оценка DECIMAL(4, 2),
                                      Время Date,
                                      PRIMARY KEY (Предмет_id, Студент_id),
                                      FOREIGN KEY (Предмет_id) REFERENCES Предметы(id),
                                      FOREIGN KEY (Студент_id) REFERENCES Студенты(id)
);


INSERT INTO Студенты (ФИО, Пол, Дата_рождения, Номер_аттестата)
VALUES
    ('Иванов Иван', 'муж', '2000-01-15', '54321'),
    ('Петрова Мария', 'жен', '1999-05-20', '65432'),
    ('Сидоров Павел', 'муж', '2001-09-10', '76543'),
    ('Кузнецова Анна', 'жен', '2002-03-18', '87654'),
    ('Григорьева Елена', 'жен', '2000-08-12', '98765'),
    ('Смирнов Дмитрий', 'муж', '2001-11-25', '23456'),
    ('Козлова Наталья', 'жен', '1999-04-05', '34567'),
    ('Алексеев Петр', 'муж', '2002-07-04', '45678'),
    ('Васнецов Игорь', 'муж', '2000-12-22', '56789'),
    ('Петров Илья', 'муж', '2001-03-08', '67890'),
    ('Михайлова Алена', 'жен', '1999-10-11', '78901'),
    ('Лебедев Владимир', 'муж', '2002-02-28', '89012'),
    ('Павлова Татьяна', 'жен', '2000-07-17', '90123'),
    ('Константинов Сергей', 'муж', '2001-09-29', '01234'),
    ('Соколова Анастасия', 'жен', '2002-04-03', '12345'),
    ('Иванова Ольга', 'жен', '1999-08-15', '23457'),
    ('Геннадьев Игорь', 'муж', '2000-12-27', '34568'),
    ('Тимофеева Алена', 'жен', '2001-11-04', '45679'),
    ('Семенов Игорь', 'муж', '2002-06-09', '56780'),
    ('Фролова Екатерина', 'жен', '2000-01-31', '67891'),
    ('Александров Станислав', 'муж', '2001-04-22', '78902'),
    ('Андреева Екатерина', 'жен', '1999-09-19', '89013'),
    ('Геннадьева Анна', 'жен', '2002-03-07', '90124'),
    ('Гришин Станислав', 'муж', '2000-08-24', '01235'),
    ('Константинова Марина', 'жен', '2001-10-06', '12346'),
    ('Игнатов Павел', 'муж', '2002-05-13', '23457'),
    ('Анисимов Сергей', 'муж', '1999-12-25', '34568'),
    ('Свиридова Анастасия', 'жен', '2000-06-01', '45679'),
    ('Максимов Михаил', 'муж', '2001-07-23', '56780'),
    ('Фомина Виктория', 'жен', '2002-02-11', '67891'),
    ('Борисов Артем', 'муж', '1999-10-14', '78902');


INSERT INTO Преподаватели (ФИО, Пол, Дата_рождения, Наличие_учёной_степени)
VALUES
    ('Ганжа Ксения Александровна', 'жен', '1976-05-10', TRUE),
    ('Елесеенко Ирина Леонидовна', 'жен', '1965-07-10', TRUE),
    ('Сущенко Андрей Андреевич', 'муж', '1978-12-05', FALSE),
    ('Богданов Дмитрий Сергеевич', 'муж', '1980-03-15', TRUE),
    ('Жукова Марина Валерьевна', 'жен', '1972-08-20', TRUE),
    ('Мельников Игорь Владимирович', 'муж', '1975-11-25', FALSE),
    ('Никитина Екатерина Викторовна', 'жен', '1982-04-05', TRUE),
    ('Тарасов Валентин Петрович', 'муж', '1983-07-04', FALSE),
    ('Королева Анастасия Валентиновна', 'жен', '1970-12-22', TRUE),
    ('Исаев Павел Александрович', 'муж', '1978-03-08', FALSE);

INSERT INTO Группы (Специализация_id, Номер_группы, Курс)
VALUES
    (1, 'А101', 1),
    (2, 'В223', 3),
    (3, 'Г345', 4),
    (2, 'Б202', 2),
    (3, 'В434', 4),
    (1, 'А102', 1),
    (2, 'В224', 3),
    (3, 'Г346', 4),
    (2, 'Б203', 2),
    (3, 'В435', 4);

INSERT INTO Дисциплины (Дисциплина)
VALUES
    ('Информационные технологии и программирование'),
    ('Экономика и финансы'),
    ('Психология и социология'),
    ('Иностранный язык'),
    ('Философия и этика'),
    ('География и экология'),
    ('Искусство и культурные исследования'),
    ('Математика и анализ данных'),
    ('Физика и астрономия'),
    ('История мировых цивилизаций'),
    ('Литература и культурные исследования'),
    ('Химия и биохимия'),
    ('Биология человека и медицинская генетика');

INSERT INTO Предметы (Группа_id, Дисциплина_id, Семестр, Преподаватель_id, Время)
VALUES
    (1, 1, 1, 1, '2023-05-15'),
    (2, 2, 2, 2, '2023-06-20'),
    (3, 3, 1, 3, '2023-07-10'),
    (1, 4, 2, 2, '2023-08-25'),
    (2, 5, 1, 1, '2023-09-05'),
    (3, 6, 2, 4, '2023-10-15'),
    (1, 1, 1, 5, '2023-11-20');

INSERT INTO Специализации (Специализация)
values
    ('Математика и компьютерные науки'),
    ('Информационная безопасность'),
    ('Экономика и финансы'),
    ('Гуманитарные науки'),
    ('Биология и медицина'),
    ('Инженерные науки');

INSERT INTO Активность (Студент_id, Группа_id, Поступление, Отчисление)
VALUES
    (1, 1, '2021-12-01', NULL),
    (2, 2, '2021-11-15', NULL),
    (3, 3, '2022-01-10', '2023-08-30'),
    (4, 1, '2022-04-20', '2023-06-30'),
    (5, 2, '2022-08-08', NULL),
    (6, 3, '2022-10-05', NULL),
    (7, 1, '2023-01-15', NULL),
    (8, 2, '2023-03-28', NULL),
    (9, 3, '2023-05-10', NULL),
    (10, 1, '2023-06-22', '2024-02-15'),
    (11, 2, '2023-08-01', NULL),
    (12, 3, '2023-09-25', NULL),
    (13, 1, '2023-11-30', NULL),
    (14, 2, '2024-01-02', '2024-12-01'),
    (15, 3, '2024-03-15', NULL),
    (16, 1, '2024-05-08', '2025-01-15'),
    (17, 2, '2024-07-01', NULL),
    (18, 3, '2024-09-15', '2025-05-20'),
    (19, 1, '2024-10-30', NULL),
    (20, 2, '2024-12-20', NULL),
    (21, 3, '2025-02-12', NULL),
    (22, 1, '2025-04-05', NULL),
    (23, 2, '2025-06-10', NULL),
    (24, 3, '2025-08-22', NULL),
    (25, 1, '2025-10-25', NULL),
    (26, 2, '2025-12-15', NULL),
    (27, 3, '2026-02-28', NULL),
    (28, 1, '2026-04-20', NULL),
    (29, 2, '2026-06-05', NULL),
    (30, 3, '2026-08-10', NULL),
    (31, 1, '2026-10-15', NULL),
    (32, 2, '2026-12-01', NULL),
    (33, 3, '2027-02-15', NULL),
    (34, 1, '2027-04-01', '2027-11-10'),
    (35, 2, '2027-06-15', NULL);

--9
UPDATE Активность
SET Отчисление = '2023-12-31'
WHERE Студент_id = 1 AND Группа_id = 1;
UPDATE Активность
SET Группа_id = 2
WHERE Студент_id = 1 AND Группа_id = 1;


--10
SELECT 'Преподаватель' AS Статус, Пол, COUNT(*) AS Количество
FROM Преподаватели
WHERE Дата_рождения BETWEEN '1960-01-01' AND '2000-12-31'
GROUP BY Пол
UNION
SELECT 'Студент', Пол, COUNT(*) AS Количество
FROM Студенты
WHERE Дата_рождения BETWEEN '1990-01-01' AND '2007-12-31'
GROUP BY Пол;


--11
SELECT ФИО, Дата_рождения
FROM Преподаватели
WHERE Дата_рождения BETWEEN '1990-01-01' AND '2000-12-31'
UNION
SELECT ФИО, Дата_рождения
FROM Студенты
WHERE Дата_рождения BETWEEN '1990-01-01' AND '2000-12-31';


--12
ALTER TABLE Предметы
    ADD COLUMN Время DATE;

SELECT Преподаватели.ФИО AS Преподаватель, Группы.Номер_группы AS Группа, Дисциплина AS Предмет, Предметы.Время
FROM Преподаватели
         JOIN Предметы ON Преподаватели.id = Предметы.Преподаватель_id
         JOIN Дисциплины ON Предметы.Дисциплина_id = Дисциплины.id
         JOIN Группы ON Предметы.Группа_id = Группы.id;


--13
SELECT Студенты.*
FROM Студенты
         JOIN Активность ON Студенты.id = Активность.Студент_id
         JOIN Группы ON Активность.Группа_id = Группы.id
WHERE Группы.Номер_группы = 'Б121'
  AND Активность.Поступление <= '2023-12-31'
  AND (Активность.Отчисление >= '2023-01-01' OR Активность.Отчисление IS NULL);


--14
SELECT Группы.*, Активность.Поступление, Активность.Отчисление
FROM Студенты
         JOIN Активность ON Студенты.id = Активность.Студент_id
         JOIN Группы ON Активность.Группа_id = Группы.id
WHERE Студенты.id = 10
  AND (Активность.Поступление <= '2023-12-31'
    AND (Активность.Отчисление >= '2025-01-01' OR Активность.Отчисление IS NULL));


--15
SELECT Активность.Студент_id AS Студент_ID, Предметы.id AS Предмет_ID
FROM Активность
         JOIN Группы ON Активность.Группа_id = Группы.id
         JOIN Предметы ON Активность.Группа_id = Предметы.Группа_id
WHERE Активность.Отчисление IS NULL;

INSERT INTO Оценки(Студент_id, Предмет_id, Тип_оценки, Время)
values
    (2, 2, 'Экзамен', CURRENT_DATE),
    (2, 5, 'Зачёт', CURRENT_DATE),
    (3, 1, 'Зачёт', CURRENT_DATE),
    (3, 4, 'Экзамен', CURRENT_DATE);
--(?, ?, '?');--


UPDATE Оценки
SET Оценка = 5
WHERE Студент_id = 2 AND Предмет_id = 2;
UPDATE Оценки
SET Оценка = 'Зачёт'
WHERE Студент_id = 2 AND Предмет_id = 5;

UPDATE Оценки
SET Оценка = 'Не зачёт'
WHERE Студент_id = 3 AND Предмет_id = 1;
UPDATE Оценки
SET Оценка = 3
WHERE Студент_id = 3 AND Предмет_id = 4;


--16
SELECT Дисциплины.Дисциплина, Оценки.Оценка, Оценки.Студент_id
FROM Оценки
         JOIN Предметы ON Оценки.Предмет_id = Предметы.id
         JOIN Дисциплины ON Предметы.Дисциплина_id = Дисциплины.id
WHERE Студент_id = 3;


--17
SELECT Предметы.Группа_id AS Группа, Дисциплины.Дисциплина, AVG(Оценки.Оценка) AS Средний_балл
FROM Предметы
         JOIN Оценки ON Предметы.id = Оценки.Предмет_id
         JOIN Дисциплины ON Дисциплины.id = Предметы.Дисциплина_id
WHERE Предметы.Дисциплина_id = 4;


--19
CREATE TRIGGER PreventGroupDeletion
    BEFORE DELETE ON Группы
    FOR EACH ROW
    WHEN EXISTS (SELECT * FROM Активность WHERE Группа_id = OLD.id)
BEGIN
    SELECT RAISE(ABORT, 'Нельзя удалить группу, в которой числятся/числились студенты');
END;

--20
CREATE TRIGGER PreventSpecializationDeletion
    BEFORE DELETE ON Специализации
    FOR EACH ROW
    WHEN EXISTS (SELECT Активность.Поступление FROM Группы JOIN Активность ON Активность.Группа_id = Группы.id = Активность.Группа_id WHERE Специализация_id = OLD.id and Активность.Поступление IS NOT NULL)
BEGIN
    SELECT RAISE(ABORT, 'Не допускается удаление специализаций, по которым были собранны непустые группы');
END;

--21
CREATE TRIGGER DeleteSpecializationNoGroups
    AFTER DELETE ON Группы
    FOR EACH ROW
    WHEN NOT EXISTS (SELECT * FROM Группы WHERE Специализация_id = OLD.Специализация_id)
BEGIN
    DELETE FROM Специализации WHERE ID = OLD.Специализация_id;
END;

--22
CREATE TRIGGER PreventDisciplineDeletion
    BEFORE DELETE ON Дисциплины
    FOR EACH ROW
    WHEN EXISTS (SELECT * FROM Предметы WHERE Предметы.Дисциплина_id = OLD.id)
BEGIN
    SELECT RAISE(ABORT, 'Не допускается удаление дисциплин, связанных с существующими предметами');
END;

--23
CREATE TRIGGER PreventDuplicateTeachers
    BEFORE INSERT ON Предметы
    WHEN EXISTS (
        SELECT *
        FROM Предметы
        WHERE NEW.Группа_id = Группа_id
          AND NEW.ГодСеместр = ГодСеместр
          AND NEW.Дисциплина_id = Дисциплина_id
          AND NEW.Преподаватель_id <> Предметы.Преподаватель_id
    )
BEGIN
    SELECT RAISE(ABORT, 'Нельзя назначить разным преподавателям одинаковые дисциплины в одной и той же группе');
END;

--24
CREATE TRIGGER PreventDuplicateStudents
    BEFORE INSERT ON Активность
    WHEN EXISTS (
        SELECT *
        FROM Активность
        WHERE NEW.Студент_id = Студент_id
          AND NEW.Отчисление IS NULL
          AND Активность.Отчисление IS NULL
    )
BEGIN
    SELECT RAISE(ABORT, 'Один студент не может числиться одновременно в разных группах.');
END;

--25
CREATE TRIGGER UpdateGroupOnExpulsion
    BEFORE INSERT ON Активность
BEGIN
    UPDATE Активность
    SET Отчисление = DATETIME('now')
    WHERE Студент_id = NEW.Студент_id AND Отчисление IS NULL AND id <> NEW.id;
END;

--26
CREATE TRIGGER PreventGradeWithoutGroup
    BEFORE INSERT ON Оценки
    WHEN NOT EXISTS (
        SELECT *
        FROM Активность
                 JOIN Предметы ON Активность.Группа_id = Предметы.Группа_id
        WHERE Активность.Студент_id = NEW.Студент_id
          AND Предметы.ID = NEW.Предмет_id
          AND Активность.Отчисление IS NULL
    )
BEGIN
    SELECT RAISE(ABORT, 'Студент не числится в группе, связанной с данным предметом');
END;

--27
CREATE TRIGGER DeletePreviousGrades
    AFTER INSERT ON Оценки
BEGIN
    DELETE FROM Оценки
    WHERE Студент_id = NEW.Студент_id
      AND Предмет_id = NEW.Предмет_id
      -- Уникальный идентификатор
      AND (ROWID != NEW.ROWID OR ROWID IS NULL);
END;

--28
CREATE TRIGGER PreventPastGradeTime
    BEFORE INSERT ON Оценки
    FOR EACH ROW
BEGIN
    SELECT
        CASE
            WHEN NEW.Время > DATETIME('now') THEN
                RAISE (ABORT, 'Не допускается проставление оценки перед текущим моментом времени.')
            END;
END


