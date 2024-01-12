class SessionsController < ApplicationController
  include SessionsHelper
  before_action :require_user, except: [:index, :create]
  def index
    if $current_user = User.find_by_id(session[:current_user_id])
      #logger.debug $current_user
      redirect_to sessions_landing_path
    end
  end
  def landing
  end
  def create
    if user = User.find_by_username(params[:username].downcase)
      if user.authenticate(params[:password])
        session[:current_user_id] = user.id
      end
    end
    redirect_to root_path
  end
  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
