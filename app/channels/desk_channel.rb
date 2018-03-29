class DeskChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.info "Subscribed to DeskChannel deskId: #{params[:deskId]}"

    @desk = Desk.find(params[:deskId])

    stream_from "desk_channel_#{@desk.id}"
    #speak('message' => '*** joined the game ***')
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info 'Unsubscribed to DeskChannel'
    #speak('message' => '*** left the game ***')
  end

  def speak(data)
  	logger.info "Deskchannel, speak: #{data.inspect}"

     MessageService.new(
       body: data['message'], user: current_user, desk: @desk
     ).perform
  end

  def movement(data)
    logger.info "Deskchannel, movement: #{data.inspect}"

     CageService.new(
       el_to: data['elTo'], el_from: data['elFrom'], desk: @desk
     ).perform
  end
end
