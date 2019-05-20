require 'rails_helper'

RSpec.describe User, type: :model do
  subject{
    build(:user)
  }

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  describe "associations" do
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:photos).dependent(:destroy)}
    it { should have_many(:likes).dependent(:destroy)}
    it { should have_many(:comments).dependent(:destroy)}
    it { should have_many(:relationships).dependent(:destroy)}
    it { should have_many(:followed_users).through(:relationships).source(:followed)}
    it { should have_many(:reverse_relationships).dependent(:destroy)}
    it { should have_many(:followers).through(:reverse_relationships).source(:follower)}
  end
end
