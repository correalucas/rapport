class MembersController < ApplicationController
  skip_before_action :verify_authentication, only: [:new, :create]
  before_action :set_member, only: [:show, :edit]

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :original_url)
    end
end
