class User < ApplicationRecord
  has_many :firebase_tokens
  has_many :messages

  scope :not_snoozing, -> { where(snooze_until: nil).or(where('snooze_until < ?', DateTime.current)) }
  scope :valid_firebase_token, -> { where(FirebaseToken.valid.where('users.id = firebase_tokens.user_id').arel.exists) }
  scope :messaged_for_help, -> { where(Message.for_help.where('users.id = messages.user_id').arel.exists) }

  scope :need_help, -> {
    not_snoozing
      .valid_firebase_token
      .messaged_for_help
  }
end
