class Admin < ActiveRecord::Base
	belongs_to :school
	has_many :newsfeeds
	has_many :updated_bys, class_name: "Admin", foreign_key: "updated_by", :through => :newsfeeds

	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	attr_accessor :password, :password_confirmation
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 20 }
	validates :school, presence: true
	validates :email, presence: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }

	# validates password for new user
	validates :password, presence: true, length: { in: 6..15 }, confirmation: true, on: :create
	# validates password for edit user
	validates :password, allow_blank: true, length: { in: 6..15 }, confirmation: true, on: :update

	before_save :encrypt_password
	

	def has_password?(submitted_password)
		self.encrypted_password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		admin = find_by_email(email)
		return nil if admin.nil?
		return admin if admin.has_password?(submitted_password)
	end

	private
		def encrypt_password
			if !self.password.blank?
				self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{self.password}")
				self.encrypted_password = encrypt(self.password)
			end
		end

		def encrypt(password)
			Digest::SHA2.hexdigest("#{self.salt}--#{password}")
		end
end
