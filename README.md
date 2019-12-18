# Jungle

A mini e-commerce application built with Rails 4.2.  Shoppers can browse products by categories and add items to cart.  Upon clicking cart they will be prompted to login or signup.  They can then proceed to pay for their order with Stripe.  After succesful payment details are entered they will see an order summary page.   Admins can create categories and products after succesful authentication.


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

## Screenshots

![Signup](/docs/Signup.png "Signup")
![Login](/docs/Login.png "Login")
![Products](/docs/Products.png "Products")
![Apparel](/docs/Apparel.png "Apparel")
![Admin Categories](/docs/Admin:Categories.png "Admin Categories Page")




