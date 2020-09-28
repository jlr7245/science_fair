class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  has_one :tour, through: :chatroom
  has_one :site, through: :chatroom

  def to_hash
    {
      id: self.id,
      content: self.content,
      time: self.created_at,
      user_id: self.user.id,
      username: self.user.username,
      user_name: self.user.name,
      site_id: self.site.id
    }
  end
end
