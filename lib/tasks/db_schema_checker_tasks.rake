namespace :db do
  namespace :migrate do
    namespace :reset do
      desc 'Check the consistency of schema.rb'
      task :check do
        unless Rails.env.test?
          abort 'This task must be run under test environment'
        end

        original_env_schema = ENV['SCHEMA']
        original_env_verbose = ENV['VERBOSE']

        schema_path = if ActiveRecord.schema_format == :ruby
                        'db/schema.rb'
                      else
                        'db/structure.sql'
                      end

        consistent = nil
        diff = ''
        Dir.mktmpdir(nil, Rails.root.join('tmp')) do |dir|
          old_schema = Rails.root.join(schema_path)
          new_schema = File.join(dir, File.basename(schema_path))

          ENV['SCHEMA'] = new_schema
          ENV['VERBOSE'] = 'false'

          Rake::Task['db:migrate:reset'].invoke

          consistent = FileUtils.compare_file(old_schema, new_schema)

          next if consistent
          next if `which diff`.empty?

          diff = `diff -u #{old_schema} #{new_schema}`
        end

        ENV['SCHEMA'] = original_env_schema
        ENV['VERBOSE'] = original_env_verbose

        if consistent
          puts 'ok'
          exit 0
        else
          puts 'ERROR: Generated schema is not consistent with db/schema.rb'
          puts diff
          exit 1
        end
      end
    end
  end
end
