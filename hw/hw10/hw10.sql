CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT dogs.name AS name, sizes.size AS size FROM dogs, sizes WHERE dogs.height>sizes.min AND dogs.height<=sizes.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT d1.name
    FROM dogs AS d1, dogs AS d2, parents AS p
      WHERE d1.name = p.child AND p.parent = d2.name
        ORDER BY d2.height DESC;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT s1.name AS dog1, s2.name AS dog2, size1.size AS type
    FROM dogs AS s1, dogs AS s2, parents AS p1, parents AS p2, size_of_dogs AS size1, size_of_dogs AS size2
      WHERE s1.name < s2.name AND s1.name = p1.child AND s2.name = p2.child AND p1.parent = p2.parent 
        AND s1.name = size1.name AND s2.name = size2.name AND size1.size = size2.size;


-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT dog1 || " and " || dog2 || " are " || type || " siblings" FROM siblings;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here

INSERT INTO stacks_helper SELECT name, height, height FROM dogs;
INSERT INTO stacks_helper SELECT dogs || ', ' || name, stack_height+height, height FROM stacks_helper, dogs WHERE last_height<height;
INSERT INTO stacks_helper SELECT dogs || ', ' || name, stack_height+height, height FROM stacks_helper, dogs WHERE last_height<height;
INSERT INTO stacks_helper SELECT dogs || ', ' || name, stack_height+height, height FROM stacks_helper, dogs WHERE last_height<height;

CREATE TABLE stacks AS
  SELECT dogs, stack_height FROM stacks_helper WHERE stack_height>170 ORDER BY stack_height ASC;

