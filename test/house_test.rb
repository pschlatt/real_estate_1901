require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'


class HouseTest < Minitest::Test

    def test_house_exists_and_has_price_and_address
      house = House.new("400000", "123 sugar lane")

      assert_instance_of House, house
      assert_equal 400000, house.price
      assert_equal "123 sugar lane", house.address
    end



    def test_for_rooms
      house = House.new("400000", "123 sugar lane")

      assert_equal [], house.rooms
    end

    def test_adding_rooms
      house = House.new("400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, 13)
      room_2 = Room.new(:bedroom, 11, 15)
      house.add_room(room_1)
      house.add_room(room_2)
      rooms_added = [room_1,room_2]

      assert_equal rooms_added, house.rooms
    end

    def test_get_rooms_by_category
      house = House.new("400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, 13)
      room_2 = Room.new(:bedroom, 11, 15)
      room_3 = Room.new(:living_room, 25, 15)
      room_4 = Room.new(:basement, 30, 41)
      bedrooms = [room_1, room_2]
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      assert_equal bedrooms, house.rooms_from_category(:bedroom)
      assert_equal [room_4], house.rooms_from_category(:basement)
    end

    def test_house_area

      house = House.new("400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, 13)
      room_2 = Room.new(:bedroom, 11, 15)
      room_3 = Room.new(:living_room, 25, 15)
      room_4 = Room.new(:basement, 30, 41)
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      assert_equal 1900, house.area

    end

end

# pry(main)> require './lib/room'
# #=> true
#
# pry(main)> require './lib/house'
# #=> true
#
# pry(main)> house = House.new("$400000", "123 sugar lane")
# #=> #<House:0x00007fccd30375f8...>
#
# pry(main)> room_1 = Room.new(:bedroom, 10, 13)
# #=> #<Room:0x00007fccd29b5720...>
#
# pry(main)> room_2 = Room.new(:bedroom, 11, 15)
# #=> #<Room:0x00007fccd2985f48...>
#
# pry(main)> room_3 = Room.new(:living_room, 25, 15)
# #=> #<Room:0x00007fccd383c2d0...>
#
# pry(main)> room_4 = Room.new(:basement, 30, 41)
# #=> #<Room:0x00007fccd297dc30...>
#
# pry(main)> house.add_room(room_1)
#
# pry(main)> house.add_room(room_2)
#
# pry(main)> house.add_room(room_3)
#
# pry(main)> house.add_room(room_4)
#
# pry(main)> house.rooms_from_category(:bedroom)
# #=> [#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>]
#
# pry(main)> house.rooms_from_category(:basement)
# #=> [#<Room:0x00007fccd297dc30...>]
#
# pry(main)> house.area
# #=> 1900
