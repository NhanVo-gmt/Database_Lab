delimiter // 
create trigger insert_book_remainder_from_book 
after insert
on book for each row
begin
	insert into book_remainder values (NEW.ISBN, NEW.Number_of_copies);
end//
delimiter;

delimiter // 
create trigger decrease_book_remainder_from_loanbill
after insert
on loanbill for each row
begin
	declare number_of_book_now int;
    select number_of_book_remaining into number_of_book_now from book_remainder br where br.isbn = NEW.Book_ID;
	if number_of_book_now > 0 then
		update book_remainder br set br.Number_of_book_remaining = br.Number_of_book_remaining - 1 where br.isbn = NEW.Book_ID;
	end if;
end//
delimiter;

delimiter // 
create trigger increase_book_remainder_from_returnbill
after insert
on returnbill for each row
begin
	update book_remainder br set br.Number_of_book_remaining = br.Number_of_book_remaining + 1 where br.isbn = 
		(select Book_ID from loanbill where Loan_Bill_ID = NEW.Loan_Bill_ID);
end//
	