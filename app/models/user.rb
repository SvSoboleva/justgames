class User < ApplicationRecord
	before_create :generate_nickname

	has_many :desks, dependent: :destroy

	private

	def generate_nickname
		self.nickname = Faker::Name.first_name.downcase
	end	

end
 