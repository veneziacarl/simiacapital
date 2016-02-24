desc "This task is called by the Heroku scheduler add-on"
task :send_news => :environment do
  puts "Devilering daily news..."
  users = User.all
  User.send_news(users)
  puts "Completed email delivery."
end
