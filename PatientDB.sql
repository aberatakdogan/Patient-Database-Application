
create table Treatment(

Treatment_No integer not null primary key,
Treatment_Type varchar(30),
Treatment_Duration varchar(30),
Treating_Doctor varchar(40),
Start_Date Date

);


create table Diagnosis(

Diagnosis_ID integer not null primary key,
Diagnosis_Name varchar(30),
Diagnostic_Device varchar(30),
Tumor_Type varchar(30)
);


create table Patient(

ID integer not null primary key,
Patient_Name varchar(40),
Patient_Surname varchar(40),
Patient_Gender varchar(1),
Patient_Nationality varchar(40),
Birth_Date Date,
Patient_Height varchar(20),
Patient_Weight varchar(20),
Status varchar(40),
Treatment_Num integer,
Diagnosis_Num integer,
foreign key(Treatment_Num) references Treatment(Treatment_No),
foreign key(Diagnosis_Num) references Diagnosis(Diagnosis_ID)


);


create table Appointment(

Appointment_ID varchar(10) not null primary key,
Appointment_Unit varchar(40),
Appointment_Date Date,
Hospital varchar(40),
Patient_ID integer,
foreign key(Patient_ID) references Patient(ID)

);

create table ContactInformation(

Address_ID varchar(10) not null primary key,
Country varchar(30),
City varchar(30),
Postal_Code varchar(30),
Full_Address varchar(100),
Patient_Phone_Num varchar(11),
Patient_Mail varchar(30),
Patient_ID integer,
foreign key(Patient_ID) references Patient(ID)


);


insert into Treatment(Treatment_No, Treatment_Type, Treatment_Duration,  Treating_Doctor, Start_Date)
values
(10, 'Electrochemotherapy', '1 Session','Doctor_1', '2021/07/10'),
(20, 'Chemotherapy', '6 Sessions', 'Doctor_2', '2018/02/16'),
(30, 'Chemotherapy', '6 Session', 'Doctor_3', '2015/09/06'),
(40, 'Electrochemotherapy', '1 Session', 'Doctor_4', '2013/01/19'),
(50, 'Chemotherapy', '6 Session', 'Doctor_5', '2017/04/25'),
(60, 'Electrochemotherapy', '1 Session', 'Doctor_1', '2016/08/15'),
(70, 'Chemotherapy', '6 Sessions', 'Doctor_2', '2019/05/16'),
(80, 'Chemotherapy', '6 Session', 'Doctor_5', '2015/09/08');

insert into Diagnosis(diagnosis_id,diagnosis_name,diagnostic_device,tumor_type)
values
(100, 'Skin Cancer', 'MR', 'Benign'),
(200, 'Breast Cancer', 'MR', 'Malignant'),
(300, 'Lung Cancer', 'MR,PET-CT', 'Benign'),
(400, 'Skin Cancer', 'MR', 'Premalignant'),
(500, 'Colon Cancer', 'US,MR,PET ', 'Benign');


insert into patient(id, patient_name, patient_surname, patient_gender, patient_nationality, birth_date, patient_height, patient_weight, status, treatment_num, diagnosis_num)
values
(1, 'A**','Y*****','M','TC', '1950/06/11','165 cm','90 kg', 'Teacher', 10, 100 ),
(2, 'A***','K***','F','TC', '1960/03/22','160 cm','70 kg', 'Officer', 20, 200 ),
(3, 'Z*****','Ö*','F','TC', '1958/04/17','158 cm','60 kg', 'Lawyer', 30, 300 ),
(4, 'M*****','D****','M','TC', '1962/10/18','175 cm','90 kg', 'Engineer', 40, 400 ),
(5, 'K****','D****','M','TC', '1955/08/26','168 cm','80 kg', 'Dentist', 50, 500 ),
(6, 'H****','A*****','M','TC','1953/07/05','172 cm','92 kg','Lawyer',60,400),
(7, 'E***','Þ****','F','TC', '1948/11/06','155 cm', '67 kg', 'Pharmacist',70,300),
(8, 'E****', 'A****', 'F', 'TC', '1956/09/19', '163 cm', '68 kg', 'Teacher', 30,200),
(9, 'T*****', 'Ç****', 'M', 'TC', '1959/01/01', '159 cm', '62 kg', 'Engineer', 40, 100),
(10, 'F*****', 'K******', 'F', 'TC', '1950/08/25','154 cm','55 kg','Teacher', 80, 200);


insert into appointment(appointment_id, appointment_unit, appointment_date, hospital, patient_id)
values
('A1', 'Oncology', '2021/07/01', 'Medical Park Hospital',1),
('A2', 'Oncology', '2018/01/25', 'Lokman Hekim Hospital',2),
('A3', 'Oncology', '2015/08/11', 'Hacettepe University Hospital',3),
('A4', 'Oncology', '2012/12/21', 'Medical Park Hospital',4),
('A5', 'Oncology', '2017/03/16', 'Lokman Hekim Hospital',5),
('A6', 'Oncology', '2016/07/11', 'Medical Park Hospital',6),
('A7', 'Oncology', '2019/04/10', 'Hacettepe University Hospital',7),
('A8', 'Oncology', '2015/08/26', 'Lokman Hekim Hospital',8),
('A9', 'Oncology', '2013/01/02', 'Medical Park Hospital',9),
('A10', 'Oncology', '2015/09/01', 'Hacettepe University Hospital',10);


insert into contactinformation(address_id, country, city, postal_code, full_address, patient_phone_num, patient_mail, patient_id)
values
('AD1', 'Turkey', 'Ankara', '06530', '06530/Çankaya/Ankara', '05012033545', 'a**.y*****@hotmail.com', 1),
('AD2', 'Turkey', 'Ankara', '06300', '06300/Keçiören/Ankara', '05023034555', 'a***.k***@hotmail.com', 2),
('AD3', 'Turkey', 'Ankara', '06830', '06830/Gölbaþý/Ankara', '05034035565', 'z*****.o*@hotmail.com', 3),
('AD4', 'Turkey', 'Ankara', '06530', '06530/Çankaya/Ankara', '05044036575', 'm*****.d*****@hotmail.com', 4),
('AD5', 'Turkey', 'Ankara', '06560', '06560/Yenimahalle/Ankara', '05055037585', 'k*****.d****@hotmail.com', 5),
('AD6', 'Turkey', 'Ankara', '06760', '06760/Çubuk/Ankara', '05056038595', 'h****.a******@hotmail.com', 6),
('AD7', 'Turkey', 'Ankara', '06300', '06300/Keçiören/Ankara', '05076038585', 'e***.****@hotmail.com', 7),
('AD8', 'Turkey', 'Ankara', '06560', '06560/Yenimahalle/Ankara', '05087037585', 'e*****.a****@hotmail.com', 8),
('AD9', 'Turkey', 'Ankara', '06890', '06890/Kýzýlcahamam/Ankara', '05098037585', 't*****.c****@hotmail.com', 9),
('AD10', 'Turkey', 'Ankara', '06530', '06530/Çankaya/Ankara', '05305037542', 'f*****.k*@hotmail.com', 10);

--List all treatments with treatment number, treatment type, treatment duration, treating doctor, and start date information.
select *
from treatment;

--List all diagnosis with diagnosis id, diagnosis name, diagnostic device, and tumor type information.
select *
from diagnosis;

--List all patients with their id, name, surname, gender, nationality, birth date, height, weight, status, treatment number, and diagnosis number information. 
select *
from patient;

--List all appointments with appointment id, appointment unit, appointment date, hospital, and patient id information.
select *
from appointment;

--List all contact information of patients with their address id, country, city, postal code, full address, phone number, mail address, and id number information.
select *
from contactinformation;  

--List all patients who get chemotherapy treatment.
select *
from patient natural join treatment
where patient.treatment_num = treatment.treatment_no and treatment_type='Chemotherapy';

--List all patients whose diagnosis are lung cancer.
select *
from patient natural join diagnosis
where patient.diagnosis_num = diagnosis.diagnosis_id and diagnosis_name='Lung Cancer';

--List all information of patients and their contact information.
select *
from patient natural join contactinformation
where contactinformation.patient_id = patient.id ;

