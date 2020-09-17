class FirebaseToken < ApplicationRecord
  belongs_to :user

  scope :valid, -> { where(invalidated_at: nil) }
end
