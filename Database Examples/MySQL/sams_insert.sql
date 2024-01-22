/*
SYNTAX:

INSERT INTO table_name (column1, column2, column3) VALUES (value1, value2, value3);

*/

/*
Business Rules
* Airline is identified by an airline ID (2 characters) which is the IATA_Code
* Each AircratModel has a unique model id (e.g. ’A380’ or ’B737’) and is produced by a specific manufacturer 
	(e.g., ’Airbus’, ’Boeing’ or ‘Gulfstream’)
* Each sub_model must belong to one unique model (e.g. ’A380_800’ or ’B747_100’)
* For example, a ’B737_900ER or B737 MAX _ 10’ is the extended range version of the latest version of the Boeing 737. 
	Another example, a ’A380_900’ a specific variant of an Airbus A380. 
	It has 650 seats in a standard configuration compared to 555 seats on the A380_800
* Each aircraft is identified by an aircraft id which is a serial number (6 digits) given by Southern Airport inhouse.
* All aircraft fly in Australia must also have an aviation registration number (ARN) given by the Civil Aviation Safety Authority. 
	These registration number is commonly known and consists of a two_letter code identifying the owning airline and a three_letter 
	unique id within the airline fleet. Both parts are separated by a hyphen.
	For example, ’VH_EAF’ would be a valid aircraft registration number. 
	’VH’ is the code for the Qantas fleet of aircrafts and ’EAF’ identifies one particular aircraft of the Qantas fleet. 
	Most airlines give their aircraft a name. For example, as mentioned ’VH_EAF’ is named ’City of Adelaide’ by Qantas.
* Each engine has an identification number such as: CFM56_7B20_340_131_712_0_17846. 
	Some manufacturers may have 30 characters engine identification number
* Each technician is uniquely identified by their employee id which is an automatically increased serial number
* 
*/

/*
Backup & Recovery
* Ensure that all data are backed up regularly
* Data must be available 7 * 24
* Most database transactions are generated evenly everyday during the week even during the weekend. 
	Two third of the transactions happen between 6:00am ~ 8:00pm
* The manager has indicated that if any data are corrupted, the database must be able to recover the 
	data to the time before the corruption.
*/

/**/

INSERT INTO Country 
(countryID, countryName) 
VALUES 
('AUS', 'Australia'), 
('USA', 'United States of America'),
('NZL', 'New Zealand'),
('CAN', 'Canada'), 
('MEX', 'Mexico');


INSERT INTO Airline 
(airlineID, countryID, airlineName, street, suburb, postcode, state, country, contactPhone, websiteAddress) 
VALUES 
('QF', 'AUS', 'Qantas', '10 Bourke Road', 'Mascot', '2020', 'NSW', 'Australia', '9691 3636', 'https://www.qantas.com/au/en.html'),
('AA', 'USA', 'American Airlines', 'AA Street', 'Fort Worth', '76022', 'TX', 'United States of America', '555 36172', 'https://www.americanairlines.com.au/intl/au/index.jsp'),
('NZ', 'NZL', 'Air New Zealand', 'NZ Street', 'Auckland', '0600', 'North Island', 'New Zealand', '1234 5678', 'https://www.airnewzealand.com.au/adl'),
('AC', 'CAN', 'Air Canada', 'Maple Avenue', 'Montreal', '46541', 'Quebec', 'Canada', '9876 5412', 'https://www.aircanada.com/au/en/aco/home.html'),
('AM', 'MEX', 'Aeromexico', 'Bueno Rue', 'Mexico City', '03214', 'Mexico', 'Mexico', '6547 8998', 'https://aeromexico.com/es_mx');


INSERT INTO AircraftManufacturer /* manufacturerID as AI PK*/
(manufacturerName) 
VALUES
('Airbus'), /* 1 */
('Boeing'), /* 2 */
('Lockheed Martin'), /* 3 */
('Raytheon Technologies'), /* 4 */
('Northrop Grumman'); /* 5 */


INSERT INTO EngineModel  
(engineModelName, engineManufacturer, thrustRange_km, dryWeight_kg) 
VALUES 
('CFM56_7B', 'CFM International', 121 , 2370.00),
('GEM56_7B', 'General Electric', 125 , 2500.00),
('HWA56_7B', 'Honeywell Aerospace', 122 , 2457.00),
('SFN56_7B', 'Safran', 123 , 2470.00),
('LKA56_7B', 'Lyulka', 124 , 2499.99);


INSERT INTO AircraftModel 
(modelID, manufacturerID) 
VALUES 
('A380', 1),
('B737', 2),
('L380', 3),
('R880', 4),
('N912', 5);


INSERT INTO `AircraftSub_Model`
(submodelID, engineModelName, modelID, length_m, height, wingspanArea_m2, maxPayloadWeight_kg, `maxCruisingSpeed_kp/h`, maximumRange_km)
VALUES 
('A380_800', 'CFM56_7B', 'A380', 39.5, 12.5, 35.8, 20540.00, 838, 5436.00),
('B737_700', 'GEM56_7B', 'B737', 39.5, 12.5, 35.8, 20540.00, 838, 5436.00),
('L380_456', 'HWA56_7B', 'L380', 39.5, 12.5, 35.8, 20540.00, 838, 5436.00),
('R880_789', 'SFN56_7B', 'R880', 39.5, 12.5, 35.8, 20540.00, 838, 5436.00),
('N912_123', 'LKA56_7B', 'N912', 39.5, 12.5, 35.8, 20540.00, 838, 5436.00);


INSERT INTO Aircraft 
(aircraftID, submodelID, aviationRegistrationNo, aircraftName) 
VALUES 
('001', 'A380_800', 'QA_001', 'QANTAS ADL'),
('002', 'B737_700', 'BO_002', 'Boeing MLB'),
('003', 'L380_456', 'LM_003', 'Lockheed SYD'),
('004', 'R880_789', 'RT_004', 'Raytheon PRT'),
('005', 'N912_123', 'NG_005', 'Northrop BRS');


INSERT INTO Engine 
(engineIdentificationNumber, Aircraft_aircraftID, engineModelName, manufacturingDate) 
VALUES 
('CFM56_7B_1234_4567', '001', 'CFM56_7B', '2023-05-18'),
('GEM56_7B_8976_5432', '002', 'GEM56_7B', '2023-01-31'),
('HWA56_7B_1593_7531', '003', 'HWA56_7B', '2023-02-25'),
('SFN56_7B_1597_3246', '004', 'SFN56_7B', '2023-03-16'),
('LKA56_7B_9137_4682', '005', 'LKA56_7B', '2023-04-01');


INSERT INTO PassengerCategory 
(submodelID, maximumNumberOfPassengers, maxNoPassengers1stClass, maxNoPassengersEconomy) 
VALUES 
('A380_800', 160, 16, 144),
('B737_700', 220, 20, 200),
('L380_456', 265, 10, 255),
('R880_789', 156, 16, 140),
('N912_123', 170, 20, 150);


INSERT INTO CargoCategory /* cargoCategory as AI PK */
(submodelID, maximumCargoWeight_kg, mainDeckCapacity_m3, lowerDeckCapacity_m3) 
VALUES 
('N912_123', 141, 43.7, 2358.00); /* 1 */


/*1 Tech, 1 Supervisor, 1 Manager*/
INSERT INTO Technician /* employeeID as AI PK */
(supervisorID, firstName, lastName, streetAddress, suburb, postcode, phone, salary, loginName)
VALUES 
(NULL, 'Simon', 'Johnson', '123 Anystreet', 'Adelaide', '5000', '555 4357456', 160000.00, 'simonJ'), /*employeeId = 1*/
(1, 'Jesse', 'Hamilton_Young', '456 Currie St', 'Adelaide', '5000', '555 1236579', 150000.00, 'jesseH'), /*employeeId = 2*/
(1, 'Andre', 'Alexandrov', '357 Blyat Ave', 'Salisbury', '5108', '555 9134675', 95000.00, 'AndreA'), /*employeeId = 3*/
(1, 'Chanmonich', 'Phe', '987 George Street', 'Adelaide', '5000', '555 6791347', 100000.0, 'chanmP'); /*employeeId = 4*/




INSERT INTO Manager 
(managerID, ManagementCommencementDate) 
VALUES 
(2, '2023-05-19');


INSERT INTO Training 
(trainingID, trainingName, trainingDate) 
VALUES 
(0123, 'A380', '2023-02-13'),
(0124, 'B737', '2023-02-14'),
(0125, 'L380', '2023-02-15'),
(0126, 'R880', '2023_02_16'),
(0127, 'N912', '2023_02_17');


INSERT INTO TestEvent /* testEventID as AI PK */
(Aircraft_aircraftID, startTestDateTime, endTestDateTime, noOfHours, testResult, resultComments) 
VALUES 
('001', '2022-01-19 12:30:00', '2022-01-19 15:30:00', 3.00, 'Pass', 'All good mate'), /* 1 */
('001', '2022-01-19 15:30:00', '2022-01-19 16:30:00', 1.00, 'Pass', 'Sweet as'), /* 2 */
('002', '2022-01-18 09:00:00', '2022-01-18 11:00:00', 2.00, 'Pass', 'Easy'), /* 3 */
('003', '2022-01-01 05:00:00', '2022-01-01 17:00:00', 12.00, 'Pass', 'Thanks for that...'), /* 4 */
('004', '2022-01-16 13:00:00', '2022-01-16 13:30:00', 0.30, 'Fail', 'Yeah nah nah nah...'); /* 5 */


INSERT INTO Test 
(testID, testName) 
VALUES
(001, 'Engine Maintenance'),
(002, 'Stress Fracture Inspection'),
(003, 'Fuel Line Inspection'),
(004, 'Pilot Seat Inspection'),
(005, 'Plumbing Inspection');


INSERT INTO TestItem /* itemCode as AI PK */
(ItemName, testResult, testID) 
VALUES 
('Engine start and run up according to AFM procedures', 'Pass', 001), /* 1 */
('Poking Panels', 'Pass', 002), /* 2 */
('Tube Checking', 'Fail', 003), /* 3 */
('Touching Cloth', 'Pass', 004), /* 4 */
('Plumbing Inspection', 'Pass', 005); /* 5 */


INSERT INTO TestItemTestEvent 
(testEventID, itemCode, testID) 
VALUES 
(1, 1, 001),
(2, 2, 002),
(3, 3, 003),
(4, 4, 004),
(5, 5, 005);

INSERT INTO QualifiedTechnician 
(Technician_employeeID, trainingID, completionStatus) 
VALUES 
(1, 0123, 'Complete'),
(1, 0124, 'Complete'),
(2, 0123, 'Complete'),
(3, 0125, 'Complete'),
(4, 0126, 'Complete');


INSERT INTO TechnicianTestItemTestEvent 
(employeeID, testEventID, itemCode, testID) 
VALUES 
(1, 1, 1, 001),
(1, 2, 2, 002),
(2, 3, 3, 003),
(3, 4, 4, 004), /* 'L380 */
(4, 5, 5, 005);


INSERT INTO AircraftModel_QualifiedTechnician 
(modelID, Technician_employeeID, trainingID) 
VALUES 
('A380', 1, 0123),
('B737', 1, 0124),
('L380', 3, 0125),
('R880', 4, 0126),
('A380', 2, 0123);


INSERT INTO Airline_Aircraft 
(airlineID, aircraftID, dateOwned) 
VALUES 
('QA', '001', '2023-05-19'),
('BO', '002', '2023-05-18'),
('LM', '003', '2023-05-17'),
('RT', '004', '2023-05-16'),
('NG', '005', '2023-05-15');