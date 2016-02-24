class NewsMailer < ActionMailer::Base
  default from: "\"Simia Capital\" <simiacapital@gmail.com>"

  def daily_news(user)
    mail(to: user.email, subject: "Daily Cannabis News!")
  end
end
