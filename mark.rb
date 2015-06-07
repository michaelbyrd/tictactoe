def media_path(file)
  File.join(File.dirname(__FILE__), 'media', file)
end

class Mark
  def initialize(symbol, x, y)
    @image = Gosu::Image.from_text(self, symbol, Gosu.default_font_name, 50 )
    @x, @y = x, y
  end

  def draw
    @image.draw(
      @x - @image.width / 2.0,
      @y - @image.height / 2.0,
      0)
  end

  def sound
    @sound.play
  end

end
