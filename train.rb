class Train 

  attr_accessor :speed #сделал возможность просто задавать текущую скорость (согласно ТЗ - набирать скорость)
  attr_reader :wagon_quantity, :current_station, :previous_station, :next_station, :number, :type

  def initialize(number, type, wagon_quantity, speed = 0)
    @number = number
    @type = type
    @wagon_quantity = wagon_quantity
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def take_wagon
    if @speed == 0
      @wagon_quantity += 1
    else
      puts "please, stop the train before taking wagon"
    end
  end

  def remove_wagon
    if @speed == 0
      @wagon_quantity -= 1
    else
      puts "please, stop the train before removing wagon"
    end
  end

  def take_route(route)
    @station_list = route.station_list
    @station_index = 0
    @current_station = @station_list[@station_index]
    @next_station = @station_list[@station_index + 1]
    @current_station.take_train(self)
  end

  def go_forward
    if @station_index < @station_list.length - 1
        @station_index += 1
        @current_station = @station_list[@station_index]
        @next_station = @station_list[@station_index + 1]
        @previous_station = @station_list[@station_index - 1]
        @current_station.take_train(self)
        @previous_station.depart_train(self)
    else
        puts "Train cannot go forward, it is on the final station of the route, you can go back only"
    end
  end


  def go_back
    if @station_index > 0
        @station_index -= 1
        @current_station = @station_list[@station_index]
        @next_station = @station_list[@station_index + 1]
        @previous_station = @station_list[@station_index - 1]
        @current_station.take_train(self)
        @previous_station.depart_train(self)
    else
        puts "Train cannot go back, it is on the first station of the route, you can go forward only"
    end
  end

end
