class User < ActiveRecord::Base
  include BCrypt
  has_many :events, foreign_key: 'organizer_id'

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
