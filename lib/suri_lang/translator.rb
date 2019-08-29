require "natto"

module SuriLang
  class Translator
    DICTIONARY = {
      'です': 'デス',
      'ます': 'マス',
      'まし': 'マシ',
      'ませ': 'マセ',
      'くれ': 'クレ',
      'ください': 'くだサイ',
    }

    def self.wakati(text)
      nm = Natto::MeCab.new('-Owakati')
      nm.enum_parse(text).select{|n| n.is_nor?}.map(&:surface)
    end

    def self.katakana(morphemes)
      morphemes.map {|morpheme| DICTIONARY[morpheme.to_sym] || morpheme}
    end
  end
end
