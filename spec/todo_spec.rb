RSpec.describe Todo do
  it 'has a version number' do
    expect(Todo::VERSION).not_to be nil
  end

  describe 'configure' do
    subject { class_double(Todo) }
    it 'define settings values' do
      file_name = Faker::File.file_name
      subject.configure { |c| c.db = file_name }
      expect(subject.settings.db).to eq(file_name)
    end
  end
end
