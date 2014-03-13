  # the authentication system was largely built and adapted to my needs from Michael Hartl's excellent Ruby on Rails tutorial
  # Available from: http://ruby.railstutorial.org/book/ruby-on-rails-tutorial
  # the addition of the following liscence applies to the Sessions and User MVC only - the rest was written seperately
  #Title: Learn Web Development with Rails
  #Author: Michael Hartl
  #Date: 2014
  #Code Version: 1.0
  #Availability: http://ruby.railstutorial.org/
  # ----------------------------------------------------------------------------
  # "THE BEER-WARE LICENSE" (Revision 42):
  # Michael Hartl wrote this code. As long as you retain this notice you
  # can do whatever you want with this stuff. If we meet some day, and you think
  # this stuff is worth it, you can buy me a beer in return.
  # ----------------------------------------------------------------------------
  #

module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url
      flash[:danger] = "Please sign in!"
    end
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # friendly forwarding

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

end
