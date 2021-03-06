[![Code Climate](https://codeclimate.com/github/marcoaam/shopping-website/badges/gpa.svg)](https://codeclimate.com/github/marcoaam/shopping-website) [![Test Coverage](https://codeclimate.com/github/marcoaam/shopping-website/badges/coverage.svg)](https://codeclimate.com/github/marcoaam/shopping-website) [![Build Status](https://travis-ci.org/marcoaam/shopping-website.svg?branch=development)](https://travis-ci.org/marcoaam/shopping-website)

Clothes Shopping Website
=======================

A responsive Website for shopping clothes build using Sinatra.

Check it on Heroku [shopping-website](http://shopping-website.herokuapp.com/)

Technologies
------------

Regarding the decision for the technologies used in this project there are a few things to consider.

I would expect on a real world escenario first determine the customer needs taking information such as size of the business, growth plans, between others to be able to proceed and take more accurate decisions. That way I would be able to decide about the technologies that suits best for the client needs.

Taking in mind this is not the case. I decided on a set of technologies based on assumptions of the customers needs from my point of view.

### List of technologies used

- Ruby
- Sinatra
- RSpec / Capybara
- ERB templating system
- CSS
- Datamapper
- PostgreSQL
- Bootstrap


### Sinatra

I decided to use Sinatra for this project based on that it is a simple yet powerfull library that gives great control over the application. It can handle a reasonable size application without getting out of hand as long as the proper organisation for the files and folders is followed.

### RSpec / Capybara

For the purposes of testing I consider that RSpec and Capybara provide a excellent testing environment. With the knowledge I have of them I can drive the code easily but more importantly it is a friendly framework easy to use and to understand.

### Database

I choose to use a database in this case even thought I had the option of mocking the data. I decided to do so because I think it simulates in a better way a real world scenario and gives flexibility at the moment of adding new features in the future if needed.

### Bootstrap

The customer requirement is for a responsive website that can easily be optimised to all devices and I consider bootstrap has great features to do this. Using Bootstrap allows to manipulate elements on the page easily and has a great set of extra features to be ready for expansion when needed.


File structure
--------------

In the app folder there are a series of folders simulating the MVC kind of file structure. each one of them contains the following.

### Models

There are 5 models to handle the relations efficiently. The models were implemented in this way because if the client decides in the near future to add functionality as, a search bar or display by category, it can be added easily without much changes.

- product (class Product)
- category (class Category)
- stock_product (class SockProduct)
- cart_product (class CartProduct)
- voucher (class Voucher)

### Views

- index          (handles all the products and cart)
- _shopping_cart (partial to display the shopping cart)
- _products_list (partial to display a list of products)
- _flash_errors  (partial to display the errors)
- layout         (main application template)

### Controllers

- application   (handles the homepage)
- shopping_cart (handles each creation and removal of products)
- Voucher       (handles the voucher creation)


Test files
-----------

Inside of the spec folder are all the test files.

### Features folder

High level capybara tests.

- products_feature_spec
- shopping_cart_feature_spec
- voucher_feature_spec
- helpers folder (helper file to eliminate some repetition in the tests)

### Models

Unit testing for the models.

- cart_product_spec
- stock_product_spec
- voucher_spec


Application setup requirements
------------------------------

- Ruby
- bundler (gem install bundler)


How to set it up
---------------

### Option 1 (download zip folder).

1. Download from https://github.com/marcoaam/shopping-website/archive/master.zip .
2. Unzip the package and go to the directory in the terminal.

### Option 2 (use git).

    git clone git@github.com:marcoaam/shopping-website.git
    cd shopping-website


Run the following commands
------------------------------

    bundle install
    psql -c 'create database shopping_test;'
    psql -c 'create database shopping_development;'
    rake auto_migrate RACK_ENV=test
    rake auto_migrate
    rake seed
    rackup

open your browser in [localhost:9292/](http://localhost:9292/)


How to test it
--------------

    cd shopping-website
    rspec

How to use it
-------------

Openning the page you will find all the products displayed as the user stories indicate.

### Add a product to cart.

By just clicking the "Add to cart" button in any of the products you will see that the product gets added to "My shopping cart". You can also fill the numeric box with the quantity of your choice but it cannot be greater than the quantity available or less than one.

### Remove the product from cart.

By clicking "Remove" inside of the shopping cart for any of the products you can easily remove one of the product that you are clicking.

### Apply vouchers.

As instructed there are 3 types of vouchers.

- GET5off (Doesn't have any restriction).
- GET10off (Total price greater than 50).
- GET15off (Total greater that 75 and at least one Footwear item).

To apply the voucher just type in any of those values.


Things to do
------------

If I continue to develop this website I would implement the following to improve the user experience.

### 1. Apply AJAX and JS.

Loading the products to the cart and applying the vouchers is reloading the whole page to do it. By applying AJAX and JS to do so, the user experience would be much better.

### 2. Have more alert messages.

Trying to load a product that it is not in stock and removing products from cart leaving the voucher not valid are not displaying any messages to the user. To have a better user experience I would add this messages to let the user know what is going on.

### 3. Add pictures.

In any online shopping wesite pictures play an important role. With a good set of pictures for each product the website look and user experience would be much better. I didn't add them because it is out of the user stories requirements.
