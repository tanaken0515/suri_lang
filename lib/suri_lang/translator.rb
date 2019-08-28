require "natto"

module SuriLang
  class Translator
    def self.wakati(text)
      nm = Natto::MeCab.new('-Owakati')
      nm.parse(text)
    end
  end
end
