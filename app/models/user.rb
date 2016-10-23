class User < ApplicationRecord

	has_many :friendships
	has_many :friends, :through => :friendships
	
	has_secure_password

	validates :email, uniqueness: true
	validates :name, :email, presence: true

	def sent_messages
		Message.where(sender_id: id)
	end

	def received_messages
		Message.where(sender_id: id)
	end

end
