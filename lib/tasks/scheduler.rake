desc "This task is called by the Heroku scheduler add-on"
task :send_news => :environment do
  puts "Updating feed..."
  news = Aggregator.new.generate_news
  puts "Completed feed update."
  puts "Devilering daily news..."
  User.send_news(news)
  puts "Completed email delivery."
end
