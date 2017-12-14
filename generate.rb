require "rubygems"
require "fileutils"
require "haml"
require "yaml"

class SignatureGenerator
  def initialize
    @template_file = "template.haml"
    @yaml_file = "people.yml"
    @output_directory = "build"

    @people = YAML.load_file(@yaml_file)
    @engine = Haml::Engine.new(File.read(@template_file))
  end

  def run
    create_directory(@output_directory)

    @people.map(&method(:write_person))

    puts "Wrote #{@people.size} signatures"
  end

  def create_directory(dir)
    # remove already generated signatures
    FileUtils.rm_rf(dir) if File.directory?(dir)
    # create a new build directory
    FileUtils.mkdir_p(dir)
  end

  def write_person(person)
    file_name = "#{person["first_name"]}-#{person["last_name"]}.html"
    path = File.join(@output_directory, file_name)

    File.open(path, "w") do |file|
      file.write(@engine.render(Object.new, { person: person }))
    end
  end
end

SignatureGenerator.new.run
