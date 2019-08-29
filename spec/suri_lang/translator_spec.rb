RSpec.describe SuriLang::Translator do
  describe '.wakati' do
    it '正しく分かち書きされること' do
      expect(SuriLang::Translator.wakati('私の名前は田中です')).to eq(%w(私 の 名前 は 田中 です))
    end
  end
end
