require 'spec_helper'

RSpec.describe Task do
  describe 'create' do
    let(:attributes) { Fabricate.attributes_for(:task) }

    it 'saves a task' do
      expect(Task.create(attributes)).to be_a(Todo::Task)
      expect(Task.count).to eq(1)
    end
  end
end
