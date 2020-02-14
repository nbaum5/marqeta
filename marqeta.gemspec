Gem::Specification.new do |s|
  s.name        = 'marqeta'
  s.version     = '0.0.8'
  s.summary     = "Marqeta API wrapper"
  s.description = "Marqeta API wrapper"
  s.authors     = ["nb"]
  s.files       = Dir["{lib}/**/*"].select { |f| File.file?(f) } + %w(README.md)

  s.add_runtime_dependency 'httparty'
end
