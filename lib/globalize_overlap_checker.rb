require "globalize_overlap_checker/version"
require "globalize_overlap_checker/globalize/acto_macro"

module GlobalizeOverlapChecker
  class GlobalizeOverlapError < StandardError; end
  class MyRailtie < Rails::Railtie
    rake_tasks do
      load "tasks/generate_remove_overlap_migration.rake"
    end
  end

  @prohibition_overlap = false

  class << self
    def prohibition_overlap?
      @prohibition_overlap
    end

    def prohibition_overlap!
      @prohibition_overlap = true
    end

    def add_overlap_model(table_name, overlap)
      @overlap_models = [] unless defined?(@overlap_models)
      @overlap_models << { table_name: table_name, overlap: overlap }
    end

    def generate_migration(output_filepath)
      Rails.application.eager_load!

      migration_heads = [
          "class RemoveGlobalizeOverlapMigration < ActiveRecord::Migration",
          "  def change"
      ]

      migration_tails = ["  end",
                         "end"]

      sorted_tables = @overlap_models.compact.sort_by { |d| d[:table_name] }
      migration = (migration_heads +
          sorted_tables.map { |d| "    remove_columns :#{d[:table_name].to_sym}, #{d[:overlap].map{ |c| ":#{c}"}.join(", ")}" } +
          migration_tails).flatten

      open(output_filepath, 'w') { |f| f.write(migration.join("\n")) }
    end
  end
end
