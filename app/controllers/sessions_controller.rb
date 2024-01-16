class SessionsController < ApplicationController
  include SessionsHelper
  before_action :check_session
  before_action :go_to_login, only: [:landing]
  def index
  end
  def landing
  end
  def create
    if $current_user = User.find_by_username(params[:username].downcase)
      if $current_user.authenticate(params[:password])
        session[:current_user_id] = $current_user.id
        return redirect_to sessions_landing_path
      end
    end
    go_to_login
  end
  def destroy
    session[:current_user_id] = nil
    check_session
    go_to_login
  end
end
