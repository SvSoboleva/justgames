class Desk < ApplicationRecord
	before_create :generate_token

  belongs_to :user
  has_many :messages, dependent: :destroy

  def to_param
  	token
  end

  private

  def generate_token
  	self.token = SecureRandom.hex(2)
  end	

end
