class KnightPathFinder
attr_reader :visited_positions

  def initialize(pos)
    @start_pos = pos
    @visited_positions = [pos]
    # build_move_tree
  end

  #TODO: build move tree
  #def build_move_tree
  #end

  def self.valid_moves(pos)
    possible_moves = []
  end

  def new_move_positions(pos)
    possible_new_moves = pos.valid_moves.reject{ |move| visited_positions.include?(move) }
    visited_positions.concat(possible_new_moves)
  end



end


# kpf = KnightPathFinder.new([0,0])
# kpf.
