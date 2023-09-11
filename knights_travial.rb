require_relative 'poly_tree'

class KnightPathFinder
  def self.valid_moves(pos)
    results = []

    row = pos[0].to_i
    col = pos[1].to_i
    
    if (0..7).include?(row + 1) && (0..7).include?(col + 2)
      results << [row + 1, col + 2]
    end

    if (0..7).include?(row + 1) && (0..7).include?(col - 2)
      results << [row + 1, col - 2] 
    end

    if (0..7).include?(row - 1) && (0..7).include?(col - 2)
      results << [row - 1, col - 2] 
    end

    if (0..7).include?(row - 1) && (0..7).include?(col + 2)
      results << [row - 1, col + 2] 
    end
    if (0..7).include?(row + 2) && (0..7).include?(col + 1)
        results << [row + 2, col + 1]  
    end

    if (0..7).include?(row + 2) && (0..7).include?(col - 1)
      results << [row + 2, col - 1] 
    end

    if (0..7).include?(row - 2) && (0..7).include?(col - 1)
      results << [row - 2, col - 1] 
    end

    if (0..7).include?(row - 2) && (0..7).include?(col + 1)
      results << [row - 2, col + 1] 
    end

    results
  end

  def initalize(start_pos)
    @considered_positions = [self.root_node]
    self.root_node = PolyTreeNode.new(start_pos)
  end

  def new_move_positions(pos) 
    valid_moves = KnightPathFinder.valid_moves(pos)
    new_positions = []
    valid_moves.each do |array|
      if !@considered_positions.include?(array)
        @considered_positions << array 
        new_positions << array 
      end  
    end

    new_positions
  end
end