-- Добавление ограничения UNIQUE на столбец Name_Status_room
ALTER TABLE Status_Room
	ADD CONSTRAINT UQ_Name_Status_room UNIQUE (Name_Status_room),
	ADD CONSTRAINT CH_Name_Status_room CHECK (Name_Status_room IN ('Свободен', 'Забронирован', 'Занят', 'Недоступен'));

ALTER TABLE Room
	ADD CONSTRAINT unique_room_number_room UNIQUE (Number_Room),
	ADD CONSTRAINT chk_room_number_room CHECK (Number_Room >= 0),
	ADD CONSTRAINT chk_daily_cost_room CHECK (Daily_Cost_Room >= 0);

ALTER TABLE Room_Configuration
	ADD CONSTRAINT chk_quantity_room_configuration CHECK (Quantity_Room_Configuration >= 0);

-- Добавление ограничения на Reservation
ALTER TABLE Reservation
	ADD CONSTRAINT chk_num_reservation CHECK (Number_Reservation ~ 'БРН-[0-9]{9}-[0-9]{2}'),
	ADD CONSTRAINT chk_total_cost_reservation CHECK (Total_Cost_Reservation > 0);

ALTER TABLE Client
	ALTER COLUMN Patronymic_Client SET DEFAULT '-',
	ADD CONSTRAINT chk_document_series_client CHECK (Document_Series_Client ~ '[0-9]{2} [0-9]{2}'),
	ADD CONSTRAINT chk_document_number_client CHECK (Document_Number_Client ~ '[0-9]{6}'),
	ADD CONSTRAINT chk_code_department_client CHECK (Code_Department_Client ~ '[0-9]{3}-[0-9]{3}'),
	ADD CONSTRAINT chk_phone_client CHECK (Phone_Client ~ '\+7\([0-9]{3}\)[0-9]{3}-[0-9]{2}-[0-9]{2}'),
	ADD CONSTRAINT unique_phone_client UNIQUE (Phone_Client),
	ADD CONSTRAINT unique_email_address_client UNIQUE (Email_Address_Client),
	ADD CONSTRAINT chk_email_address_client CHECK (Email_Address_Client LIKE '%@%' AND Email_Address_Client LIKE '%.%'),
	ADD CONSTRAINT unique_login_client UNIQUE (Login_Client),
	ADD CONSTRAINT chk_login_client CHECK (length(Login_Client) >= 4 AND Login_Client ~ '[a-zA-Z]'),
	ADD CONSTRAINT chk_password_client CHECK (length(Password_Client) >= 4 AND Password_Client ~ '[a-zA-Z0-9!@#$%^&*()]');

ALTER TABLE Employee
	ALTER COLUMN Patronymic_Employee SET DEFAULT '-',
	ADD CONSTRAINT unique_login_employee UNIQUE (Login_Employee),
	ADD CONSTRAINT chk_login_employee CHECK (length(Login_Employee) >= 4 AND Login_Employee ~ '[a-zA-Z]'),
	ADD CONSTRAINT chk_password_employee CHECK (length(Password_Employee) >= 4 AND Password_Employee ~ '[a-zA-Z0-9!@#$%^&*()]');

ALTER TABLE Contract
	ADD CONSTRAINT chk_number_contract CHECK (Number_Contract ~ 'ДГН-[0-9]{8}');

-- Таблица Status_Receipt
CREATE TABLE Status_Receipt (
    ID_Status_Receipt SERIAL NOT NULL CONSTRAINT PK_Status_Receipt PRIMARY KEY,
    Name_Status_Receipt VARCHAR(10) NOT NULL CHECK (Name_Status_Receipt IN ('Не оплачен', 'Оплачен'))
);
ALTER TABLE Status_Receipt
ADD CONSTRAINT unique_name_status_receipt UNIQUE (Name_Status_Receipt);

-- Таблица Type_Pay
CREATE TABLE Type_Pay (
    ID_Type_Pay SERIAL NOT NULL CONSTRAINT PK_Type_Pay PRIMARY KEY,
    Name_Type_Pay VARCHAR(11) NOT NULL CHECK (Name_Type_Pay IN ('Наличный', 'Безналичный'))
);
ALTER TABLE Type_Pay
ADD CONSTRAINT unique_name_type_pay UNIQUE (Name_Type_Pay);

-- Таблица Receipt
CREATE TABLE Receipt (
    ID_Receipt SERIAL NOT NULL CONSTRAINT PK_Receipt PRIMARY KEY,
    Num_Receipt VARCHAR(19) NOT NULL CHECK (Num_Receipt ~ 'КЧ/[0-9]{2}/Ус-[0-9]{10}'),
    Date_Create_Receipt DATE NOT NULL DEFAULT CURRENT_DATE,
    Time_Create_Receipt TIME NOT NULL DEFAULT CURRENT_TIME,
    Status_Receipt_ID INT NOT NULL,
    Total_Cost_Receipt INT NOT NULL CHECK (Total_Cost_Receipt > 0),
    Entered_Sum_Receipt INT NOT NULL CHECK (Entered_Sum_Receipt >= 0),
    Change_Sum_Receipt INT NOT NULL CHECK (Change_Sum_Receipt >= 0)
);
ALTER TABLE Receipt
ADD CONSTRAINT unique_num_receipt UNIQUE (Num_Receipt);

-- Таблица Type_Pay_Receipt
CREATE TABLE Type_Pay_Receipt (
    ID_Type_Pay_Receipt SERIAL NOT NULL CONSTRAINT PK_Type_Pay_Receipt PRIMARY KEY,
    Receipt_ID INT NOT NULL,
    Type_Pay_ID INT NOT NULL
);

-- Таблица Client_Orders 
CREATE TABLE Client_Orders (
    ID_Client_Orders SERIAL NOT NULL CONSTRAINT PK_Client_Orders PRIMARY KEY,
    Contract_ID INT NOT NULL,
    Receipt_ID INT NOT NULL
);

-- Таблица Type_Service
CREATE TABLE Type_Service (
    ID_Type_Service SERIAL NOT NULL CONSTRAINT PK_Type_Service PRIMARY KEY,
    Name_Type_Service VARCHAR(100) NOT NULL
);
ALTER TABLE Type_Service
ADD CONSTRAINT unique_name_type_service UNIQUE (Name_Type_Service);

-- Таблица Service
CREATE TABLE Service (
    ID_Service SERIAL NOT NULL CONSTRAINT PK_Service PRIMARY KEY,
    Type_Service_ID INT NOT NULL,
    Quantity_Service INT NOT NULL CHECK (Quantity_Service >= 0),
    Cost_Service INT NOT NULL CHECK (Cost_Service > 0)
);

-- Таблица Service_Receipt
CREATE TABLE Service_Receipt (
    ID_Service_Receipt SERIAL NOT NULL CONSTRAINT PK_Service_Receipt PRIMARY KEY,
    Service_ID INT NOT NULL,
    Receipt_ID INT NOT NULL
);