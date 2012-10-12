Demo-Banking-Application-Prototype-
===================================

Demo Banking Application Prototype using JS, AJAX, MS-ACCESS.

It is a JSP-servlet application for banking. User is able to login, check for account balance, pay existing bills
and order for a cheque book, view account statement online. 
Data is stored in MS-Access/SQL server/Oracle.

Technologies used: HTML, CSS, JSP, JS, Ajax
Number of HTML pages: 1
Number of CSS pages: 1
Number of Java Server Pages: 8
Number of JavaScript pages: 3


Working:
Firstly, customer logs in with his Username and Password.

If the entered credentials are correct then the customer gets redirected to the profile page else the application shows the message to enter correct username and password.

After customer gets redirected to the profile page he/she gets the list of menu such as Check for Account Balance, Pay Existing Bills, Order a Cheque Book, View Account Statement Online.

When customer clicks on the Check for Account Balance, it will show customer’s account balance.

If customer wants to pay bill he/she will clicks on Pay Existing Bills. There will some fields such as password (for better security) , Bill Description, Bill Amount. Clicking on Pay Bill button the bill gets paid and it will show the balance after deduction.

When customer wants to order cheque book(s),customers will choose order cheque book menu. Customers have to fill some fields such as password, number of cheque books, number of leaves. Clicking on Request Chequebook button will place an order for requested chequebooks, a message “Request Received. Chequebook(s) will be issued soon.” will be shown.

When customer wants online account statement, customer clicks on account statement online menu. It will show the information about username, account no, available balance and communication address.