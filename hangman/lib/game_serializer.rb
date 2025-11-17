module GameSerializer
  def self.save(state, path = './saves/save.mld')
    File.write(path, Marshal.dump(state))
  end

  def self.load(path = './saves/save.mld')
    Marshal.load(File.read(path))
  end
end
