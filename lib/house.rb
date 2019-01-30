class House
attr_reader :price, :address, :rooms

    def initialize(price, address)
      @price = price.to_i
      @address = address
      @rooms = []
      @all_areas = []

    end

    def add_room(room_to_add)
      @rooms << room_to_add
    end

    def rooms_from_category(category)
      rooms_by_category = @rooms.find_all do |room|
        category == room.category
      end
      return rooms_by_category

    end


    def area

    house_area = @rooms.each do |room|
         @all_areas << room.area
      end

      return @all_areas


    end


end
