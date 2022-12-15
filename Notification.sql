-- procedure for create notification
DELIMITER //
create procedure create_noti(
in in_customer_id int, in in_isbn bigint
)
begin
	insert into notification(Status, Customer_ID, ISBN) values (false, in_customer_id, in_isbn);
    
    call update_noti(in_isbn);
end //

DELIMITER ;

DELIMITER //
create procedure update_noti(
in in_isbn bigint
)
begin
	declare number_of_book_now int;
    select number_of_book_remaining into number_of_book_now from book_remainder br where br.isbn = in_isbn;

	if number_of_book_now > 0 then 
		update notification set Status = true where Status = false and ISBN = in_isbn limit 1;
    end if;
end //

DELIMITER ;
