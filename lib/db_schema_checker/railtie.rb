module DbSchemaChecker
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'tasks/db_schema_checker_tasks.rake'
    end
  end
end
