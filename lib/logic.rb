module Logic
  
  extend self

  def generate_coord_table
    assoc_coord = {}
    (-8..-1).each_with_index do |number, index_n|
      ("A".."H").each_with_index do |letter, index_l|
        assoc_coord[letter + (-number).to_s] = [index_n, index_l]
      end
    end
    assoc_coord
  end

end