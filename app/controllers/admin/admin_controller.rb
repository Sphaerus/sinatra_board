class AdminController < ApplicationController
  before do
    #authenticate_admin
  end

  private

  def authenticate_admin
    authenticate_user
    redirect to(base_url) if !current_user.admin?
  end
end
