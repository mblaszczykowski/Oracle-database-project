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
![Logical model](./logical-model.png)
![Relational model](./relational-model.png)

## Instructions for project installation
Deployment scripts that install (creates tables and also inserts data to the tables) and uninstall the project are in .sql files.<br>
To install the project, copy the code snippets of interest to Oracle SQL Developer connected to the server, and then execute the sentences with the green button.

## Showcase of perspectives
"wyswietl_cala_oferte” (show full offer) perspective: <br>
![Showcase 1](./Showcase/wyswietl-cala-oferte.png  | width=300)
<img src="https://i.imgur.com/ZWnhY9T.png" width=50% height=50%>

"zarobki_wedlug_miesiecy” (earnings by month) perspective: <br>
![Showcase 2](./Showcase/zarobki-wedlug-miesiecy.png  | width=300)
<img src="https://i.imgur.com/ZWnhY9T.png" width=50% height=50%>

"najlepiej_sprzedajace_sie_marki” (best-selling brands) perspective: <br>
![Showcase 3](./Showcase/najlepiej-sprzedajace-sie-marki.png | width=300)
<img src="https://i.imgur.com/ZWnhY9T.png" width=50% height=50%>

"miasta_najwiecej_zamowien” (highest orders by city) perspective: <br>
<img src="./Showcase/miasta-najwiecej-zamowien.png" width=50% height=50%>
