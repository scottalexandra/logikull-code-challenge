require 'rails_helper'

RSpec.describe 'Artists API', type: :request do
  let!(:artist) { create(:artist) }
  let(:artist_id) { artist.id }

  describe 'Get /artists' do
    before { get '/artists' }

    it 'returns a status code of 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns a list of artists' do
      expect(response_body.length).to eq(1)
    end
  end

  describe 'GET /artists/:id' do
    before { get "/artists/#{artist_id}" }

    context 'the happy path' do
      it 'returns a status code of 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the artist' do
        expect(response_body['id']).to eq(artist_id)
      end
    end

    context 'the sad path' do
      let(:artist_id) { 6 }

      it 'returns a status code of 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a message saying record not found' do
        expect(response_body['message']).to eq("Couldn't find Artist with 'id'=6")
      end
    end
  end

  describe 'POST /artists' do
    let(:valid_attributes) { { name: 'Backstreet Boys'} }

    context 'the happy path' do
      before { post '/artists', params: valid_attributes }

      it 'returns a status code of 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates an artist' do
        expect(response_body['name']).to eq('Backstreet Boys')
      end
    end

    context 'the sad path' do
      let(:invalid_attribtes) { { name: ''} }
      before { post '/artists', params: invalid_attribtes }

      it 'returns a status code of 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a message that says the request is invalid' do
        expect(response_body['message']).to eq("Validation failed: Name can't be blank")
      end
    end
  end

  describe 'PUT /artists/:id' do
    let(:valid_attributes) { { name: 'S Club 7'} }

    context 'the happy path' do
      before { put "/artists/#{artist_id}", params: valid_attributes }

      it 'returns a status code of 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the artist' do
        updated_artist = Artist.find(artist_id)
        expect(updated_artist.name).to eq('S Club 7')
      end
    end
  end

  describe 'DELETE /artists/:id' do
    before { delete "/artists/#{artist_id}" }

    it "returns a status code of 204" do
      expect(response).to have_http_status(204)
    end
  end
end
