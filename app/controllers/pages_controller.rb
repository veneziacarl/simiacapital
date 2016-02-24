require 'rss'

class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @contact = Contact.new
  end

  def portal
    @news = Aggregator.new.generate_news
  end
end
