[![Code Climate](https://codeclimate.com/github/marcoaam/shopping-website/badges/gpa.svg)](https://codeclimate.com/github/marcoaam/shopping-website) [![Test Coverage](https://codeclimate.com/github/marcoaam/shopping-website/badges/coverage.svg)](https://codeclimate.com/github/marcoaam/shopping-website) [![Build Status](https://travis-ci.org/marcoaam/shopping-website.svg?branch=development)](https://travis-ci.org/marcoaam/shopping-website)

Clothes Shopping Website
=======================

A Website for shopping clothes build in Sinatra.

Technologies
------------

- Ruby
- Sinatra
- RSpec / Capybara
- ERB templating library
- Datamapper
- PostgreSQL
- Bootstrap

Regarding the decision for the technologies used there are a few things to consider.

I would expect on a real world escenario first determine the customer needs taking information such as size of the business, growth plans, between others to be able to decide about the technologies properly looking close to the information.

Because this is not the case. I decided on this set of technologies based on assumptions of the customers needs from my point of view.


### Sinatra

I decided to use Sinatra for this project based on that it is a simple yet powerfull library that gives great control over the application. It can handle a reasonable size application without getting out of hand as long as the proper organisation for the files and folders is followed.

### RSpec / Capybara

For the purposes of testing I consider that RSpec and Capybara provide a excellent testing environment. With the knowledge I have of them I can drive the code easily but more importantly it is a friendly framework easy to use and to understand.

### Database

I choose to use a database in this case even thought I had the option of mocking the data. I decided to do so because I think it simulates in a better way a real world scenario and gives flexibility at the moment of adding new features in the future if needed.

### Bootstrap

The customer request is for a responsive website that can easily be optimised to all devices and bootstrap I consider it has great features to do this. Using Bootstrap allows to manipulate elements on the page easily and has a great set of extra features to be ready for expansion when needed.


Models
------

There are 5 models to handle the relations efficiently.

- Product
- Category
- SockProduct
- CartProduct
- Voucher

Controllers
-----------

- application   (handles the homepage)
- shopping_cart (handles each creation and removal of products)
- Voucher       (handles the voucher creation)

Views
------

- index          (handles all the products and cart)
- _shopping_cart (partial to display the shopping cart)
- _products_list (partial to display a list of products)
- _flash_errors  (partial to display the errors)
- layout         (main application template)


Requirements
-------------

- Ruby
- bundler 
    gem install bundler


How to set it up
---------------

1. Download from https://github.com/marcoaam/shopping-website/archive/master.zip .
2. Unzip the package and go to the directory on the terminal.
3. Run the following commands.

    bundle install
    psql -c 'create database shopping_test;'
    psql -c 'create database shopping_development;'
    rake auto_migrate RACK_ENV=test
    rake auto_upgrade RACK_ENV=test
    rake auto_migrate
    rake auto_upgrade
    rake seed
    rackup

open your browser in [localhost:9292/](http://localhost:9292/)


How to test it
--------------

    cd shopping-website
    rspec



