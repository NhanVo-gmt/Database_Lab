-- procedure for create borrowhomebill
DELIMITER //
create procedure create_borrowhome_bill(
in staff_id int, in customer_id int, in book_id bigint
)
begin
	declare	loan_bill_id int default 0;
    declare due_time timestamp;
    declare member_type varchar(10);
    select Member_type into member_type from customer where Customer_id=customer_id limit 1;
	
    insert into loanbill(Staff_ID, Customer_ID, Book_ID) values (staff_id, customer_id, book_id);
    
    select last_insert_id() into loan_bill_id;
    
    -- 14/silver 20/gold 30/platinum
    if member_type='silver' then 
		select date_add(current_timestamp(), interval 14 day) into due_time;
	elseif member_type='gold' then
		select date_add(current_timestamp(), interval 20 day) into due_time;
	else
		select date_add(current_timestamp(), interval 30 day) into due_time;
	end if;
    
    insert into borrowhomebill(Loan_Bill_ID, Due_Time) values(loan_bill_id, due_time);
end //

DELIMITER ;

-- call procedure example
call create_borrowhome_bill(1,2053163,9782113180045);

-- for testing
select * from loanbill;
select * from borrowhomebill;
