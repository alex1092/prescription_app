class Script < ApplicationRecord
  belongs_to :user
  has_many_attached :picture
end
