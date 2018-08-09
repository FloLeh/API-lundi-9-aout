class Crypto < ApplicationRecord
  validates :name, uniqueness:true
end
