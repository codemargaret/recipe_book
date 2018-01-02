![Alt text](./db_design.png?raw=true "Database Schema Design")

# _Recipe Book_

#### _An application that allows a user to keep track of recipes, 09.28.2017_

#### By _**Margaret Berry and Dawson Mortenson**_

## Project Goals
* _Practice setting up different types of relationships in ActiveRecord, including a many-to-many relationship._
* _Seed a database._

## User Stories
* _As a user, I want to..._
* _...add a recipe with ingredients and instructions, so I remember how to prepare my favorite dishes._
* _...tag my recipes with different categories, so recipes are easier to find._
* _...search recipes by tag._
* _...delete recipes I don't like or use, so I don't have to see them as choices._
* _...rate my recipes, so I know which ones are the best._
* _...list my recipes by highest rated so I can see which ones I like the best._
* _...see all recipes that use a certain ingredient, so I can more easily find recipes for the ingredients I have._

## Future Features
* _Enable users to edit recipes._

## Setup/Installation Requirements
_Run the following commands in Terminal:_

1. `$ git clone` [this repository](https://github.com/codemargaret/recipe_book.git)
2. `$ cd recipe_book`
3. `$ rake db:create`
4. `$ rake db:migrate`
5. `$ rake db:seed`
6. `$ rake db:test:prepare`
7. `$ ruby app.rb`
8. _Navigate to localhost:4567_

## Known Bugs
_There are no known bugs at this time._

## Support and contact details
_If you have issues, questions, ideas, or concerns, please contact [Margaret](codeberry1@gmail.com). Feel free to make a contribution to the code._

## Technologies Used
* _Ruby_
* _Sinatra_
* _ActiveRecord_

### License
*This software is licensed under the MIT license.*

Copyright (c) 2017 **_Margaret Berry and Dawson Mortenson_**
