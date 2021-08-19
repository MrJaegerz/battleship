require_relative "battleship"
require "test/unit"

class TestBattleship < Test::Unit::TestCase

    def test_map
        assert_equal(true, Battleship.new(10, 10,'x  ').showMap(), 'Test Map !' )
    end
    def test_attack
        coord = [1, 1]
        assert_equal(true, Battleship.new(10, 10,'x  ').attack(coord, @board), 'Test Attaque !' )
    end
    def test_win
        assert_equal(true, Battleship.new(10, 10,'x  ').checkWin(), 'Test Win !' )
    end
end