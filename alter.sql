drop database bank;
CREATE database bank;

CREATE TABLE bank_details
(	
	Bank_name VARCHAR(15)  NOT NULL,
	Bank_branch VARCHAR(15) NOT NULL,
	Bank_district VARCHAR(30),
	Bank_state VARCHAR(20),
	Unique (Bank_branch),
	Bank_IFSC_code VARCHAR(10),
	Primary Key (Bank_IFSC_code)
);

CREATE TABLE account
(
	Account_no BIGINT,
	Account_balance BIGINT,
	Customer_id BIGINT,
	Primary Key (Account_no)
);


CREATE TABLE customer
(	
	Fname VARCHAR(30) NOT NULL,
	Mname CHAR,
	Lname VARCHAR(30) NOT NULL,
	Customer_id BIGINT,
	Account_no BIGINT,
	DOB DATE,
	Email_id VARCHAR(40) NOT NULL,
	Password VARCHAR(40) NOT NULL,	
	Address VARCHAR(50),
	Gender CHAR,
	Bank_IFSC_code VARCHAR(10),
	Primary KEY (Customer_id),
	FOREIGN KEY (Bank_IFSC_code) REFERENCES bank_details(Bank_IFSC_code),
	FOREIGN KEY (Account_no) REFERENCES account(Account_no)
	ON DELETE CASCADE
);

Alter TABLE account
ADD FOREIGN KEY (Customer_id) REFERENCES customer(Customer_id);

CREATE TABLE transaction
(
	Account_no BIGINT,
	Credit INT,
	Debit INT,
	Transaction_id BIGINT,
	Transaction_date DATE NOT NULL,
	Transaction_time TIME NOT NULL,
	Primary Key (Transaction_id),
	FOREIGN KEY (Account_no) REFERENCES account(Account_no)
	ON DELETE CASCADE
);

CREATE TABLE card
(
	Card_no VARCHAR(20),
	CVV INT NOT NULL,
	Joined_date DATE,
	Expiry_date DATE NOT NULL,
	Holder_Fname VARCHAR(20),
	Account_no BIGINT,
	Primary Key (Card_no),
	FOREIGN KEY (Account_no) REFERENCES account(Account_no)
	ON DELETE CASCADE
);

CREATE TABLE wallet
(
	Wallet_balance Int,
	Account_no BIGINT,
	FOREIGN KEY (Account_no) REFERENCES account(Account_no)
	ON DELETE CASCADE
);

CREATE TABLE loan
(
	Loan_no INT Primary Key,
	Loan_type VARCHAR(20) NOT NULL,
	Loan_amount BIGINT,
	Loan_interest FLOAT(2),
	Due_date DATE NOT NULL,
	Account_no BIGINT,
	FOREIGN KEY (Account_no) REFERENCES account(Account_no)
	ON DELETE CASCADE
);

CREATE TABLE nominee
(
	N_Fname VARCHAR(20) NOT NULL,
	N_Lname VARCHAR(20) NOT NULL,
	N_age INT,
	N_relation VARCHAR(15) NOT NULL,
	N_Gender CHAR,
	Customer_id BIGINT,
	FOREIGN KEY (Customer_id) REFERENCES customer(Customer_id)
	ON DELETE CASCADE
);
