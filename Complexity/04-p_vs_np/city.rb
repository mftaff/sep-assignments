class City
    attr_accessor :name
    attr_accessor :neighbors
    attr_accessor :visited
    
    def initialize(name, neighbors)
        @name = name
        @neighbors = neighbors
        @visited = false
    end
end
