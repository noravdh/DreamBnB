Description
DreamBnB is an application that allows users to list spaces to rent & book places to stay.

CREATE A DATABASE
Call it 'DreamBnB'
make 2 tables
CREATE TABLE login(id SERIAL PRIMARY KEY, user_name VARCHAR(60));
CREATE TABLE space(id SERIAL PRIMARY KEY, space_name VARCHAR(60));

User stories
As a user, so that I can access the website,
I want to be able to sign up.

As an owner, so that I share my space,
I want to be able to add my space.

As an owner, so that I can share multiple spaces,
I want to be able to add multiple spaces.

As an owner, so that I can provide an accurate description of my space,
I want to be able to give my space a name, description and price.

As an owner, so that I can share my availability,
I want to be able to offer a range of dates when the space is available.

As a renter, so that I can stay in a space,
I want to be able to request to hire a space for a night.

As an owner, so people can stay in my space,
I want to be able to approve their request.

As an owner, so that my space doesn't get double-booked,
I want users to only be able to book once.

As an owner, so that the odds of my space being booked are higher,
I want my space to stay available until a renter has confirmed their booking.
