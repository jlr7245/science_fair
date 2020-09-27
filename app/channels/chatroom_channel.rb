class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel::#{params[:tour_id]}:#{params[:site_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
