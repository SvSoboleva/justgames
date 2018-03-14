class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :destroy]

  # GET /desks
  # GET /desks.json
  def index
    @desks = Desk.all
    @desk = Desk.new
  end

  def show
  end

  def create
    @desk = current_user.desks.create!(game_name: params[:commit])

    if @desk.save
      if @desk.game_name == 'chess' 
        create_chessboard
      else
        create_checkerboard
      end  
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

    def create_chessboard
      
    end

    def create_chessboard
      #todo
    end
end
