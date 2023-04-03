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
