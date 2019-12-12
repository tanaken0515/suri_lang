RSpec.describe SuriLang::Greeter do
  describe '.greet' do
    it 'あいさつする' do
      expect(SuriLang::Greeter.greet).to be_a_kind_of(String)
    end
  end

  describe '.random_build' do
    let(:greeter) { SuriLang::Greeter.random_build }

    it 'Greeterクラスのオブジェクトが作られる' do
      expect(greeter).to be_a_kind_of(SuriLang::Greeter)
    end

    it 'attributesが各々正しいこと' do
      expect(greeter.message).to be_a_kind_of(String)
      expect(greeter.source).to start_with('https://suzuri.jp/surisurikun/journals')
      expect(%w[spring summer fall winter none].include?(greeter.season)).to be_truthy
    end
  end
end
