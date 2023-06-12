class GraphNode
    attr_reader :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def add_neighbor(node)
        @neighbors << node
    end
end

def bfs(starting_node, target_value)
    visited = []
    q = Queue.new
    q << starting_node

    until q.empty?
        current_node = q.shift
        return current_node if current_node.value == target_value

        visited << current_node

        current_node.neighbors.each do |neighbor|
            q << neighbor unless visited.include?(neighbor)
        end
    end
    nil
end
