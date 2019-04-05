import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="1Zorikovich1"
  database="itfb"
)

print(mydb)