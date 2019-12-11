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
      '予め,副詞': 'あらかじめ',
      '併せ,動詞': 'あわせ',
      '下さい,動詞': 'くだサイ',
      '言う,動詞': 'いう',
      '致し,動詞': 'いたし',
      '頂く,動詞': 'いただく',
      '一旦,副詞': 'いったん',
      '及び,接続詞': 'および',
      '事,名詞': 'こと',
      '毎,名詞': 'ごと',
      '更に,副詞': 'さらに',
      '既に,副詞': 'すでに',
      '全て,名詞': 'すべて',
      '是非,副詞': 'ぜひ',
      '沢山,副詞': 'たくさん',
      '側,名詞': 'そば',
      '但し,接続詞': 'ただし',
      '為,名詞': 'ため',
      '出来る,動詞': 'できる',
      '通り,名詞': 'とおり',
      '時,名詞': 'とき',
      '伴い,動詞': 'ともない',
      '共に,副詞': 'ともに',
      '尚,接続詞': 'なお',
      '等,名詞': 'など',
      '他,名詞': 'ほか',
      '殆ど,副詞': 'ほとんど',
      '又,副詞': 'また',
      '又は,接続詞': 'または',
      '良い,形容詞': 'よい',
      '全く,副詞': 'まったく',
      '迄,助詞': 'まで',
    }

    def self.wakati(text)
      nm = Natto::MeCab.new('-Owakati')
      nm.enum_parse(text).select{|n| !n.is_eos?}.map(&:surface)
    end

    def self.translate(text)
      nm = Natto::MeCab.new('-F%m,%f[0]')
      features = nm.enum_parse(text).select{|n| !n.is_eos?}.map{|n| n.feature.split(',')}
      words = features.map{|feature| to_suri_word(feature[0], feature[1])}
      words.join
    end

    private

    def self.to_suri_word(word, word_class)
      DICTIONARY["#{word},#{word_class}".to_sym] || word
    end
  end
end
