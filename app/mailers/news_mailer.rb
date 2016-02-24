class NewsMailer < ActionMailer::Base
  default from: "\"Simia Capital\" <simiacapital@gmail.com>"

  def daily_news(users)
    puts "Generating news feed..."
    @news = Aggregator.new.generate_news
    puts "Completed aggregation."
    users.each do |user|
      mail(to: user.email, subject: "Daily Cannabis News!")
    end
  end
end
