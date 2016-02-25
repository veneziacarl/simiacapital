desc "This task is called by the Heroku scheduler add-on"
task :send_news => :environment do
  puts "Devilering daily news..."
  User.send_news
  puts "Completed email delivery."
end
