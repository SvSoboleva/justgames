require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validations check' do
    it 'correct name' do
      current_user = FactoryBot.create(:user)
      expect(current_user.nickname).to be
    end  

    it 'create random name' do
      current_user = User.create
      expect(current_user.nickname).to be
    end  
  end  
end
