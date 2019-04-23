# Rapport

Simple social network site.

## Requirements

Rapport requires **redis**, **elasticsearch** and **Rails 5.2.3**

If you're in MAC OS X you'll want to run the following to install redis
```brew install redis```
and when it get installed, please run the **redis server**.

To install **elasticsearch** you'll want to run the following:
```brew install elasticsearch```
and when it get installed, please run the **elasticsearch server**.

## Installation

Follow these easy steps to install and start the application:

### Set up Rails app

First, install the gems required by the application:
```
bundle
```
Then run:
```
rails db:create
rails db:migrate
```

You can also add some records to database by running:
```
rails db:seed
```

### Set up .env file

Before running the application you will need to create a .env (or rename .env-example) file in app root directory and declare the following variables:

```
BITLY_TOKEN
REDIS_URL
```

*To create a bitly access_token you will need to create an account to the site [https://app.bitly.com](https://app.bitly.com "https://app.bitly.com"). After created, go to Profile (by clicking in your username at the menu) > Generic Access Token > put your pasword > click to "Generate Token"*


### Tests

Run the application Rspec tests running:

```
rspec
```

### Start the app

Start the Rails app:
```
rails s
```
