def sluggish_octopus(fish)
    longest_fish = nil
    fish.each_with_index do |fish1, i1|
        fish.each_with_index do |fish2, i2|
            if fish1.length > fish2.length && i2 > i1
                longest_fish = fish1
            else
                longest_fish = fish2
            end
      end
    end
    longest_fish
  end

def dominant_octopus(fish)
return fish if fish.length <= 1

mid = fish.length / 2
left = fish[0...mid]
right = fish[mid..-1]

merge(dominant_octopus(left), dominant_octopus(right))
end

def merge(left, right)
merged = []
left_idx = 0
right_idx = 0

while left_idx < left.length && right_idx < right.length
    if left[left_idx].length < right[right_idx].length
    merged << left[left_idx]
    left_idx += 1
    else
    merged << right[right_idx]
    right_idx += 1
    end
end

merged.concat(left[left_idx..-1]) if left_idx < left.length
merged.concat(right[right_idx..-1]) if right_idx < right.length

merged
end

def clever_octopus(fishies)
    longest_fish = fishies.inject do |longest, fish|
      fish.length > longest.length ? fish : longest
    end
    longest_fish
end

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |dir, idx|
      return idx if dir == direction
    end
end

def fast_dance(direction, new_tiles_data_structure)
    new_tiles_data_structure[direction]
end

  