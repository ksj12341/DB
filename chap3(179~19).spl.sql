/* newbook테이블 생성 */

create table NewBook (
bookid NUMBER PRIMARY KEY,
bookname VARCHAR2(20) NOT NULL,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price > 1000));

select * from NewBook;

/* newcustomer 테이블 생성 */

CREATE TABLE NewCustomer (
custid NUMBER PRIMARY KEY,
name VARCHAR2(20),
address VARCHAR2(20),
phone VARCHAR2(30));


/* neworders테이블 생성 */
create table NewOrders(
orderid NUMBER,
custid NUMBER NOT NULL,
bookid NUMBER NOT NULL,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE);


/* 속성 추가 */

alter table newbook add isbn varchar2(13);

select *from newbook;

/*제약사항 변경 */

alter table newbook modify isbn number;


select * from newbook;
select * from newcustomer;
select * from neworders;

/*테이블 삭제 */
alter table newbook drop column isbn;

select * from book;

/*튜플 추가 */

insert into book(bookid,bookname,publisher,price)
values(11,'스포츠 의학', '한솔의학서적',90000);

insert into book(bookid,bookname,publisher)
values (14,'스포츠의학','한솔의학서적');


select * from imported_book;

/*대량 삽입 */
insert into book(bookid, bookname,price,publisher)
select bookid, bookname,price,publisher
from imported_book;

select * from imported_book;
select * from book;

select * from customer;

/*업데이트*/

update customer
set address='대한민국 부산'
where custid=5;

select * from customer;

update customer
set address=(select address from customer where name ='김연아')
where name='박세리';

/*튜플 삭제*/
delete from customer
where custid=5;

select * from customer;

rollback;






































