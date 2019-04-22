class ApplicationController < ActionController::Base
  before_action :verify_authentication
  helper_method :current_member, :random_color, :logged_in?

  def random_color
    Random.new.bytes(3).unpack('H*').first
  end

  def log_in(member)
    session[:member_id] = member.id
  end

  def logged_in?
    current_member.present?
  end

  def log_out
    session.delete(:user_id) if session[:user_id]
  end

  def current_member
    @current_member ||= Member.find_by(id: session[:member_id]) if session[:member_id]
  end

  private

  def verify_authentication
    redirect_to signup_path, alert: 'You must sign up to access this page' unless logged_in?
  end
end
