class Route

  attr_reader :station_list

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @station_list = [@start_station, @end_station]
  end

  def add_station(station)
    @station_list.insert(1, station) if station != @start_station && station != @end_station
  end

  def remove_station(station)
    @station_list.delete(station) if station != @start_station && station != @end_station
  end

  def show_stations
    @station_list.each{|item| puts item.name}
  end

end
