
-- Процедура для добавления записи в таблицу Reservation
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
    -- Проверка ограничений
    IF p_Creation_Date_Reservation != CURRENT_DATE THEN
        RAISE EXCEPTION 'Дата создания бронирования должна быть текущей';
    ELSIF p_Checkin_Date_Reservation <= p_Creation_Date_Reservation THEN
        RAISE EXCEPTION 'Дата заезда должна быть после даты создания';
    ELSIF p_Checkin_Time_Reservation < '14:00'::TIME THEN
        RAISE EXCEPTION 'Время заезда должно быть после 14:00';
    ELSIF p_Checkout_Date_Reservation <= p_Checkin_Date_Reservation THEN
        RAISE EXCEPTION 'Дата выезда должна быть после даты заезда';
    ELSIF p_Checkout_Time_Reservation > '12:00'::TIME THEN
        RAISE EXCEPTION 'Время выезда должно быть до 12:00';
    ELSE
        INSERT INTO Reservation (
            Number_Reservation, Creation_Date_Reservation, Checkin_Date_Reservation, Checkin_Time_Reservation, 
            Checkout_Date_Reservation, Checkout_Time_Reservation, Room_ID, Total_Cost_Reservation
        )
        VALUES (
            p_Number_Reservation, p_Creation_Date_Reservation, p_Checkin_Date_Reservation, p_Checkin_Time_Reservation, 
            p_Checkout_Date_Reservation, p_Checkout_Time_Reservation, p_Room_ID, p_Total_Cost_Reservation
        );
    END IF;
END;
$$;

-- Процедура для обновления записи в таблицу Reservation
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
    -- Проверка ограничений
    IF p_Creation_Date_Reservation != CURRENT_DATE THEN
        RAISE EXCEPTION 'Дата создания бронирования должна быть текущей';
    ELSIF p_Checkin_Date_Reservation <= p_Creation_Date_Reservation THEN
        RAISE EXCEPTION 'Дата заезда должна быть после даты создания';
    ELSIF p_Checkin_Time_Reservation < '14:00'::TIME THEN
        RAISE EXCEPTION 'Время заезда должно быть после 14:00';
    ELSIF p_Checkout_Date_Reservation <= p_Checkin_Date_Reservation THEN
        RAISE EXCEPTION 'Дата выезда должна быть после даты заезда';
    ELSIF p_Checkout_Time_Reservation > '12:00'::TIME THEN
        RAISE EXCEPTION 'Время выезда должно быть до 12:00';
    ELSE
        UPDATE Reservation
        SET
            Number_Reservation = p_Number_Reservation,
            Creation_Date_Reservation = p_Creation_Date_Reservation,
            Checkin_Date_Reservation = p_Checkin_Date_Reservation,
            Checkin_Time_Reservation = p_Checkin_Time_Reservation,
            Checkout_Date_Reservation = p_Checkout_Date_Reservation,
            Checkout_Time_Reservation = p_Checkout_Time_Reservation,
            Room_ID = p_Room_ID,
            Total_Cost_Reservation = p_Total_Cost_Reservation
        WHERE ID_Reservation = p_ID_Reservation;
    END IF;
END;
$$;

-- Процедура для добавления записи в таблицу Contract
CREATE OR REPLACE PROCEDURE Contract_Insert (
    p_Number_Contract VARCHAR(12),
    p_Reservation_ID INT,
    p_Employee_ID INT,
    p_Creation_Date_Contract DATE,
    p_Creation_Time_Contract TIME
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_Creation_Date_Reservation DATE;
    v_Checkin_Date_Reservation DATE;
    v_Checkin_Time_Reservation TIME;
BEGIN
    -- Извлечение данных из таблицы Reservation
    SELECT Creation_Date_Reservation, Checkin_Date_Reservation, Checkin_Time_Reservation
    INTO v_Creation_Date_Reservation, v_Checkin_Date_Reservation, v_Checkin_Time_Reservation
    FROM Reservation
    WHERE ID_Reservation = p_Reservation_ID;
    -- Проверка ограничений
    IF p_Creation_Date_Contract <= v_Creation_Date_Reservation THEN
        RAISE EXCEPTION 'Дата договора должна быть позже даты создания брони';
    ELSIF p_Creation_Date_Contract >= v_Checkin_Date_Reservation THEN
        RAISE EXCEPTION 'Дата договора должна быть раньше даты заселения';
    ELSIF p_Creation_Time_Contract >= v_Checkin_Time_Reservation THEN
        RAISE EXCEPTION 'Время договора должно быть раньше времени заселения';
    ELSE
        INSERT INTO Contract (
            Number_Contract, Reservation_ID, Employee_ID, Creation_Date_Contract, Creation_Time_Contract
        )
        VALUES (
            p_Number_Contract, p_Reservation_ID, p_Employee_ID, p_Creation_Date_Contract, p_Creation_Time_Contract
        );
    END IF;
END;
$$;

-- Процедура для обновления записи в таблицу Contract
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
DECLARE
    v_Creation_Date_Reservation DATE;
    v_Checkin_Date_Reservation DATE;
    v_Checkin_Time_Reservation TIME;
BEGIN
    -- Извлечение данных из таблицы Reservation
    SELECT Creation_Date_Reservation, Checkin_Date_Reservation, Checkin_Time_Reservation
    INTO v_Creation_Date_Reservation, v_Checkin_Date_Reservation, v_Checkin_Time_Reservation
    FROM Reservation
    WHERE ID_Reservation = p_Reservation_ID;
    
    -- Проверка ограничений
    IF p_Creation_Date_Contract <= v_Creation_Date_Reservation THEN
        RAISE EXCEPTION 'Дата договора должна быть позже даты создания брони';
    ELSIF p_Creation_Date_Contract >= v_Checkin_Date_Reservation THEN
        RAISE EXCEPTION 'Дата договора должна быть раньше даты заселения';
    ELSIF p_Creation_Time_Contract >= v_Checkin_Time_Reservation THEN
        RAISE EXCEPTION 'Время договора должно быть раньше времени заселения';
    ELSE
        UPDATE Contract
        SET
            Number_Contract = p_Number_Contract,
            Reservation_ID = p_Reservation_ID,
            Employee_ID = p_Employee_ID,
            Creation_Date_Contract = p_Creation_Date_Contract,
            Creation_Time_Contract = p_Creation_Time_Contract
        WHERE ID_Contract = p_ID_Contract;
    END IF;
END;
$$;


-- Новые процедуры

-- Процедура для добавления записи в таблицу Status_Receipt
CREATE OR REPLACE PROCEDURE Status_Receipt_Insert (
    p_Name_Status_Receipt VARCHAR(10)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Status_Receipt (Name_Status_Receipt)
    VALUES (p_Name_Status_Receipt);
END;
$$;

-- Процедура для обновления записи в таблице Status_Receipt
CREATE OR REPLACE PROCEDURE Status_Receipt_Update (
    p_ID_Status_Receipt INT,
    p_Name_Status_Receipt VARCHAR(10)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Status_Receipt
    SET Name_Status_Receipt = p_Name_Status_Receipt
    WHERE ID_Status_Receipt = p_ID_Status_Receipt;
END;
$$;


-- Процедура для удаления записи из таблицы Status_Receipt
CREATE OR REPLACE PROCEDURE Status_Receipt_Delete (
    p_ID_Status_Receipt INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Status_Receipt
    WHERE ID_Status_Receipt = p_ID_Status_Receipt;
END;
$$;


-- Процедура для добавления записи в таблицу Type_Pay
CREATE OR REPLACE PROCEDURE Type_Pay_Insert (
    p_Name_Type_Pay VARCHAR(11)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Type_Pay (Name_Type_Pay)
    VALUES (p_Name_Type_Pay);
END;
$$;

-- Процедура для обновления записи в таблице Type_Pay
CREATE OR REPLACE PROCEDURE Type_Pay_Update (
    p_ID_Type_Pay INT,
    p_Name_Type_Pay VARCHAR(11)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Type_Pay
    SET Name_Type_Pay = p_Name_Type_Pay
    WHERE ID_Type_Pay = p_ID_Type_Pay;
END;
$$;

-- Процедура для удаления записи из таблицы Type_Pay
CREATE OR REPLACE PROCEDURE Type_Pay_Delete (
    p_ID_Type_Pay INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Type_Pay
    WHERE ID_Type_Pay = p_ID_Type_Pay;
END;
$$;

CREATE OR REPLACE PROCEDURE Receipt_Insert (
    p_Num_Receipt VARCHAR(19),
    p_Date_Create_Receipt DATE,
    p_Time_Create_Receipt TIME,
    p_Status_Receipt_ID INT,
    p_Total_Cost_Receipt INT,
    p_Entered_Sum_Receipt INT,
    p_Change_Sum_Receipt INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Receipt (
        Num_Receipt, Date_Create_Receipt, Time_Create_Receipt, Status_Receipt_ID, 
        Total_Cost_Receipt, Entered_Sum_Receipt, Change_Sum_Receipt
    )
    VALUES (
        p_Num_Receipt, p_Date_Create_Receipt, p_Time_Create_Receipt, p_Status_Receipt_ID, 
        p_Total_Cost_Receipt, p_Entered_Sum_Receipt, p_Change_Sum_Receipt
    );
END;
$$;


CREATE OR REPLACE PROCEDURE Receipt_Update (
    p_ID_Receipt INT,
    p_Num_Receipt VARCHAR(19),
    p_Date_Create_Receipt DATE,
    p_Time_Create_Receipt TIME,
    p_Status_Receipt_ID INT,
    p_Total_Cost_Receipt INT,
    p_Entered_Sum_Receipt INT,
    p_Change_Sum_Receipt INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Receipt
    SET
        Num_Receipt = p_Num_Receipt,
        Date_Create_Receipt = p_Date_Create_Receipt,
        Time_Create_Receipt = p_Time_Create_Receipt,
        Status_Receipt_ID = p_Status_Receipt_ID,
        Total_Cost_Receipt = p_Total_Cost_Receipt,
        Entered_Sum_Receipt = p_Entered_Sum_Receipt,
        Change_Sum_Receipt = p_Change_Sum_Receipt
    WHERE ID_Receipt = p_ID_Receipt;
END;
$$;


-- Процедура для удаления записи из таблицы Receipt
CREATE OR REPLACE PROCEDURE Receipt_Delete (
    p_ID_Receipt INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Receipt
    WHERE ID_Receipt = p_ID_Receipt;
END;
$$;

-- Процедура для добавления записи в таблицу Type_Pay_Receipt
CREATE OR REPLACE PROCEDURE Type_Pay_Receipt_Insert (
    p_Receipt_ID INT,
    p_Type_Pay_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Type_Pay_Receipt (Receipt_ID, Type_Pay_ID)
    VALUES (p_Receipt_ID, p_Type_Pay_ID);
END;
$$;

-- Процедура для обновления записи в таблице Type_Pay_Receipt
CREATE OR REPLACE PROCEDURE Type_Pay_Receipt_Update (
    p_ID_Type_Pay_Receipt INT,
    p_Receipt_ID INT,
    p_Type_Pay_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Type_Pay_Receipt
    SET
        Receipt_ID = p_Receipt_ID,
        Type_Pay_ID = p_Type_Pay_ID
    WHERE ID_Type_Pay_Receipt = p_ID_Type_Pay_Receipt;
END;
$$;

-- Процедура для удаления записи из таблицы Type_Pay_Receipt
CREATE OR REPLACE PROCEDURE Type_Pay_Receipt_Delete (
    p_ID_Type_Pay_Receipt INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Type_Pay_Receipt
    WHERE ID_Type_Pay_Receipt = p_ID_Type_Pay_Receipt;
END;
$$;

-- Процедура для добавления записи в таблицу Client_Orders
CREATE OR REPLACE PROCEDURE Client_Orders_Insert (
    p_Contract_ID INT,
    p_Receipt_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Client_Orders (Contract_ID, Receipt_ID)
    VALUES (p_Contract_ID, p_Receipt_ID);
END;
$$;

-- Процедура для обновления записи в таблице Client_Orders
CREATE OR REPLACE PROCEDURE Client_Orders_Update (
    p_ID_Client_Orders INT,
    p_Contract_ID INT,
    p_Receipt_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Client_Orders
    SET
        Contract_ID = p_Contract_ID,
        Receipt_ID = p_Receipt_ID
    WHERE ID_Client_Orders = p_ID_Client_Orders;
END;
$$;

-- Процедура для удаления записи из таблицы Client_Orders
CREATE OR REPLACE PROCEDURE Client_Orders_Delete (
    p_ID_Client_Orders INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Client_Orders
    WHERE ID_Client_Orders = p_ID_Client_Orders;
END;
$$;


-- Процедура для добавления записи в таблицу Type_Service
CREATE OR REPLACE PROCEDURE Type_Service_Insert (
    p_Name_Type_Service VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Type_Service (Name_Type_Service)
    VALUES (p_Name_Type_Service);
END;
$$;

-- Процедура для обновления записи в таблице Type_Service
CREATE OR REPLACE PROCEDURE Type_Service_Update (
    p_ID_Type_Service INT,
    p_Name_Type_Service VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Type_Service
    SET Name_Type_Service = p_Name_Type_Service
    WHERE ID_Type_Service = p_ID_Type_Service;
END;
$$;

-- Процедура для удаления записи из таблицы Type_Service
CREATE OR REPLACE PROCEDURE Type_Service_Delete (
    p_ID_Type_Service INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Type_Service
    WHERE ID_Type_Service = p_ID_Type_Service;
END;
$$;


-- Процедура для добавления записи в таблицу Service
CREATE OR REPLACE PROCEDURE Service_Insert (
    p_Type_Service_ID INT,
    p_Quantity_Service INT,
    p_Cost_Service INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Service (Type_Service_ID, Quantity_Service, Cost_Service)
    VALUES (p_Type_Service_ID, p_Quantity_Service, p_Cost_Service);
END;
$$;

-- Процедура для обновления записи в таблице Service
CREATE OR REPLACE PROCEDURE Service_Update (
    p_ID_Service INT,
    p_Type_Service_ID INT,
    p_Quantity_Service INT,
    p_Cost_Service INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Service
    SET
        Type_Service_ID = p_Type_Service_ID,
        Quantity_Service = p_Quantity_Service,
        Cost_Service = p_Cost_Service
    WHERE ID_Service = p_ID_Service;
END;
$$;

-- Процедура для удаления записи из таблицы Service
CREATE OR REPLACE PROCEDURE Service_Delete (
    p_ID_Service INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Service
    WHERE ID_Service = p_ID_Service;
END;
$$;


-- Процедура для добавления записи в таблицу Service_Receipt
CREATE OR REPLACE PROCEDURE Service_Receipt_Insert (
    p_Service_ID INT,
    p_Receipt_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Service_Receipt (Service_ID, Receipt_ID)
    VALUES (p_Service_ID, p_Receipt_ID);
END;
$$;

-- Процедура для обновления записи в таблице Service_Receipt
CREATE OR REPLACE PROCEDURE Service_Receipt_Update (
    p_ID_Service_Receipt INT,
    p_Service_ID INT,
    p_Receipt_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Service_Receipt
    SET
        Service_ID = p_Service_ID,
        Receipt_ID = p_Receipt_ID
    WHERE ID_Service_Receipt = p_ID_Service_Receipt;
END;
$$;

-- Процедура для удаления записи из таблицы Service_Receipt
CREATE OR REPLACE PROCEDURE Service_Receipt_Delete (
    p_ID_Service_Receipt INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Service_Receipt
    WHERE ID_Service_Receipt = p_ID_Service_Receipt;
END;
$$;