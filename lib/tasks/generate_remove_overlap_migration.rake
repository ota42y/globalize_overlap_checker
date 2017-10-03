namespace :globalize_overlap_checker do
  desc "generate_remove_overlap_migration"
  task :generate_remove_overlap_migration => :environment do
    filepath = "db/migrate/#{DateTime.now.strftime("%Y%m%d%H%M%S")}_remove_globalize_overlap_migration.rb"
    ::GlobalizeOverlapChecker.generate_migration(filepath)
  end
end
