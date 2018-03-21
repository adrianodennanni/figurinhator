class Figurinha < ApplicationRecord
  belongs_to :user
  belongs_to :figurinha_info
end
