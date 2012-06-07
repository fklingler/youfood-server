class Waiter
  include Mongoid::Document
  include Mongoid::Slug

  devise :token_authenticatable

  field :first_name
  field :last_name

  belongs_to :zone
  has_one :device, :as => :owner

  slug :full_name

  def full_name
    first_name + ' ' + last_name
  end
end