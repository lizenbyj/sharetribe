class TransactionProcess < ActiveRecord::Base
  attr_accessible :process
  has_one :listing_shape
end
