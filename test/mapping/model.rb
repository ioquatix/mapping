# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2025, by Samuel Williams.

require "mapping/model"

class DateMapping < Mapping::Model
	map(Time) do |date, offset: nil|
		if offset
			date.localtime(offset)
		else
			date
		end
	end
end

describe DateMapping do
	let(:mapping) {subject.new}
	let(:time) {Time.now}
	
	it "can map without timezone option" do
		expect(mapping.map(time)).to be == time
	end
	
	it "can map with timezone option" do
		expect(mapping.map(time, offset: 0)).to be == time.gmtime
	end
end

class LowerCaseMapping < Mapping::Model
	map(String) {|string| string.downcase}
	map(Float) {|float| float.to_s}
end

describe LowerCaseMapping do
	let(:mapping) {subject.new}
	
	it "can map string" do
		expect(mapping.map("FOO")).to be == "foo"
	end
end

class EmptyMapping < LowerCaseMapping
	unmap(String)
end

describe EmptyMapping do
	let(:mapping) {subject.new}
	
	it "can remove a mapped method" do
		expect{mapping.map("foo")}.to raise_exception(NoMethodError)
	end
	
	it "can still call super" do
		expect(mapping.map(10.0)).to be == "10.0"
	end
end
