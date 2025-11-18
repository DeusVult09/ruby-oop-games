module GameSerializer
  PATH = path = './saves/save.mld'

  def self.save(game)
    save_game = GameSave.new(game)
    File.write(PATH, Marshal.dump(save_game))
  end

  def self.load(game)
    save_data = Marshal.load(File.read(PATH))
    save_data.load(game)
  end
end