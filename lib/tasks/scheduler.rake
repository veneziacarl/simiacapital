desc "This task is called by the Heroku scheduler add-on"
task :send_news => :environment do
  puts "Updating feed..."
  # news = Aggregator.new.generate_news
  puts "Completed feed update."
  puts "Devilering daily news..."
  user = User.all[1]
  User.send_news(user)
  puts "Completed email delivery to #{user.email}."
end
