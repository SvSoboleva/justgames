class DeskChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.info "Subscribed to DeskChannel deskId: #{params[:deskId]}"

    @desk = Desk.find(params[:deskId])

    stream_from "desk_channel_#{@desk.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info 'Unsubscribed to DeskChannel'
  end

  def speak(data)
  	logger.info "Deskchannel, speak: #{data.inspect}"

  	ActionCable.server.broadcast "desk_channel_#{@desk.id}", message: data['message']
  end
end
