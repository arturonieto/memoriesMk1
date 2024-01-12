module SessionsHelper
  def require_user
    redirect_to root_path unless $current_user
  end
end
