class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :destroy]

  # GET /desks
  # GET /desks.json
  def index
    @desks = Desk.where(user: current_user)
    @desk = Desk.new
  end

  def show
    @cages = Cage.where(desk: @desk)
    @beaten = Cage.where("desk_id = :d AND board_id LIKE 'bn%'", d: @desk)
  end

  def create
    @desk = current_user.desks.create!(game_name: params[:commit])

    if @desk.save
      redirect_to @desk, notice: 'Desk was successfully created.'
    else notice 'Desk was not successfully created.'  
    end  
  end

  def destroy
    @desk.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desk
      @desk = Desk.find_by(token: params[:token])
    end
end
