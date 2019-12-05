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
      ]
    end

    it '正しく翻訳されること' do
      sentence_sets.each do |sentence_set|
        expect(SuriLang::Translator.translate(sentence_set[:input])).to eq(sentence_set[:expected])
      end
    end
  end
end
