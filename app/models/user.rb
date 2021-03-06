class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :mf
  # mf: true, is female. mf: false, is male

  has_many :program_sets

  attr_accessor :password
  before_save :encrypt_password

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i


  validates :password, { confirmation: true, presence: true, length: { :in => 6..20 }, :on => :create }
  validates :email, { presence: true, uniqueness: true, length: { maximum: 100 },
                      :format => { :with => EMAIL_REGEX, :on => :create } }



def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end


  def encrypt_password
  	if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end 
  end




end
