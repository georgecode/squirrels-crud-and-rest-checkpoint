
class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :subscriptions
  has_many :channels, through: :subscriptions

  validates :email, :hashed_password, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end
end
