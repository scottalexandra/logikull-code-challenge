require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { should have_many(:albums) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  describe 'for each artist' do
    let!(:artist1) { create(:artist) }
    let!(:artist2) { create(:artist) }
    let!(:album1) { create(:album, title: "love love love is great", year: "2002", artist_id: artist1.id) }
    let!(:album2) { create(:album, title: "love ain't got a hold on me, but it's great", year: "2010", artist_id: artist1.id) }
    let!(:album3) { create(:album, artist_id: artist2.id) }

    context 'album year range' do
      it 'returns the range of years albums were released over' do
        expect(artist1.range_of_years).to eq("2002-2010")
      end
    end

    context 'number of albums method' do
      it 'returns to the number of albums for each artist' do
        expect(artist1.number_of_albums).to eq(2)
        expect(artist2.number_of_albums).to eq(1)
      end
    end

    context 'common words method' do
      it 'returns the top 5 words common across their albums' do
        expect(artist1.common_words).to eq(["love", "great", "it", "is", "a"])
      end
    end
  end
end
