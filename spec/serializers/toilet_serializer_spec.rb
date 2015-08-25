require 'rails_helper'

describe ToiletSerializer do

  subject { ToiletSerializer.new(toilet) }
  let(:toilet) { create(:toilet) }

  it 'creates json representation of a toilet' do
    json = toilet.attributes.to_json

    expect(subject.attributes.to_json).to eq(json)
  end

end
