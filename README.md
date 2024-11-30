# Admin login details----------------------------------------------------------------

username : admin
password : 123

# Web Application Database Setup-----------------------------------------------------

# Prerequisites
- Install **MySQL** on your local machine.
- Set up a MySQL user with appropriate privileges.

# Database Setup
1. clone the repository ABC-CINEMA
2. import the database
     -  go to mysql workbench
     -  in here go t servers and in servers select data import
     -  select Import From Self-Contained File and select the database file location
     -  after that down there click Start Import
3. changes in apache netbeans accoeding to your local machine
     - go to the Source Packages/util/DBConnect.java
     - in there replace "root" to your mysql username and "12345" to your mysql password (make sure the database name in the mysql is "ecommerce") 
           private static String url = "jdbc:mysql://localhost:3306/ecommerce"; 
           private static String user = "root";
           private static String pass = "12345";
4. make sure you have jdbc and .jar files downloaded and added to the services/Databases
