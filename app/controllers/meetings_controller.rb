class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all.includes(:book)
  end
  def show
    @meeting = Meeting.find(params[:id])
  end
end
