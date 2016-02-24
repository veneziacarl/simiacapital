desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  news = Aggregator.new.generate_news
  puts "done."
end

task :send_news => :environment do
  User.send_news(news)
end
