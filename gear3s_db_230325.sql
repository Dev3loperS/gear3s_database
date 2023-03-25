create database gear3s_db;
use gear3s_db;

create table sex(
	id int auto_increment,
    name varchar(50) unique not null,
    
    primary key(id)
);

create table roles(
	id int auto_increment,
    name varchar(50) unique not null,
    description varchar(255),
    
    primary key(id)
);

create table users(
	id int auto_increment,
    email varchar(255) unique not null,
    password varchar(255) not null,
    fullname varchar(100) not null,
    birthday date,
    phone varchar(20) not null,
    address varchar(200) not null,
    avatar text,
    last_payment int default 0,
    role_id int,
    sex_id int,
     
	primary key (id),
    constraint FK_users_role_id foreign key(role_id) references roles(id),
    constraint FK_users_sex_id foreign key(sex_id) references sex(id)
);

create table mycard(
	id int auto_increment,
    card_number varchar(50) unique not null,
    card_name varchar(50) not null,
    expiry_date date not null,
    
    primary key (id)
);

create table user_card(
	id int auto_increment,
    user_id int,
    mycard_id int,
    
    primary key(id),
    constraint FK_user_card_user_id foreign key(user_id) references users(id),
    constraint FK_user_card_mycard_id foreign key(mycard_id) references mycard(id)
);

create table order_status(
	id int auto_increment,
    name varchar(50) unique not null,
    
    primary key(id)
);

create table shipping(
	id int auto_increment,
    name varchar(50) unique not null,
    price int not null,
    
    primary key(id)
);

create table orders (
	id int auto_increment,
    order_date date not null,
    total int not null,
    shipping_address text not null,
    user_id int,
    user_card_id int,
    shipping_id int,
    status_id int,
    
    primary key(id),
    constraint FK_orders_user_id foreign key(user_id) references users(id),
    constraint FK_orders_user_card_id foreign key(user_card_id) references user_card(id),
    constraint FK_orders_shipping_id foreign key(shipping_id) references shipping(id),
    constraint FK_orders_status_id foreign key(status_id) references order_status(id)
);

create table manufacturer(
	id int auto_increment,
    name varchar(100) unique not null,
    
    primary key(id)
);

create table category(
	id int auto_increment,
    name varchar(50) unique not null,
    
    primary key(id)
);

create table discount(
	id int auto_increment,
    code varchar(50) unique not null,
    discount_amount int not null,
    start_date date not null,
    end_date date not null,
    description text,
    
    primary key(id)
);

create table product(
	id int auto_increment,
    name varchar(200) unique not null,
    price_origin int not null,
    price_discount int,
    inventory int not null,
    sold_qty int default 0,
    description text,
    discount_id int,
    manufacturer_id int,
    category_id int,
    
    primary key(id),
    constraint FK_product_discount_id foreign key(discount_id) references discount(id),
    constraint FK_product_manufacturer_id foreign key(manufacturer_id) references manufacturer(id),
    constraint FK_product_category_id foreign key(category_id) references category(id)
);

create table image(
	id int auto_increment,
    name text not null,
    
    primary key(id)
);

create table product_image(
	id int auto_increment,
    product_id int,
    image_id int,
    
    primary key(id),
    constraint FK_product_image_product_id foreign key(product_id) references product(id),
    constraint FK_product_image_image_id foreign key(image_id) references image(id)
);

create table order_item(
	id int auto_increment,
    amount smallint not null,
    subtotal int,
    order_id int,
    product_id int,
    
    primary key(id),
    constraint FK_order_item_order_id foreign key(order_id) references orders(id),
    constraint FK_order_item_product_id foreign key(product_id) references product(id)
);

create table category_property(
	id int auto_increment,
    name varchar(200) not null,
    category_id int,
    
    primary key(id),
    constraint FK_category_property_category_id foreign key(category_id) references category(id)
);

create table product_property(
	id int auto_increment,
    description text not null,
    product_id int,
    cate_property_id int,
    
    primary key(id),
    constraint FK_product_property_product_id foreign key(product_id) references product(id),
    constraint FK_product_property_cate_property_id foreign key(cate_property_id) references category_property(id)
);

create table product_rating(
	id int auto_increment,
    star tinyint default 0,
    comment text,
    user_id int,
    product_id int,
    
    primary key(id),
    constraint FK_product_rating_user_id foreign key(user_id) references users(id),
    constraint FK_product_rating_product_id foreign key(product_id) references product(id)
);


















