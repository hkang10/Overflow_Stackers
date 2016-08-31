class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  validates :first_name, :last_name, :email, :password, {presence: true}
  validates :email, {uniqueness: true}
  validate :check_length

def @password
   @password ||= BCrypt::Password.new(hashed_password)
end

def @password=(new_password)
  @input_password = new_password
 @password = BCrypt::Password.create(new_password)
 self.hashed_password = @password
end

def authenticate(user_input_password)
  self.password == user_input_password
end

def check_length
  if @input_password.length < 6
    errors.add(:password, "must be greater than 6 characters")
  end
end

end
