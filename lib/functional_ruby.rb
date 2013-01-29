Dir.entries("lib/shopping/").each do |file|
  require File.expand_path("lib/functional_ruby/" + file) unless File.directory?(file)
end