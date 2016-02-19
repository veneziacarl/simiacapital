require 'pry'
require 'rss'

class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @contact = Contact.new
  end

  def portal
    @articles = Aggregator.generate_articles
  end
end
