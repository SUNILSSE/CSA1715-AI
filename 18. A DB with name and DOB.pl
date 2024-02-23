person(john, date(1990, 5, 15)).
person(susan, date(1985, 8, 23)).
person(mike, date(1995, 2, 10)).
person(alice, date(1980, 11, 5)).
get_dob(Name, DOB) :- person(Name, DOB).
