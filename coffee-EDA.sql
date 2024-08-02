
ALTER TABLE CoffeeSales.coffee
MODIFY `date` date;

ALTER TABLE CoffeeSales.coffee
MODIFY `datetime` DATETIME;

-- DAILY SUM OF COFFEE SALES
SELECT
	`date` as daily,
    ROUND(SUM(money),2) as money
FROM CoffeeSales.coffee
GROUP BY `date`;

-- PROPORTION OF COFFEE SOLD
SELECT
	coffee_name,
    COUNT(coffee_name) AS amount_sold
FROM CoffeeSales.coffee
GROUP BY 1;

-- AMOUNT EACH COFFEE MADE OF SALES
SELECT 
	coffee_name,
    ROUND(SUM(money),2) AS total_sales
FROM CoffeeSales.coffee
GROUP BY 1;

-- MONTHLY SUM OF COFFEE SALES BY COFFEE TYPE
SELECT
	date_format(`date`, '%Y-%m-01'),
    coffee_name,
    ROUND(SUM(money),2) AS amount_sold
FROM CoffeeSales.coffee
GROUP BY 1,2;

-- DOW COUNT OF COFFEE SOLD (1 = Sunday, 7 = Saturday)
SELECT
	DAYOFWEEK(`date`) AS weekly,
    COUNT(*)
FROM CoffeeSales.coffee
GROUP BY 1
ORDER BY 1;

