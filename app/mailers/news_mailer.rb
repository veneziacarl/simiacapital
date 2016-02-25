class NewsMailer < ActionMailer::Base
  default from: "\"Simia Capital\" <simiacapital@gmail.com>"

  def daily_news(users)
    puts "Generating news feed..."
    @news = Aggregator.new.generate_news
    puts "Completed aggregation."
    mail(to: "simiacapital@gmail.com", subject: "Daily Cannabis News!", bcc: users)
  end
end
