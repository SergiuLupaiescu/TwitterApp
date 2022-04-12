require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:tweets) }
    it { should have_many(:active_friendships).class_name('Friendship') }
    it { should have_many(:passive_friendships).class_name('Friendship') }
    it { should have_many(:following).through('active_friendships') }
    it { should have_many(:followers).through('passive_friendships') }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email) }
  end
end