include RSpec

require_relative 'kevin_bacon_graph'

RSpec.describe KevinBaconGraph, type: Class do
    let (:kevin)    { Node.new("Kevin Bacon", ["movie1"]) }
    
    let (:tom)      { Node.new("Tom", ["movie1", "movie2", "movie7"]) }
    let (:john)     { Node.new("John", ["movie5", "movie7"]) }
    let (:chris)    { Node.new("Chris", ["movie1", "movie5"]) }
    let (:sue)      { Node.new("Sue", ["movie4"]) }
    let (:dave)     { Node.new("Dave", ["movie1", "movie5", "movie8"]) }
    let (:emily)    { Node.new("Emily", ["movie2"]) }
    let (:stewart)  { Node.new("Stewart", ["movie2", "movie4", "movie8"]) }
    let (:stephanie){ Node.new("Stephanie", ["movie6"]) }
    let (:sarah)    { Node.new("Sarah", ["movie4", "movie8"]) }
    let (:dale)     { Node.new("Dale", ["movie4", "movie6"]) }
    let (:ohare)    { Node.new("Ohare", ["movie4"]) }
    let (:mary)     { Node.new("Mary", ["movie3"]) }
    
    let (:actors) { {
        "Tom": tom,
        "John": john,
        "Chris": chris,
        "Sue": sue,
        "Dave": dave,
        "Emily": emily,
        "Stewart": stewart,
        "Stephanie": stephanie,
        "Sarah": sarah,
        "Dale": dale,
        "Ohare": ohare,
        "Mary": mary
        }
    }
    
    let (:films) { {
        "movie1": [kevin, tom, chris, dave],
        "movie2": [tom, emily, stewart],
        "movie3": [mary],
        "movie4": [ohare, dale, sarah, stewart, sue],
        "movie5": [john, chris, dave],
        "movie6": [stephanie, dale],
        "movie7": [tom, john],
        "movie8": [stewart, dave, sarah],
        }
    }

    let (:graph) { KevinBaconGraph.new(films, actors) }
    
    describe "graph building" do
        it "creates a new graph" do
            expect(graph).not_to be_nil
            expect(graph.film_actor_hash["movie1"]).to eq films["movie1"]
            expect(graph.film_actor_hash["movie8"]).to eq films["movie8"]
        end
    end
    
    describe "#find_bacon_number(actor)" do
        it "handles nil gracefully" do
            expect(graph.find_bacon_number(nil)).to be_nil
        end
        
        it "handles incorrect data gracefully" do
            expect(graph.find_bacon_number(0)).to be_nil
            expect(graph.find_bacon_number(dave)).to be_nil
            expect(graph.find_bacon_number("fakestring")).to be_nil
        end
        
        it "returns 0 for actors that play in a movie with Bacon" do
            expect(graph.find_bacon_number("Tom")).to eq 0
            expect(graph.find_bacon_number("Chris")).to eq 0
            expect(graph.find_bacon_number("Dave")).to eq 0
        end
        
        it "returns 1 for actors that play in a movie with a 0 actor" do
            expect(graph.find_bacon_number("Emily")).to eq 1
            expect(graph.find_bacon_number("Stewart")).to eq 1
            expect(graph.find_bacon_number("John")).to eq 1
            expect(graph.find_bacon_number("Sarah")).to eq 1
        end        
        
        it "returns 2 for actors that play in a movie with a 1 actor" do
            expect(graph.find_bacon_number("Ohare")).to eq 2
            expect(graph.find_bacon_number("Dale")).to eq 2
            expect(graph.find_bacon_number("Sue")).to eq 2
        end       
        
        it "returns 3 for actors that play in a movie with a 2 actor" do
            expect(graph.find_bacon_number("Stephanie")).to eq 3
        end        
        
        it "returns 'no match within 6 degrees' if actor isn't found in 6 degrees" do
            expect(graph.find_bacon_number("Mary")).to eq "no match within 6 degrees"
        end
        
        it "stores an actors bacon number to make future searches faster" do
            expect(tom.bacon_num).to be_nil
            expect(graph.find_bacon_number("Tom")).to eq 0
            expect(tom.bacon_num).to eq 0            
            
            expect(emily.bacon_num).to be_nil
            expect(graph.find_bacon_number("Emily")).to eq 1
            expect(emily.bacon_num).to eq 1            
            
            expect(ohare.bacon_num).to be_nil
            expect(graph.find_bacon_number("Ohare")).to eq 2
            expect(ohare.bacon_num).to eq 2            
            
            expect(stephanie.bacon_num).to be_nil
            expect(graph.find_bacon_number("Stephanie")).to eq 3
            expect(stephanie.bacon_num).to eq 3
        end
    end
end
