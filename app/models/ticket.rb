class Ticket
  include DataMapper::Resource
  # implements #to_partial_path
  include ActiveModel::Conversion

  STATUSES = %w[open closed]

  property :id,         Serial
  property :title,      String, required: true
  property :status,     String, required: true, default: 'open'
  property :created_at, DateTime
  property :updated_at, DateTime

  validates_within :status, set: STATUSES
end
