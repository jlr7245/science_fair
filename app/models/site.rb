class Site < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: :user_id
  belongs_to :project
  has_many :chatrooms
end
