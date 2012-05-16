class Ticket
  include DataMapper::Resource
  # implements #to_partial_path
  include ActiveModel::Conversion

  STATUSES = %w[open closed]

  property :id,         Serial
  property :title,      String,  required: true
  property :status,     String,  required: true, default: 'open'
  property :user_id,    Integer, required: true
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :project

  validates_within :status, set: STATUSES

  def self.last_updated_since(date)
    all(:updated_at.gt => date, :order => [:updated_at.desc])
  end

  def self.closed
    all(status: 'closed', :order => [:updated_at.desc])
  end
end
