class Project
  include DataMapper::Resource
  # implements #to_partial_path
  include ActiveModel::Conversion

  property :id,         Serial
  property :title,      String
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :tickets

  def open_tickets
    tickets.all(status: 'open')
  end

  def closed_tickets
    tickets.all(status: 'closed')
  end
end
