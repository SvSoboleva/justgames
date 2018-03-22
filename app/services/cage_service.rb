class CageService
  def initialize(el_to:, el_from:, desk:)
    @el_to = el_to
    @el_from = el_from
    @desk = desk
  end

  def perform
    broadcast_message
    create_movement!
  end

  private

  def create_movement!
    cage_from = Cage.find_by(desk: @desk, img_id: @el_from)
    if cage_to = Cage.find_by(desk: @desk, img_id: @el_to)
      cage_to.update(img_id: cage_from.img_id, img_name: cage_from.img_name)
    else
      Cage.create!(desk: @desk, board_id: @el_to, img_id: cage_from.img_id, img_name: cage_from.img_name)  
    end         
    cage_from.destroy
  end

  def broadcast_message
    ActionCable.server.broadcast "desk_channel_#{@desk.id}",
      elTo: @el_to, elFrom: @el_from
  end
end