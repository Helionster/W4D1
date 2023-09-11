require_relative 'poly_tree'

class KnightPathFinder

    def self.valid_moves(pos)
        results = []

        row = pos[0].to_i
        col = pos[1].to_i
        
        if (0..7).include?(row + 1) && (0..7).include?(col + 2)
          results << [row + 1, col + 2]  
        elsif (0..7).include?(row + 1) && (0..7).include?(col - 2)
          results << [row + 1, col - 2] 
        elsif (0..7).include?(row - 1) && (0..7).include?(col - 2)
          results << [row - 1, col - 2] 
        elsif (0..7).include?(row - 1) && (0..7).include?(col + 2)
          results << [row - 1, col + 2] 
        elsif (0..7).include?(row + 2) && (0..7).include?(col + 1)
            results << [row + 2, col + 1]  
        elsif (0..7).include?(row + 2) && (0..7).include?(col - 1)
          results << [row + 2, col - 1] 
        elsif (0..7).include?(row - 2) && (0..7).include?(col - 1)
          results << [row - 2, col - 1] 
        elsif (0..7).include?(row - 2) && (0..7).include?(col + 1)
          results << [row - 2, col + 1] 
        end
    end
    
    def initalize
       @considered_positions = [self.root_node]
       self.root_node = KnightPathFinder.new([0, 0])
    end

    def new_move_positions(pos) 
        valid_moves = KnightPathFinder.valid_moves(pos)
        new_positions = []
        valid_moves.each do |array|
          if !@considered_positions.include?(array)
            @considered_positions << array 
          else
            new_positions << array 
          end  
        end

        new_positions
    end

    
    
end