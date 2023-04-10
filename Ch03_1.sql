/* 도서 번호가 1인 도서의 이름 */
SELECT bookname
FROM book
WHERE bookid = 1;

/* 가격이 20,000원 이상인 도서의 이름 */
SELECT bookname
FROM book
WHERE price >= 20000;

/* 박지성의 총구매액 */
SELECT SUM(saleprice)
FROM orders
WHERE custid = 1;

/* 박지성의 총구매액2 */
SELECT SUM(saleprice)
FROM customer, orders
WHERE customer.custid = orders.custid AND customer.name LIKE '박지성';

/* 박지성이 구매한 도서의 수 */
SELECT COUNT(*)
FROM customer, orders
WHERE orders.custid = customer.custid AND customer.name LIKE '박지성';

/* 박지성이 구매한 도서의 출판사 수 */
SELECT COUNT(publisher)
FROM book, customer, orders
WHERE book.bookid = orders.bookid AND customer.custid = orders.custid AND customer.name LIKE '박지성';

/*박지성이 구매한 도서의 출판사 수 */
SELECT COUNT(PUBLISHER)
FROM BOOK, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID AND ORDERS.CUSTID = 1;


/* 박지성이 구매한 도서의 이름 , 가격, 정가와 판매가격 차이 */
SELECT bookname, price, price-saleprice 
FROM Customer, Orders, Book 
WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');




/*박지성이 구매하지 않은 도서의 이름 */
SELECT DISTINCT BOOK.BOOKNAME
FROM BOOK, ORDERS, CUSTOMER
/*WHERE BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID = ORDERS.CUSTID AND CUSTOMER.NAME != '박지성';*/
WHERE not exists(select bookname from customer orders where customer.custid=orders.custid and orders.bookid=book.bookid and customer.name like '박지성');








