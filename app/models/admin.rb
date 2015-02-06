class Admin < ActiveRecord::Base
	belongs_to :school

	attr_accessor :pass, :pass_confimration
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 20 }
	validates :email, presence: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }
	validates :pass, presence: true, confirmation: true

	before_save :encrypt_pass
	before_save do 
		self.email.downcase!
	end

	def has_pass?(submitted_password)
		self.password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		admin = find_by_email(email)
		return nil if admin.nil?
		return admin if admin.has_pass?(submitted_password)
	end

	private
		def encrypt_pass
			self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{self.pass}") if self.new_record?
			self.password = encrypt(self.pass)
		end

		def encrypt(pass)
			Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
		end
end
