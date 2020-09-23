class User < ApplicationRecord
  enum user_type: [ :student, :instructor ]
  validates :user_type, inclusion: { in: user_types.keys }
end
