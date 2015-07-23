require 'rails_helper'

describe 'Groups API' do
  before do
    create(:group)
  end

  it 'lists all groups ' do
    get '/groups', {}, { 'Accept' => 'application/json' }

    expect(response).to be_success
    expect(response.content_type).to eq(Mime::JSON)

    groups = json(response.body)

    expect(groups.length).to eq(1)
    expect(groups.first[:name]).to eq('Default')
  end
end
