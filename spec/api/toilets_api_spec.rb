require 'rails_helper'

describe 'Toilets API' do
  before do
    create(:toilet)
  end

  it 'lists all toilets available to authenticated user' do
    get '/toilets', {}, { 'Accept' => 'application/json' }

    expect(response).to be_success
    expect(response.content_type).to eq(Mime::JSON)

    toilets = json(response.body)

    expect(toilets.length).to eq(1)
    expect(toilets.first[:name]).to eq('Wonky')
  end
end
