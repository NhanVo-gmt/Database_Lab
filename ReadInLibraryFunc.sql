-- delete procedure
-- SYNTAX: drop procedure create_readin_bill;

-- procedure for create readinlibrarybill
DELIMITER //
create procedure create_readinlibrary_bill(
in staff_id int, in customer_id int, in book_id bigint, in borrow_time date, in due_time date
)
begin
	declare	loan_bill_id int default 0;
	insert into loanbill(Staff_ID, Customer_ID, Book_ID) values (staff_id, customer_id, book_id);
    select last_insert_id() into loan_bill_id;
    insert into readinlibrarybill values(loan_bill_id, borrow_time, due_time);
end //

DELIMITER ;

-- call procedure example
call create_readinlibrary_bill(1,2053163,9781638257945,'2022-10-10', '2022-10-20');

-- for testing
select * from loanbill;
select * from readinlibrarybill;