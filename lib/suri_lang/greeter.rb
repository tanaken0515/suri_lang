require 'yaml'

module SuriLang
  class Greeter
    def self.greet
      message = 'hello world!'
      message
    end

    def self.greeting_list
      YAML.load_file(File.expand_path("../greeter/greetings.yml", __FILE__))
    end
  end
end
