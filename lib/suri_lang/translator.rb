require "natto"

module SuriLang
  class Translator
    def self.wakati(text)
      nm = Natto::MeCab.new('-Owakati')
      nm.enum_parse(text).select{|n| n.is_nor?}.map(&:surface)
    end
  end
end
