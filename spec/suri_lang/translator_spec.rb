RSpec.describe SuriLang::Translator do
  describe '.wakati' do
    it '正しく分かち書きされること' do
      expect(SuriLang::Translator.wakati('私の名前は田中です')).to eq(%w(私 の 名前 は 田中 です))
    end

    it '未知語が欠損しないこと' do
      expect(SuriLang::Translator.wakati('SUZURIのスリスリくんさんです')).to eq(%w(SUZURI の スリ スリ くん さん です))
    end
  end

  describe '.translate' do
    let(:sentence_sets) do
      [
        {input: '私の名前は田中です', expected: '私の名前は田中デス'}, # "です" -> "デス"
        {input: 'いよいよ夏がやってきました', expected: 'いよいよ夏がやってきマシた'}, # "ました" -> "マシた"
        {input: 'ぜひチェックしてくれ！', expected: 'ぜひチェックしてクレ！'}, # "してくれ" -> "してクレ"
        {input: 'そこに座ってください', expected: 'そこに座ってくだサイ'}, # "ください" -> "くだサイ"
        {input: 'もう少しましなものはないのか？', expected: 'もう少しましなものはないのか？'}, # 助動詞以外の "まし" は変換されない
        {input: 'SUZURIのスリスリくんさんです', expected: 'SUZURIのスリスリくんさんデス'}, # 未知語が欠損しない
        # 漢字の開き
        {input: '予めご確認ください', expected: 'あらかじめご確認くだサイ'},
        {input: 'こちらも併せてご確認下さい', expected: 'こちらもあわせてご確認くだサイ'},
        {input: 'そんなこと言うなって', expected: 'そんなこというなって'},
        {input: 'よろしくお願い致します', expected: 'よろしくお願いいたしマス'},
        {input: 'これは頂くよ', expected: 'これはいただくよ'},
        {input: '一旦これでよしとしよう', expected: 'いったんこれでよしとしよう'},
        {input: '重要性及び緊急性が高い', expected: '重要性および緊急性が高い'},
        {input: '重要な事は早めに教えてね', expected: '重要なことは早めに教えてね'},
        {input: 'ひと雨降る毎に暖かくなる', expected: 'ひと雨降るごとに暖かくなる'},
        {input: 'これから更にがんばります', expected: 'これからさらにがんばりマス'},
        {input: '時既に遅し', expected: 'ときすでに遅し'},
        {input: 'この世の全てに感謝', expected: 'この世のすべてに感謝'},
        {input: '是非よろしくお願いします', expected: 'ぜひよろしくお願いしマス'},
        {input: '沢山作ってね！', expected: 'たくさん作ってね！'},
        {input: 'あなたの側にいたい', expected: 'あなたのそばにいたい'},
        {input: 'お小遣いをあげる。但し、無駄遣いしないこと。', expected: 'お小遣いをあげる。ただし、無駄遣いしないこと。'},
        {input: 'これは君の為でもあるんだよ', expected: 'これは君のためでもあるんだよ'},
        {input: 'すべて思い通りに出来る', expected: 'すべて思い通りにできる'},
        {input: 'ここに書いてある通りにやろう', expected: 'ここに書いてあるとおりにやろう'},
        {input: 'どんな時も', expected: 'どんなときも'},
        {input: '遅延に伴い、電車の混雑状況がひどい', expected: '遅延にともない、電車の混雑状況がひどい'},
        {input: '共に行こう', expected: 'ともに行こう'},
        {input: '今でも尚貧乏だ', expected: '今でもなお貧乏だ'},
        {input: 'Tシャツ等を作ることができます', expected: 'Tシャツなどを作ることができマス'},
        {input: '他にもコップなどの日用品も作れます', expected: 'ほかにもコップなどの日用品も作れマス'},
        {input: '実物と殆ど遜色ありません', expected: '実物とほとんど遜色ありマセん'},
        {input: 'それも又よかろう', expected: 'それもまたよかろう'},
        {input: 'これでも良い。又は、それでも良い。', expected: 'これでもよい。または、それでもよい。'},
        {input: '全く疲れない', expected: 'まったく疲れない'},
        {input: '明日迄に仕上げる', expected: '明日までに仕上げる'},
      ]
    end

    it '正しく翻訳されること' do
      sentence_sets.each do |sentence_set|
        expect(SuriLang::Translator.translate(sentence_set[:input])).to eq(sentence_set[:expected])
      end
    end
  end
end
