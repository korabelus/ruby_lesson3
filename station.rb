class Station

  attr_reader :trains_now, :name
  
  def initialize(name)
    @name = name
    @trains_now =[]
  end

  def take_train(train)
    trains_now.push(train)
  end

  def depart_train(train)
    trains_now.delete(train)
  end

  def show_trains
    @trains_now.each{|item| puts item.number}
  end

  def show_trains_by_type
    puts "Please ,enter type"
    type =  gets.chomp
    @trains_now.each{|item| puts item.number if type == item.type}
  end

end
