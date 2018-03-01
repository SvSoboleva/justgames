class MessageService
  def initialize(body:, user:, desk:)
    @body = body
    @user = user
    @desk = desk
  end

  def perform
    create_message!
    broadcast_message
  end

  private

  def create_message!
    @message ||= Message.create! body: @body, desk: @desk, nickname: @user.nickname
  end

  def broadcast_message
    ActionCable.server.broadcast "desk_channel_#{@desk.id}",
      message: render_message
  end

  def render_message
    ApplicationController.renderer.render(partial: 'messages/message', locals: {
      message: @message
    })
  end
end