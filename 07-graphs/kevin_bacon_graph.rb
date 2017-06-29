require_relative 'node'

class KevinBaconGraph
    attr_accessor :film_actor_hash
    attr_accessor :actor_hash
    
    def initialize(film_actor_hash, actors)
        @film_actor_hash = film_actor_hash
        @actor_hash = actors
    end
    
    # given an actor name (string) returns the number of steps up to 6 needed 
    # to reach Kevin Bacon
    def find_bacon_number(actor)
        if validate_data_type(actor)
            # if actor's node has stored bacon_num return it
            
            # start with bacon movie (the root)
            # if actor is in that list return 0
            # elsif check each of those actors
        end
    end
    
    def validate_data_type(data)
        @actor_hash.key?(data.to_sym) ? true : false
    end
end
