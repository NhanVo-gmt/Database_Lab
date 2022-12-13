-- function for create readinlibrarybill
DELIMITER //
create procedure create_readin_bill(
in id int, staff_id int, customer_id int, borrow_time date, due_time date
)
begin
	select * from book;
    select * from customer;
end //

DELIMITER ;

-- delete procedure
drop procedure create_readin_bill;

-- call procedure
call create_readin_bill(1,1,1,'2022-10-10', '2022-10-10');