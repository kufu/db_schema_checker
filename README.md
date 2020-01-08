# DbSchemaChecker

## Installation

```ruby
gem 'db_schema_checker'
```

## Usage

```console
$ RAILS_ENV=test bin/rails db:migrate:reset:check
Dropped database 'blog_test'
Created database 'blog_test'
ok

$ rm db/migrate/20180202012345_create_comments.rb

$ RAILS_ENV=test bin/rails db:migrate:reset:check
Dropped database 'blog_test'
Created database 'blog_test'
ERROR: Generated schema is not consistent with db/schema.rb
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kufu/db_schema_checker.

## Code of Conduct

Everyone interacting in the db_schema_checker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kufu/db_schema_checker/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/kufu/db_schema_checker/blob/master/LICENSE.txt).
