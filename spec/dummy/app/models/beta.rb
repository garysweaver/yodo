class Beta < ActiveRecord::Base
  has_one :al, class_name: Alpha
  has_one :bet, class_name: Beta
  has_one :gam, class_name: Gamma
  has_one :beta
  has_many :ds, class_name: Delta
  has_many :deltas
  has_one :gamma
  has_one :gammas, class_name: Gamma
end
