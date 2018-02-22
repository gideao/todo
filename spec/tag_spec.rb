require 'spec_helper'

RSpec.describe Tag do
  describe 'create' do
    let(:attributes) { Fabricate.attributes_for(:tag) }

    it 'saves a tag' do
      expect(Tag.create(attributes)).to be_a(Todo::Tag)
      expect(Tag.count).to eq(1)
    end
  end
end
