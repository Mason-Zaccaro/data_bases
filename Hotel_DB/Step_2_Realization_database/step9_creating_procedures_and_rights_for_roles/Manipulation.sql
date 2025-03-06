SELECT 
    ID_Class AS "ID класса",
    Name_Class AS "Название класса",
    Image_Class AS "Изображение класса"
FROM 
    Class;

SELECT 
    ID_Status_room AS "ID статуса номера",
    Name_Status_room AS "Название статуса номера"
FROM 
    Status_room;

SELECT 
    Room.ID_Room AS "ID номера",
    Room.Number_Room AS "Номер номера",
    Class.Name_Class AS "Название класса",
    Room.Daily_Cost_Room AS "Стоимость за сутки",
    Status_room.Name_Status_room AS "Статус номера"
FROM 
    Room
JOIN 
    Class ON Room.Class_ID = Class.ID_Class
JOIN 
    Status_room ON Room.Status_Room_ID = Status_room.ID_Status_room;

-- Комплектация (Configuration)
SELECT 
    ID_Configuration AS "ID комплектации",
    Furniture_Configuration AS "Мебель комплектации"
FROM 
    Configuration;
	
-- Опции (Options)
SELECT 
    ID_Options AS "ID опции",
    Name_Options AS "Название опции"
FROM 
    Options;
	
SELECT 
    Reservation.ID_Reservation AS "ID бронирования",
    Reservation.Number_Reservation AS "Номер бронирования",
    Reservation.Creation_Date_Reservation AS "Дата создания бронирования",
    Reservation.Checkin_Date_Reservation AS "Дата заселения",
    Reservation.Checkin_Time_Reservation AS "Время заселения",
    Reservation.Checkout_Date_Reservation AS "Дата выезда",
    Reservation.Checkout_Time_Reservation AS "Время выезда",
    Room.Number_Room AS "Номер комнаты",
    Reservation.Total_Cost_Reservation AS "Итоговая стоимость"
FROM 
    Reservation
JOIN 
    Room ON Reservation.Room_ID = Room.ID_Room;

SELECT 
    ID_Client AS "ID клиента",
    Surname_Client ||' '|| Name_Client ||' '|| Patronymic_Client AS "ФИО Клиента",
    Document_Series_Client ||' '|| Document_Number_Client AS "Серия Номер паспорта",
    Date_of_Birth_Client AS "Дата рождения",
    Gender_Client AS "Пол",
    Issued_By_Client AS "Кем выдан",
    Issued_Date_Client AS "Дата выдачи",
    Code_Department_Client AS "Код подразделения",
    Phone_Client AS "Контактный телефон",
    Email_Address_Client AS "Адрес электронной почты",
    Login_Client AS "Логин",
    Password_Client AS "Пароль"
FROM 
    Client;

SELECT 
    ID_Add_Services AS "ID дополнительной услуги",
    Name_Add_Services AS "Название дополнительной услуги",
    Cost_Add_Services AS "Стоимость дополнительной услуги"
FROM 
    Add_Services;
	
SELECT 
    ID_Employee AS "ID сотрудник",
	Surname_Employee ||' '|| Name_Employee ||' '||Patronymic_Employee AS "ФИО сотрудника",
    Login_Employee AS "Логин сотрудника",
    Password_Employee AS "Пароль сотрудника"
FROM 
    Employee;
	
-- Операционные таблицы (Дочерние)
SELECT 
    Room_Configuration.ID_Room_Configuration AS "ID комплектации номера",
    Room_Configuration.Quantity_Room_Configuration AS "Количество мебели",
    Configuration.Furniture_Configuration AS "Мебель комплектации",
    Room.Number_Room AS "Номер комнаты"
FROM 
    Room_Configuration
JOIN 
    Configuration ON Room_Configuration.Configuration_ID = Configuration.ID_Configuration
JOIN 
    Room ON Room_Configuration.Room_ID = Room.ID_Room;

SELECT 
    Room_Options.ID_Room_Options AS "ID опции номера",
    Room_Options.Quantity_Room_Options AS "Количество опций",
    Options.Name_Options AS "Название опции",
    Room.Number_Room AS "Номер комнаты"
FROM 
    Room_Options
JOIN 
    Options ON Room_Options.Option_ID = Options.ID_Options
JOIN 
    Room ON Room_Options.Room_ID = Room.ID_Room;

SELECT 
    Client_Reservation.ID_Client_Reservation AS "ID бронирования клиента",
    Client.Phone_Client AS "Телефон клиента",
    Reservation.Number_Reservation AS "Номер бронирования"
FROM 
    Client_Reservation
JOIN 
    Client ON Client_Reservation.Client_ID = Client.ID_Client
JOIN 
    Reservation ON Client_Reservation.Reservation_ID = Reservation.ID_Reservation;

SELECT 
    Contract.ID_Contract AS "ID договора",
    Contract.Number_Contract AS "Номер договора",
    Reservation.Number_Reservation AS "Номер бронирования",
    Employee.Login_Employee AS "Логин сотрудника",
    Contract.Creation_Date_Contract AS "Дата создания договора",
    Contract.Creation_Time_Contract AS "Время создания договора"
FROM 
    Contract
JOIN 
    Reservation ON Contract.Reservation_ID = Reservation.ID_Reservation
JOIN 
    Employee ON Contract.Employee_ID = Employee.ID_Employee;
	
-- Манипулирование над данными
CALL Reservation_Update(1, 'ГООООООЛ', '2023-08-10', '2023-09-05', '14:00:00', '2023-09-15', '12:00:00', 1, 38960);
CALL Reservation_Update(1, 'ГООООООЛ', '1984-02-22', '2023-09-05', '14:00:00', '2023-09-15', '12:00:00', 1, 38960);
CALL Reservation_Update(1, 'БРН-000000001-23', '2023-08-10', '2023-09-05', '14:00:00', '2023-09-15', '12:00:00', 1, 38960);
CALL Reservation_Insert(1, 'ГООООООЛ', '1984-02-22', '2023-09-05', '14:00:00', '2023-09-15', '12:00:00', 1, 38960);
CALL Reservation_Delete(42);