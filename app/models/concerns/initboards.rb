module Initboards
  extend ActiveSupport::Concern

  def create_initialize_array(game)
    if game == 'chess'
      [ {board_id: 'a8', img_name: 'rb.png', img_id: 'rb1'}, 
        {board_id: 'b8', img_name: 'nb.png', img_id: 'nb1'},
        {board_id: 'c8', img_name: 'bb.png', img_id: 'bb1'},
        {board_id: 'd8', img_name: 'kb.png', img_id: 'kb'},
        {board_id: 'e8', img_name: 'qb.png', img_id: 'qb'},
        {board_id: 'f8', img_name: 'bb.png', img_id: 'bb2'},
        {board_id: 'g8', img_name: 'nb.png', img_id: 'nb2'},
        {board_id: 'h8', img_name: 'rb.png', img_id: 'rb2'},
        {board_id: 'a7', img_name: 'pb.png', img_id: 'pb1'},
        {board_id: 'b7', img_name: 'pb.png', img_id: 'pb2'},
        {board_id: 'c7', img_name: 'pb.png', img_id: 'pb3'},
        {board_id: 'd7', img_name: 'pb.png', img_id: 'pb4'},
        {board_id: 'e7', img_name: 'pb.png', img_id: 'pb5'},
        {board_id: 'f7', img_name: 'pb.png', img_id: 'pb6'},
        {board_id: 'g7', img_name: 'pb.png', img_id: 'pb7'},
        {board_id: 'h7', img_name: 'pb.png', img_id: 'pb8'},
        {board_id: 'a2', img_name: 'pw.png', img_id: 'pw1'},
        {board_id: 'b2', img_name: 'pw.png', img_id: 'pw2'},
        {board_id: 'c2', img_name: 'pw.png', img_id: 'pw3'},
        {board_id: 'd2', img_name: 'pw.png', img_id: 'pw4'},
        {board_id: 'e2', img_name: 'pw.png', img_id: 'pw5'},
        {board_id: 'f2', img_name: 'pw.png', img_id: 'pw6'},
        {board_id: 'g2', img_name: 'pw.png', img_id: 'pw7'},
        {board_id: 'h2', img_name: 'pw.png', img_id: 'pw8'},
        {board_id: 'a1', img_name: 'rw.png', img_id: 'rw1'}, 
        {board_id: 'b1', img_name: 'nw.png', img_id: 'nw1'},
        {board_id: 'c1', img_name: 'bw.png', img_id: 'bw1'},
        {board_id: 'd1', img_name: 'kw.png', img_id: 'kw'},
        {board_id: 'e1', img_name: 'qw.png', img_id: 'qw'},
        {board_id: 'f1', img_name: 'bw.png', img_id: 'bw2'},
        {board_id: 'g1', img_name: 'nw.png', img_id: 'nw2'},
        {board_id: 'h1', img_name: 'rw.png', img_id: 'rw2'}
      ]
    else
      []
    end
  end
end