

Create Table Dealer(
	DID varchar(5),
	DEALERS_NAME varchar(50),
	CONSTRAINT Deald_DID PRIMARY KEY (DID)
);


Create Table Customer(
  CID varchar(5),
  NAME VARCHAR(50) not null,
  CONSTRAINT Customer_CID UNIQUE (CID),
  CONSTRAINT Customer_CID PRIMARY KEY (CID)

);


Create Table Record(
  R_ID varchar(5),
  DID varchar(5),
  PRICE NUMERIC(5,0) CHECK (PRICE>0),
  CID VARCHAR(5),
  CONSTRAINT Record_R_ID PRIMARY KEY (R_ID),
  CONSTRAINT Record_DID FOREIGN KEY (DID) REFERENCES Dealer(DID),
  CONSTRAINT Record_CID FOREIGN KEY (CID) REFERENCES Customer(CID)
  ON DELETE CASCADE
	ON UPDATE CASCADE

);

Create Table Extras(
  EXTRAS_ID varchar(5),
  AUTO NUMERIC(1,0),
  EXTRA_HORSE_POWER NUMERIC(1,0),
  CONSTRAINT Extras_EXTRAS_ID PRIMARY KEY (EXTRAS_ID)
);

Create Table Vehicle(
  VIN varchar(5),
  MODEL_NAME varchar(10),
  OWNER_ID varchar(5),
  RECORD_ID varchar(5),
  EXTRAS_ID varchar(5),
  VEHICLE_BRAND VARCHAR(10),
  CONSTRAINT Vehicle_VIN PRIMARY KEY (VIN),
  CONSTRAINT Vehicle_CUSTOMER_ID FOREIGN KEY (OWNER_ID) REFERENCES Customer(CID) 
	ON DELETE CASCADE
	ON UPDATE CASCADE,
  CONSTRAINT Vehicle_RECORD_ID FOREIGN KEY (RECORD_ID) REFERENCES Record(R_ID) 
	ON DELETE CASCADE
	ON UPDATE CASCADE,
  CONSTRAINT Vehicle_EXTRAS_ID FOREIGN KEY (EXTRAS_ID) REFERENCES Extras(EXTRAS_ID)
        ON DELETE CASCADE
	ON UPDATE CASCADE
 );


insert into Dealer values ('KO323', 'AGELLOU');
insert into Dealer values ('KO324', 'MOSCHOLIOS');
insert into Dealer values ('KO325', 'KONSTAS');
insert into Dealer values ('KO326', 'PIPERIDIS');


insert into Customer values ('SAD32', 'PROKOPIOU');
insert into Customer values ('WAR33', 'STAMATIADIS');
insert into Customer values ('OPR12', 'STAMOU');
insert into Customer values ('OPR14', 'GALIFIANAKIS');
insert into Customer values ('SAD70', 'MALAMOS');


insert into Record values ('435IL', 'KO323','16000', 'SAD32');
insert into Record values ('435KL', 'KO324','17000', 'WAR33');
insert into Record values ('435ZK', 'KO325','21000', 'OPR12');
insert into Record values ('435PK', 'KO326','12000', 'OPR14');
insert into Record values ('435WR', 'KO324','15500', 'SAD70');


insert into Extras values ('extr1', '0', '0');
insert into Extras values ('extr2', '0','1');
insert into Extras values ('extr3','1','0');
insert into Extras values ('extr4','1','1');

insert into Vehicle values ('IKI12', 'XF', 'SAD32','435IL','extr1','Jaguar');
insert into Vehicle values ('IKP13', 'Punto', 'WAR33','435KL','extr2','Fiat');
insert into Vehicle values ('ZSR14', 'Yaris', 'OPR12','435ZK','extr3','Toyota');
insert into Vehicle values ('HTR15', 'X5', 'OPR14','435PK','extr4','Bmw');
insert into Vehicle values ('IKI80', 'Brava', 'SAD70','435WR','extr2','Fiat');


