person(john, date(1990, 5, 15),age(21)).
person(susan, date(1985, 8, 23),age(18)).
person(mike, date(1995, 2, 10),age(25)).
person(alice, date(1980, 11, 5),age(19)).
get_dob(Name, DOB,AGE) :- person(Name, DOB,AGE).
