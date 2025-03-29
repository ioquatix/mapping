# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2025, by Samuel Williams.

require "mapping/descendants"

describe Numeric do
	let(:descendants) {Mapping.lookup_descendants(subject)}
	
	it "has several descendants" do
		expect(descendants).not.to be(:empty?)
	end
end
