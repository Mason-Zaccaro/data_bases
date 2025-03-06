-- Таблица Класс (Class)
CREATE TABLE Class (
	ID_Class SERIAL NOT NULL CONSTRAINT PK_Class PRIMARY KEY,
	Name_Class VARCHAR(12) NOT NULL,
	Image_Class VARCHAR(100) NOT NULL
);

-- Таблица Статус номера (Status_room)
CREATE TABLE Status_Room (
	ID_Status_Room SERIAL NOT NULL CONSTRAINT PK_Status_Room PRIMARY KEY,
	Name_Status_room VARCHAR(12) NOT NULL
);

-- Таблица Номер (Room)
CREATE TABLE Room (
	ID_Room SERIAL NOT NULL CONSTRAINT PK_Room PRIMARY KEY,
	Number_Room INT NOT NULL,
	Daily_Cost_Room INT NOT NULL,
	Class_ID INT NOT NULL REFERENCES Class(ID_Class),
	Status_Room_ID INT NOT NULL REFERENCES Status_Room(ID_Status_Room)
);

-- Таблица Комплектация (Configuration)
CREATE TABLE Configuration (
	ID_Configuration SERIAL NOT NULL CONSTRAINT PK_Configuration PRIMARY KEY,
	Furniture_Configuration VARCHAR(14) NOT NULL
);

-- Таблица Комплектация номера (Room_Configuration)
CREATE TABLE Room_Configuration (
	ID_Room_Configuration SERIAL NOT NULL CONSTRAINT PK_Room_Configuration PRIMARY KEY,
	Quantity_Room_Configuration INT NOT NULL,
	Configuration_ID INT NOT NULL REFERENCES Configuration(ID_Configuration),
	Room_ID INT NOT NULL REFERENCES Room(ID_Room)
);

-- Таблица Опции (Options)
CREATE TABLE Options (
	ID_Options SERIAL NOT NULL CONSTRAINT PK_Options PRIMARY KEY,
	Name_Options VARCHAR(13) NOT NULL
);

-- Таблица Опции номера (Room_Options)
CREATE TABLE Room_Options (
	ID_Room_Options SERIAL NOT NULL CONSTRAINT PK_Room_Options PRIMARY KEY,
	Quantity_Room_Options INT NOT NULL,
	Option_ID INT NOT NULL REFERENCES Options(ID_Options),
	Room_ID INT NOT NULL REFERENCES Room(ID_Room)
);

-- Таблица Бронирование (Reservation)
CREATE TABLE Reservation (
	ID_Reservation SERIAL NOT NULL CONSTRAINT PK_Reservation PRIMARY KEY,
	Number_Reservation VARCHAR(16) NOT NULL,
	Creation_Date_Reservation DATE NOT NULL,
	Checkin_Date_Reservation DATE NOT NULL,
	Checkin_Time_Reservation TIME NOT NULL,
	Checkout_Date_Reservation DATE NOT NULL,
	Checkout_Time_Reservation TIME NOT NULL,
	Total_Cost_Reservation INT NOT NULL,
	Room_ID INT NOT NULL REFERENCES Room(ID_Room)
);

-- Таблица Клиент (Client)
CREATE TABLE Client (
	ID_Client SERIAL NOT NULL CONSTRAINT PK_Client PRIMARY KEY,
	Surname_Client VARCHAR(50) NOT NULL,
	Name_Client VARCHAR(50) NOT NULL,
	Patronymic_Client VARCHAR(50),
	Document_Series_Client VARCHAR(5) NOT NULL,
	Document_Number_Client VARCHAR(6) NOT NULL,
	Date_of_Birth_Client DATE NOT NULL,
	Gender_Client VARCHAR(3) NOT NULL,
	Issued_By_Client VARCHAR(70) NOT NULL,
	Issued_Date_Client DATE NOT NULL,
	Code_Department_Client VARCHAR(7) NOT NULL,
	Phone_Client VARCHAR(16) NOT NULL,
	Email_Address_Client VARCHAR(70) NOT NULL,
	Login_Client VARCHAR(50) NOT NULL,
	Password_Client VARCHAR(50) NOT NULL
);

-- Таблица Бронирование клиента (Client_Reservation)
CREATE TABLE Client_Reservation (
	ID_Client_Reservation SERIAL NOT NULL CONSTRAINT PK_Client_Reservation PRIMARY KEY,
	Client_ID INT NOT NULL REFERENCES Client(ID_Client),
	Reservation_ID INT NOT NULL REFERENCES Reservation(ID_Reservation)
);

-- Таблица Дополнительные услуги (Add_Services)
CREATE TABLE Add_Services (
	ID_Add_Services SERIAL NOT NULL CONSTRAINT PK_Add_Services PRIMARY KEY,
	Name_Add_Services VARCHAR(8) NOT NULL,
	Cost_Add_Services INT NOT NULL
);

-- Таблица Дополнительные услуги бронирования (Add_Services_Reservation)
CREATE TABLE Add_Services_Reservation (
	ID_Add_Services_Reservation SERIAL NOT NULL CONSTRAINT PK_Add_Services_Reservation PRIMARY KEY,
	Add_Services_ID INT NOT NULL REFERENCES Add_Services(ID_Add_Services),
	Reservation_ID INT NOT NULL REFERENCES Reservation(ID_Reservation)
);

-- Таблица Сотрудник (Employee)
CREATE TABLE Employee (
	ID_Employee SERIAL NOT NULL CONSTRAINT PK_Employee PRIMARY KEY,
	Surname_Employee VARCHAR(50) NOT NULL,
	Name_Employee VARCHAR(50) NOT NULL,
	Patronymic_Employee VARCHAR(50),
	Login_Employee VARCHAR(50) NOT NULL,
	Password_Employee VARCHAR(50) NOT NULL
);

-- Таблица Договор (Contract)
CREATE TABLE Contract (
	ID_Contract SERIAL NOT NULL CONSTRAINT PK_Contract PRIMARY KEY,
	Number_Contract VARCHAR(12) NOT NULL,
	Creation_Date_Contract DATE NOT NULL,
	Creation_Time_Contract TIME NOT NULL,
	Reservation_ID INT NOT NULL REFERENCES Reservation(ID_Reservation),
	Employee_ID INT NOT NULL REFERENCES Employee(ID_Employee)
);

-- Создание индексов
-- Индексы для таблицы Класс (Class)
CREATE INDEX IF NOT EXISTS Index_ID_Class ON Class(ID_Class);

-- Индексы для таблицы Статус номера (Status_Room)
CREATE INDEX IF NOT EXISTS Index_ID_Status_Room ON Status_Room(ID_Status_Room);
CREATE UNIQUE INDEX Index_Name_Status_Room ON Status_Room(Name_Status_Room);

-- Индексы для таблицы Номер (Room)
CREATE INDEX IF NOT EXISTS Index_ID_Room ON Room(ID_Room);
CREATE UNIQUE INDEX Index_Number_Room ON Room(Number_Room);

-- Индексы для таблицы Комплектация (Configuration)
CREATE INDEX IF NOT EXISTS Index_ID_Configuration ON Configuration(ID_Configuration);

-- Индексы для таблицы Комплектация номера (Room_Configuration)
CREATE INDEX IF NOT EXISTS Index_ID_Room_Configuration ON Room_Configuration(ID_Room_Configuration);

-- Индексы для таблицы Опции (Options)
CREATE INDEX IF NOT EXISTS Index_ID_Options ON Options(ID_Options);

-- Индексы для таблицы Опции номера (Room_Options)
CREATE INDEX IF NOT EXISTS Index_ID_Room_Options ON Room_Options(ID_Room_Options);

-- Индексы для таблицы Бронирование (Reservation)
CREATE INDEX IF NOT EXISTS Index_ID_Reservation ON Reservation(ID_Reservation);
CREATE UNIQUE INDEX Index_Number_Reservation ON Reservation(Number_Reservation);

-- Индексы для таблицы Клиент (Client)
CREATE INDEX IF NOT EXISTS Index_ID_Client ON Client(ID_Client);
CREATE INDEX index_surname_client ON Client (Surname_Client);
CREATE INDEX index_name_client ON Client (Name_Client);
CREATE INDEX index_patronymic_client ON Client (Patronymic_Client);
CREATE INDEX index_document_series_client ON Client (Document_Series_Client);
CREATE INDEX index_document_number_client ON Client (Document_Number_Client);
CREATE INDEX index_date_of_birth_client ON Client (Date_of_Birth_Client);
CREATE INDEX index_gender_client ON Client (Gender_Client);
CREATE INDEX index_issued_by_client ON Client (Issued_By_Client);
CREATE INDEX index_issued_date_client ON Client (Issued_Date_Client);
CREATE INDEX index_code_department_client ON Client (Code_Department_Client);
CREATE UNIQUE INDEX Index_Phone_Client ON Client(Phone_Client);
CREATE UNIQUE INDEX Index_Email_Client ON Client(Email_Address_Client);
CREATE UNIQUE INDEX Index_Login_Client ON Client(Login_Client);

-- Индексы для таблицы Бронирование клиента (Client_Reservation)
CREATE INDEX IF NOT EXISTS Index_ID_Client_Reservation ON Client_Reservation(ID_Client_Reservation);

-- Индексы для таблицы Дополнительные услуги (Add_Services)
CREATE INDEX IF NOT EXISTS Index_ID_Add_Services ON Add_Services(ID_Add_Services);

-- Индексы для таблицы Дополнительные услуги бронирования (Add_Services_Reservation)
CREATE INDEX IF NOT EXISTS Index_ID_Add_Services_Reservation ON Add_Services_Reservation(ID_Add_Services_Reservation);

-- Индексы для таблицы Сотрудник (Employee)
CREATE INDEX IF NOT EXISTS Index_ID_Employee ON Employee(ID_Employee);
CREATE UNIQUE INDEX Index_Login_Employee ON Employee(Login_Employee);

-- Индексы для таблицы Договор (Contract)
CREATE INDEX IF NOT EXISTS Index_ID_Contract ON Contract(ID_Contract);
CREATE UNIQUE INDEX Index_Number_Contract ON Contract(Number_Contract);

-- Выдача прав доступа
-- Предоставление прав для роли rl_Client
GRANT SELECT ON Class TO rl_Client;
GRANT SELECT ON Status_Room TO rl_Client;
GRANT SELECT ON Room TO rl_Client;
GRANT SELECT ON Configuration TO rl_Client;
GRANT SELECT ON Room_Configuration TO rl_Client;
GRANT SELECT ON Options TO rl_Client;
GRANT SELECT ON Room_Options TO rl_Client;
GRANT SELECT ON Reservation TO rl_Client;
GRANT SELECT ON Client_Reservation TO rl_Client;
GRANT SELECT ON Add_Services TO rl_Client;
GRANT SELECT ON Add_Services_Reservation TO rl_Client;
GRANT SELECT ON Contract TO rl_Client;

-- Предоставление прав для роли rl_Employee
GRANT SELECT, INSERT, UPDATE ON Room_Configuration TO rl_Employee;
GRANT SELECT, INSERT, UPDATE ON Room_Options TO rl_Employee;
GRANT SELECT, INSERT, UPDATE ON Reservation TO rl_Employee;
GRANT SELECT, INSERT, UPDATE ON Client TO rl_Employee;
GRANT SELECT, INSERT, UPDATE ON Client_Reservation TO rl_Employee;
GRANT SELECT, INSERT, UPDATE ON Add_Services_Reservation TO rl_Employee;
GRANT SELECT, INSERT, UPDATE ON Contract TO rl_Employee;
GRANT SELECT ON Class TO rl_Employee;
GRANT SELECT ON Status_room TO rl_Employee;
GRANT SELECT ON Room TO rl_Employee;
GRANT SELECT ON Configuration TO rl_Employee;
GRANT SELECT ON Options TO rl_Employee;
GRANT SELECT ON Add_Services TO rl_Employee;
GRANT SELECT ON Employee TO rl_Employee;

-- Предоставление прав для роли rl_Administrator
GRANT SELECT, INSERT, UPDATE, DELETE ON Class TO rl_Administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Status_room TO rl_Administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Room TO rl_Administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Configuration TO rl_Administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Options TO rl_Administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Add_Services TO rl_Administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO rl_Administrator;
GRANT SELECT, DELETE ON Room_Configuration TO rl_Administrator;
GRANT SELECT, DELETE ON Room_Options TO rl_Administrator;
GRANT SELECT, DELETE ON Reservation TO rl_Administrator;
GRANT SELECT, DELETE ON Client TO rl_Administrator;
GRANT SELECT, DELETE ON Client_Reservation TO rl_Administrator;
GRANT SELECT, DELETE ON Add_Services_Reservation TO rl_Administrator;
GRANT SELECT, DELETE ON Contract TO rl_Administrator;