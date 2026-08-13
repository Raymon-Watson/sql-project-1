# sql-project-1

First SQL project towards learning data science. As such, I will be documenting the process thoroughly.


Data taken from: https://www.kaggle.com/datasets/nudratabbas/sql-practice-dataset-1-easy-queries/discussion/680723

## Initial inspection

Initial inspection of the data using Microsoft Excel.


**orders.csv (PRIMARY TABLE)**
|order_id|customer_id| product_id |order_date|quantity|payment_method|
|-|-|-|-|-|-|
|unique order id (PRIMARY KEY)| unique customer id (referencing customers)| product id (referencing products) | order date (dd/mm/yyyy) | number of the item ordered| method of payment (card/cash/online)|

This table makes sense as the primary table, as it uniquely identifies each order, with each order having an associated customery_id (identifying the customer who ordered it, stored in customer.csv) and an associated product id (identifying the product purchased, stored in products.csv).

I think it makes sense to make the unique order id the PRIMARY KEY, as it uniquely identifies each order. I considered making it a combination of customer_id and product_id, but this does not uniquely identify each order, since a customer may purchase the same product on different dates, plus it is best to keep it as simple as possible.

**customer.csv**
|customer_id|gender|age|city|signup_date|loyalty_member|
|-|-|-|-|-|-|
|unique customer id (FOREIGN KEY) | Male/Female | Age in years | City of member | signup date (dd/mm/yyyy)| Is a loyalty member (yes/no)|

It makes sense to designate the unique customer id as the foreign key, since this directly and uniquely connects the customer data to the orders.


**products**
|product_id|product_name|category|price|
|-|-|-|-|
|unique product id (FOREIGN KEY) |product name (w/ item number)| product category (Beauty/Home/Electronic/...) | product price (GBP)|

It makes sense to designate the unique product id as the foreign key, since this directly and uniquely connects the customer data to the orders.



