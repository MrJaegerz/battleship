require "readline"

class Battleship

    def initialize(x, y, val)
        @board = Array.new(x) { Array.new(y) { val } }
        @ships = {'carrier' =>  5, 'battleship'=> 4, 'cruiser'=> 3, 'submarine'=> 3, 'destroyer'=> 2}
        @teamDestroyed = []
    end

    def iniBoard
        board = @board
        ships = @ships
        
        ships.each do |key, value|
            print key, value

            vertical = rand(0...2)

            if key == 'carrier'
                if vertical == 0
                    rdmRow = rand(0...10)
                    rdmCol = rand(0...5)
                    if board[rdmRow][rdmCol] != 'x'
                        rdmRow = rand(0...10)
                        rdmCol = rand(0...5)
                    end

                    board[rdmRow][rdmCol] = 'K  '
    
                    while value > 1
                        rdmCol = rdmCol + 1
                        board[rdmRow][rdmCol] = 'K  '
                        value = value - 1
                    end
                else
                    rdmRow = rand(0...5)
                    rdmCol = rand(0...10)
                    board[rdmRow][rdmCol] = 'K  '
    
                    while value > 1
                        rdmRow = rdmRow + 1
                        board[rdmRow][rdmCol] = 'K  '
                        value = value - 1
                    end
                end
            end
            if key == 'battleship'
                if vertical == 0
                    rdmRow = rand(0...10)
                    rdmCol = rand(0...6)
                    if board[rdmRow][rdmCol] != 'x'
                        rdmRow = rand(0...10)
                        rdmCol = rand(0...5)
                    end
                    board[rdmRow][rdmCol] = 'B  '

                    while value > 1
                        rdmCol = rdmCol + 1
                        board[rdmRow][rdmCol] = 'B  '
                        value = value - 1
                    end
                else
                    rdmRow = rand(0...6)
                    rdmCol = rand(0...10)
                    board[rdmRow][rdmCol] = 'B  '

                    while value > 1
                        rdmRow = rdmRow + 1
                        board[rdmRow][rdmCol] = 'B  '
                        value = value - 1
                    end
                end
            end
            # end
            if key == 'cruiser'
                if vertical == 0
                    rdmRow = rand(0...10)
                    rdmCol = rand(0...7)
                    
                    if board[rdmRow][rdmCol] != 'x'
                        rdmRow = rand(0...10)
                        rdmCol = rand(0...5)
                    end

                    board[rdmRow][rdmCol] = 'C  '

                    while value > 1
                        rdmCol = rdmCol + 1
                        board[rdmRow][rdmCol] = 'C  '
                        value = value - 1
                    end
                else
                    rdmRow = rand(0...7)
                    rdmCol = rand(0...10)
                    board[rdmRow][rdmCol] = 'C  '

                    while value > 1
                        rdmRow = rdmRow + 1
                        board[rdmRow][rdmCol] = 'C  '
                        value = value - 1
                    end
                end
            end
            if key == 'submarine'
                if vertical == 0
                    rdmRow = rand(0...10)
                    rdmCol = rand(0...7)

                    if board[rdmRow][rdmCol] != 'x'
                        rdmRow = rand(0...10)
                        rdmCol = rand(0...7)
                    end

                    board[rdmRow][rdmCol] = 'S  '

                    while value > 1
                        rdmCol = rdmCol + 1
                        board[rdmRow][rdmCol] = 'S  '
                        value = value - 1
                    end
                else
                    rdmRow = rand(0...7)
                    rdmCol = rand(0...10)

                    if board[rdmRow][rdmCol] != 'x'
                        rdmCol = rand(0...10)
                        rdmRow = rand(0...7)
                    end

                    board[rdmRow][rdmCol] = 'S  '

                    while value > 1
                        rdmRow = rdmRow + 1
                        board[rdmRow][rdmCol] = 'S  '
                        value = value - 1
                    end
                end
            end
            if key == 'destroyer'
                if vertical == 0
                    rdmRow = rand(0...10)
                    rdmCol = rand(0...8)

                    if board[rdmRow][rdmCol] != 'x'
                        rdmRow = rand(0...10)
                        rdmCol = rand(0...8)
                    end

                    board[rdmRow][rdmCol] = 'D  '

                    while value > 1
                        rdmCol = rdmCol + 1
                        board[rdmRow][rdmCol] = 'D  '
                        value = value - 1
                    end
                else
                    rdmRow = rand(0...8)
                    rdmCol = rand(0...10)

                    if board[rdmRow][rdmCol] != 'x'
                        rdmRow = rand(0...10)
                        rdmCol = rand(0...8)
                    end

                    board[rdmRow][rdmCol] = 'D  '

                    while value > 1
                        rdmRow = rdmRow + 1
                        board[rdmRow][rdmCol] = 'D  '
                        value = value - 1
                    end
                end
            end
            print ' '
        end
        print "\n"

        showMap()

        require "readline"
        coords = []
        count = 2

        while buf = Readline.readline("Coord attack (value OnebyOne): \n", true)
            coords.push(buf)

            if count > 1
                if count % 2 != 0
                    attack(coords, board)
                    showMap()
                    coords = []
                    count = 1
                end
            end
            if checkWin() == true
                return true
            end
            count += 1
        end
    end

    def attack(coordAttack, board)
        case @board[Integer(coordAttack[0])][Integer(coordAttack[1])]
        when "C  "
            print "Vous avez touché le Cruiser !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["cruiser"] = @ships["cruiser"] - 1
            return true
        when "D  "
            print "Vous avez touché le Destroyer !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["destroyer"] = @ships["destroyer"] - 1
            return true
        when "B  "
            print "Vous avez touché le Battleship !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["battleship"] = @ships["battleship"] - 1
            return true
        when "S  "
            print "Vous avez touché le submarine !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["submarine"] = @ships["submarine"] - 1
            return true
        when "K  "
            print "Vous avez touché un Carrier !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["carrier"] = @ships["carrier"] - 1
            return true
        else
            print "Vous avez tiré dans l'eau !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            return true
        end
        checkWin()
        return true
    end

    def checkWin()
        @ships.each do |key, ship|            
            if ship == 0
                @ships[key] = nil
                @teamDestroyed.push key
            end
        end
        if @teamDestroyed.count == 5
            print "Vous avez detruit tout les bateaux !\n"
            return true
        end
        print @teamDestroyed, "\n"
    end

    def showMap()
        for row in @board do
            for val in row do
                print val
            end
            print "\n" 
        end
        return true
    end
end

i = Battleship.new(10, 10,'x  ')
i.iniBoard