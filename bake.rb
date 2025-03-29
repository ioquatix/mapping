# frozen_string_literal: true
# Released under the MIT License.
# Copyright, 2025, by Samuel Williams.

def after_gem_release_version_increment(version)
	context["releases:update"].call(version)
	context["utopia:project:readme:update"].call
end
