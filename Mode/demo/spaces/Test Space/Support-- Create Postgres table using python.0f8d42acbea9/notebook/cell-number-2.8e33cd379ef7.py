import psycopg2

#establishing the connection
conn = psycopg2.connect(
   database="mydb", user='postgres', password='password', host='127.0.0.1', port= '5432'
)

#Setting auto commit false
conn.autocommit = True

#Creating a cursor object using the cursor() method
cursor = conn.cursor()

#Doping EMPLOYEE table if already exists.
cursor.execute("DROP TABLE IF EXISTS EMPLOYEE")

#Creating a table
sql = '''CREATE TABLE EMPLOYEE(
   FIRST_NAME CHAR(20) NOT NULL,
   LAST_NAME CHAR(20),
   AGE INT, SEX CHAR(1),
   INCOME INT,
   CONTACT INT
)'''
cursor.execute(sql)

#Populating the table
insert_stmt = "INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME, CONTACT) VALUES (%s, %s, %s, %s, %s, %s)"
data = [('Krishna', 'Sharma', 26, 'M', 2000, 101), 
   ('Raj', 'Kandukuri', 20, 'M', 7000, 102),
   ('Ramya', 'Ramapriya', 29, 'F', 5000, 103),
   ('Mac', 'Mohan', 26, 'M', 2000, 104)]
cursor.executemany(insert_stmt, data)
conn.commit()

#Retrieving specific records using the ORDER BY clause
cursor.execute("SELECT * from EMPLOYEE ORDER BY AGE")
print(cursor.fetchall())

#Commit your changes in the database
conn.commit()

#Closing the connection
conn.close()