class User
  include DataMapper::Resource
  include ActiveModel::SecurePassword

  property :id,              Serial
  property :username,        String, required: true, unique: true
  property :password_digest, BCryptHash, required: true

  attr_writer :password_confirmation

  has_secure_password

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
end
