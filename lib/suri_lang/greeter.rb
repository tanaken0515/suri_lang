require 'yaml'

module SuriLang
  class Greeter
    def self.greet
      self.greeting_list.sample['text']
    end

    def self.greeting_list
      YAML.load_file(File.expand_path("../greeter/greetings.yml", __FILE__))
    end
  end
end
