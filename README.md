# Oracle-database-project
> Final project for Databases subject at Military University of Technology in Warsaw

## Business analysis of the designed reality
I chose an online computer store as my subject. It sells items in the categories of Laptops and Computers, Smartphones and Smartwatches, Gaming, Computer Components or Peripherals.<br>
In the store's database, information about orders, customers, products, categories, employees, customer addresses, receipts and receipt items is stored in tables.<br>
As part of the business analysis, I developed 4 perspectives that implement the display of the store's offerings, the display of earnings by month, the display of best-selling brands and the list of cities from which customers placed the most orders.

## Database creation software
Oracle Data Modeler was used to create a relational model and a logical model.<br>
Oracle SQL Developer was used to execute and prepare SQL statements responsible for creating tables, sequences and perspectives, as well as deleting them and populating the tables with data. 

## Logical and relational model of the database
<img src="./logical-model.png" width=70% height=70%>
<img src="./relational-model.png" width=80% height=80%>

## Instructions for project installation
Deployment scripts that install (creates tables and also inserts data to the tables) and uninstall the project are in .sql files.<br>
To install the project, copy the code snippets of interest to Oracle SQL Developer connected to the server, and then execute the sentences with the green button.

## Showcase of perspectives
"wyswietl_cala_oferte” (show full offer) perspective: <br>
<img src="./Showcase/wyswietl-cala-oferte.png" width=60% height=60%>

"zarobki_wedlug_miesiecy” (earnings by month) perspective: <br>
<img src="./Showcase/zarobki-wedlug-miesiecy.png" width=20% height=20%>

"najlepiej_sprzedajace_sie_marki” (best-selling brands) perspective: <br>
<img src="./Showcase/najlepiej-sprzedajace-sie-marki.png" width=25% height=25%>

"miasta_najwiecej_zamowien” (highest orders by city) perspective: <br>
<img src="./Showcase/miasta-najwiecej-zamowien.png" width=20% height=20%>
