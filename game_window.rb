def media_path(file)
  File.join(File.dirname(__FILE__), 'media', file)
end


class GameWindow < Gosu::Window

  BACKGROUND = media_path('background.png')
  WIDTH = 800
  HEIGHT = 600
  BLACK = Gosu::Color.argb(0xff_000000)

  def initialize(width=WIDTH, height=HEIGHT, fullscreen=false)
    super
    self.caption = 'Tic-Tac-Toe'
    @background = Gosu::Image.new( self, BACKGROUND, false )
    @marks = []
  end

  def update
    # @marks.reject!(&:done?)
    # @marks.map(&:update)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    if id == Gosu::MsLeft
      @marks << Mark.new( "X", mouse_x, mouse_y )
    end
  end

  def needs_cursor?
    true
  end

  def needs_redraw?
    !@scene_ready || @marks.any?
  end

  def draw
    @scene_ready ||= true
    @background.draw(0, 0, 0)

    draw_board(250, 50, 500, 500)
    @marks.map(&:draw)
  end

  private def draw_board(x, y, height, width)
    draw_bar(x , y + height * (1.0 / 3.0), width, 5, BLACK)
    draw_bar(x , y + height * (2.0 / 3.0), width, 5, BLACK)
    draw_bar(x + width * (1.0 / 3.0 ) , y, 5, height, BLACK)
    draw_bar(x + width * (2.0 / 3.0 ) , y, 5, height, BLACK)
  end

  private def draw_bar(x, y, width, height, color)
    @background.draw_as_quad(x, y, color,
                            x + width, y, color,
                            x, y + height, color,
                            x + width, y + height, color,
                            0, mode = :default)
  end
end
