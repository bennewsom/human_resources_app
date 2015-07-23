class HomeController < ApplicationController
  def index
    redirect_to companys_path if user_signed_in?
  end
end