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
        # return true
        # receiveAttack = attack
        
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
            count += 1
        end
    end

    def attack(coordAttack, board)
        case @board[Integer(coordAttack[0])][Integer(coordAttack[1])]
        when "C  "
            print "Vous avez touché le Cruiser !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["cruiser"] = @ships["cruiser"] - 1
        when "D  "
            print "Vous avez touché le Destroyer !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["destroyer"] = @ships["destroyer"] - 1
        when "B  "
            print "Vous avez touché le Battleship !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["battleship"] = @ships["battleship"] - 1
        when "S  "
            print "Vous avez touché le submarine !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["submarine"] = @ships["submarine"] - 1
        when "K  "
            print "Vous avez touché un Carrier !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
            @ships["carrier"] = @ships["carrier"] - 1
        else
            print "Vous avez tiré dans l'eau !\n"
            @board[Integer(coordAttack[0])][Integer(coordAttack[1])] = "O  "
        end
        checkWin()
    end

    def checkWin()
        @ships.each do |key, ship|
            # print ship,' ', key
            # print "\n"
            
            if ship == 0
                print @ships
                print "\n"
                @teamDestroyed.push key
                print @teamDestroyed, "\n"
                @teamDestroyed.group_by{ |e| e }.select { |k, v| v.size > 1 }.map(&:first)
                @teamDestroyed.sort.chunk{ |e| e }.select { |e, chunk| chunk.size > 1 }.map(&:first)
                @teamDestroyed.select{ |e| @teamDestroyed.count(e) > 1 }.uniq
                print @teamDestroyed
                # if @teamDestroyed.count == 0
                #     @teamDestroyed.push key
                
                # else
                #     @teamDestroyed.each do |aKey, desShip| 
                #         print aKey," Toto ! ", key, "\n"
                #         if key == aKey
                #             print "im in true\n"
                #         else
                #             print "im in else \n"
                #             @teamDestroyed.push key
                #             return true
                #         end
                #     end
                
                # end
            end
        end

        if @teamDestroyed.count == 5
            print "Vous avez detruit tout les bateaux !!\n"
            return true
        end

        print @teamDestroyed
        print "\n"
    end

    def showMap()
        for row in @board do
            for val in row do
                print val
            end
            print "\n" 
        end
    end
end

i = Battleship.new(10, 10,'x  ')
i.iniBoard