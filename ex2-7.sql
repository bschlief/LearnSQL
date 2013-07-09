/* PREAMBLE = drop initial if they're already there. */
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS person_pet;

/*===ex2===*/
CREATE TABLE person (
  id integer primary key,
  first_name text,
  last_name text,
  age integer
);

CREATE TABLE pet (
  id integer primary key,
  name text,
  breed text,
  age integer,
  dead integer
);

CREATE TABLE person_pet (
  person_id integer,
  pet_id integer
);

/*===ex3===*/

INSERT INTO person (id, first_name, last_name, age)
  values (0, "Zed", "Shaw", 37);

INSERT INTO pet (id, name, breed, age, dead)
  values (0, "Fluffy", "Unicorn", 1000, 0);

INSERT INTO pet values (1, "Gigantor", "Robot", 1, 1);

/*===ex4===*/

INSERT INTO person_pet (person_id, pet_id) VALUES (0, 0);
INSERT INTO person_pet VALUES (0, 1);

/*===ex5===*/

SELECT * from person;
SELECT name, age from pet;
SELECT name, age from pet where dead = 0;
SELECT * from person where first_name != "Zed";

/*===ex6===*/

SELECT pet.id, pet.name, pet.age, pet.dead
  FROM pet, person_pet, person
  WHERE
  pet.id = person_pet.pet_id AND
  person_pet.person_id = person.id AND
  person.first_name = "Zed";

/*===ex7===*/

-- make sure there's dead pets
SELECT name, age FROM pet where dead = 1;

-- aww poor robot
DELETE FROM pet WHERE dead = 1;

-- make sure the robot is gone
SELECT * FROM pet;

-- let's resurrect the robot
INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 0);

-- the robot LIVES!
SELECT * from pet;
