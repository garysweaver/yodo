class Delta < ActiveRecord::Base
  has_many :delts, class_name: Delta
end
