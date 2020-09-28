class CreateMessageHelper
  attr_reader :tour, :site, :user
  def initialize(args)
    @tour = args[:tour]
    @site = args[:site]
    @user = args[:user]
  end

  def new_message
    chatroom = Chatroom.find_by(site: site, tour: tour)
    Message.new(chatroom: chatroom, user: user)
  end

  def messages
    chatroom = Chatroom.find_by(site: site, tour: tour)
    chatroom.messages
  end
end
