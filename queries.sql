/*
1) Retrieve username,phone,area ,city and wishname who have userid as 1.
*/

select uname,cphoneno,area,ccity,wishname from users natural join customer
natural join address natural join wishlist where wishlist.userid=1;


/*
2) Retrieve username,phone,area ,city and wishname of all the users in wishlist.
*/
select uname,cphoneno,area,ccity,wishname from users natural join customer
natural join address natural join wishlist where wishlist.userid=users.userid;


/*
3) List the name and phone number of customer who have not received the order.
*/

select cname,cphoneno from customer natural join orders where
orders.status='Not Delivered';


/*
4) Retrieve the customer name who have pincode='577601';
*/

select cname from customer where cpincode='577601';
