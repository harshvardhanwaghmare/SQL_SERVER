----QUESTION:1----
CREATE VIEW SALES.SALES_INFO
AS
SELECT P.product_id,P.product_name,SO.order_id FROM production.products P
 INNER JOIN SALES.order_items SI ON P.product_id=SI.product_id INNER JOIN SALES.orders SO
ON SO.order_id=SI.order_id

SELECT * FROM SALES.SALES_INFO


----QUESTION:2----

CREATE VIEW SALES.STAFF_SALES
AS 
SELECT SS.first_name,SS.last_name,SUM(quantity*list_price) AS 'ORDER VALUE' FROM SALES.order_items SOI INNER JOIN SALES.orders SO
ON SOI.order_id=SO.order_id INNER JOIN SALES.staffs SS ON SO.staff_id=SS.staff_id
GROUP BY SS.first_name,SS.last_name

SELECT * FROM SALES.STAFF_SALES



----QUESTION:3----
CREATE PROCEDURE SALES.USP_ADD_STORE
@STORE_NAME VARCHAR(255),
@STORE_COUNT INT OUTPUT
AS
BEGIN
   INSERT INTO SALES.stores (store_name) VALUES (@STORE_NAME)
   SELECT @STORE_COUNT=COUNT(store_name) FROM SALES.stores

END;

DECLARE @COUNT INT;
EXEC SALES.USP_ADD_STORE
@STORE_NAME='Rowlett Bikes',
@STORE_COUNT=@COUNT OUTPUT

SELECT @COUNT AS 'SOTRE COUNT'



-----QUESTION:4-----

CREATE  PROCEDURE SALES.USP_STORE_WISE_SALES
AS
BEGIN
      SELECT SS.store_ID,SS.store_name,SS.city, COUNT(order_id) AS 'COUNT SALE' FROM 
	  SALES.stores SS INNER JOIN SALES.orders SO
	  ON SS.STORE_ID=SO.STORE_ID
      GROUP BY SS.store_ID,SS.store_name,SS.city 
END;

EXEC SALES.USP_STORE_WISE_SALES 





-------QUESTON:5-----------------
CREATE FUNCTION SALES.UDF_COUNT_SALES(
@CUSTOMER_ID INT,
@YEAR int

)
returns int
as
begin
declare @count2 int
	select @count2= sum(quantity*list_price) from sales.order_items WHERE ORDER_ID IN 
	(SELECT order_id FROM SALES.ORDERS WHERE customer_id=@CUSTOMER_ID AND YEAR(order_date)=@YEAR)
	return @count2
end;

(select SALES.UDF_COUNT_SALES(259,2016) as 'COUNT SALE')



