class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'message'
  end

  def receive(data)
    data['user'] = current_user
    ActionCable.server.broadcast('message', data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
