require_relative "battleship"
require "test/unit"

class TestBattleship < Test::Unit::TestCase

    def test_map
        assert_equal(true, Battleship.new(10, 10,'x  ').iniBoard(), 'Test Map !' )
    end
    # def test_attack
    #     assert_equal(true, Battleship.new(10, 10,'x  ').attack(), 'Test Attaque !' )
    # end
    def test_win
        assert_equal(true, Battleship.new(10, 10,'x  ').checkWin(), 'Test Win !' )
    end
end