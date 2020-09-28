class Chatroom < ApplicationRecord
  belongs_to :site
  belongs_to :tour
  has_many :messages
end
