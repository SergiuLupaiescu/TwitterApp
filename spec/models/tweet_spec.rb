require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }

    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end
end
