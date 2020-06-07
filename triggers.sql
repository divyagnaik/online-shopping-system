CREATE OR REPLACE FUNCTION tri()
RETURNS trigger AS
$$
BEGIN
IF NEW.price < 0 THEN
UPDATE order_detail SET price = 1000 WHERE orderid=NEW.orderid;
END IF;
RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

drop trigger trigg on order_detail;

CREATE TRIGGER trigg
AFTER INSERT OR UPDATE
ON order_detail
FOR EACH ROW
EXECUTE PROCEDURE tri();



/*
update order_detail set price=-1000 where orderid=101;
*/
