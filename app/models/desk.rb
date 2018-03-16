class Desk < ApplicationRecord
  include Initboards
	before_create :generate_token
  after_create :build_cages

  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :cages, dependent: :destroy

  def to_param
  	token
  end

  private

  def generate_token
  	self.token = SecureRandom.hex(2)
  end	

  def build_cages
    build_array = create_initialize_array(self.game_name)
    
    build_array.each do |h|
      cages << Cage.create(h)
    end
  end

end
