class HomeController < ApplicationController
  def index
    query = params[:search].presence && params[:search][:query]
    if query
      @members = Member.home_search(query, current_member.id)
    end
  end
end
