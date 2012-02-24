class InMemoryDb
  def self.in_memory_db?
    #Rails.configuration.database_configuration['test']['database'] =~ /memory/
    ActiveRecord::Base.connection_config[:database] =~ /memory/
  end

  def self.verbosity
    ActiveRecord::Base.connection_config[:verbosity]
  end

  def self.inform_using_in_memory
    puts "Creating in-memory database"
  end

  def self.create_db
    create_db = lambda {
      #ActiveRecord::Migration.verbose = verbosity.blank?
      #ActiveRecord::Migrator.migrate('db/migrate')
      load "#{Rails.root}/db/schema.rb"
    }
    case verbosity
    when "silent"
      silence_stream(STDOUT, &create_db)
    when "quiet"
      inform_using_in_memory
      silence_stream(STDOUT, &create_db)
    else
      inform_using_in_memory
      create_db.call
    end
  end
end

InMemoryDb.create_db if InMemoryDb.in_memory_db?
