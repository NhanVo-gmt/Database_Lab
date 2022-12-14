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
select * from payment;

