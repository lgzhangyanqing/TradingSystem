
/*
If tables exist, drop those tables
*/
BEGIN
	EXECUTE IMMEDIATE 'DROP TABLE yfts_own';
EXCEPTION
	WHEN OTHERS THEN
    	IF SQLCODE != -942 THEN
        	RAISE;
    	END IF;
END;
/
BEGIN
	EXECUTE IMMEDIATE 'DROP TABLE yfts_trans';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
			RAISE;
		END IF;
END;
/
BEGIN
	EXECUTE IMMEDIATE 'DROP TABLE yfts_user';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
			RAISE;
		END IF;
END;
/
BEGIN
	EXECUTE IMMEDIATE 'DROP TABLE yfts_stock';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
			RAISE;
		END IF;
END;
/

/*
For user table:
*/
create table yfts_user
(
	user_id number(8),
	username varchar2(20) not null unique,
	password varchar2(20) not null,
	email varchar2(50) not null unique,
	firstname varchar2(30),
	lastname varchar2(30),
	balance number not null,
	authority varchar2(20) not null,
	enabled number(1),
	constraint yfts_user_pk primary key (user_id)
);


/*
For stock table:
*/
create table yfts_stock
(
	stock_id number(5),
	symbol varchar2(10) not null unique,
	stockname varchar2(50) not null,
	constraint yfts_stock_pk primary key (stock_id)
);


/*
For ownership table:
*/
create table yfts_own
(
	user_id number(8),
	stock_id number(5),
	quantity number(10) not null,
	constraint yfts_own_quantity_ck check (quantity >= 0),
	constraint yfts_own_pk  primary key (user_id,stock_id),
	constraint yfts_own_uid_fk foreign key (user_id) references yfts_user (user_id),
	constraint yfts_own_sid_fk foreign key (stock_id) references yfts_stock (stock_id)
);

/*
For transaction table:
*/
create table yfts_trans
(
	trans_id number,
	user_id number(8),
	stock_id number(5),
	amount number(12) not null,
	price number(5,2) not null,
	trans_time date,
	constraint yfts_trans_price_ck check (price >= 0),
	constraint yfts_trans_pk primary key (trans_id),
	constraint yfts_trans_uid_fk foreign key (user_id) references yfts_user (user_id),
	constraint yfts_trans_sid_fk foreign key (stock_id) references yfts_stock (stock_id)
);

insert into yfts_user values(1,'user','123456','123@123.com','user','user',1000000,'ROLE_USER',1);
insert into yfts_user values(2,'admin','123456','234@123.com','admin','admin',1000000,'ROLE_ADMIN',1);

insert into yfts_stock values(1,'BOA','Bank of America');
insert into yfts_stock values(2,'GOOG','Google');
