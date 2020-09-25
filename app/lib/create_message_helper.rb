class CreateMessageHelper
  def self.create_message!(args)
    tour = args[:tour]
    user = args[:user]
    site = args[:site]
    content = args[:content]

    chatroom = Chatroom.find_by(site: site, tour: tour)
    Message.create(chatroom: chatroom, user: user, content: content)
  end
end
