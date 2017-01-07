class Post < Sequel::Model(DB)
  def self.find_by(id)
    self[id]
  end
end