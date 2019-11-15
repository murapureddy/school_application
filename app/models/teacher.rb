class Teacher < ApplicationRecord
  belongs_to :school
  has_one :subject

  EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\Z/i
  #before_create { generate_token(:auth_token) }
  before_save :encrypt_password
  attr_accessor :password
  validates :firstname, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    teacher = find_by_email(email)
    if teacher && teacher.password_hash == BCrypt::Engine.hash_secret(password, teacher.password_salt)
      teacher
    else
      nil
    end
  end


  # def generate_token(column)
  #   begin
  #     self[column] = SecureRandom.urlsafe_base64
  #   end while User.exists?(column => self[column])
  # end
end
