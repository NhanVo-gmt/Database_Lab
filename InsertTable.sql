-- Customer  
INSERT INTO Customer VALUES(2052858, "An", "Nguyen", "Go Vap", 0965529766, "male", "an.nguyen02@hcmut.edu.vn", '2002-05-27', "platinum");
INSERT INTO Customer VALUES(2052580, "Long", "Nguyen", "Binh Thanh", 0938737737, "male", "long.nguyen02@hcmut.edu.vn", '2002-06-19', "gold");
INSERT INTO Customer VALUES(2053163 , "Kien", "Vo", "District 8", 0941249092, "male", "kien.vo02@hcmut.edu.vn", '2002-01-29', "gold");
INSERT INTO Customer VALUES(2053290, "Nhan", "Vo", "Tan Binh", 0908733512, "male", "nhan.vo02@hcmut.edu.vn", '2002-06-06', "silver");
INSERT INTO Customer VALUES(2051535, "Hiep", "Nguyen", "Binh Tan", 0908735141, "male", "hiep.nguyen02@hcmut.edu.vn", '2002-07-06', "silver");
INSERT INTO Customer VALUES(2055323, "Hung", "Vu", "Thu Duc", 0908733654, "male", "hung.vu02@hcmut.edu.vn", '2002-06-24', "platinum");
INSERT INTO Customer VALUES(2053135, "Khoa", "Pham", "Tan Binh", 0934533512, "male", "khoa.pham02@hcmut.edu.vn", '2002-06-08', "platinum");
INSERT INTO Customer VALUES(2053642, "Nhat", "Mai", "Tan Binh", 0908738642, "male", "nhat.mai02@hcmut.edu.vn", '2002-12-06', "gold");
INSERT INTO Customer VALUES(2053213, "Tien", "Vo", "Tan Binh", 0956833512, "male", "tien.vo02@hcmut.edu.vn", '2002-11-12', "silver");
INSERT INTO Customer VALUES(2053643, "Toan", "Le", "Tan Binh", 0345733512, "male", "toan.le02@hcmut.edu.vn", '2002-10-05', "gold");

Select * From Customer;

-- Staff
INSERT INTO Staff VALUES(1, "Hung", "Tran", "male", "2002-05-08", 5.5);
INSERT INTO Staff VALUES(2, "Lap", "Nguyen", "male", "2002-09-03", 5.5);
INSERT INTO staff VALUES(3, "Anh", "Yen", "female", "2002-03-03", 5.5);

Select * From Staff;

-- Book
INSERT INTO Book VALUES(9789783604600, "The Beach House", "cheap", "Fiction", "Little, Brown and Company", "2001-05-05", 6, 1);
INSERT INTO Book VALUES(9787830516379, "Men are from Mars, women are from Venus", "expensive", "Nonfiction, Marriage", "HarperCollins", "2018-08-19", 3, 1);
INSERT INTO Book VALUES(9787696092087, "Blind spots in the boardroom", "expensive", "Action", "Piatkus", "2012-04-15", 2, 3);
INSERT INTO Book VALUES(9781638257945, "Smugglers' Summer", "cheap", "Comedy, Drama", "Warner Books", "2006-05-17", 9, 3);
INSERT INTO Book VALUES(9783583734755, "A French affair", "expensive", "Horror", "Century", "2005-10-06", 9, 2);
INSERT INTO Book VALUES(9785528037334, "Summer of Love", "cheap", "Romance", "Century", "2001-01-27", 2, 2);
INSERT INTO Book VALUES(9788606352854, "Jennie Kissed Me", "cheap", "Fantasy", "Fawcett", "2013-05-02", 10, 1);
INSERT INTO Book VALUES(9785457731310, "The Undomestic Goddess", "cheap", "Crime, Fantasy", "Transworld Publishers Limited", "2019-09-15", 1, 3);
INSERT INTO Book VALUES(9783010907299, "What Happens in London", "expensive", "Historical", "Pocket Star", "2005-11-29", 3, 1);
INSERT INTO Book VALUES(9786509130490, "Lord Borin's Secret Love", "cheap", "School, Sport", "Piatkus", "2008-09-10", 1, 1);
INSERT INTO Book VALUES(9789732387945, "All I Want Is Everything", "expensive", "Adventure", "Kensington Pub. Corp.", "2020-11-29", 9, 3);
INSERT INTO Book VALUES(9789129466013, "Sweet Awakening", "cheap", "School, Sport", "Second Story Press", "2003-11-13", 1, 1);
INSERT INTO Book VALUES(9782113180045, "Someone to Love", "cheap", "Romance", "Avon", "2015-09-17", 10, 3);
INSERT INTO Book VALUES(9782900682845, "We Are All Made of Molecules", "cheap", "Science Fiction", "Little, Brown and Company", "2004-06-21", 10, 1);
INSERT INTO Book VALUES(9786787560864, "Defy Not the Heart", "expensive", "Fantasy","Tundra Books", "2012-05-31", 5, 3);
INSERT INTO Book VALUES(9783468266160, "Early Harvest", "expensive", "Horror", "Avon Bks.", "2011-06-20", 8, 1);
INSERT INTO Book VALUES(9789974344760, "The frightened bride", "cheap", "Drama, Comedy", "Topaz", "2017-12-22", 8, 1);
INSERT INTO Book VALUES(9788667995035, "Marriage Made in Money", "expensive", "Fantasy", "Hurst and Blackett", "2011-08-09", 10, 3);
INSERT INTO Book VALUES(9785151051393, "Perfecting Fiona", "cheap", "Adventure, Action", "Harlequin Books", "2012-04-20", 10, 3);
INSERT INTO Book VALUES(9788264825757, "One Night With You", "cheap", "Slice of Life", "St. Martin's Press", "2014-08-02", 1, 2);

select * from book;

-- Author 
INSERT INTO Author VALUES(777, "Ernest", "Hemingway", "USA");
INSERT INTO Author VALUES(159, "William", "Shakespear", "UK");
INSERT INTO Author VALUES(327, "Charles", "Dickens", "UK");
INSERT INTO Author VALUES(446, "George", "Orwell", "UK");
INSERT INTO Author VALUES(617, "Rowling", "J.K.", "UK");
INSERT INTO Author VALUES(324, "Virginia", "Woolf", "USA");
INSERT INTO Author VALUES(504, "William", "Faulkner", "USA");
INSERT INTO Author VALUES(986, "Fyodor", "Mikhailovich", "Russia");
INSERT INTO Author VALUES(768, "James", "Joyce", "Ireland");
INSERT INTO Author VALUES(990, "Oscar", "Wilde", "Ireland");

select * from author;

-- Written By
INSERT INTO WrittenBy VALUES(9789783604600, 777);
INSERT INTO WrittenBy VALUES(9787830516379, 777);
INSERT INTO WrittenBy VALUES(9787696092087, 777);
INSERT INTO WrittenBy VALUES(9781638257945, 159);
INSERT INTO WrittenBy VALUES(9783583734755, 327);
INSERT INTO WrittenBy VALUES(9785528037334, 446);
INSERT INTO WrittenBy VALUES(9788606352854, 324);
INSERT INTO WrittenBy VALUES(9785457731310, 617);
INSERT INTO WrittenBy VALUES(9783010907299, 617);
INSERT INTO WrittenBy VALUES(9786509130490, 986);
INSERT INTO WrittenBy VALUES(9789732387945, 446);
INSERT INTO WrittenBy VALUES(9789129466013, 504);
INSERT INTO WrittenBy VALUES(9782113180045, 324);
INSERT INTO WrittenBy VALUES(9782900682845, 768);
INSERT INTO WrittenBy VALUES(9786787560864, 504);
INSERT INTO WrittenBy VALUES(9783468266160, 159);
INSERT INTO WrittenBy VALUES(9789974344760, 990);
INSERT INTO WrittenBy VALUES(9788667995035, 990);
INSERT INTO WrittenBy VALUES(9785151051393, 986);
INSERT INTO WrittenBy VALUES(9788264825757, 986);

select Author.First_name, Author.Last_name, Book.Title from Author, Book, WrittenBy Where WrittenBy.Book_ID = Book.ISBN And WrittenBy.Author_ID = Author.Author_ID;

select * from book_remainder;

-- Borrow Home Bill
insert into loanbill values (null, 2, 2051535, 9781638257945);
insert into borrowhomebill values (last_insert_id(), '2002-06-06', '2002-06-13');
insert into loanbill values (null, 1, 2052580, 9787830516379);
insert into borrowhomebill values (last_insert_id(), '2002-07-12', '2002-08-13');
insert into loanbill values (null, 3, 2052858, 9788606352854);
insert into borrowhomebill values (last_insert_id(), '2012-03-12', '2012-04-05');
insert into loanbill values (null, 2, 2053642, 9785457731310);
insert into borrowhomebill values (last_insert_id(), '2012-12-15', '2012-12-29');
insert into loanbill values (null, 3, 2052858, 9785151051393);
insert into borrowhomebill values (last_insert_id(), '2013-05-02', '2012-05-20');

-- Read in library Bill
insert into loanbill values (null, 1, 2051535, 9786509130490);
insert into readinlibrarybill values (last_insert_id(), '2012-06-06', '2012-06-06');
insert into loanbill values (null, 2, 2053213, 9788667995035);
insert into readinlibrarybill values (last_insert_id(), '2012-07-08', '2012-07-12');
insert into loanbill values (null, 1, 2053642, 9788264825757);
insert into readinlibrarybill values (last_insert_id(), '2012-03-12', '2012-03-12');
insert into loanbill values (null, 2, 2053213, 9783010907299);
insert into readinlibrarybill values (last_insert_id(), '2012-10-12', '2012-10-12');
insert into loanbill values (null, 3, 2053290, 9783010907299);
insert into readinlibrarybill values (last_insert_id(), '2012-12-12', '2012-12-12');