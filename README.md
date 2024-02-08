# DbSchemaChecker

This tool adds a convenient rake task that allows you to verify whether schema.rb and migration files have been correctly committed. It’s designed to help ensure the integrity of your database schema management process.

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

## Why This Tool Was Created

Many developers have encountered issues with database schema management in Continuous Integration (CI) environments, depending on how database tables are managed. Common scenarios include:

- Being reminded during a review that migration files or schema.rb were not updated.
- Experiencing discrepancies in the order of columns in schema.rb compared to the live database after merging parallel pull requests that add columns to the same table.
- Noticing changes in schema.rb after running migrations from the latest main branch, indicating that schema.rb was updated.
- Encountering ActiveRecord::PendingMigrationError because only schema.rb was committed, leaving migrations pending.

These issues often arise from inconsistencies between migration files and their output, schema.rb, on the main branch. To alleviate the hassle of manually checking these consistencies, this tool was developed.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kufu/db_schema_checker.

## Code of Conduct

Everyone interacting in the db_schema_checker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kufu/db_schema_checker/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/kufu/db_schema_checker/blob/master/LICENSE.txt).
