

#PART 1 AND PART 2
id <- c(10,11,12,13,14,15,16,17,18,19)
id

fname <- c('Anne', 'Bill', 'Brian', 'Brian', 'Bryan', 'Bryton', 'Chris', 'Dan', 'Danny', 'Doug')

lname <- c('Smith', 'Brown', 'Johnson', 'Colts', 'Jackson', 'Sanderson', 'Robinson', 'Cranshaw', 'Phantom', 'Dimmadome')

zipcode <- c(77493, 77494, 77495, 77496, 77497, 75093, 75093, 75082, 75083, 75084)

gpa <- c(3.2, 3.5, 2.0, 1.0, 4.0, 3.43, 3.19999999999, 3.3, 3.0, 2.98)


grades.data <- data.frame(id, fname, lname, zipcode, gpa)

grades.data$id

library(RMySQL)	
library(RODBC)	
library(DBI) 	


conn <- dbConnect( drv = RMySQL::MySQL(), dbname = "r_quiz1_db", host = "localhost", username = "root", password = "") 
dbRemoveTable(conn, name = "grades") # must clean before inputting the df
dbWriteTable(conn, value = grades.data, name = "grades", append = TRUE ) 

# PART 3 
str <- "These are students where GPA >= 3.2 "
dbGetQuery(conn, "SELECT * FROM grades WHERE GPA >= 3.2;") 
str <- "Number of students where GPA >= 3.2 is: "
dbGetQuery(conn, "SELECT COUNT(*) FROM grades WHERE GPA >= 3.2;") 
# PART 4
str <- "These are students where zipcode is 75093: "
dbGetQuery(conn, "SELECT * FROM grades WHERE zipcode = 75093;")
str <- "Number of students where zipcode is 75093 is: "
dbGetQuery(conn, "SELECT COUNT(*) FROM grades WHERE zipcode = 75093;")


dbDisconnect(conn)