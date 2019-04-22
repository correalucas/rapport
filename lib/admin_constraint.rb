class AdminConstraint
  def matches?(request)
    request.session[:member_id] == 1
  end
end
