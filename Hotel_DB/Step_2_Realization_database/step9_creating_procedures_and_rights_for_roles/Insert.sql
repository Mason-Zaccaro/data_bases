-- Тип организации (Type_Organization)
INSERT INTO Type_Organization (Name_Type_Organization) VALUES ('НПАО');
CALL type_organization_insert('ООО');

-- Должность сотрудника (Position_Employee)
INSERT INTO Position_Employee (Name_Position_Employee) VALUES ('Логист');
CALL position_employee_insert('Курьер');

-- Должность представителя (Position_Representative)
INSERT INTO Position_Representative (Name_Position_Representative) VALUES ('Глава отдела');
INSERT INTO Position_Representative (Name_Position_Representative) VALUES ('Начальник отдела');
CALL position_representative_insert('Главный бухгалтер');

-- Статус листа (Status_List)
INSERT INTO Status_List (Name_Status_List) VALUES ('В работе');
CALL status_list_insert('Закрыта');

-- Приоритет (Priority)
INSERT INTO Priority (Name_Priority) VALUES ('Не срочно');
CALL priority_insert('Срочно');

-- Статус заказа (Status_Application)
INSERT INTO Status_Application (Name_Status_Application) VALUES ('Доставлено');
CALL status_application_insert('В пути');

-- Услуга (Service)
INSERT INTO Service (Name_Service, Total_Price_Service, Image_Service) 
VALUES ('Формирование документов', 12000, 'C:\\');

INSERT INTO Service (Name_Service, Total_Price_Service, Image_Service) 
VALUES ('Доставка готовых документов', 13000, 'C:\\');

CALL service_insert('Транспортировка документов по требованию заказчика', 13500, 'C:\\');
CALL service_insert('Проверка почтовых отделений', 12500, 'C:\\');

-- Организация (Organization)
INSERT INTO Organization (Type_Organization_ID, Full_Name_Organization, Short_Name_Organization, INN_Organization, OKPO_Organization, Legal_Address_Organization)
VALUES (1, 'Северный Мост', 'СевМос', '0001465723', '6924568145', 'г. Москва, ул. Павелецкая, д. 67, к. 1');

INSERT INTO Organization (Type_Organization_ID, Full_Name_Organization, Short_Name_Organization, INN_Organization, OKPO_Organization, Legal_Address_Organization)
VALUES (2, 'Региональная служба поддержки', 'РСП', '0002625672', '5827685445', 'г. Москва, ул. Беляево, д. 5, стр. 5');

CALL organization_insert(1, 'Служба коммунальных услуг', 'СКУ', '0003722627', '9012347653', 'г. Москва, ул. Достоевская, д. 26, к. 1');
CALL organization_insert(2, 'Юридическое агентство', 'ЮРАген', '0001562352', '8623452236', 'г. Москва, ул. Кутузовская, д. 43, к. 1');

-- Физический адрес (Physical_Address)
INSERT INTO Physical_Address (Name_Physical_Address, Organization_ID) VALUES ('г. Москва, ул. Марьино, д. 63, стр. 6', 1);
INSERT INTO Physical_Address (Name_Physical_Address, Organization_ID) VALUES ('г. Москва, ул. грешская, д. 21, к. 1', 1);
CALL physical_address_insert('г. Москва, ул. Румянцево, д. 67, стр. 7', 2);
CALL physical_address_insert('г. Москва, ул. Останкино, д. 28, стр. 19', 3);
CALL physical_address_insert('г. Москва, ул. Щукинская, д. 52, стр. 1', 3);
CALL physical_address_insert('г. Москва, ул. Строгино, д. 17, к. 22', 3);
CALL physical_address_insert('г. Москва, ул. Сколково, д. 53, стр. 19', 4);

-- Сотрудник (Employee)
INSERT INTO Employee (Position_Employee_ID, Last_Name_Employee, Name_Employee, Patronymic_Employee, Login_Employee, Password_Employee)
VALUES (1, 'Иванов', 'Иван', 'Иванович', 'wk_IvanovII', 'Pa$$w0rd');

INSERT INTO Employee (Position_Employee_ID, Last_Name_Employee, Name_Employee, Patronymic_Employee, Login_Employee, Password_Employee)
VALUES (2, 'Петров', 'Пётр', 'Петрович', 'wk_PetrovPP', 'Pa$$w0rd');

INSERT INTO Employee (Position_Employee_ID, Last_Name_Employee, Name_Employee, Patronymic_Employee, Login_Employee, Password_Employee)
VALUES (2, 'Романов', 'Роман', 'Романович', 'wk_RomanovRR', 'Pa$$w0rd');

CALL employee_insert(2, 'Александров', 'Александр', 'Александрович', 'wk_AleksandrovAA', 'Pa$$w0rd');
CALL employee_insert(2, 'Павлов', 'Павел', 'Павлович', 'wk_PavlovPP', 'Pa$$w0rd');
CALL employee_insert(2, 'Борисов', 'Борис', 'Борисович', 'wk_BorisovBB', 'Pa$$w0rd');

-- Договор (Contract)
INSERT INTO Contract (Num_Contract, Date_Create_Contract, Validity_Period, Organization_ID, Total_Price_Contract, Employee_ID)
VALUES ('Д№-00000001-23', '2023-09-01', '1 год', 1, 38500, 1);

INSERT INTO Contract (Num_Contract, Date_Create_Contract, Validity_Period, Organization_ID, Total_Price_Contract, Employee_ID)
VALUES ('Д№-00000002-23', '2023-09-01', '1,5 года', 2, 25000, 1);

CALL contract_insert('Д№-00000003-23', '2023-09-03', '1 год', 3, 38500, 1);
CALL contract_insert('Д№-00000004-23', '2023-09-03', '6 месяцев', 4, 51000, 1);

-- Заказ (Orders)
INSERT INTO Orders (Num_Orders, Contract_ID, Service_ID, Date_Create_Orders) VALUES ('ЗК-П№000000001', 1, 3, '2023-09-04');
INSERT INTO Orders (Num_Orders, Contract_ID, Service_ID, Date_Create_Orders) VALUES ('ЗК-П№000000002', 1, 2, '2023-09-04');
INSERT INTO Orders (Num_Orders, Contract_ID, Service_ID, Date_Create_Orders) VALUES ('ЗК-П№000000003', 2, 2, '2023-09-04');

CALL orders_insert('ЗК-П№000000004', 3, 3, '2023-09-05');
CALL orders_insert('ЗК-П№000000005', 3, 4, '2023-09-05');
CALL orders_insert('ЗК-П№000000006', 4, 2, '2023-09-06');
CALL orders_insert('ЗК-П№000000007', 4, 4, '2023-09-06');

-- Представитель (Representative)
INSERT INTO Representative (Name_Departament_Representative, Position_Representative_ID, Last_Name_Representative, Name_Representative, Patronymic_Representative, Phone_Number_Representative, Login_Representative, Password_Representative, Organization_ID)
VALUES ('Отдел кадров', 1, 'Максимова', 'Елена', 'Андреевна', '+7(934)522-71-27', 'MaksimovaEA', 'Pa$$w0rd', 1);

INSERT INTO Representative (Name_Departament_Representative, Position_Representative_ID, Last_Name_Representative, Name_Representative, Patronymic_Representative, Phone_Number_Representative, Login_Representative, Password_Representative, Organization_ID)
VALUES ('Отдел маркетинга', 2, 'Иванова', 'Светлана', 'Игоревна', '+7(933)732-53-63', 'IvanovaSI', 'Pa$$w0rd', 1);

INSERT INTO Representative (Name_Departament_Representative, Position_Representative_ID, Last_Name_Representative, Name_Representative, Patronymic_Representative, Phone_Number_Representative, Login_Representative, Password_Representative, Organization_ID)
VALUES ('Отдел закупок', 2, 'Георгиев', 'Павел', 'Владимирович', '+7(943)518-47-12', 'GeorgievPV', 'Pa$$w0rd', 2);

CALL representative_insert('Отдел бухгалтерии', 3, 'Андреев', 'Константин', 'Валерьевич', '+7(902)672-18-37', 'AndreevKV', 'Pa$$w0rd', 3);
CALL representative_insert('Отдел приема продукции', 2, 'Павлов', 'Вениамин', 'Олегович', '+7(900)530-17-91', 'PavlovVO', 'Pa$$w0rd', 3);
CALL representative_insert('Отдел по работе с поставщиками', 1, 'Александрова', 'Кристина', 'Сергеевна', '+7(918)621-24-66', 'AlkeksandrovaKS', 'Pa$$w0rd', 4);

-- Услуги отдела (Department_Service)
INSERT INTO Department_Service (Representative_ID, Service_ID) VALUES (1, 1);
INSERT INTO Department_Service (Representative_ID, Service_ID) VALUES (1, 2);
INSERT INTO Department_Service (Representative_ID, Service_ID) VALUES (2, 3);
INSERT INTO Department_Service (Representative_ID, Service_ID) VALUES (3, 1);
CALL department_service_insert(3, 2);
CALL department_service_insert(4, 4);
CALL department_service_insert(5, 3);
CALL department_service_insert(5, 4);
CALL department_service_insert(6, 1);
CALL department_service_insert(6, 2);
CALL department_service_insert(6, 3);
CALL department_service_insert(6, 4);

-- Маршрутный лист (Route_List)
INSERT INTO Route_List (Num_Route_List, Employee_ID, Status_List_ID) VALUES ('МЛ№000000001', 4, 1);
INSERT INTO Route_List (Num_Route_List, Employee_ID, Status_List_ID) VALUES ('МЛ№000000001', 2, 2);
CALL route_list_insert('МЛ№000000001', 5, 1);
CALL route_list_insert('МЛ№000000001', 3, 1);

-- Заявка (Application)
INSERT INTO Application (Route_List_ID, Orders_ID, Priority_ID, By_Time_Application, Status_Application_ID) 
VALUES (1, 2, 2, '13:00', 1);

INSERT INTO Application (Route_List_ID, Orders_ID, Priority_ID, By_Time_Application, Status_Application_ID) 
VALUES (1, 1, 1, '17:00', 2);

INSERT INTO Application (Route_List_ID, Orders_ID, Priority_ID, By_Time_Application, Status_Application_ID) 
VALUES (2, 4, 2, '11:00', 1);

CALL application_insert(2, 5, 1, '15:00', 1);
CALL application_insert(3, 6, 1, '17:00', 2);
CALL application_insert(3, 7, 1, '17:00', 1);
CALL application_insert(4, 3, 1, '15:00', 2);

-- Документ заявки (Document)
INSERT INTO Document (Name_Document) VALUES ('Документ АЗ0-1');
INSERT INTO Document (Name_Document) VALUES ('Документ АЗ0-2');
INSERT INTO Document (Name_Document) VALUES ('Документ ПК14');
INSERT INTO Document (Name_Document) VALUES ('Документ ПК732');
INSERT INTO Document (Name_Document) VALUES ('Документ КН6226');

CALL document_insert('Документ НГ5621');
CALL document_insert('-');
CALL document_insert('Документ ВК/632-35');
CALL document_insert('Документ ЕА-522/КВ');

-- Документ заявки (Document_Application)
INSERT INTO Document_Application (Application_ID, Document_ID) VALUES (1, 1);
INSERT INTO Document_Application (Application_ID, Document_ID) VALUES (1, 2);
INSERT INTO Document_Application (Application_ID, Document_ID) VALUES (2, 3);
INSERT INTO Document_Application (Application_ID, Document_ID) VALUES (2, 4);

CALL document_application_insert(3, 5);
CALL document_application_insert(3, 6);
CALL document_application_insert(4, 7);
CALL document_application_insert(5, 8);
CALL document_application_insert(6, 7);
CALL document_application_insert(7, 9);