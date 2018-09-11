require 'rails_helper'

RSpec.describe Desk, type: :model do

  context 'creating desks' do

    before(:all) do
      @current_user = User.create
    end
      
    it 'chess' do
      current_desk = @current_user.desks.create!(game_name: 'chess')
      expect(current_desk.id).to be
      expect(current_desk.cages.count).to eq 32
    end 

    it 'classic' do
      current_desk = @current_user.desks.create!(game_name: 'classic')
      expect(current_desk.id).to be
      expect(current_desk.cages.count).to eq 32
    end 

    it 'corners' do
      current_desk = @current_user.desks.create!(game_name: 'corners')
      expect(current_desk.id).to be
      expect(current_desk.cages.count).to eq 24
    end 
  end  
end
