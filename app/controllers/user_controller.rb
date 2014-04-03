class UserController < ApplicationController
  before_filter :authenticate_user!

  def home
    @companies = current_user.companies
  end
end
