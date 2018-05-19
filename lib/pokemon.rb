class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:)
    @id=id
    @name=name
    @type=type
    @db=db
    @hp=hp
  end

  def self.save(name, type, db, hp)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?,?)", name, type, hp)
  end

  def self.find(id, db)
    selection = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: selection[0], name: selection[1], type: selection[2], db: db, hp: selection[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?", hp, self.id)
  end
end
