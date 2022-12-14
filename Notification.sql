-- procedure for create notification
DELIMITER //
create procedure create_noti(
in in_customer_id int, in in_isbn bigint
)
begin
	insert into notification(Status, Customer_ID, ISBN) values (false, in_customer_id, in_isbn);
end //

DELIMITER ;
