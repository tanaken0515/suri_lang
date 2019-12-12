require 'yaml'

module SuriLang
  class Greeter
    attr_reader :message
    attr_reader :source
    attr_reader :season

    def initialize(message, source, season)
      @message = message
      @source = source
      @season = season
    end

    def self.random_build
      greeting = self.greeting_list.sample
      self.new(greeting['message'], greeting['source'], greeting['season'])
    end

    def self.greet
      self.greeting_list.sample['message']
    end

    def self.greeting_list
      YAML.load_file(File.expand_path("../greeter/greetings.yml", __FILE__))
    end
  end
end
