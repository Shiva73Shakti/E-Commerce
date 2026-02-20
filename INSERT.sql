

insert into users0(name,email,password)
values('Amit sharma','amit.sharma@gmail.com','amit@12'),
        ('priya verma','priya.verma@gmail.com','Priya@12345');
		
insert into products(name,price,stock)
values ('Dell inspiron laptop',58999.00,15),
	        ('HP wireless mouse',699.00,100),
			('Oneplue Nord CE3',24999.00,30),
			('Apple ipone 15 ',79999.00,14),
			('Logitech keyboard',1299.00,96);


insert into orders(user_id)
values   (1),
         (2),
		 (2),
		 (1);

insert into order_items(order_id,product_id,quantity)
values(1,2,15),
      (2,3,12),
	  (1,1,5),
	  (2,2,19);


insert into payments(order_id,amount,status)
values (1,19498.00,'success'),
       (2,299988.00,'pending'),
	   (1,'58999.00','success'),
		(2,13281.00,'failed'); 
		  