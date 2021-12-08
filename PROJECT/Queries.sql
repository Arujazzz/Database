--1
select distinct orders.book_code, books.book_name, store.store_city, sum(orders.number_of_books) as sum
from books,  orders, store, customer_order
where books.book_code = orders.book_code and customer_order.order_id = orders.order_id
and store.store_id = customer_order.store_id
group by books.book_name, orders.book_code, store.store_city order by sum(orders.number_of_books) desc limit 20;

--2
select distinct orders.book_code, books.book_name, store.store_state, sum(orders.number_of_books) as sum
from books,  orders, store, customer_order
where books.book_code = orders.book_code and customer_order.order_id = orders.order_id
and store.store_id = customer_order.store_id
group by books.book_name, orders.book_code, store.store_state order by sum(orders.number_of_books) desc limit 20;

--3
select store.store_id, store.store_name, sum(amount) as sum
from store, orders, customer_order
where customer_order.store_id = store.store_id and customer_order.order_id = orders.order_id
and customer_order.date_order > '31/12/2020'
group by store.store_id order by sum(amount) desc limit 5;

--4
select genre.genre_id, genre.genre_name, sum(orders.number_of_books) as sum
from genre, orders, books, book_genre
where genre.genre_id = book_genre.genre_id and book_genre.book_code = books.book_code and books.book_code = orders.book_code
group by genre.genre_id, genre.genre_name order by sum(orders.number_of_books) desc;

--5
select classification.classification_id, classification.class_name, sum(orders.number_of_books)
from classification, books, orders
where classification.classification_id = books.classification_id and books.book_code = orders.book_code
group by classification.classification_id, classification.class_name order by sum(orders.number_of_books) desc;

--6
select books.book_code, books.book_name, sum (warehouse_book.number_of_books)
from books, warehouse_book
where warehouse_book.book_code = books.book_code
group by books.book_code, books.book_name order by sum (warehouse_book.number_of_books) desc limit 20;

--7
select sum(number_of_books) from warehouse_book;

--8
select author.author_id, author.first_name, author.last_name, count(books.author_id)
from author, books
where author.author_id = books.author_id
group by author.author_id, author.first_name, author.last_name
order by count(books.author_id) desc limit 20;

--9
select author.author_id, author.first_name, author.last_name, count(genre.genre_id)
from author, author_genre, genre
where author.author_id = author_genre.author_id and author_genre.genre_id = genre.genre_id
group by  author.author_id, author.first_name, author.last_name
order by count(genre.genre_id) desc limit 10;

--10
select publishing.publishing_id, publishing.publishing_name, sum(orders.number_of_books) as sum
from books, publishing, orders
where orders.book_code = books.book_code and books.publishing_id = publishing.publishing_id
group by publishing.publishing_id, publishing.publishing_name
order by sum(orders.number_of_books) desc;
