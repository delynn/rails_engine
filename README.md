# Rails Engine

[![Code Climate](https://codeclimate.com/github/julsfelic/rails_engine/badges/gpa.svg)](https://codeclimate.com/github/julsfelic/rails_engine) [![Test Coverage](https://codeclimate.com/github/julsfelic/rails_engine/badges/coverage.svg)](https://codeclimate.com/github/julsfelic/rails_engine/coverage) [![Issue Count](https://codeclimate.com/github/julsfelic/rails_engine/badges/issue_count.svg)](https://codeclimate.com/github/julsfelic/rails_engine) ![build](https://travis-ci.org/julsfelic/rails_engine.svg?branch=master)

The Rails Engine project takes in CSV data from the [Black Thursday repo](https://github.com/turingschool/curriculum/blob/master/source/projects/black_thursday.markdown)
and creates a RESTful Rails API that includes record endpoints, relationship endpoints,
and business intelligence endpoints.

## Getting Started

Clone down the repo:

```bash
  $ git clone https://github.com/julsfelic/rails_engine.git
```

Then change into the project directory:

```bash
  $ cd rails_engine
```

### Installing

Let's go ahead and get the database setup:

```bash
  $ rake db:setup
```

Then import the CSV data:

```bash
  $ rake import:all
```

There is also the option to import only specific subsets of the CSV data:

```bash
$ rake import:customers
$ rake import:invoice_items
$ rake import:invoices
$ rake import:items
$ rake import:merchants
$ rake import:transactions
```

Once the rake task is complete, go ahead and run the test suite to confirm that setup was completed successfully:

```bash
  $ rspec
```

To hit our API endpoints let us start up a server:

```bash
  $ rails s
```

And using a tool like [Postman](https://www.getpostman.com/) or [cURL](https://curl.haxx.se/) we can tell our API to return JSON data. Here is an example endpoint using cURL:

```bash
  curl -XGET localhost:3000/api/v1/merchants/find_all?name=Cummings-Thiel
```

This will return a collection of transactions associated with the specific customer. For a full list of all the endpoints reference the official [Rails Engine docs](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md)

## Running the tests

Rails Engine uses RSpec for its test suite. To run the tests:

```bash
  $ rspec
```

## Authors

* **Julian Feliciano** - *Initial work* - [julsfelic](https://github.com/julsfelic)
