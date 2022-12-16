-- drop user 'admin'@'localhost';
-- drop user 'customer'@'localhost';
-- drop user 'staff'@'localhost';

-- Create admin
create user 'admin'@'localhost' identified by 'password';
grant all on library.* to 'admin'@'localhost';
revoke drop on library.* from 'admin'@'localhost';
ALTER USER 'admin'@'localhost' WITH MAX_QUERIES_PER_HOUR 300;

-- Create customer
create user 'customer'@'localhost' identified by 'password';
grant select on library.author to 'customer'@'localhost';
grant select on library.book to 'customer'@'localhost';
grant select on library.book_remainder to 'user'@'localhost';
grant select on library.customer to 'customer'@'localhost';
grant select on library.staff to 'customer'@'localhost';
ALTER USER 'customer'@'localhost' WITH MAX_QUERIES_PER_HOUR 60;

-- Create staff
create user 'staff'@'localhost' identified by 'password';
grant select on library.* to 'staff'@'localhost';
grant execute on procedure library.create_borrowhome_bill to 'staff'@'localhost';
grant execute on procedure library.create_readinlibrary_bill to 'staff'@'localhost';
grant execute on procedure library.create_noti to 'staff'@'localhost';
grant execute on procedure library.create_fine_record to 'staff'@'localhost';
grant execute on procedure library.create_fine_payment to 'staff'@'localhost';
grant execute on procedure library.create_fine_record to 'staff'@'localhost';
grant execute on procedure library.create_return_bill to 'staff'@'localhost';
ALTER USER 'staff'@'localhost' WITH MAX_QUERIES_PER_HOUR 300;