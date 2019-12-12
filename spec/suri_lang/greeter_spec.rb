RSpec.describe SuriLang::Greeter do
  describe '.greet' do
    it 'あいさつする' do
      expect(SuriLang::Greeter.greet).to be_a_kind_of(String)
    end
  end
end
