class MessagesController < ApplicationController
  before_action :authorize

  def create
    @message = Message.new(message_params)
    @message.save

    

    ActionCable.server.broadcast "chatroom_channel::#{@message.tour.id}:#{@message.site.id}", @message.to_hash
  end

  def destroy
  end

  def message_params
    params.require(:message).permit(:content, :chatroom_id, :user_id)
  end
end
