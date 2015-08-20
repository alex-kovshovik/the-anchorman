require 'rails_helper'

describe 'Toilets API' do
  let!(:toilet) { create(:toilet) }

  it 'lists all toilets available to authenticated user' do
    get '/toilets', {}, { 'Accept' => 'application/json' }

    expect(response).to be_success
    expect(response.content_type).to eq(Mime::JSON)

    toilets = json(response.body)

    expect(toilets.length).to eq(1)
    expect(toilets.first[:name]).to eq('Wonky')
  end

  it 'updates toilet status and records transaction' do
    patch "/toilets/#{toilet.id}", { toilet: { state: 'occupied' } }.to_json, { 'Accept' => 'application/json', 'Content-Type' => Mime::JSON.to_s }

    expect(response).to be_success
    expect(response.content_type).to eq(Mime::JSON)

    expect(toilet.reload.occupied?).to be_truthy

    expect(ToiletTransaction.count).to eq(1)
  end

  it 'renders errors when wrong data is submitted' do
    # The non existing "signed" state is when vague user "signature" is left on the toilet after the flush.
    patch "/toilets/#{toilet.id}", { toilet: { state: 'signed' } }.to_json, { 'Accept' => 'application/json', 'Content-Type' => Mime::JSON.to_s }

    expect(response.status).to eq(422)
    expect(response.content_type).to eq(Mime::JSON)
  end

  it 'responds not_found when toilet not found' do
    patch "/toilets/-1"
    expect(response.status).to eq(404)
  end

  it 'shows one toilet' do
    get "/toilets/#{toilet.id}", nil, { 'Accept' => 'application/json'}

    expect(response.status).to eq(200)
  end

  it 'updates keep alive timestamp' do
    patch "/toilets/#{toilet.id}/keepalive", nil, { 'Accept' => 'application/json', 'Content-Type' => Mime::JSON.to_s }

    expect(response.status).to eq(200)
    expect(toilet.reload.last_keep_alive_at.utc).to be_within(0.2.second).of Time.now.utc
  end


end
