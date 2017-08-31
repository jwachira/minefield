require 'spec_helper'

describe Mine do
  let(:mine) { described_class.new(1, 2, 3) }

  describe '#valid?' do
    it 'should raise ArgumentError for arguments that are not numeric' do
      expect { described_class.new(1, 't', 0) }.to raise_error(ArgumentError)
    end
  end

  describe '#euclidean_distance' do
    let(:mine2) { described_class.new(3, 4, 6) }

    it 'returns euclidean distance between 2 mines' do
      expect(mine2.euclidean_distance(mine2)).to eql(0.0)
      expect(mine2.euclidean_distance(mine)).to eql(2.8284271247461903)
    end
  end

  describe '#within_radius?' do
    let(:mine_1) { described_class.new(1, 1, 1) }
    let(:mine_2) { described_class.new(0, 0, 2) }

    it 'returns true if within blast radius' do
      expect(mine_2.within_radius?(mine_1)).to be true
    end

    it 'returns false if not within blast radius' do
      mine_3 = described_class.new(50, 50, 50)
      expect(mine_3.within_radius?(mine_2)).to be false
    end
  end
end
