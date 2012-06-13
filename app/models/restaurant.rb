class Restaurant
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :address
  field :menu_begin_date, type: Date
  field :menu_end_date, type: Date

  has_many :zones, :dependent => :delete
  has_many :tables, :dependent => :delete
  has_many :waiters, :dependent => :delete
  belongs_to :menu

  slug :name
  validates :name, presence: true, uniqueness: true
  validate :begin_date_before_end_date

  acts_as_api
  api_accessible :public do |t|
    t.add :menu_begin_date
    t.add :menu_end_date
    t.add :menu
  end

  protected
  def begin_date_before_end_date
    if menu_begin_date > menu_end_date
      errors.add(:menu_end_date, "can't be before menu begin date")
    end
  end
end