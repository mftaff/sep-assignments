require_relative 'city'

def nearest_neighbor(city_graph, curr_city)
    while curr_city.visited == false 
        puts curr_city.name
        neighbor_cities = curr_city.neighbors
        next_city = neighbor_cities[0]
        for neighbor in neighbor_cities
            next if neighbor.visited == true
            if city_graph["#{curr_city.name}_#{neighbor.name}".to_sym] < city_graph["#{curr_city.name}_#{next_city.name}".to_sym]
                next_city = neighbor
            end
        end
        curr_city.visited = true
        curr_city = next_city
    end
end

def reset_visited(cities)
    cities.each {|c| c.visited = false}
end

# tests

distances = {
    "haifa_jlem": 119,
    "haifa_tlv": 86,
    "haifa_eilat": 363,
    "jlem_haifa": 119,
    "jlem_tlv": 55,
    "jlem_eilat": 248,
    "tlv_haifa": 86,
    "tlv_jlem": 55,
    "tlv_eilat": 280,
    "eilat_haifa": 363,
    "eilat_tlv": 280,
    "eilat_jlem": 248
}

jlem = City.new("jlem", [])
haifa = City.new("haifa", [])
tlv = City.new("tlv", [])
eilat = City.new("eilat", [haifa, tlv, jlem])

cities = [jlem, haifa, tlv, eilat]

jlem.neighbors = [eilat, haifa, tlv]
haifa.neighbors = [eilat, jlem, tlv]
tlv.neighbors = [eilat, haifa, jlem]

nearest_neighbor(distances, jlem)
reset_visited(cities)
puts "~~~~~~~"
nearest_neighbor(distances, haifa)
reset_visited(cities)
puts "~~~~~~~"
nearest_neighbor(distances, tlv)
reset_visited(cities)
puts "~~~~~~~"
nearest_neighbor(distances, eilat)
