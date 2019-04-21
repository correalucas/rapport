class ApplicationController < ActionController::Base
  before_action :verify_authentication
  helper_method :current_member

  def log_in(member)
    session[:member_id] = member.id
  end

  def current_member
    @current_member ||= Member.find_by(id: session[:member_id]) if session[:member_id]
  end

  private

  def logged_in?
    current_member.present?
  end

  def verify_authentication
    redirect_to signup_path, alert: 'You must sign up to access this page' unless logged_in?
  end
end
