require "byebug"
class Board
  attr_accessor :cups 

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14)
    @cups[6] = []
    @cups[13] = []
    place_stones
  end

  def place_stones
    (0..5).each { |cup_idx| @cups[cup_idx] = [:stone, :stone, :stone, :stone] }
    (7..12).each { |cup_idx| @cups[cup_idx] = [:stone, :stone, :stone, :stone] }
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !(0..6).to_a.concat((8..13).to_a).include?(start_pos)
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx = (cup_idx + 1) % 14
      unless (current_player_name == @player1 && cup_idx == 13) || (current_player_name == @player2 && cup_idx == 6)
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].count == 1

    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |cup_idx| @cups[cup_idx].empty? } || (7..12).all? { |cup_idx| @cups[cup_idx].empty? }
  end

  def winner
    player1_points = @cups[6].count
    player2_points = @cups[13].count

    if player1_points == player2_points
      :draw
    elsif player1_points > player2_points
      @player1
    else
      @player2
    end
  end
end