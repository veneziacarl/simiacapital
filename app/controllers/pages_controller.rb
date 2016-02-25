require 'rss'

class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @contact = Contact.new
  end

  def portal
  end

  def subscribe
    @user = User.find(current_user)
    if @user.update(daily_news: true)
      flash[:notice] = "Successfully subscribed to daily news"
      redirect_to portal_path
    else
      flash.now[:notice] = "Unable to subscribe. Please try again."
      render :portal
    end
  end

  def unsubscribe
    @user = User.find(current_user)
    if @user.update(daily_news: false)
      flash[:notice] = "Successfully unsubscribed from daily news"
      redirect_to portal_path
    else
      flash.now[:notice] = "Failed to unsubscribe. Please try again."
      render :portal
    end
  end
end
