# README

* Ruby version: 3.4.2

* Database initialization: 

* How to run the test suite

* Deployment instructions

# USER STORY 1
Title: Adding data to the database from a json file 

As a developer I want to fill my database with the data that come from a json file with the information of recipes.

Acceptance Criteria:

Given a json file with recipes information coming from https://pennylane-interviewing-assets-20220328.s3.eu-west-1.amazonaws.com/recipes-en.json.gz,
an entrance in Recipe table of the database is created for each element using the task from rails db:seed

# USER STORY 2
Title: Filter recipes by ingredients

As a user searching for meals I want to enter ingredients (one by one) I already have So that I can find recipes that match what’s in
my kitchen (and only those ingredients). I also want to clear all the ingredients, so I can start over.

Acceptance Criteria:

The controller should have an action for add an ingredient to a list and search, right away, within the ingredients of 
the recipes stored in the database the ones that use ONLY those ingredients. An action for clearing the list and start over
should be in place as well. 

# USER STORY 3

Title: UX for the application 

As a user I want a simple form where I can enter ingredients in a field text and obtain a list of Recipes with the result
shown as a list

Acceptance Criteria:

Given I have entered “tomato”, “pasta” as ingredients in the text field, I want to see a resume list of "Tomato" and "Pasta" 
as introduced ingredients and below that a list of recipes with the result.
There should be a button to enter one by one the ingredients, labeled as "Add ingredient" and another one labeled "Clear ingredients"
to empty that list 

# USER STORY 4

Title: Details for a recipe

As a user I want to have the details of one concrete recipe returned in the search, so then I can see all the details


Acceptance Criteria:

Given I recipe, I can have all the details of it such as the title, author, category, preparation time, cook time, rating,
link to a photo (decoded url) and a list of ingredients in a human friendly format

# USER STORY 5

Title: Details for a recipe in the UX 

As a user I want to be able to navigate into the details of a recipe returned in the main search .
I also want to be back to the main search from that detailed view.


Acceptance Criteria:

Given a recipe, a view is rendered with the title as a header in the top of the view, and below the author, category, 
preparation and cook time. The rating should be also showed as stars that represents the score. At the bottom, a button 
labeled "Back to the list" will redirect me to the main view.