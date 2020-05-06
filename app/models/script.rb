class Script < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :doctor
end
