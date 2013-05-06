class Alpha < ActiveRecord::Base
  has_one :alpha
  has_one :beta
  has_one :gam, class_name: Gamma
  has_many :deltas
  has_many :delts, class_name: Delta
end
