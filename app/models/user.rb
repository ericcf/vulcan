class User
  include DataMapper::Resource
  include ActiveModel::SecurePassword

  property :id,              Serial
  property :username,        String,     required: true, unique: true
  property :email,           String
  property :password_digest, BCryptHash, required: true

  attr_writer :password_confirmation

  has_secure_password

  has n, :tickets

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def tickets_in_date_range(start_date, end_date)
    tickets.all(status: 'closed', :updated_at.gte => start_date, :updated_at.lte => end_date)
  end
end
