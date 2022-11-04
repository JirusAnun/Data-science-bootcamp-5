create table meal(
    meal_id  int,
    name     text,
    price    float,
    chef_id  int,
    primary key(meal_id)
);

create table chef(
    chef_id int,
    chef_name text,
    salary flaot,
    primary key(chef_id)
);

create table waiter(
    waiter_id int,
    waiter_name text,
    salary flaot,
    primary key(waiter_id)
);

create table customer(
    customer_id int,
    customer_name text,
    phone int,
    waiter_id int,
    primary key(customer_id),
    foreign key(waiter_id) references waiter(waiter_id)
);

create table orders(
    orders_id int,
    customer_id int,
    meal_id int,
    waiter_id int,
    primary key(orders_id),
    foreign key(customer_id) references customer(customer_id),
    foreign key(meal_id) references meal(meal_id),
    foreign key(waiter_id) references waiter(waiter_id)
);

insert into Meal values
    (1,"Meal1",100,1),
    (2,"Meal2",200,1),
    (3,"Meal3",300,1),
    (4,"Meal4",400,2),
    (5,"Meal5",500,2),
    (6,"Meal6",600,2),
    (7,"Meal7",700,2),
    (8,"Meal8",800,2),    
    (9,"Meal9",900,3),
    (10,"Meal10",1000,3);

insert into chef values
    (1,"A",20000),
    (2,"B",50000),
    (3,"C",100000);

insert into waiter values
    (1,"D",10000),
    (2,"E",12000),
    (3,"F",14000),
    (4,"G",15000);

insert into customer values
    (1,"H",034000000,1),
    (2,"I",089000000,1),
    (3,"J",020000000,2),
    (4,"K",087000000,3),
    (5,"L",099000000,3),
    (6,"M",010000000,4);

insert into orders values
    (1,1,1,1),
    (2,2,8,4),
    (3,3,9,2),
    (4,4,10,3),
    (5,5,2,1),
    (6,6,4,2);

select "top 3 most expensive order";
select 
    orders.orders_id, 
    customer.customer_name, 
    waiter.waiter_name,
    meal.name,
    meal.price,
    customer.customer_name || " order " || meal.name || " price : " || meal.price || " from " ||     waiter.waiter_name  report
from orders 
join customer 
    on orders.customer_id = customer.customer_id
join meal 
    on orders.meal_id = meal.meal_id
join waiter 
    on orders.waiter_id = waiter.waiter_id
order by meal.price desc
limit 3; 












