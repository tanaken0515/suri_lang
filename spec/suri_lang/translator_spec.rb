RSpec.describe SuriLang::Translator do
  describe '.wakati' do
    it '正しく分かち書きされること' do
      expect(SuriLang::Translator.wakati('私の名前は田中です')).to eq(%w(私 の 名前 は 田中 です))
    end
  end

  describe '.translate' do
    it '"です" が "デス" に変換されること' do
      expect(SuriLang::Translator.translate('私の名前は田中です')).to eq('私の名前は田中デス')
    end

    it '"ました" が "マシた" に変換されること' do
      expect(SuriLang::Translator.translate('いよいよ夏がやってきました')).to eq('いよいよ夏がやってきマシた')
    end

    it '"してくれ" が "してクレ" に変換されること' do
      expect(SuriLang::Translator.translate('ぜひチェックしてくれ！')).to eq('ぜひチェックしてクレ！')
    end

    it '"ください" が "くだサイ" に変換されること' do
      expect(SuriLang::Translator.translate('そこに座ってください')).to eq('そこに座ってくだサイ')
    end

    it '助動詞以外の "まし" は変換されないこと' do
      expect(SuriLang::Translator.translate('もう少しましなものはないのか？')).to eq('もう少しましなものはないのか？')
    end
  end
end
