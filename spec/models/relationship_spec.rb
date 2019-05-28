require 'rails_helper'

RSpec.describe Relationship, type: :model do


  context "association" do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
  end

  describe "validation" do
    it "валідаціє працює, нооо не знаю як создати 2 юзера і підписатися на них в тестах" do
      expect(subject).to_not be_valid
    end
  end

end
