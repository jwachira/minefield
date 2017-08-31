require 'spec_helper'

describe ExplosionCalculator do
  let(:mine_1) { Mine.new(-2, 1, 3) }
  let(:mine_2) { Mine.new(-3, 1, 1) }
  let(:mine_3) { Mine.new(1, 1, 1) }

  let(:mines)  { [mine_1, mine_2, mine_3] }

  subject { described_class.new(mines).explode }

  describe '#explode' do
    it 'returns all exploded mines' do
      expect(subject.map(&:mine)).to match_array(mines)
    end

    it 'returns an array of mine explosion reports' do
      expect(subject).to be_a Array
      expect(subject.length).to eql(3)
    end

    it 'returns mine explosion counters in desc order' do
      expect(subject.map(&:explosion_counter)).to eq [2, 2, 0]
    end
  end
end
