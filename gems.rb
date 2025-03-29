# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2025, by Samuel Williams.

source "https://rubygems.org"

# Specify your gem's dependencies in mapping.gemspec
gemspec

group :maintenance, optional: true do
	gem "bake-gem"
	gem "bake-modernize"
	
	gem "utopia-project"
end

group :test do
	gem "sus"
	gem "covered"
	gem "decode"
	gem "rubocop"
	
	gem "bake-test"
	gem "bake-test-external"
end

gem "bake-releases", "~> 0.3.0", :group => :maintenance
