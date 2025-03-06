-- Таблица Класс (Class)
-- Добавление
CREATE OR REPLACE PROCEDURE Class_Insert (
    p_Name_Class VARCHAR(12),
    p_Image_Class VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Class (Name_Class, Image_Class)
    VALUES (p_Name_Class, p_Image_Class);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Class_Update (
    p_ID_Class INT,
    p_Name_Class VARCHAR(12),
    p_Image_Class VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Class
    SET Name_Class = p_Name_Class,
        Image_Class = p_Image_Class
    WHERE ID_Class = p_ID_Class;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Class_Delete (
    p_ID_Class INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Class
    WHERE ID_Class = p_ID_Class;
END;
$$;

-- Таблица Статус номера (Status_room)
-- Добавление
CREATE OR REPLACE PROCEDURE Status_room_Insert (
    p_Name_Status_room VARCHAR(12)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Status_room (Name_Status_room)
    VALUES (p_Name_Status_room);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Status_room_Update (
    p_ID_Status_room INT,
    p_Name_Status_room VARCHAR(12)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Status_room
    SET Name_Status_room = p_Name_Status_room
    WHERE ID_Status_room = p_ID_Status_room;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Status_room_Delete (
    p_ID_Status_room INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Status_room
    WHERE ID_Status_room = p_ID_Status_room;
END;
$$;

-- Таблица Номер (Room)
-- Добавление
CREATE OR REPLACE PROCEDURE Room_Insert (
    p_Number_Room INT,
    p_Class_ID INT,
    p_Daily_Cost_Room INT,
    p_Status_Room_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Room (Number_Room, Class_ID, Daily_Cost_Room, Status_Room_ID)
    VALUES (p_Number_Room, p_Class_ID, p_Daily_Cost_Room, p_Status_Room_ID);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Room_Update (
    p_ID_Room INT,
    p_Number_Room INT,
    p_Class_ID INT,
    p_Daily_Cost_Room INT,
    p_Status_Room_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Room
    SET Number_Room = p_Number_Room,
        Class_ID = p_Class_ID,
        Daily_Cost_Room = p_Daily_Cost_Room,
        Status_Room_ID = p_Status_Room_ID
    WHERE ID_Room = p_ID_Room;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Room_Delete (
    p_ID_Room INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Room
    WHERE ID_Room = p_ID_Room;
END;
$$;

-- Таблица Комплектация (Configuration)
-- Добавление
CREATE OR REPLACE PROCEDURE Configuration_Insert (
    p_Furniture_Configuration VARCHAR(14)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Configuration (Furniture_Configuration)
    VALUES (p_Furniture_Configuration);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Configuration_Update (
    p_ID_Configuration INT,
    p_Furniture_Configuration VARCHAR(14)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Configuration
    SET Furniture_Configuration = p_Furniture_Configuration
    WHERE ID_Configuration = p_ID_Configuration;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Configuration_Delete (
    p_ID_Configuration INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Configuration
    WHERE ID_Configuration = p_ID_Configuration;
END;
$$;

-- Таблица Комплектация номера (Room_Configuration)
-- Добавление
CREATE OR REPLACE PROCEDURE Room_Configuration_Insert (
    p_Quantity_Room_Configuration INT,
    p_Configuration_ID INT,
    p_Room_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Room_Configuration (Quantity_Room_Configuration, Configuration_ID, Room_ID)
    VALUES (p_Quantity_Room_Configuration, p_Configuration_ID, p_Room_ID);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Room_Configuration_Update (
    p_ID_Room_Configuration INT,
    p_Quantity_Room_Configuration INT,
    p_Configuration_ID INT,
    p_Room_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Room_Configuration
    SET Quantity_Room_Configuration = p_Quantity_Room_Configuration,
        Configuration_ID = p_Configuration_ID,
        Room_ID = p_Room_ID
    WHERE ID_Room_Configuration = p_ID_Room_Configuration;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Room_Configuration_Delete (
    p_ID_Room_Configuration INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Room_Configuration
    WHERE ID_Room_Configuration = p_ID_Room_Configuration;
END;
$$;

-- Таблица Опции (Options)
-- Добавление
CREATE OR REPLACE PROCEDURE Options_Insert (
    p_Name_Options VARCHAR(13)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Options (Name_Options)
    VALUES (p_Name_Options);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Options_Update (
    p_ID_Options INT,
    p_Name_Options VARCHAR(13)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Options
    SET Name_Options = p_Name_Options
    WHERE ID_Options = p_ID_Options;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Options_Delete (
    p_ID_Options INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Options
    WHERE ID_Options = p_ID_Options;
END;
$$;

-- Таблица Опции номера (Room_Options)
-- Добавление
CREATE OR REPLACE PROCEDURE Room_Options_Insert (
    p_Quantity_Room_Options INT,
    p_Option_ID INT,
    p_Room_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Room_Options (Quantity_Room_Options, Option_ID, Room_ID)
    VALUES (p_Quantity_Room_Options, p_Option_ID, p_Room_ID);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Room_Options_Update (
    p_ID_Room_Options INT,
    p_Quantity_Room_Options INT,
    p_Option_ID INT,
    p_Room_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Room_Options
    SET Quantity_Room_Options = p_Quantity_Room_Options,
        Option_ID = p_Option_ID,
        Room_ID = p_Room_ID
    WHERE ID_Room_Options = p_ID_Room_Options;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Room_Options_Delete (
    p_ID_Room_Options INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Room_Options
    WHERE ID_Room_Options = p_ID_Room_Options;
END;
$$;

-- Таблица Бронирование (Reservation)
-- Добавление
CREATE OR REPLACE PROCEDURE Reservation_Insert (
    p_Number_Reservation VARCHAR(16),
    p_Creation_Date_Reservation DATE,
    p_Checkin_Date_Reservation DATE,
    p_Checkin_Time_Reservation TIME,
    p_Checkout_Date_Reservation DATE,
    p_Checkout_Time_Reservation TIME,
    p_Room_ID INT,
    p_Total_Cost_Reservation INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Reservation (Number_Reservation, Creation_Date_Reservation, Checkin_Date_Reservation, Checkin_Time_Reservation, Checkout_Date_Reservation, Checkout_Time_Reservation, Room_ID, Total_Cost_Reservation)
    VALUES (p_Number_Reservation, p_Creation_Date_Reservation, p_Checkin_Date_Reservation, p_Checkin_Time_Reservation, p_Checkout_Date_Reservation, p_Checkout_Time_Reservation, p_Room_ID, p_Total_Cost_Reservation);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Reservation_Update (
    p_ID_Reservation INT,
    p_Number_Reservation VARCHAR(16),
    p_Creation_Date_Reservation DATE,
    p_Checkin_Date_Reservation DATE,
    p_Checkin_Time_Reservation TIME,
    p_Checkout_Date_Reservation DATE,
    p_Checkout_Time_Reservation TIME,
    p_Room_ID INT,
    p_Total_Cost_Reservation INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Reservation
    SET Number_Reservation = p_Number_Reservation,
        Creation_Date_Reservation = p_Creation_Date_Reservation,
        Checkin_Date_Reservation = p_Checkin_Date_Reservation,
        Checkin_Time_Reservation = p_Checkin_Time_Reservation,
        Checkout_Date_Reservation = p_Checkout_Date_Reservation,
        Checkout_Time_Reservation = p_Checkout_Time_Reservation,
        Room_ID = p_Room_ID,
        Total_Cost_Reservation = p_Total_Cost_Reservation
    WHERE ID_Reservation = p_ID_Reservation;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Reservation_Delete (
    p_ID_Reservation INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Reservation
    WHERE ID_Reservation = p_ID_Reservation;
END;
$$;

-- Таблица Клиент (Client)
-- Добавление
CREATE OR REPLACE PROCEDURE Client_Insert (
    p_Surname_Client VARCHAR(50),
    p_Name_Client VARCHAR(50),
    p_Patronymic_Client VARCHAR(50),
    p_Document_Series_Client VARCHAR(5),
    p_Document_Number_Client INT,
    p_Date_of_Birth_Client DATE,
    p_Gender_Client VARCHAR(3),
    p_Issued_By_Client VARCHAR(70),
    p_Issued_Date_Client DATE,
    p_Code_Department_Client VARCHAR(7),
    p_Phone_Client VARCHAR(16),
    p_Email_Address_Client VARCHAR(70),
    p_Login_Client VARCHAR(50),
    p_Password_Client VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Client (Surname_Client, Name_Client, Patronymic_Client, Document_Series_Client, Document_Number_Client, Date_of_Birth_Client, Gender_Client, Issued_By_Client, Issued_Date_Client, Code_Department_Client, Phone_Client, Email_Address_Client, Login_Client, Password_Client)
    VALUES (p_Surname_Client, p_Name_Client, p_Patronymic_Client, p_Document_Series_Client, p_Document_Number_Client, p_Date_of_Birth_Client, p_Gender_Client, p_Issued_By_Client, p_Issued_Date_Client, p_Code_Department_Client, p_Phone_Client, p_Email_Address_Client, p_Login_Client, p_Password_Client);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Client_Update (
    p_ID_Client INT,
    p_Surname_Client VARCHAR(50),
    p_Name_Client VARCHAR(50),
    p_Patronymic_Client VARCHAR(50),
    p_Document_Series_Client VARCHAR(5),
    p_Document_Number_Client VARCHAR(6),
    p_Date_of_Birth_Client DATE,
    p_Gender_Client VARCHAR(3),
    p_Issued_By_Client VARCHAR(70),
    p_Issued_Date_Client DATE,
    p_Code_Department_Client VARCHAR(7),
    p_Phone_Client VARCHAR(16),
    p_Email_Address_Client VARCHAR(70),
    p_Login_Client VARCHAR(50),
    p_Password_Client VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Client
    SET Surname_Client = p_Surname_Client,
        Name_Client = p_Name_Client,
        Patronymic_Client = p_Patronymic_Client,
        Document_Series_Client = p_Document_Series_Client,
        Document_Number_Client = p_Document_Number_Client,
        Date_of_Birth_Client = p_Date_of_Birth_Client,
        Gender_Client = p_Gender_Client,
        Issued_By_Client = p_Issued_By_Client,
        Issued_Date_Client = p_Issued_Date_Client,
        Code_Department_Client = p_Code_Department_Client,
        Phone_Client = p_Phone_Client,
        Email_Address_Client = p_Email_Address_Client,
        Login_Client = p_Login_Client,
        Password_Client = p_Password_Client
    WHERE ID_Client = p_ID_Client;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Client_Delete (
    p_ID_Client INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Client
    WHERE ID_Client = p_ID_Client;
END;
$$;

-- Таблица Бронирование клиента (Client_Reservation)
-- Добавление
CREATE OR REPLACE PROCEDURE Client_Reservation_Insert (
    p_Client_ID INT,
    p_Reservation_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Client_Reservation (Client_ID, Reservation_ID)
    VALUES (p_Client_ID, p_Reservation_ID);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Client_Reservation_Update (
    p_ID_Client_Reservation INT,
    p_Client_ID INT,
    p_Reservation_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Client_Reservation
    SET Client_ID = p_Client_ID,
        Reservation_ID = p_Reservation_ID
    WHERE ID_Client_Reservation = p_ID_Client_Reservation;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Client_Reservation_Delete (
    p_ID_Client_Reservation INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Client_Reservation
    WHERE ID_Client_Reservation = p_ID_Client_Reservation;
END;
$$;

-- Таблица Дополнительные услуги (Add_Services)
-- Добавление
CREATE OR REPLACE PROCEDURE Add_Services_Insert (
    p_Name_Add_Services VARCHAR(8),
    p_Cost_Add_Services INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Add_Services (Name_Add_Services, Cost_Add_Services)
    VALUES (p_Name_Add_Services, p_Cost_Add_Services);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Add_Services_Update (
    p_ID_Add_Services INT,
    p_Name_Add_Services VARCHAR(8),
    p_Cost_Add_Services INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Add_Services
    SET Name_Add_Services = p_Name_Add_Services,
        Cost_Add_Services = p_Cost_Add_Services
    WHERE ID_Add_Services = p_ID_Add_Services;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Add_Services_Delete (
    p_ID_Add_Services INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Add_Services
    WHERE ID_Add_Services = p_ID_Add_Services;
END;
$$;

-- Дополнительные услуги бронирования (Add_Services_Reservation)
-- Добавление
CREATE OR REPLACE PROCEDURE Add_Services_Reservation_Insert (
    p_Add_Services_ID INT,
    p_Reservation_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Add_Services_Reservation (Add_Services_ID, Reservation_ID)
    VALUES (p_Add_Services_ID, p_Reservation_ID);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Add_Services_Reservation_Update (
    p_ID_Add_Services_Reservation INT,
    p_Add_Services_ID INT,
    p_Reservation_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Add_Services_Reservation
    SET Add_Services_ID = p_Add_Services_ID,
        Reservation_ID = p_Reservation_ID
    WHERE ID_Add_Services_Reservation = p_ID_Add_Services_Reservation;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Add_Services_Reservation_Delete (
    p_ID_Add_Services_Reservation INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Add_Services_Reservation
    WHERE ID_Add_Services_Reservation = p_ID_Add_Services_Reservation;
END;
$$;

-- Сотрудник (Employee)
-- Добавление
CREATE OR REPLACE PROCEDURE Employee_Insert (
    p_Surname_Employee VARCHAR(50),
    p_Name_Employee VARCHAR(50),
    p_Patronymic_Employee VARCHAR(50),
    p_Login_Employee VARCHAR(50),
    p_Password_Employee VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employee (Surname_Employee, Name_Employee, Patronymic_Employee, Login_Employee, Password_Employee)
    VALUES (p_Surname_Employee, p_Name_Employee, p_Patronymic_Employee, p_Login_Employee, p_Password_Employee);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Employee_Update (
    p_ID_Employee INT,
    p_Surname_Employee VARCHAR(50),
    p_Name_Employee VARCHAR(50),
    p_Patronymic_Employee VARCHAR(50),
    p_Login_Employee VARCHAR(50),
    p_Password_Employee VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Employee
    SET Surname_Employee = p_Surname_Employee,
        Name_Employee = p_Name_Employee,
        Patronymic_Employee = p_Patronymic_Employee,
        Login_Employee = p_Login_Employee,
        Password_Employee = p_Password_Employee
    WHERE ID_Employee = p_ID_Employee;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Employee_Delete (
    p_ID_Employee INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Employee
    WHERE ID_Employee = p_ID_Employee;
END;
$$;

-- Договор (Contract)
-- Добавление
CREATE OR REPLACE PROCEDURE Contract_Insert (
    p_Number_Contract VARCHAR(12),
    p_Reservation_ID INT,
    p_Employee_ID INT,
    p_Creation_Date_Contract DATE,
    p_Creation_Time_Contract TIME
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Contract (Number_Contract, Reservation_ID, Employee_ID, Creation_Date_Contract, Creation_Time_Contract)
    VALUES (p_Number_Contract, p_Reservation_ID, p_Employee_ID, p_Creation_Date_Contract, p_Creation_Time_Contract);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Contract_Update (
    p_ID_Contract INT,
    p_Number_Contract VARCHAR(12),
    p_Reservation_ID INT,
    p_Employee_ID INT,
    p_Creation_Date_Contract DATE,
    p_Creation_Time_Contract TIME
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Contract
    SET Number_Contract = p_Number_Contract,
        Reservation_ID = p_Reservation_ID,
        Employee_ID = p_Employee_ID,
        Creation_Date_Contract = p_Creation_Date_Contract,
        Creation_Time_Contract = p_Creation_Time_Contract
    WHERE ID_Contract = p_ID_Contract;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Contract_Delete (
    p_ID_Contract INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Contract
    WHERE ID_Contract = p_ID_Contract;
END;
$$;

GRANT EXECUTE ON PROCEDURE Room_Configuration_Insert TO rl_employee;
GRANT EXECUTE ON PROCEDURE Room_Configuration_Update TO rl_employee;
GRANT EXECUTE ON PROCEDURE Room_Configuration_Delete TO rl_employee;
GRANT EXECUTE ON PROCEDURE Room_Options_Insert TO rl_employee;
GRANT EXECUTE ON PROCEDURE Room_Options_Update TO rl_employee;
GRANT EXECUTE ON PROCEDURE Room_Options_Delete TO rl_employee;
GRANT EXECUTE ON PROCEDURE Reservation_Insert TO rl_employee;
GRANT EXECUTE ON PROCEDURE Reservation_Update TO rl_employee;
GRANT EXECUTE ON PROCEDURE Reservation_Delete TO rl_employee;
GRANT EXECUTE ON PROCEDURE Client_Insert TO rl_employee;
GRANT EXECUTE ON PROCEDURE Client_Update TO rl_employee;
GRANT EXECUTE ON PROCEDURE Client_Delete TO rl_employee;
GRANT EXECUTE ON PROCEDURE Client_Reservation_Insert TO rl_employee;
GRANT EXECUTE ON PROCEDURE Client_Reservation_Update TO rl_employee;
GRANT EXECUTE ON PROCEDURE Client_Reservation_Delete TO rl_employee;
GRANT EXECUTE ON PROCEDURE Add_Services_Reservation_Insert TO rl_employee;
GRANT EXECUTE ON PROCEDURE Add_Services_Reservation_Update TO rl_employee;
GRANT EXECUTE ON PROCEDURE Add_Services_Reservation_Delete TO rl_employee;
GRANT EXECUTE ON PROCEDURE Contract_Insert TO rl_employee;
GRANT EXECUTE ON PROCEDURE Contract_Update TO rl_employee;
GRANT EXECUTE ON PROCEDURE Contract_Delete TO rl_employee;
GRANT EXECUTE ON PROCEDURE Class_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Class_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Class_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Status_room_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Status_room_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Status_room_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Room_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Room_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Room_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Configuration_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Configuration_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Configuration_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Options_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Options_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Options_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Add_Services_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Add_Services_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Add_Services_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Employee_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Employee_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Employee_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Room_Configuration_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Room_Configuration_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Room_Configuration_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Room_Options_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Room_Options_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Room_Options_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Reservation_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Reservation_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Reservation_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Client_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Client_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Client_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Client_Reservation_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Client_Reservation_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Client_Reservation_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Add_Services_Reservation_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Add_Services_Reservation_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Add_Services_Reservation_Delete TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Contract_Insert TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Contract_Update TO rl_administrator;
GRANT EXECUTE ON PROCEDURE Contract_Delete TO rl_administrator;
