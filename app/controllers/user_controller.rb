class UserController < ApplicationController
  def home
    @companies = current_user.companies
  end
end
