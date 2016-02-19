class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @contact = Contact.new
  end

  def portal
  end
end
