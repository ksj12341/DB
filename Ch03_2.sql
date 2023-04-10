SELECT *
FROM orders;

/* 마당서점의 도서의 총수 */
SELECT COUNT(*)
FROM book;

/* 마당서점에 도서를 출고하는 출판사의 총수 */
SELECT COUNT(distinct publisher)
FROM book;
/* 모든 고객의 이름, 주소 */
SELECT name.address
FROM customer;

/* 2020년 7월 4일 ~ 7월7일 사이에 주문받은 도서의 주문번호 */
SELECT orderid
FROM orders
WHERE orderdate BETWEEN '2020-07-04' AND '2020-07-07';

/* 2020년 7월 4일 ~ 7월7일 사이에 주문받은 도서를 제외한 도서의 주문번호*/
SELECT orderid
FROM orders
WHERE orderdate NOT BETWEEN '2020-07-04' AND '2020-07-07';

/* 성이 '김' 씨인 고객의 이름과 주소*/
SELECT name, address
FROM customer
WHERE name LIKE '김%';

/* 성이 '김' 씨이고 이름이 '아'로 끝나는 고객의 이름과 주소 */
SELECT name, address
FROM customer
WHERE name LIKE '김%아';




/* 주문하지 않은 고객의 이름(부속질의 사용) */

select name
from customer
where custid not in (select custid from orders);



/*주문 금액의 총액과 주문의 평군 금액 */
SELECT sum(saleprice), avg(saleprice) 
FROM Orders;



/*고객의 이름과 고객별 구매액 */
SELECT name, sum(saleprice) 
FROM Orders, Customer 
WHERE Orders.custid=Customer.custid GROUP BY name;



/*고객의 이름과 고객이 구매한 도서 목록 */
SELECT name, bookname  
FROM Book, Orders, Customer 
WHERE Orders.bookid=Book.bookid AND Orders.custid=Customer.custid;



/*도서의 가격(Book 테이블과) 판매가격 (Orders 테이블)의 차이가 가장 많은 주문 */
SELECT * 
FROM Book, Orders 
WHERE Book.bookid=Orders.bookid AND price-saleprice=(SELECT max(price-saleprice) 
FROM Book, Orders 
WHERE Book.bookid=Orders.bookid);



/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름 */
SELECT name 
FROM Customer, Orders
WHERE Customer.custid=Orders.custid GROUP BY name HAVING avg(saleprice) > (SELECT avg(saleprice) FROM Orders);
  
