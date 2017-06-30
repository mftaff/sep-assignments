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

            check_movies_actors(get_actor_connections(@kevin_bacon, nil), "Kevin Bacon", target_actor, 0)
        end
    end
    
    def validate_and_get_actor(actor)
        @actor_hash[actor.to_sym] if actor.is_a?(String) && @actor_hash[actor.to_sym]
    end
    
    def check_movies_actors(actors, root_name, target_name, degree)
        last_actor = actors.last

        actors.each do |a|
            actor = @actor_hash[a.to_sym]
            next if actor.name == root_name
    
            if actor.name == target_name
                actor.bacon_num = degree
                return degree
            else
                get_actor_connections(actor, @film_actor_hash.key(actors).to_s).each do |act|
                    actors << act if not actors.include? act
                end
            end
            
            if a == last_actor
                degree += 1
                return "no match within 6 degrees" if degree == 6
                last_actor = actors.last
            end
        end
        "no match within 6 degrees"
    end
    
    def get_actor_connections(actor, curr_movie)
        connections = []
        actor.movies.each do |movie|
            next if movie == curr_movie
            @film_actor_hash[movie.to_sym].map { |act| connections << act.name if act != actor && act.name != "Kevin Bacon"}
        end
        connections
    end
end
