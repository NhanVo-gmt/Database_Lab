-- For loan bills
SELECT * FROM loanbill;
select * from borrowhomebill bb left join loanbill lb on bb.Loan_Bill_ID=lb.Loan_Bill_ID;
select * from readinlibrarybill rb left join loanbill lb on rb.Loan_Bill_ID=lb.Loan_Bill_ID;