namespace :db do
  desc "Destroys all the discussions."
  task reset_all_discussions: :environment do
    puts "Destroying all the discussions."
    Discussion.destroy_all
    puts "Finished."
  end
end