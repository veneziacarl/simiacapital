class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.send_news
    @users = User.where(daily_news: true).pluck(:email)
    NewsMailer.daily_news(@users).deliver
  end
end
