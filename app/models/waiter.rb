class Waiter
  include Mongoid::Document
  include Mongoid::Slug

  field :first_name
  field :last_name

  belongs_to :restaurant
  belongs_to :zone
  has_one :device, :as => :owner, :dependent => :delete

  slug :full_name

  def full_name
    first_name + ' ' + last_name
  end
end