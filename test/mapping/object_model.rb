# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2025, by Samuel Williams.

require "mapping/object_model"

module Human
	Person = Struct.new(:name, :age, :posessions)
	Possession = Struct.new(:name, :value)
end

class MappingModelV1 < Mapping::ObjectModel
	map(Human::Person) do |object|
		{
			name: object.name,
			age: object.age,
		}
	end
end

class MappingModelV2 < MappingModelV1
	map(Human::Person) do |object|
		super(object).merge(
			posessions: self.map(object.posessions)
		)
	end
	
	map(Human::Possession) do |object|
		{
			name: object.name,
			value: object.value,
		}
	end
end

describe Mapping::ObjectModel do
	let(:person) {Human::Person.new("Bob Jones", 200, [Human::Possession.new("Vase", "$20")])}
	
	it "can map with base class" do
		model = MappingModelV1.new
		
		expect(model.map(person)).to be == {
			name: "Bob Jones",
			age: 200
		}
	end
	
	it "can map with derived class" do
		model = MappingModelV2.new
		
		expect(model.map(person)).to be == {
			name: "Bob Jones",
			age: 200, 
			posessions: [
				{name: "Vase", value: "$20"}
			]
		}
	end
end

describe Mapping::ObjectModel do
	let(:mapping) {subject.new}
	let(:hash) {Hash[x: 10, y: 20]}
	
	it "can map an array" do
		expect(mapping.map([])).to be == []
	end
	
	it "can map a hash" do
		expect(mapping.map(hash)).to be == hash
	end
	
	it "can map true" do
		expect(mapping.map(true)).to be == true
	end
	
	it "can map false" do
		expect(mapping.map(false)).to be == false
	end
	
	it "can map nil" do
		expect(mapping.map(nil)).to be == nil
	end
end
