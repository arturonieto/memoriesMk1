module SessionsHelper
  def check_session
    if !session[:current_user_id]
      $current_user = nil
    elsif !$current_user or ( $current_user and $current_user.id != session[:current_user_id] )
      $current_user = User.find_by_username(session[:current_user_id]);
    end
  end
  def go_to_login
    redirect_to root_path unless $current_user
  end
end
