require_relative 'node'

class KevinBaconGraph
    attr_accessor :film_actor_hash
    attr_accessor :actor_hash
    attr_accessor :kevin_bacon
    
    def initialize(film_actor_hash, actors, kevin_bacon)
        @film_actor_hash = film_actor_hash
        @actor_hash = actors
        @kevin_bacon = kevin_bacon
    end
    
    # given an actor name (string) returns the number of steps up to 6 needed 
    # to reach Kevin Bacon
    def find_bacon_number(target_actor)
        actor_node = validate_and_get_actor(target_actor)
        if actor_node
            return actor_node.bacon_num if actor_node.bacon_num

            actors = get_actor_connections(@kevin_bacon)
            last_actor = actors.last
            degree = 0

            actors.each do |a|
                actor = @actor_hash[a.to_sym]
        
                if actor.name == target_actor
                    actor.bacon_num = degree
                    return degree
                else
                    get_actor_connections(actor).each { |act| actors << act if not actors.include? act }
                end
                
                if a == last_actor
                    degree += 1
                    return "no match within 6 degrees" if degree == 6
                    last_actor = actors.last
                end
            end
            "no match within 6 degrees"
        end
    end
    
    # returns actor node if actor_name is a valid data_type. (rescue covers .to_sym being called on a non-string)
    def validate_and_get_actor(actor)
        @actor_hash[actor.to_sym] if @actor_hash[actor.to_sym] rescue false
    end 
    
    # given an actor_node returns all his further connections as an array of strings (names)
    # actor -> An actor Node
    # curr_movie -> string that equals key of 
    def get_actor_connections(actor)
        connections = []
        actor.movies.each do |movie|
            @film_actor_hash[movie.to_sym].each { |act| connections << act.name if act != actor and act.name != "Kevin Bacon" }
        end
        connections
    end
end
