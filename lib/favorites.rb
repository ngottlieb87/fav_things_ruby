class Item
  @@list = []
  attr_reader(:id)
  attr_accessor(:name, :rank)

  def initialize(name,rank)
    @rank = rank
    @name = name
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def self.find(id)
   item_id = id.to_i()
   @@list.each do |item|
     if item.id == item_id
       return item
     end
   end
  end

  def self.clear()
    @@list = []
  end

  def save()
    @@list.push(self)
  end

  def update()
    @@list.map do |item|
      if item.rank == self.rank && self.name != ""
        item.name = ""
        item.rank = ""
      elsif item.name == self.name && self.rank != ""
        item.name = ""
        item.rank = ""
      end
    end
  end

  def self.delete(del)
    @@list.each do |item|
      if item.name == del
      item.rank = ""
      item.name = ""
      end
    end
  end

  def self.sort()
    @@list.sort_by {|x| x.rank}
  end

end
