class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
  end

  def new
  @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to clubs_path, notice: "Club was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


# Add users to club
  def add_user
    @club = Club.find(params[:club_id])
    user = User.find(params[:user_id])

    unless @club.users.include?(user)
      @club.users << user
      flash[:notice] = "#{user.email} was added to the club!"
    else
      flash[:alert] = "#{user.email} is already in the club."
    end

    redirect_to club_path(@club)
  end

  private
def club_params
  params.require(:club).permit(:name)

end



end
