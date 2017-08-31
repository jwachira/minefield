require "spec_helper"

describe ExplosionReport do
  let(:mine) { Mine.new(1,2,3) }
  subject { described_class.new(mine, explosion_counter: 9)}
  describe '#initialize' do
    it 'returns a mine object and explosion_counter' do
      expect(subject.mine).to eql(mine)
      expect(subject.explosion_counter).to eql(9)
    end
  end
end
