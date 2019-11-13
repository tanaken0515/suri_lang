require "natto"

module SuriLang
  class Translator
    DICTIONARY = {
      'です,助動詞': 'デス',
      'ます,助動詞': 'マス',
      'まし,助動詞': 'マシ',
      'ませ,助動詞': 'マセ',
      'くれ,動詞': 'クレ',
      'ください,動詞': 'くだサイ',
    }

    def self.wakati(text)
      nm = Natto::MeCab.new('-Owakati')
      nm.enum_parse(text).select{|n| !n.is_eos?}.map(&:surface)
    end

    def self.katakana(word, word_class)
      DICTIONARY["#{word},#{word_class}".to_sym] || word
    end

    def self.translate(text)
      nm = Natto::MeCab.new('-F%m,%f[0]')
      features = nm.enum_parse(text).select{|n| !n.is_eos?}.map{|n| n.feature.split(',')}
      words = features.map{|feature| katakana(feature[0], feature[1])}
      words.join
    end
  end
end
