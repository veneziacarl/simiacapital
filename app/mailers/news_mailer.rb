class NewsMailer < ApplicationMailer
  def new_news
    mail(
      to: "veneziacarl@gmail.com",
      subject: "New NEWS!",
      from: "simiacapital@gmail.com"
    )
  end
end
