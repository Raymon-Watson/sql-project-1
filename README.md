# sql-project-1

First SQL project towards learning data science. As such, I will be documenting the process thoroughly. Also, I will be working through the project without any outside help (as much as I can), and then later inspecting the process to optimize my workflow.

**Note:** Detailed notes are contained below.

Data taken from: https://www.kaggle.com/datasets/nudratabbas/sql-practice-dataset-1-easy-queries/discussion/680723


## Flow Overview:

1. Create a PostgreSQL database for the project.

2. Run `sql/01_setup.sql` to create the required table.

3. Import `data/sales.csv` into the `sales` table using pgAdmin:
   - Right-click the `sales` table.
   - Select **Import/Export Data**.
   - Select **Import**.
   - Choose `data/sales.csv`.
   - Set the format to CSV.
   - Enable **Header**.
   - Use `,` as the delimiter.

4. Run `sql/02_exploration.sql` to inspect the dataset.

5. Run `sql/03_analysis.sql` to reproduce the analysis.




**NOTE:** When importing, make sure to import orders last, since it relies directly on both other tables.







# Initializing the project


## Initial inspection

Initial inspection of the data using Microsoft Excel.


**orders.csv (PRIMARY TABLE)**
|order_id|customer_id| product_id |order_date|quantity|payment_method|
|-|-|-|-|-|-|
|unique order id (text) (PRIMARY KEY)| unique customer id (text) (referencing customers)| product id (text) (referencing products) | order date (date dd/mm/yyyy) | number of the item ordered (int) | method of payment (text) (card/cash/online)|

This table makes sense as the primary table, as it uniquely identifies each order, with each order having an associated customery_id (identifying the customer who ordered it, stored in customer.csv) and an associated product id (identifying the product purchased, stored in products.csv).

I think it makes sense to make the unique order id the PRIMARY KEY, as it uniquely identifies each order. I considered making it a combination of customer_id and product_id, but this does not uniquely identify each order, since a customer may purchase the same product on different dates, plus it is best to keep it as simple as possible.

This may not be optimal, but the method I used to check data types of each column is by using **=TYPE(CELL)** in excel, which outputs a number and is associated as following:
- 1 : Number (int,decimal,date,time)
- 2 : Text (strings, numbers formatted as text)
- 4 : Logical (True/False)
- 16 : Error (NA)
- 64 : Array


**customer.csv**
|customer_id|gender|age|city|signup_date|loyalty_member|
|-|-|-|-|-|-|
|unique customer id (text) (FOREIGN KEY) | Male/Female (text)| Age in years (int)| City of member (text)| signup date (date, dd/mm/yyyy)| Is a loyalty member (text) (yes/no)|

It makes sense to designate the unique customer id as the foreign key, since this directly and uniquely connects the customer data to the orders.




**products.csv**
|product_id|product_name|category|price|
|-|-|-|-|
|unique product id (text) (FOREIGN KEY) |product name (text) (w/ item number)| product category (text) (Beauty/Home/Electronic/...) | product price (GBP) (decimal)|

It makes sense to designate the unique product id as the foreign key, since this directly and uniquely connects the customer data to the orders.



## Creating the setup.sql file

Here, we create the table structures, including identifying the primary and foreign keys, to be used when we import the data from the csv files contained in the data folder. In the previous section, we identified all the data types, and these will be used here to make sure all the columns are correctly designated.




