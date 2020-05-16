\c bank
/* see the relational schema or see the order maintained in the bank_create.sql to put the values */

/* Add some more branches from different districts and states, give unique ifsc codes and all bank names are PES BAnNK Only*/
INSERT into bank_details values('PES BANK', 'Rajajinagar','Bangalore','Karnataka','PESB5555');
INSERT into bank_details values('PES BANK', 'Ambevadi','Mumbai','Maharashtra', 'PESB4321');
INSERT into bank_details values('PES BANK', 'Vidya Nagar','Davanagere','Karnataka','PESB3423');

/* let some Fnames be same also and and IFSC Codes should match the above tables values */
/* for some of them let there be same fname,mname,lname but diff cust_id, acc_no which is they have multiple accounts*/
INSERT into customer values ('James','E','Borg', 888665555, '1937-11-10','james12@gmail.com','basket123','450 Stone,Davanagere,Karnataka', 'M','PESB3423');
INSERT into customer values ('Franklin','T','Wong',333445555, '1955-12-08','franky4@gmail.com','nandi32','638 voss,Mumbai,Karnataka', 'M','PESB4321');
INSERT into customer values ('John','B','Smith',12345678, '1965-01-09','johnpapa1@gmail.com','ganesh35','731 Fondren,Bangalore,Karnataka', 'M','PESB5555');
INSERT into customer values ('Jennifer','S','Wallace',987654321, '1941-06-20','jennifer2@gmail.com','lopez12','291 Berry, Davanagere,Karnataka', 'F','PESB3423');
INSERT into customer values ('Alicia','J','Zelaya',999887777, '1968-01-19','alicewon4@gmail.com','wonderland3','3321 Castle,Bangalore,Karnataka', 'F','PESB5555');
INSERT into customer values ('Ramesh','K','Narayan',666884444, '1962-09-15','Rameshi55@gmail.com','suresh44','975 Fire Oak, Bangalore, Karnataka', 'M','PESB5555');
INSERT into customer values ('Joyce','A','English',453453453, '1972-07-31','Joycey56@gmail.com','jack664','5631 Rice,Davanagere,Karnataka', 'F','PESB3423');
INSERT into customer values ('Ahmed','V','Jabbar',987987987, '1969-03-29','Ahmedab4@gmail.com','dhoni777','980 Dallas, Mumbai,Karnataka', 'M','PESB4321');


/* for the order refer bank_create.sql file and maintain balance in different ranges */
INSERT into account values (12346789, 10060, 888665555);
INSERT into account values (66688444, 300000, 333445555);
INSERT into account values (25453453, 11005, 12345678);
INSERT into account values (45345353, 2500, 987654321);
INSERT into account values (33344555, 9500, 999887777);
INSERT into account values (53345555, 35444, 666884444);
INSERT into account values (30445555, 6000, 987987987);
INSERT into account values (58445555, 7005, 453453453);


/* the account numbers should match and at a given transaction either debit or credit should be null*/
INSERT into transaction values (12346789,1000, NULL, 8885555,'2018-04-05','12:21:34');
INSERT into transaction values (12346789,NULL, 1000, 6645455,'2019-02-25','11:41:24');
INSERT into transaction values (66688444,NULL, 300000, 3445985,'2018-02-15','22:51:35');
INSERT into transaction values (25453453,320, NULL, 1034518,'2018-09-05','14:22:12');
INSERT into transaction values (25453453,1300, NULL, 4235648,'2018-04-30','11:21:11');

/* take care that the name and their account no is matching here*/
INSERT into card values ('6012 2312 5744 5665', 981, '2017-04-05', '2021-12-23', 'James', 12346789);
INSERT into card values ('4234 6412 4754 8686', 121, '2016-01-12', '2020-01-15', 'Franklin', 66688444);

/* the account numbers should match*/
INSERT into wallet values (500, 12346789);
INSERT into wallet values (1300, 53345555);

/*give some random loan no and as usual acc nos should match*/
INSERT into loan values (1021, 'Home', 110000, 8.23, '2020-02-23', 12346789);
INSERT into loan values (1025, 'Car', 150000, 6.45, '2019-11-12', 66688444);
INSERT into loan values (1043 ,'Education', 200000, 7.73, '2022-05-30', 12346789);

/* a single customer can have multiple nominees , make some like that also*/
INSERT into nominee values ('Nikhil', 'Devegouda', 17, 'Son', 'M', 888665555); 
INSERT into nominee values ('Radhika', 'Pandit', 29, 'Wife', 'F', 987654321);

