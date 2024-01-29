/* all values used to insert are dummy values*/
/*------------------------------------------Create database EMS--------------------------------------------*/
create database EMS;
/*--------------------------------------Create Service_Provider Table-------------------------------------*/
use EMS;
create table Service_Provider(
    Supplier_Id Int identity(1,1) primary key,
    Supplier_Name Varchar(50) not null,
    Supplier_Email Varchar(50) not null,
    Supplier_Contact Varchar(10) not null
);
/*--------------------------------------------Create table Region--------------------------------------------*/
create table Region(
    Region_Id int identity(1,1) primary key,
    Region_Name varchar(50) not null
);
/*----------------------------------------------Create table Customers-------------------------------------*/

create table Customers(
Customer_Id int identity(1,1) primary key,
Customer_FName varchar(50) not null,
Customer_LName varchar(50) not null,
Customer_Email varchar(50) not null,
Customer_Contact varchar(10) not null,
Customer_Location varchar(150) not null,
Supplier_Id int not null,
Region_Id int not null,
Enrolledfor_Autopayments bit default 0 not null,
foreign key(Supplier_Id) references Service_Provider(Supplier_Id),
foreign key(Region_Id) references Region(Region_Id)
);
/*------------------------------------------Create Maintenance_Requests Table--------------------------*/
create table Maintenance_Requests(
    Maintenancerequest_Id int identity(1,1) primary key,
    Supplier_Id int not null,
    Region_Id int default null,
    Customer_Id int default null,
    Maintenancerequest_Date date not null,
    Description varchar(500) default' ',
    foreign key(Supplier_Id) REFERENCES Service_Provider(Supplier_Id)
);
/*---------------------------------------------Create Meter_Readings Table-------------------------------*/
create table  Meter_Readings(
    Meter_Id int identity(1000,1) primary key,
    Customer_Id int not null,
    Meter_Readings decimal(9,2) default 0.00,
    Readings_Date date not null,
    foreign key(Customer_Id) references Customers(Customer_Id)
);
/*---------------------------------------------Create Auto_Payments Table-------------------------------*/
create table Auto_Payments(
    Autopayment_Id int identity(1,1) primary key,
    Customer_Id int unique not null,
    Card_Type varchar(25) not null,
    Card_Number varchar(19) not null unique,
    Expiry_Date Date not null,
    CVV int not null,
    Billing_Address varchar(250) not null,
    foreign key(Customer_Id) REFERENCES Customers(Customer_Id)
);
/*---------------------------------------------Create Billing Table-------------------------------*/
create table Billing(
    Billing_Id int identity(1,1) primary key,
    Billing_Amount decimal(9,2) default 0.00,
    Customer_Id int unique not null,
    Total_Consumption decimal(9,2) default 0.00,
    Supplier_Id int not null,
    Billing_Date date,
    foreign key(Customer_Id) references Customers(Customer_Id)
);
/*--------------------------------------------- Reminders Table-------------------------------*/
create table Reminders(
    Reminder_Id int identity(100,1) primary key,
    Reminder varchar(250) default 'No reminders or changed reminder preferences',
    Customer_Id int not null,
    foreign key(Customer_Id) REFERENCES Customers(Customer_Id)
);
/*----------------------------------------------Usage_History Table-------------------------------*/
create table Usage_History(
    Usage_Id int identity(1,1) primary key,
    Customer_Id int not null,
    Bill_Generated_Date date not null,
    Bill_payment_Date date not null,
    Total_Amount decimal(9,2),
    Total_Consumption decimal(9,2),
    foreign key(Customer_Id) references Customers(Customer_Id)
);


/*------------------------------------Insert values  to Service_Provider Table---------------------------*/
use EMS;
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Reliant','8332359653','info@reliant.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Oncor','8263758293','info@oncor.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Compare Power','8462758364','info@comparepowwer.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Amigo Power','9162553475','info@Amigopower.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Ampra Energy','7253856495','info@amprapower.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Energy Texas','8371698365','info@energytexas.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Tara energy','7239476849','info@taraenergy.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Onver Power','5837469382','info@onverpower.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Tata Powers','8385945848','info@tatapower.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Cupa power','5837485737','info@cupapower.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('Zampa Distributions','4938572647','info@zampadistributions.com');
insert into service_provider(Supplier_Name,Supplier_Contact,Supplier_EMail)
values('spectrum powers','9472837485','info@tspectrumpowers.com');
/*---------------------------------------Inserting values into Region table--------------------------------*/
insert into Region values('Denton');
insert into Region values('Dallas');
insert into Region values('Houston');
insert into Region values('Austin');
insert into Region values('Irving');
insert into Region values('Plano');
insert into Region values('Frisco');
insert into Region values('Fort-worth');
insert into Region values('Lewisville');
insert into Region values('Phoenix');
/*----------------------------------------Inserting values into Customers table---------------------------*/
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Raghu','nandhan','4857362847','raghu@gmail.com','union circle, denton, tx',1,1,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('ram','charan','4837285674','ram@gmail.com','oaks of denton, denton, TX',3,1,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Email,Customer_Contact,Customer_Location,Supplier_Id,Region_Id)
values('Rishi','kumar','rishi@gmail.com','8573746385','valley ranch pkwy, Irving, TX',1,5);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('priya','chandran','9472847364','pricha@gmail.com','oaks at valley ranch, Irving, Tx',2,5,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Sruthi','Kiran','9263828462','kiran@gmail.com','Swadeshi plaza, Irving, TX',4,5,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Cristina','Rose','6284638472','cristina@gmail.com','Wilmington pkwy, Fort-worth, Tx',4,8,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Ronald','Wright','7483648264','ronald@gmail.com','Dallas pkwy, dallas, Tx',6,2,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Terissa','Tim','9273846284','teressa@gmail.com','Loscolinas pkwy, houston, Tx',5,3,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Mike','Tong','9374738472','Mike@gmail.com','Spring valley rd,plano, Tx',3,6,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Tom','Crissey','8284637463','Tom@gmail.com','Spring valley rd,plano, Tx',2,6,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Micheal','Tom','8264927482','Micheal@gmail.com','Montfort dr, frisco, Tx',1,7,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Pavan','Naini','9405959573','pavan@gmail.com','Ioof St, Houston, Tx',9,3,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Kalyan','Tinku','9890987890','tinku@gmail.com','Bernald St denton, Tx',1,1,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Kiran Kumar','Mintu','9309439890','kirankumar@gmail.com','lebin street, lw',7,9,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Adam','Smith','9453245679','adamsmith@gmail.com','Teasley Lane,Ph',7,10,12);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Anvar','mith','8293746738','anvar@gmail.com','Timber st, Lewisville, Tx',11,9,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('cane','walter','3947584839','cane@gmail.com','Twistley rd,Frisco,Tx',10,7,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Kane','county','5928385858','kane@gmail.com','winter ln, Plano, Tx',8,6,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Ruth','ranger','7838485868','ruth@gmail.com','Rinder pkwy, Dallas, Tx',6,2,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Birkey','wing','8273648573','birkey@gmail.com','oaks of denton, Denton, Tx',11,1,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('king','william','7394829485','kingwilliam@gmail.com','trails of austin, Austin,Tx',12,4,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('ram','singh','8483847275','ramsingh@gmail.com','lukes of fort-worth, Fort-worth, Tx',9,8,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Trint','bing','8938475837','trinth@gmail.com','churchy st, Phoenix, Tx',5,10,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('wright','wrong','8394388484','wright@gmail.com','trinty ln, Denton, Tx',8,1,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('miller','wright','8273645273','miller@gmail.com','west street ln, Irving, Tx',9,5,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Anil','kumbley','7483746574','kumbley@gmail.com','Timber west ln, Austin, Tx',2,4,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('virat','rona','7384958274','virat@gmail.com','valley pkwy E, Plano, Tx',4,6,1);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('vikranth','rana','8938485828','vikranth@gmail.com','ruster rd, Fort-worth, Tx',8,8,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('Ringer','rale','8394727475','ringer@gmail.com','winster pkwy, Austin, Tx',10,4,0);
insert into Customers(Customer_FName,Customer_LName,Customer_Contact,Customer_Email,Customer_Location,Supplier_Id,Region_Id,Enrolledfor_Autopayments)
values('stella','fring','9284837475','stella@gmail.com','oaks of Phoenix, Phoenix, Tx',11,10,0);
/*--------------------------------Inserting values into Maintenance_Requests Table-------------------*/
insert into Maintenance_Requests(Supplier_Id,Maintenancerequest_Date,[Description])
values(2,'2023-06-22','Maintenance is scheduled at the supplier end annually');
insert into Maintenance_Requests
values(1,5,4,'2023-08-23','Request for Installation of meter');
insert into Maintenance_Requests
values(1,1,1,'2023-06-12','Request for Installation of meter');
insert into Maintenance_Requests(Supplier_Id,Maintenancerequest_Date,[Description])
values(5,'2023-08-11','Maintenance is scheduled at the supplier end annually');
insert into Maintenance_Requests
values(4,8,6,'2023-04-23','Request for Installation of meter');
insert into Maintenance_Requests
values(6,2,7,'2023-10-05','Request for Installation of meter');
insert into Maintenance_Requests
values(5,3,8,'2023-09-02','Request for Installation of meter');
insert into Maintenance_Requests
values(2,6,10,'2023-08-06','Request for Installation of meter');
insert into Maintenance_Requests
values(1,7,11,'2023-10-01','Request for Installation of meter');
insert into Maintenance_Requests
values(1,1,13,'2023-12-02','Request for Installation of meter');
insert into Maintenance_Requests
values(7,10,15,'2023-11-04','Request for change of meter');
insert into Maintenance_Requests
values(10,7,17,'2023-08-13','Request for Installation of meter');
insert into Maintenance_Requests(Supplier_Id,Maintenancerequest_Date,[Description])
values(3,'2023-11-10','Maintenance is scheduled at the supplier end annually');
insert into Maintenance_Requests
values(6,12,19,'2023-09-12','Request for change of meter');
insert into Maintenance_Requests
values(11,1,20,'2023-08-13','Request for Installation of meter');
insert into Maintenance_Requests
values(9,8,22,'2023-10-04','Request for change of meter');
insert into Maintenance_Requests
values(5,10,23,'2023-11-13','Request for Installation of meter');
insert into Maintenance_Requests
values(2,4,26,'2023-09-06','Request for change of meter');
insert into Maintenance_Requests
values(8,8,28,'2023-08-03','Request for Installation of meter');
insert into Maintenance_Requests
values(10,4,29,'2023-07-12','Request for Installation of meter');
/*----------------------------------Inserting values into Meter_Readings Table-------------------------*/
insert into Meter_Readings
values(1,23.56,'2023-11-20');
insert into Meter_Readings
values(2,13.27,'2023-11-20');
insert into Meter_Readings
values(3,20.46,'2023-11-20');
insert into Meter_Readings
values(4,32.76,'2023-11-20');
insert into Meter_Readings
values(5,53.2,'2023-11-20');
insert into Meter_Readings
values(6,49.5,'2023-11-20');
insert into Meter_Readings
values(7,42.3,'2023-11-20');
insert into Meter_Readings
values(8,64.2,'2023-11-20');
insert into Meter_Readings
values(9,40.3,'2023-11-20');
insert into Meter_Readings
values(10,54.5,'2023-11-20');
insert into Meter_Readings
values(11,46.7,'2023-11-20');
insert into Meter_Readings
values(12,34.4,'2023-11-20');
insert into Meter_Readings
values(13,10.1,'2023-11-20');
insert into Meter_Readings
values(14,19.2,'2023-11-20');
insert into Meter_Readings
values(15,43.2,'2023-11-20');
insert into Meter_Readings
values(16,53.5,'2023-11-20');
insert into Meter_Readings
values(17,23.27,'2023-11-20');
insert into Meter_Readings
values(18,22.46,'2023-11-20');
insert into Meter_Readings
values(19,22.76,'2023-11-20');
insert into Meter_Readings
values(20,12.51,'2023-11-20');
insert into Meter_Readings
values(21,33.56,'2023-11-20');
insert into Meter_Readings
values(22,23.27,'2023-11-20');
insert into Meter_Readings
values(23,25.46,'2023-11-20');
insert into Meter_Readings
values(24,22.76,'2023-11-20');
insert into Meter_Readings
values(25,16.51,'2023-11-20');
insert into Meter_Readings
values(26,31.76,'2023-11-20');
insert into Meter_Readings
values(27,19.27,'2023-11-20');
insert into Meter_Readings
values(28,27.46,'2023-11-20');
insert into Meter_Readings
values(29,37.76,'2023-11-20');
insert into Meter_Readings
values(30,19.51,'2023-11-20');
/*----------------------------------Inserting values into Auto_Payments Table-------------------------*/
insert into Auto_Payments
values(1,'credit','4783927594716258','2024-02-01',346,'union circle');
insert into Auto_Payments
values(4,'debit','8264857102859374','2025-12-01',153,'oaks at valley ranch');
insert into Auto_Payments
values(6,'Debit','5263846273849270','2025-12-01',134,'Wilmington pkwy, Fort-worth, tx');
insert into Auto_Payments
values(8,'debit','8263745261846370','2026-04-01',143,'Loscolinas pkwy, houston, tx');
insert into Auto_Payments
values(11,'debit','8394728463746370','2024-03-01',256,'Montfort dr, frisco, tx');
insert into Auto_Payments
values(12,'Credit','12345','2027-01-01',123,'Ioof st,tx');
insert into Auto_Payments
values(14,'Debit','2341234564332','2030-11-01',533,'lebin street, lw');
insert into Auto_Payments
values(15,'Credit','234567812234','2025-12-01',324,'bernard street,denton');
insert into Auto_Payments
values(16,'credit','2150816150957480','2031-01-01',587,'Discovery park dr');
insert into Auto_Payments
values(17,'credit','4838485969485860','2024-07-01',564,'Twistley rd,Frisco,Tx');
insert into Auto_Payments
values(18,'debit','9483847562736450','2025-06-01',498,'winter ln, Plano, Tx');
insert into Auto_Payments
values(23,'credit','2938485862949280','2024-08-01',734,'churchy st, Phoenix, Tx');
insert into Auto_Payments
values(27,'debit','7374859384759280','2027-11-01',435,'valley pkwy E, Plano, Tx');
/*----------------------------------Inserting values into Billing Table-------------------------*/
insert into Billing
values(56.45,1,134.45,1,'2023-11-03');
insert into Billing
values(43.25,2,108.42,2,'2023-11-03');
insert into Billing
values(72.34,3,184.3,1,'2023-11-03');
insert into Billing
values(38.34,4,90.2,2,'2023-11-03');
insert into Billing
values(58.45,5,105.32,4,'2023-11-03');
insert into Billing
values(52.2,6,105.36,4,'2023-11-03');
insert into Billing
values(48.4,7,89.9,6,'2023-11-03');
insert into Billing
values(72.2,8,130.36,5,'2023-11-03');
insert into Billing
values(44.43,9,82.6,3,'2023-11-03');
insert into Billing
values(54.9,10,103.5,2,'2023-11-03');
insert into Billing
values(48.89,11,86.76,1,'2023-11-03');
insert into Billing
values(50.55,12,75,9,'2023-11-03');
insert into Billing
values(12,13,31,1,'2023-11-03');
insert into Billing
values(45,14,12,7,'2023-11-03');
insert into Billing
values(94,15,56,7,'2023-11-03');
insert into Billing
values(100,16,200,11,'2023-11-03');
insert into Billing
values(86.65,17,164.6,10,'2023-11-03');
insert into Billing
values(46.87,18,128.8,8,'2023-11-03');
insert into Billing
values(55.23,19,104.45,6,'2023-11-03');
insert into Billing
values(37.87,20,74.45,11,'2023-11-03');
insert into Billing
values(64.57,21,124.45,12,'2023-11-03');
insert into Billing
values(37.43,22,84.55,9,'2023-11-03');
insert into Billing
values(42.45,23,90.43,5,'2023-11-03');
insert into Billing
values(39.78,24,80.15,8,'2023-11-03');
insert into Billing
values(37.67,25,82.55,9,'2023-11-03');
insert into Billing
values(46.23,26,101.86,2,'2023-11-03');
insert into Billing
values(48.65,27,96.23,4,'2023-11-03');
insert into Billing
values(39.78,28,92.45,8,'2023-11-03');
insert into Billing
values(52.78,29,108.36,10,'2023-11-03');
insert into Billing
values(49.67,30,103.28,11,'2023-11-03');
/*----------------------------------Inserting values into Reminders Table-------------------------*/
insert into Reminders
VALUES('Your bill has paid usig autopayment method',1);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',2);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',3);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',4);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',5);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',6);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',7);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',8);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',9);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',10);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',11);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',12);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',13);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',14);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',15);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',16);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',17);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',18);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',19);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',20);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',21);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',22);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',23);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',24);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',25);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',26);
insert into Reminders
VALUES('Your bill has paid usig autopayment method',27);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',28);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',29);
insert into Reminders
VALUES('Your generated bill was due on 11/20/2023',30);
/*----------------------------------Inserting values into Usage_History Table-------------------------*/
insert into Usage_History
values(1,'2023-10-3','2023-10-18',56.78,126.54);
insert into Usage_History
values(1,'2023-09-3','2023-09-15',53.18,106.54);
insert into Usage_History
values(1,'11/3/2023','11/6/2023',46.77,92.5);

insert into Usage_History
values(2,'2023-10-3','2023-10-18',46.78,88.54);
insert into Usage_History
values(2,'11/3/2023','11/12/2023',36.77,72.5);

insert into Usage_History
values(3,'11/3/2023','11/11/2023',33.7,66.9);

insert into Usage_History
values(4,'11/3/2023','11/6/2023',20.3,40.6);

insert into Usage_History
values(5,'2023-10-3','2023-10-18',36.3,70.1);
insert into Usage_History
values(5,'11/3/2023','11/07/2023',36.5,70.2);

insert into Usage_History
values(6,'11/3/2023','11/6/2023',33.6,67.3);

insert into Usage_History
values(7,'11/3/2023','11/08/2023',29.6,60.4);

insert into Usage_History
values(8,'11/3/2023','11/6/2023',39.5,80.4);

insert into Usage_History
values(9,'11/3/2023','11/15/2023',60.3,130.4);

insert into Usage_History
values(10,'11/3/2023','11/8/2023',53.5,104.3);

insert into Usage_History
values(11,'2023-10-3','2023-06-18',44.7,95.6);
insert into Usage_History
values(11,'11/3/2023','11/6/2023',50.4,100.8);

insert into Usage_History
values(12,'2023-10-3','2023-06-18',39.5,80.9);
insert into Usage_History
values(12,'2023-09-3','2023-06-15',37.8,75.8);
insert into Usage_History
values(12,'11/3/2023','11/6/2023',41.7,90.2);

insert into Usage_History
values(13,'11/3/2023','11/13/2023',33.33,66.66);

insert into Usage_History
values(14,'11/3/2023','11/6/2023',42.27,82.7);

insert into Usage_History
values(15,'2023-10-3','2023-06-18',52.5,102.54);
insert into Usage_History
values(15,'11/3/2023','11/6/2023',37.77,82.54);

insert into Usage_History
values(16,'11/3/2023','11/6/2023',66.77,122.5);

insert into Usage_History
values(17,'2023-10-3','2023-06-18',37.5,60.5);
insert into Usage_History
values(17,'2023-09-3','2023-06-15',35.9,69.9);
insert into Usage_History
values(17,'11/3/2023','11/6/2023',35.7,69.8);

insert into Usage_History
values(18,'11/3/2023','11/08/2023',37.9,77.8);

insert into Usage_History
values(19,'2023-10-3','2023-07-18',41.5,92.4);
insert into Usage_History
values(19,'11/3/2023','11/05/2023',34.9,74.3);

insert into Usage_History
values(20,'11/3/2023','11/10/2023',44.4,88.8);

insert into Usage_History
values(21,'11/3/2023','11/15/2023',28.6,52.4);

insert into Usage_History
values(22,'11/3/2023','11/18/2023',34.8,74.6);

insert into Usage_History
values(23,'2023-10-3','2023-06-18',39.6,80.3);
insert into Usage_History
values(23,'2023-09-3','2023-06-15',36.7,71.4);
insert into Usage_History
values(23,'11/3/2023','11/06/2023',38.9,72.4);

insert into Usage_History
values(24,'2023-10-3','2023-11-18',47.4,90.3);
insert into Usage_History
values(24,'11/3/2023','11/6/2023',55.9,112.5);

insert into Usage_History
values(25,'2023-10-3','2023-10-18',44.8,90.5);
insert into Usage_History
values(25,'2023-09-3','2023-09-15',51.7,103.2);
insert into Usage_History
values(25,'11/3/2023','11/12/2023',41.7,83.4);

insert into Usage_History
values(26,'2023-10-3','2023-16-18',37.6,72.4);
insert into Usage_History
values(26,'11/3/2023','11/13/2023',33.6,66.7);

insert into Usage_History
values(27,'2023-10-3','2023-06-18',61.2,120.5);
insert into Usage_History
values(27,'2023-09-3','2023-06-15',41.4,83.2);
insert into Usage_History
values(27,'11/3/2023','11/06/2023',39.5,76.8);

insert into Usage_History
values(28,'2023-10-3','2023-08-18',53.4,101.2);
insert into Usage_History
values(28,'11/3/2023','11/12/2023',28.9,60.2);

insert into Usage_History
values(29,'2023-10-3','2023-09-18',36.7,72.2);
insert into Usage_History
values(29,'11/3/2023','11/15/2023',54.6,102.2);

insert into Usage_History
values(30,'2023-10-3','2023-05-18',45.38,90.5);
insert into Usage_History
values(30,'11/3/2023','11/06/2023',43.34,86.9);


