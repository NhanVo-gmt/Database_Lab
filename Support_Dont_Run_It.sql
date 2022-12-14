-- Support for readInLibraryFunc
drop procedure create_readinlibrary_bill;

delete from loanbill where Loan_Bill_ID <> -1;
delete from readinlibrarybill where Loan_Bill_ID <> -1;