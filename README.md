<<<<<<< HEAD
THIS REPOSITORY IS DEPRECATED AND WILL SOON BE DELETED.  DO NOT USE IT.
=======================================================================

Prior to September 2013, this code was used in UC Berkeley CS169 and/or
BerkeleyX CS169.1x/.2x on edX.

Effective September 2013, we are revising, refactoring and improving the
homeworks and autograders.  THEREFORE:

* The code in this repo may not work as described in the course, or at
all.

* We will be ignoring pull requests to this repo until it is deleted.

* We will not be answering ANY questions related to this repo.  It is a
non-repo for us.  We have disowned it.  It does not exist.  It has never
existed.

* We will silently ignore all inquiries related to this repo r to any
forks or clones of it.

* You will not get any kind of partial credit in the course if your
homework has errors due to differences between the code in this repo and
the code used in the course.  We will not help you debug homework
problems arising from the use of obsolete materials such as the contents of
this repo.

We will distribute homework "skeleton" code along with each homework
that has been tested with the current autograders.  That code, and ONLY
that code, should be used as the basis of your homework assignments.

Thanks - the CS169 course authors
=======
BDD, TDD Cycle
===

In this assignment you will use a combination of Behavior-Driven Design (BDD) and Test-Driven Development (TDD) with the Cucumber and RSpec tools to add a "find movies with same director" feature to RottenPotatoes, and deploy the resulting app on Heroku.

To get the initial RottenPotatoes code please fork this bdd-tdd-cycle repo to your GitHub account with the Fork button on GitHub. Then copy the clone URL from your repo, and execute the following command in the top level of your Cloud9 workspace:

`git clone <your clone URL goes here>`

Next, follow the instructions below to get setup:
----
1) Change into the rottenpotatoes directory: cd hw-bdd-tdd-cycle/rottenpotatoes  
2) Run bundle install --without production to make sure all gems are properly installed.  
3) Run bundle exec rake db:migrate to apply database migrations.  
4) Finally, run these commands to set up the Cucumber directories (under features/) and RSpec directories (under spec/) if they don't already exist, allowing overwrite of any existing files:

```shell
rails generate cucumber:install capybara
rails generate cucumber_rails_training_wheels:install
rails generate rspec:install
```
5) You can double-check if everything was installed by running the tasks `rspec` and `cucumber`.  

Since presumably you have no features or specs yet, both tasks should execute correctly reporting that there are zero tests to run. Depending on your version of rspec, it may also display a message stating that it was not able to find any _spec.rb files.

**Part 1: add a Director field to Movies**

Create and apply a migration that adds the Director field to the movies table. 
The director field should be a string containing the name of the movie’s director. 
HINT: use the [`add_column` method of `ActiveRecord::Migration`](http://apidock.com/rails/ActiveRecord/ConnectionAdapters/SchemaStatements/add_column) to do this. 

Remember to add `:director` to the list of movie attributes in the `def movie_params` method in `movies_controller.rb`.

Remember that once the migration is applied, you also have to do `rake db:test:prepare` 
to load the new post-migration schema into the test database!

**Part 2: use BDD+TDD to get new scenarios passing**

We've provided [three Cucumber scenarios](http://pastebin.com/L6FYWyV7) to 
drive creation of the happy path of Search for Movies by Director.
The first lets you add director info to an existing movie, 
and doesn't require creating any new views or controller actions 
(but does require modifying existing views, and will require creating a new step definition and possibly adding a line
or two to `features/support/paths.rb`).

The second lets you click a new link on a movie details page "Find Movies With Same Director", 
and shows all movies that share the same director as the displayed movie.  
For this you'll have to modify the existing Show Movie view, and you'll have to add a route, 
view and controller method for Find With Same Director.  

The third handles the sad path, when the current movie has no director info but we try 
to do "Find with same director" anyway.

Going one Cucumber step at a time, use RSpec to create the appropriate
controller and model specs to drive the creation of the new controller
and model methods.  At the least, you will need to write tests to drive
the creation of: 

+ a RESTful route for Find Similar Movies 
(HINT: use the 'match' syntax for routes as suggested in "Non-Resource-Based Routes" 
in Section 4.1 of ESaaS). You can also use the key :as to specify a name to generate helpers (i.e. search_directors_path) http://guides.rubyonrails.org/routing.html Note: you probably won’t test this directly in rspec, but a line in Cucumber or rspec will fail if the route is not correct.

+ a controller method to receive the click
on "Find With Same Director", and grab the id (for example) of the movie
that is the subject of the match (i.e. the one we're trying to find
movies similar to) 

+ a model method in the Movie model to find movies
whose director matches that of the current movie. Note: This implies that you should write at least 2 specs for your controller: 1) When the specified movie has a director, it should...  2) When the specified movie has no director, it should ... and 2 for your model: 1) it should find movies by the same director and 2) it should not find movies by different directors.

It's up to you to
decide whether you want to handle the sad path of "no director" in the
controller method or in the model method, but you must provide a test
for whichever one you do. Remember to include the line 
`require 'rails_helper'` at the top of your *_spec.rb files.

We want you to report your code coverage as well.

Add `gem 'simplecov', :require => false` to the test group of your gemfile, then run `bundle install --without production`.

Next, add the following lines to the TOP of spec/rails_helper.rb and features/support/env.rb:

```ruby
require 'simplecov'
SimpleCov.start 'rails'
```

Now when you run `rspec` or `cucumber`, SimpleCov will generate a report in a directory named
`coverage/`. Since both RSpec and Cucumber are so widely used, SimpleCov
can intelligently merge the results, so running the tests for Rspec does
not overwrite the coverage results from SimpleCov and vice versa.

To see the results in Cloud9, open /coverage/index.html. You will see the code, but click the Run button at the top. This will spin up a web server with a link in the console you can click to see your coverage report.

Improve your test coverage by adding unit tests and/or Cucumber features for untested or undertested code. Specifically, you can write unit tests for the `update`, `destroy`, and `create` controller methods, and perhaps bring in cucumber scenarios (and step definitions) from previous assignments.

**Submission:**
For CSCI 420/602, commit all your changes to your personal GitHub repo. Make sure you can find the following online:
+ Cucumber feature file (if different from the one provided) 
+ Cucumber step definitions (i.e., contents of your features/ directory)
+ RSpec tests (i.e., contents of spec/ directory) 
+ SimpleCov report files showing 90% or greater coverage for your models and controllers
+ The URI of your deployed app on Heroku that passes all the scenarios
+ Make sure that on Heroku you apply the new database migrations!
+ Any files you modified (i.e. app/, config/routes.rb, db/migrate/, etc.)
On CitLearn, submit your Heroku URL and your GitHub URL.
>>>>>>> a310b1209d9534fbffc2b858ea3d90df10150358
