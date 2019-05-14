# ActiveRecord::TakeOrFind

TakeOrFind is an extension to ActiveRecord which provides a method on your Rails models. Depending on the passed argument, which can either be a number (ID) or instance of that model, it lets you either find a record by the ID or use the record itself.

## When should I use this gem?

If you ever created any function which you wanted to be modular and be able to take either an ActiveRecord model or an ID, this is a place for this gem. Check [usage](#usage) for more info and examples.

## Installation

TakeOrFind is distributed as a gem, which is how it should be used in your application.

Include the gem in your Gemfile:

```
gem "activerecord-take_or_find", "~> 1.0"
```

## Usage

Lets say that you want to create a method anywhere in your application. This method would take an user_id as an argument and find the user inside the method.

```ruby
def method(user_id)
  user = User.find(user_id)
  # ...
end
```

However, at some point in time you realize that sometimes when you use this method, you already have the user loaded. For perfomance reasons atleast, you would prefer to be able to pass the user to the method, but you want to keep the possibility to pass ID only. You can achieve it like this:

```ruby
def method(user_id)
  user = User.take_or_find(user_id)
  # ...
end
```
