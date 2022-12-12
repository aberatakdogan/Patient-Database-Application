
import psycopg2
database = psycopg2.connect(user="postgres",
                          password="postgres",
                          host="localhost",
                          port="5432",
                          database="PatientDB")


statement = database.cursor()
print("Connected to PostgreSQL successfully")
print()

print("Choose a number to get information:")
print("1: Lists all patients")
print("2: Inserts a new patient")
print("3: Lists all contact informations of patients")
print("4: Deletes a contact information")
print("5: Updates a phone number in contact information")
print("6: Lists all treatments")
print("7: Inserts a treatment")
print("8: Lists all appointments")
print("9: Inserts an appointment")
print("10:Deletes an appointment")
print("11:Lists all diagnosis")
print("12:Updates a diagnosis")
print("13:Exiting the system")
print()

while(True):


    print("Enter the users choice:")
    choice = int(input())

    if choice==1:

       sql = "SELECT * FROM Patient;"
       statement.execute(sql)

       print("(ID, Name, 'Surname, Gender, Nationality, Birth Date, Height, Weight, Status, Treat Num, Diagnosis Num)")
       list = statement.fetchall()
       for i in list:
           print(i)

    elif choice==2:
        ID = input("ID:")
        Patient_Name = input("Patient Name:")
        Patient_Surname = input("Patient Surname:")
        Patient_Gender = input("Gender:")
        Patient_Nationality = input("Nationality:")
        Birth_Date = input("Birth Date:")
        Patient_Height = input("Height:")
        Patient_Weight = input("Weight:")
        Status = input("Status:")
        Treatment_Num = input("Treatment Number:")
        Diagnosis_Num = input("Diagnosis Number:")



        statement.execute("INSERT INTO Patient(ID,Patient_Name,Patient_Surname,Patient_Gender,Patient_Nationality,Birth_Date,Patient_Height,Patient_Weight,Status,Treatment_Num, Diagnosis_Num) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s )", (ID,Patient_Name,Patient_Surname,Patient_Gender,Patient_Nationality,Birth_Date,Patient_Height,Patient_Weight,Status,Treatment_Num, Diagnosis_Num,))

        database.commit()
        print("Successfully added.")


    elif choice==3:

        sql = "SELECT * FROM ContactInformation;"
        statement.execute(sql)

        print("(Addr ID, Country, City,   Postal Code, Full Address, Patient Phone Num, Patient Mail, Patient ID)")
        list = statement.fetchall()
        for i in list:
          print(i)

    elif choice==4:

        Address_ID = input("Enter the Address_ID of contact information you are going to delete:")

        statement.execute("DELETE FROM ContactInformation WHERE Address_ID= %s", (Address_ID,))

        database.commit()
        print("Successfully deleted.")


    elif choice==5:


        Phone_Num= input("New Phone Number :")
        Address_ID = input("Address_ID :")

        statement.execute("UPDATE ContactInformation SET Patient_Phone_Num=%s Where Address_ID=%s",(Phone_Num,Address_ID,))
        database.commit()
        print("A phone number of patient in contact information has been successfully updated.")



    elif choice==6:
        sql= "SELECT * FROM Treatment;"
        statement.execute(sql)

        print("(Treat No, Treatment Type, Treat Duration, Treat Doctor, Start Date)")
        list = statement.fetchall()
        for i in list:
            print(i)


    elif choice==7:
       Treatment_No = input("Treatment No:")
       Treatment_Type = input("Treatment Type:")
       Treatment_Duration = input("Treatment Duration:")
       Treating_Doctor = input("Doctor:")
       Start_Date = input("Starting Date:")

       statement.execute("""INSERT INTO Treatment(Treatment_No,Treatment_Type,Treatment_Duration,Treating_Doctor,Start_Date) 
               VALUES(%s,%s,%s,%s,%s)
               """, (Treatment_No,Treatment_Type,Treatment_Duration,Treating_Doctor,Start_Date))
       database.commit()
       print("Successfully added.")

    elif choice==8:
        sql = "SELECT * FROM Appointment;"
        statement.execute(sql)

        print("(ID, Appointment Unit, Appointment Date, Hospital, Patient ID)")
        list = statement.fetchall()
        for i in list:
           print(i)

    elif choice==9:
        Appointment_ID = input("Appointment ID:")
        Appointment_Unit = input("Appointment Unit:")
        Appointment_Date = input("Date of Appointment:")
        Hospital=input("Hospital:")
        Patient_ID = input("ID of Patient:")

        statement.execute("""INSERT INTO Appointment( Appointment_ID,Appointment_Unit,Appointment_Date,Hospital,Patient_ID) 
                       VALUES(%s,%s,%s,%s,%s)
                       """, (Appointment_ID,Appointment_Unit,Appointment_Date,Hospital,Patient_ID))
        database.commit()
        print("Successfully added.")


    elif choice==10:
        App_ID = input("Enter the ID of Appointment you are going to delete:")
        statement.execute("DELETE FROM Appointment WHERE Appointment_ID= %s", (App_ID,))
        database.commit()
        print("Successfully deleted.")

    elif choice==11:
        sql = "SELECT * FROM Diagnosis;"
        statement.execute(sql)

        print("(ID, Diagnosis Name, Diagnostic Device, Tumor Type)")
        list = statement.fetchall()
        for i in list:
            print(i)


    elif choice==12:


        Tumor_Type = input("Updated Tumor Type:")
        Diagnosis_ID = input("Diagnosis ID:")

        statement.execute("UPDATE Diagnosis SET Tumor_Type=%s Where Diagnosis_ID=%s",
                      (Tumor_Type,Diagnosis_ID))
        database.commit()
        print("Successfully updated.")

    elif choice==13:
        print("Exiting the system. Have a nice day...")
        exit()


db.close()