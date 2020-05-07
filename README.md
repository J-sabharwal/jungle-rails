# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

Signup

!["Signup Week"](https://github.com/J-sabharwal/jungle-rails/blob/master/public/Signing_up.gif?raw=true)

Cart & Ordering

!["Cart/Order View"](https://github.com/J-sabharwal/jungle-rails/blob/master/public/adding_to_cart_and_ordering.gif?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* RSpec

## User Experience

A visitor is able to signup and login into their account. Clicking the add button on a product will add an item to the cart which will update the cart item amount in the top right handle corner display. An order can be placed using the provided credit card credentials.

Admin user are able to add new products and categories within the admin section and view a list of all products and categories, along with a dashboard of the total amounts for both.

### Created by Jaspinder Sabharwal @ Lighthouse Labs 2020
