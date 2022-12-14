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

-- procedure for create return bill
DELIMITER //
create procedure create_return_bill(
in staff_id int, in customer_id int, in loan_bill_id int
)
begin
	declare start_date timestamp;
    declare return_id int default 0;

    insert into returnbill(return_date, Loan_Bill_ID, Staff_ID, Customer_ID) values (current_timestamp(), loan_bill_id, staff_id, customer_id);

	-- Get the due_time from selected loan bill id
    select due_time into start_date from borrowhomebill b where b.loan_bill_id = loan_bill_id;
    
    -- Get the newest return_bill_id
    select Return_Bill_ID into return_id from returnbill r where r.Return_Bill_ID = (SELECT MAX(Return_Bill_ID) from returnbill);
	call create_fine_record(date(start_date), current_date(), return_id);
end //

DELIMITER ;

-- procedure for create fine record
DELIMITER //
create procedure create_fine_record(
in due_date date, in return_date date, in return_bill_id int
)
begin
	declare number_of_date_late int default 0;
    
    -- Get the number of date late
	select(datediff(return_date, due_date)) into number_of_date_late; 
	insert into finerecord(Number_of_date_late, Return_Bill_ID) values (number_of_date_late, return_bill_id);
end //

DELIMITER ;

-- for testing
insert into loanbill values (1, 1, 2051535, 9781638257945);
insert into borrowhomebill values (1, '2002-06-06', '2002-06-06'); 
insert into returnbill values (1, current_timestamp(), 1, 1, 2051535); 

call create_return_bill(1, 2051535, 1)
