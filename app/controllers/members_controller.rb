class MembersController < ApplicationController
  skip_before_action :verify_authentication, only: [:new, :create]
  before_action :set_member, only: [:show, :friends, :add_friend]

  # GET /members/1
  # GET /members/1.json
  def show
    query = params[:search].presence && params[:search][:query]
    if query
      @members = Member.profile_search(query, current_member.id, @member.id)
    end
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  def friends
  end

  def add_friend
    current_member.friendships.create(friend_id: @member.id)
    @member.friendships.create(friend_id: current_member.id)
    redirect_to profile_path(@member), notice: "You and #{@member.first_name} are now friends."
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    if @member.save
      log_in(@member)
      redirect_to root_path, notice: "Hi #{@member.name}, nice to see you here."
    else
      render :new
    end
  end

  def logout
    log_out if logged_in?
    redirect_to signup_path, notice: 'Bye, see you soon.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      id = params[:id].present? ? params[:id] : session[:member_id]
      @member = Member.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :original_url)
    end
end
