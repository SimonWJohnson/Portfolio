-- CREATE OBJECT TYPE --
create or replace type model_type as object(
    ModelName varchar2(10),
    Manufacture varchar2(20)
) not final;

create type submodel_type under model_type(
    SubModelName varchar2(10),
    MaxTakeOffWeight number(8),
    CruisingRange number(8),
    WingSpan number(8),
    Height number(8,2)
) not instantiable not final;

create type passengersubmodel_type under submodel_type(
    MaxNoOfPassengers number(8)
);

create type cargosubmodel_type under submodel_type(
    MaxCargoWeight number(8)
);

create type airline_type as object(
  	AirlineCode varchar2(8),
	AirlineName varchar2(25)  
);

create type aircraft_type as object(
    Submodel ref submodel_type,
	Airline ref airline_type,
	AirCraftID number(8),
	AirCraftName  varchar2(25)
);

-- CREATE TABLES --
create table model_table of model_type;
create table passengersubmodel_table of passengersubmodel_type;
create table cargosubmodel_table of cargosubmodel_type;
create table aircraft_table of aircraft_type(AircraftID not null);
create table airline_table of airline_type(AirlineCode not null);

-- ASSIGN PRIMARY AND FOREIGN KEYS --
alter table aircraft_table ADD (CONSTRAINT aircraftid_pk PRIMARY KEY (aircraftid));
alter table airline_table ADD (CONSTRAINT airlinecode_pk PRIMARY KEY (airlinecode));
alter table model_table ADD constraint model_pk primary key(modelname, manufacture);
alter table cargosubmodel_table ADD (CONSTRAINT cargosubmodel_pk PRIMARY KEY (modelname, manufacture, submodelname));
alter table passengersubmodel_table ADD (CONSTRAINT passengersubmodel_pk PRIMARY KEY (modelname, manufacture, submodelname));

alter table cargosubmodel_table add constraint cargo_model_fk 
  foreign key(modelname, manufacture)
  references model_table(modelname, manufacture);

alter table passengersubmodel_table add constraint passenger_model_fk 
    foreign key(modelname, manufacture) 
    references model_table(modelname, manufacture);

-- INSERT INTO --
-- Airline --
INSERT INTO airline_table
VALUES('AR01', 'Airline 1');

INSERT INTO airline_table
VALUES('AR02', 'Airline 2');

INSERT INTO airline_table
VALUES('AR03', 'Airline 3');

select * from airline_table;

-- Model --
INSERT INTO model_table
VALUES('737', 'Boeing');

INSERT INTO model_table
VALUES('747', 'Boeing');

INSERT INTO model_table
VALUES('767', 'Boeing');

select * from model_table;

-- CargoSubModel --
INSERT INTO cargosubmodel_table
VALUES('737', 'Boeing', 'LightCargo', 5000, 500, 75, 40, 200);

INSERT INTO cargosubmodel_table
VALUES('767', 'Boeing', 'MedCargo', 8000, 500, 75, 40, 350);

INSERT INTO cargosubmodel_table
VALUES('747', 'Boeing', 'HeavyCargo', 11000, 500, 75, 40, 700);

select * from cargosubmodel_table;

-- PassengerSubModel --
INSERT INTO passengersubmodel_table 
VALUES('737', 'Boeing', 'LightPass', 5000, 500, 75, 40, 200);

INSERT INTO passengersubmodel_table 
VALUES('767', 'Boeing', 'MedPass', 8000, 500, 75, 40, 350);

INSERT INTO passengersubmodel_table 
VALUES('747', 'Boeing', 'HeavyPass', 11000, 500, 75, 40, 700);

select * from passengersubmodel_table;
-- Aircraft --

INSERT INTO aircraft_table
VALUES((SELECT REF(s) from passengersubmodel_table s WHERE s.modelname = '737' AND s.manufacture = 'Boeing' AND s.submodelname = 'LightPass'),
    (SELECT REF(a) from airline_table a WHERE a.airlinecode = 'AR01'),
    1, 'Pass1');

INSERT INTO aircraft_table
VALUES((SELECT REF(s) from passengersubmodel_table s where s.modelname = '747' and s.manufacture = 'Boeing' AND s.submodelname = 'HeavyPass'),
    (SELECT REF(a) from airline_table a where a.airlinecode = 'AR01'),
    2, 'Pass2');

INSERT INTO aircraft_table 
    VALUES ((SELECT REF(s) from cargosubmodel_table s where s.modelname = '767' and s.manufacture = 'Boeing' and s.submodelname = 'MedCargo'),
	(SELECT REF(a) from airline_table a where a.airlinecode = 'AR02'),
	3, 'Cargo1');