class Message < ApplicationRecord
  belongs_to :user

  scope :for_help, -> { where("body ilike '%help%'") }
end
