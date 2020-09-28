class PagesController < ApplicationController
  def home
    if current_user
      redirect_to dashboard_for_user(current_user)
    end
  end

  def about
  end
end
