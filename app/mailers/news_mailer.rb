class NewsMailer < ActionMailer::Base
  default from: "\"Simia Capital\" <simiacapital@gmail.com>"

  def daily_news(news, users)
    @news = news
    users.each do |user|
      @user = user
      mail(
      to: @user.email,
      subject: "Daily Cannabis News!",
      from: "simiacapital@gmail.com"
      ).deliver()
    end
  end
end
