# GlobalizeOverlapChecker

When there are table and model this.

```ruby
class Post < ActiveRecord::Base
    translates :name
end
```

And if posts table have `name` column, globalize overlap this column by translate method.   
In globalize 5.x, ActiveRecord's column data return overlaped column.  
But globalize 5.1 or later, thease method doesn't return overlaped column.  

And we shouldn't use overlaped column because its' difficult to understand.  

This gem check overlaped columns and generate removing migration and raise error when thease migration exist.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'globalize_overlap_checker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install globalize_overlap_checker

## Usage

When you want to generate migration file.
```bash
rake globalize_overlap_checker:generate_remove_overlap_migration
```

If you want to raise error when overlaped, write this.  
*If you want to generate migration, don't execute this*

```
GlobalizeOverlapChecker.prohibition_overlap!
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/globalize_overlap_checker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the GlobalizeOverlapChecker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/globalize_overlap_checker/blob/master/CODE_OF_CONDUCT.md).
