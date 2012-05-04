class Ticket
  include DataMapper::Resource
  # implements #to_partial_path
  include ActiveModel::Conversion

  STATUSES = %w[open closed]

  property :id,         Serial
  property :title,      String, required: true
  property :status,     String, required: true
  property :created_at, DateTime
  property :updated_at, DateTime

  validates_within :status, set: STATUSES

  before :valid?, :set_status

  private

  def set_status(context = :default)
    self.status = 'open' if status.nil?
  end
end
