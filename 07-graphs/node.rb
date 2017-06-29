class Node
    attr_accessor :name
    attr_accessor :movies
    attr_accessor :bacon_num
    # attr_accessor :film_actor_hash
    
    def initialize(name, movies=[])
        @name = name
        @movies = movies
    end
end
