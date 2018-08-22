require 'rails_helper'

describe User, type: :model do
  describe "#full_name" do
    it 'returns the user full name' do
      user = create(:user, first_name: "John", last_name: "Doe")

      expect(user.full_name).to eq "John Doe"
    end
  end
end
