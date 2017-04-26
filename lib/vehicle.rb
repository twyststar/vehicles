class Vehicle
  @@all_vehicles = []
  attr_reader(:make, :model, :year, :color, :engine_size, :number_of_doors, :id)

  define_method(:initialize) do |attributes|
    @make = attributes.fetch(:make)
    @model = attributes.fetch(:model)
    @year = attributes.fetch(:year).to_i()
    @color = attributes.fetch(:color)
    @engine_size= attributes.fetch(:engine_size)
    @number_of_doors = attributes.fetch(:number_of_doors)
    @id = @@all_vehicles.length().+(1)
  end

  define_singleton_method(:find)do |identification|
    found_vehicle = nil
    @@all_vehicles.each() do |vehicle|
      if vehicle.id().eql?(identification.to_i())
        found_vehicle = vehicle
      end
    end
    found_vehicle
  end
  define_singleton_method(:all)do
    @@all_vehicles
  end
  define_singleton_method(:clear)do
    @@all_vehicles = []
  end
  define_method(:save)do
    @@all_vehicles.push(self)
  end
  define_method(:age) do
    current_year = Time.new().year()
    current_year.-(@year)
  end
  define_method(:worth_buying?) do
    american_cars = ['Chrysler', 'Ford', 'GM']
    american = american_cars.include?(@make)
    new_enough = age().<=(15)
    american && new_enough
  end
end
