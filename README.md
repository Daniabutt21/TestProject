# README

My Test Project is a Billing App.
There are two Main Types of Users. 
-   Admin
-   User(Buyer)

I use devise and pundit gem for signup login functionalities.

## Functionalities Of Admin
 
 - Admin can view All the Registered Users in our billing app.
 - Admin can create PLans.
 - Admin can add features in respective plan.
 - CRUD implementations of Plans is provided
 - Admin can add usages of features of a user.
 - Admin can call charge method which calculates bill of all users.

## Functionalities of Users (Buyer)

 - Buyer can view all the plans and features. 
 - Buyer can subscribe plan.
 - Buyer can view its transactions.
 - buyer can view its all subscriptions.
 
 # Dependencies
 
 ## Installations
 
- Ruby.
- ~$ ruby -v
- ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux]

- SQLite3
- ~$ sqlite3 --version
- 3.22.0 2018-01-22 18:45:57 0c55d179733b46d8d0ba4d88e01a25e10677046ee3da1d5b1581e86726f2alt1

- Node
- ~$ node --version
- v12.16.3

- Yarn
- ~$ yarn -v
- 1.22.4

- Rails
- $ gem install rails
- $ rails --version 
- Rails 6.0.3.2

To get started with the project follow the instructions below:
# Clone
Clone this repo to your local machine using https://github.com/Daniabutt21/TestProject
# Setup
cd to the project folder and bundle install

$ git clone https://github.com/Daniabutt21/TestProject
- $ bundle install
- seeds.rb contains:

Dummy data for creating admin and buyer
- some sample plans and features
- $ rails db:migrate
- $ rails db:seed

# Todo

- [x] User: Devise authentication with modified models,views and controllers
- [x] Plan: Create (can add multiple features), read, update, delete
- [x] Features: Create, read
- [ ] Authorization: for Plan (only admin can access to new, edit and delte)
- [x] Subscription: User can subscribe to multiple plans and view and unsubscribe from plans
- [ ] Emails: Email sent after new subscription
- [ ] Usage: View Usage table by admin
- [ ] Add Usage (Usage record added when a user subscribes to plan)
- [ ] Add Usage for a given month for all active subscriptions
- [ ] Add Usage when a plan is edited/feature added or removed
- [ ] Add Transactions table
- [ ] Validations
- [ ] Transaction on first time subscription
- [ ] Make transaction for usage
- [ ] Allow monthly transactions (for both Usages and subscriptions)
- [ ] Send Email for monthly usage and subscriptions
