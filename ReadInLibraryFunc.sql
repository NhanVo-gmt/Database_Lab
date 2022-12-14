-- procedure for create readinlibrarybill
DELIMITER //
create procedure create_readinlibrary_bill(
in staff_id int, in customer_id int, in book_id bigint
)
begin
	declare	loan_bill_id int default 0;
    declare due_time timestamp;
	insert into loanbill(Staff_ID, Customer_ID, Book_ID) values (staff_id, customer_id, book_id);
    select last_insert_id() into loan_bill_id;
    select concat(date(current_timestamp), ' 18:00:00') into due_time;
    insert into readinlibrarybill(Loan_Bill_ID, Due_Time) values(loan_bill_id, due_time);
end //

DELIMITER ;

-- call procedure example
call create_readinlibrary_bill(1,2053163,9781638257945);

-- for testing
select * from loanbill;
select * from readinlibrarybill;