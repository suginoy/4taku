class DashboardController < ApplicationController
  def show
    @user = current_user
    @shared_courses = Course.shared_courses_for(@user)
  end

end
