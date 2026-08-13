# sql-project-1

First SQL project towards learning data science. As such, I will be documenting the process thoroughly.


Data taken from: https://www.kaggle.com/datasets/nudratabbas/sql-practice-dataset-1-easy-queries/discussion/680723

## Initial inspection

Initial inspection of the data using Microsoft Excel.


**orders.csv (PRIMARY TABLE)**
|order_id|customer_id| product_id |order_date|quantity|payment_method|
|-|-|-|-|-|-|
|unique order id| unique customer id (referencing customers)| product id (referencing products) | order date (dd/mm/yyyy) | number of the item ordered| method of payment (card/cash/online)|


**customer.csv**
|customer_id|gender|age|city|signup_date|loyalty_member|
|-|-|-|-|-|-|
|unique customer id | Male/Female | Age in years | City of member | signup date (dd/mm/yyyy)| Is a loyalty member (yes/no)|


**products**
|product_id|product_name|category|price|
|-|-|-|-|
|unique product id|product name (w/ item number)| product category (Beauty/Home/Electronic/...) | product price (GBP)|


