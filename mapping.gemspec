# frozen_string_literal: true

require_relative "lib/mapping/version"

Gem::Specification.new do |spec|
	spec.name = "mapping"
	spec.version = Mapping::VERSION
	
	spec.summary = "Map an input model to an output model using a mapping model."
	spec.authors = ["Samuel Williams"]
	spec.license = nil
	
	spec.cert_chain  = ["release.cert"]
	spec.signing_key = File.expand_path("~/.gem/release.pem")
	
	spec.homepage = "https://github.com/ioquatix/mapping"
	
	spec.metadata = {
		"funding_uri" => "https://github.com/sponsors/ioquatix/",
		"source_code_uri" => "https://github.com/ioquatix/mapping.git",
	}
	
	spec.files = Dir.glob(["{lib}/**/*", "*.md"], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 3.1"
end
