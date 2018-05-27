require 'rails_helper'

RSpec.describe 'Albums API', type: :request do
  let!(:artist) { create(:artist) }
  let!(:album) { create(:album, artist_id: artist.id) }
  let!(:artist_id) { artist.id }
  let(:album_id) { album.id }

  describe 'GET /artists/:artist_id/albums' do
    before { get "/artists/#{artist_id}/albums" }

    context 'the happy path' do
      it 'returns a status code of 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all of the albums' do
        expect(response_body.length).to eq(1)
      end
    end

    context 'the sad path' do
      let(:artist_id) { 0 }

      it 'returns a status code of 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response_body['message']).to eq("Couldn't find Artist with 'id'=0")
      end
    end
  end

  describe 'GET /artists/:artist_id/albums/:id' do
    before { get "/artists/#{artist_id}/albums/#{album_id}" }

    context 'the happy path' do
      it 'returns a status code of 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns an album' do
        expect(response_body['year']).to eq('2000')
      end
    end

    context 'the sad path' do
      let(:album_id) { 0 }

      it 'returns  a status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /artists/:artist_id/albums' do
    let(:valid_attributes) {
      { title: 'Along The Road', year: '2000', condition: 'mint' }
    }

    context 'the happy path' do
      before { post "/artists/#{artist_id}/albums", params: valid_attributes }

      it 'returns status code of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'the sad path' do
      before { post "/artists/#{artist_id}/albums", params: {} }

      it 'returns a status of 422' do
        expect(response_body['message'])
          .to match("Validation failed: Title can't be blank")
      end
    end
  end

  describe 'PUT /artists/:artist_id/albums/:id' do
    let(:valid_attributes) {
      { title: 'HEY!!', year: '2000', condition: 'mint' }
    }
    before {
      put "/artists/#{artist_id}/albums/#{album_id}", params: valid_attributes
    }

    context 'the happy path' do

      it 'returns a status code of 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the album' do
        updated_album = Album.find(album_id)
        expect(updated_album.title).to eq('HEY!!')
      end
    end

    context 'the sad path' do
      let(:album_id) { 0 }

      it 'returns a status of 403' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE artists/artist_id/albums/:id' do
    before { delete "/artists/#{artist_id}/albums/#{album_id}" }

    it 'returns a status code of 204' do
      expect(response).to have_http_status(204)
    end
  end
end
