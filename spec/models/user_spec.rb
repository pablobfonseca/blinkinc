require 'rails_helper'

describe User, type: :model do
  describe '.search' do
    context 'first_name' do
      before do
        create(:user, first_name: "Peter")
        create(:user, first_name: "John")
      end

      it 'returns one record' do
        expect(described_class.search("peter").count).to eq 1
      end
    end

    context 'last_name' do
      before do
        create(:user, last_name: "Parker")
        create(:user, last_name: "Doe")
      end

      it 'returns one record' do
        expect(described_class.search("doe").count).to eq 1
      end
    end

    context 'email' do
      before do
        create(:user, email: "peter@example.com")
        create(:user, email: "john@gmail.com")
      end

      it 'returns one record' do
        expect(described_class.search("peter").count).to eq 1
      end
    end
  end

  describe "#full_name" do
    it 'returns the user full name' do
      user = create(:user, first_name: "John", last_name: "Doe")

      expect(user.full_name).to eq "John Doe"
    end
  end
end
