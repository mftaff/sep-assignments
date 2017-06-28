include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 67) }

  let (:heap) { MinBinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }
  
  before do
    heap.insert(root, pacific_rim)
    heap.insert(root, braveheart)
    heap.insert(root, jedi)
    heap.insert(root, donnie)
    heap.insert(root, inception)
    heap.insert(root, district)
    heap.insert(root, shawshank)
    heap.insert(root, martian)
    heap.insert(root, hope)
    heap.insert(root, empire)
    heap.insert(root, mad_max_2)
  end

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      expect(root.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a left-left child" do
      expect(root.left.left.title).to eq "Star Wars: Return of the Jedi"
    end

    it "properly inserts a new node as a left-right child" do
      expect(root.left.right.title).to eq "Donnie Darko"
    end

    it "properly inserts a new node as a right child" do
      expect(root.right.title).to eq "Braveheart"
    end

    it "properly inserts a new node as a right-left child" do
      expect(root.right.left.title).to eq "Inception"
    end

    it "properly inserts a new node as a right-right child" do
      expect(root.right.right.title).to eq "District 9"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      expect(heap.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      expect(heap.find(root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a left-left node" do
      expect(heap.find(root, jedi.title).title).to eq "Star Wars: Return of the Jedi"
    end

    it "properly finds a left-right node" do
      expect(heap.find(root, donnie.title).title).to eq "Donnie Darko"
    end

    it "properly finds a right node" do
      expect(heap.find(root, braveheart.title).title).to eq "Braveheart"
    end

    it "properly finds a right-left node" do
      expect(heap.find(root, inception.title).title).to eq "Inception"
    end

    it "properly finds a right-right node" do
      expect(heap.find(root, district.title).title).to eq "District 9"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(root, nil)).to eq nil
    end
    
    it "properly deletes the root" do
      heap.delete(root, root.title)
      
      expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDonnie Darko: 85\nInception: 86\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      expect { heap.printf }.to output(expected_output).to_stdout
      
      expect(heap.root).to eq pacific_rim
      expect(heap.find(@root, root.title)).to be_nil
    end

    it "properly deletes a left node" do
      heap.delete(root, pacific_rim.title)
      
      expected_output = "The Matrix: 67\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDonnie Darko: 85\nInception: 86\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      expect { heap.printf }.to output(expected_output).to_stdout
      
      expect(heap.root.left.title).to eq "Braveheart"
      expect(heap.find(@root, pacific_rim.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      heap.delete(root, jedi.title)
      
      expected_output = "The Matrix: 67\nPacific Rim: 72\nBraveheart: 78\nDonnie Darko: 85\nInception: 86\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      expect { heap.printf }.to output(expected_output).to_stdout
      
      expect(heap.root.left.left.title).to eq "Donnie Darko"
      expect(heap.find(@root, jedi.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      heap.delete(root, donnie.title)
      
      expected_output = "The Matrix: 67\nPacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nInception: 86\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      expect { heap.printf }.to output(expected_output).to_stdout
      
      expect(heap.root.left.right.title).to eq "Inception"
      expect(heap.find(@root, donnie.title)).to be_nil
    end

    it "properly deletes a right node" do
      heap.delete(root, braveheart.title)
      expect(heap.find(@root, braveheart.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      heap.delete(root, inception.title)
      expect(heap.find(@root, inception.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      heap.delete(root, district.title)
      
      expected_output = "The Matrix: 67\nPacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDonnie Darko: 85\nInception: 86\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      expect { heap.printf }.to output(expected_output).to_stdout
      
      expect(heap.root.right.right.title).to eq "The Shawshank Redemption"
      expect(heap.find(@root, district.title)).to be_nil
    end
  end

  describe "#printf" do
    specify {
      expected_output = "The Matrix: 67\nPacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDonnie Darko: 85\nInception: 86\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      expect { heap.printf }.to output(expected_output).to_stdout
    }
  end
end
