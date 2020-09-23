class User < ApplicationRecord
  has_secure_password
  enum user_type: [ :student, :instructor ]
  validates :user_type, inclusion: { in: user_types.keys }
  validates :username, presence: true, uniqueness: true

end
