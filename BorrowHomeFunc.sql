-- procedure for create borrowhomebill
DELIMITER //
create procedure create_borrowhome_bill(
in in_staff_id int, in in_customer_id int, in in_book_id bigint
)
begin
	declare	dloan_bill_id int default 0;
    declare ddue_time timestamp;
    declare dmember_type varchar(10);
    declare dprice_code varchar(20);
    declare dpayment_id int;

    select Member_type into dmember_type from Customer where Customer_id = in_customer_id limit 1;
    select Price_code into dprice_code from book where ISBN=in_book_id limit 1;

	insert into loanbill(Staff_ID, Customer_ID, Book_ID) values (in_staff_id, in_customer_id, in_book_id);
    
    select last_insert_id() into dloan_bill_id;
    
    -- 14/silver 20/gold 30/platinum
    if dmember_type='silver' then 
		select date_add(current_timestamp(), interval 14 day) into ddue_time;
	elseif dmember_type='gold' then
		select date_add(current_timestamp(), interval 20 day) into ddue_time;
	else
		select date_add(current_timestamp(), interval 30 day) into ddue_time;
	end if;
    
    insert into borrowhomebill(Loan_Bill_ID, Due_Time) values(dloan_bill_id, ddue_time);
    
    -- create bil for expensive book
    if dprice_code ='expensive' then
		insert into payment(Payment_time, Amount_of_money, Customer_id) values (current_timestamp(), 0.5, in_customer_id);
        select last_insert_id() into dpayment_id;
        insert into borrowhomepayment values (dpayment_id, dloan_bill_id);
	end if;
end //

DELIMITER ;

-- call procedure example
call create_borrowhome_bill(1,2053163,9783010907299);
call create_borrowhome_bill(1,2053135,9789974344760);

-- for testing
select * from loanbill;
select * from borrowhomebill;
<<<<<<< HEAD

-- procedure for create return bill
DELIMITER //
create procedure create_return_bill(
in staff_id int, in customer_id int, in loan_bill_id int
)
begin
	declare due_date timestamp;
    declare return_id int default 0;
    declare number_of_date_late int default 0;

    insert into returnbill(return_date, Loan_Bill_ID, Staff_ID, Customer_ID) values (current_timestamp(), loan_bill_id, staff_id, customer_id);

	-- Get the due_time from selected loan bill id
    select due_time into due_date from borrowhomebill b where b.loan_bill_id = loan_bill_id;
    
    -- Get the newest return_bill_id
    select Return_Bill_ID into return_id from returnbill r where r.Return_Bill_ID = (SELECT MAX(Return_Bill_ID) from returnbill);
    
    -- Get number of days late
    select(datediff(current_date(), due_date)) into number_of_date_late; 
    
    if number_of_date_late > 0 then
		call create_fine_record(number_of_date_late, return_id);
	end if;
end //

DELIMITER ;

-- procedure for create fine record
DELIMITER //
create procedure create_fine_record(
in number_of_date_late int, in return_bill_id int
)
begin
	insert into finerecord(Number_of_date_late, Return_Bill_ID) values (number_of_date_late, return_bill_id);
end //

DELIMITER ;

-- for testing
insert into loanbill values (1, 1, 2051535, 9781638257945);
insert into loanbill values (2, 1, 2051535, 9782113180045);
insert into borrowhomebill values (1, '2002-06-06', '2002-06-06'); 
insert into borrowhomebill values (2, '2002-06-06', '2023-06-06'); 
insert into returnbill values (1, current_timestamp(), 1, 1, 2051535); 
insert into returnbill values (2, current_timestamp(), 1, 1, 2051535); 

call create_return_bill(1, 2051535, 1);
call create_return_bill(1, 2051535, 2);
select * from finerecord;
