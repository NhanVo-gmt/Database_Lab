create database Assigment;

use Assigment;

CREATE TABLE Customer (
	Customer_id int primary key,
    First_name varchar(40) NOT NULL,
    Last_name varchar(40) NOT NULL,
    Address varchar(40) NOT NULL,
    Phone_number int,
    Sex varchar(40),
    Email varchar(40),
    Date_or_birth date NOT NULL,
    Member_type varchar(40)
);

CREATE TABLE Staff (
	Staff_id int primary key,
    First_name varchar(40) NOT NULL,
    Last_name varchar(40) NOT NULL,
    Sex varchar(40),
    Date_or_birth date NOT NULL,
    Salary float NOT NULL
);

CREATE TABLE Book (
	ISBN bigint primary key,
    Title varchar(40) NOT NULL,
    Price_code varchar(40) NOT NULL,
    Category varchar(40) NOT NULL,
    Publication_company varchar(40),
    Publication_date date,
    Number_of_copies int,
    Book_Staff_ID int,
    Foreign key(Book_Staff_ID) references staff(Staff_ID) on delete set null
);

CREATE TABLE Author (
	Author_ID int primary key,
    First_name varchar(40) NOT NULL,
    Last_name varchar(40) NOT NULL,
    Nationality varchar(40) NOT NULL
);

CREATE TABLE LoanBill (
	Loan_Bill_ID int primary key,
    Staff_ID int NOT NULL,
    Customer_ID int NOT NULL,
    foreign key(Staff_ID) references staff(Staff_ID) on delete cascade,
    foreign key(Customer_ID) references customer(Customer_ID) on delete cascade
);

CREATE TABLE ReturnBill (
	Return_Bill_ID int primary key,
    Return_date date not null,
    Loan_Bill_ID int not null,
    Staff_ID int not null,
    Customer_ID int not null,
    foreign key(Loan_Bill_ID) references loanbill(Loan_Bill_ID) on delete cascade,
    foreign key(Staff_ID) references staff(Staff_ID) on delete cascade,
    foreign key(Customer_ID) references customer(Customer_ID) on delete cascade
);

CREATE TABLE BorrowHomeBill (
	Loan_Bill_ID int primary key,
    Borrow_date date not null,
    Due_date date not null,
    foreign key(Loan_Bill_ID) references loanbill(Loan_Bill_ID) on delete cascade
);

CREATE TABLE ReadInLibraryBill (
	Loan_Bill_ID int primary key,
    Borrow_time date not null,
    Due_time date not null,
    foreign key(Loan_Bill_ID) references loanbill(Loan_Bill_ID) on delete cascade
);

CREATE TABLE Payment (
	Payment_ID int primary key,
    Payment_date date not null,
    Amount_of_money float not null,
    Customer_ID int not null,
    foreign key(Customer_ID) references customer(Customer_ID) on delete cascade
);

CREATE TABLE FineRecord (
	Fine_ID int primary key,
    Number_of_date_late int not null,
    Return_Bill_ID int not null,
    foreign key(Return_Bill_ID) references returnbill(Return_Bill_ID)
);

CREATE TABLE FinePayment (
	Payment_ID int primary key,
    Fine_ID int not null,
    foreign key(Payment_ID) references payment(Payment_ID),
    foreign key(Fine_ID) references finerecord(Fine_ID)
);

CREATE TABLE BorrowHomePayment (
	Payment_ID int primary key,
    Borrow_Loan_ID int not null,
    foreign key(Payment_ID) references payment(Payment_ID),
    foreign key(Borrow_Loan_ID) references borrowhomebill(Loan_Bill_ID)
);

CREATE TABLE Notification (
	Noti_ID int primary key,
    Status bool
);

CREATE TABLE KeepTrackInfo (
	Noti_ID int primary key,
    ISBN bigint not null,
    foreign key(Noti_ID) references notification(Noti_ID) on delete cascade,
    foreign key(ISBN) references book(ISBN) on delete cascade
);

CREATE TABLE WrittenBy (
	Book_ID bigint,
    Author_ID int,
    primary key(Book_ID, Author_ID),
    foreign key(Book_ID) references book(ISBN) on delete cascade,
    foreign key(Author_ID) references author(Author_ID) on delete cascade
)