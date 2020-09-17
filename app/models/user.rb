class User < ApplicationRecord
  has_many :firebase_tokens
  has_many :messages
end
