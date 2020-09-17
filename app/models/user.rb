class User < ApplicationRecord
  has_many :firebase_tokens
  has_many :messages

  scope :not_snoozing, -> { where(snooze_until: nil).or(where('snooze_until < ?', DateTime.current)) }

  scope :need_help, -> {
    not_snoozing
      .joins(:firebase_tokens, :messages)
      .merge(FirebaseToken.valid)
      .merge(Message.for_help)
      .distinct
  }
end
