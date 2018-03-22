class CageService
  def initialize(el_to:, el_from:, desk:)
    @el_to = el_to
    @el_from = el_from
    @desk = desk
  end

  def perform
    create_movement!
    broadcast_message
  end

  private

  def create_movement!
   # @message ||= Message.create! body: @body, desk: @desk, nickname: @user.nickname
  end

  def broadcast_message
    ActionCable.server.broadcast "desk_channel_#{@desk.id}",
      elTo: @el_to, elFrom: @el_from
  end
end