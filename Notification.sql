-- procedure for create notification
DELIMITER //
create procedure create_noti(
in in_customer_id int, in in_isbn bigint
)
begin
	insert into notification(Status, Customer_ID, ISBN) values (false, in_customer_id, in_isbn);
end //

DELIMITER ;

DELIMITER //
create procedure update_noti(
in in_isbn bigint
)
begin
	update notification set Status = true where Status = false and ISBN = in_isbn limit 1;
end //

DELIMITER ;
